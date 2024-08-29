# Load Packages
library(tidyverse)
library(RSelenium)
library(rvest)

# List of States
states <- c("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado",
            "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho",
            "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana",
            "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota",
            "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada",
            "New Hampshire", "New Jersey", "New Mexico", "New York",
            "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon",
            "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota",
            "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington",
            "West Virginia", "Wisconsin", "Wyoming")


# Set Up Selenium Session
rD <- rsDriver(browser = "firefox", port = 4575L, chromever = NULL, check = FALSE) # Setting browser and port, easier to use firefox than chrome
remDr <- rD[["client"]]

# Define multiple user agent strings, good to avoid scraping detection
user_agents <- c(
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0",
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36",
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15"
)

# Initialize data frame
job_data <- data.frame(State = character(), FairChance = numeric(), stringsAsFactors = FALSE)

# Create loop to iterate over each state
for (state in states) {
  # Alternate the user agents
  user_agent <- sample(user_agents, 1)
  remDr$executeScript("Object.defineProperty(navigator, 'userAgent', {get: function () { return arguments[0]; }});", list(user_agent))
  
  # Define the base URL
  url <- paste0("https://www.indeed.com/jobs?q=&l=", state) # The urls for each state follow same start pattern with the state at the end
  
  # Navigate to the URL
  print(paste("Navigating to URL for", state)) # Keeping track of where code is while running
  remDr$navigate(url)
  
  Sys.sleep(sample(20:30, 1))  # Random delay to avoid detection
  
  # Log current state
  print(paste("Scraping data for", state)) # This will print before any actual scraping is done
  
  # Click the "Encouraged to apply" filter button
  tryCatch({  # Using the x-path and text of the "Encouraged to Apply" filter on Indeed to interact with it
    filter_button <- remDr$findElement(using = "xpath", value = "//button[div[@class='yosegi-FilterPill-pillLabel' and text()='Encouraged to apply']]")
    remDr$executeScript("arguments[0].scrollIntoView();", list(filter_button))  # Scroll into view if necessary
    filter_button$clickElement() # Clicking on the filter button after finding it to open pop-up
    
    Sys.sleep(3)  # Wait for the filter options to appear after click
    
    # Click the "Fair chance" checkbox
    fair_chance_checkbox <- remDr$findElement(using = "xpath", value = "//input[@type='checkbox' and @value='Q5R8A']")
    remDr$executeScript("arguments[0].scrollIntoView();", list(fair_chance_checkbox))  # Scroll into view if necessary
    fair_chance_checkbox$clickElement()
    
    # Click the "Update" button to apply the filter
    update_button <- remDr$findElement(using = "xpath", "//button[@type='submit' and contains(@class, 'css-4of6ml')]")
    update_button$clickElement()
    
    Sys.sleep(5)
  }, error = function(e) {
    print(paste("Could not select 'Fair chance' checkbox for", state, ":", e$message)) # If there is an error with finding the filter, this statement will print and let you know that the value may be incorrect or missing
  })
  
  # Scrape the total number of job postings
  fairChance <- tryCatch({
    page_source <- remDr$getPageSource() %>% .[[1]] %>% read_html()
    
    if (!is.null(page_source)) {
      print(paste("Page source retrieved for", state))
    }
    
    fair_chance_text <- page_source %>%
      html_elements(".jobsearch-JobCountAndSortPane-jobCount span:nth-child(1)") %>% # CSS selector for the number of jobs for each state
      html_text()
    
    # Extracting number of jobs for each state
    if (length(fair_chance_text) > 0) {
      print(paste("Job count element found for", state))
      fair_chance_text %>%
        {.[1]} %>%
        str_extract("[0-9,]+") %>%
        str_replace_all(",", "") %>%
        as.numeric()
    } else {
      print(paste("No job count element found for", state)) # If unable to scrape value
      NA
    }
  }, error = function(e) {
    print(paste("Error occurred for", state, ":", e$message))
    NA  # Return NA if there's an error
  })
  
  # Append to the data frame
  job_data <- rbind(job_data, data.frame(State = state, FairChance = fairChance, stringsAsFactors = FALSE))
  
  # Optionally restart Selenium session after every few states to avoid detection
  if (which(states == state) %% 5 == 0) {
    tryCatch({
      remDr$close()
      rD$server$stop()
      Sys.sleep(120)  # Increase sleep time to 2 minutes before restarting
      rD <- rsDriver(browser = "firefox", port = 4577L, chromever = NULL, check = FALSE)
      remDr <- rD[["client"]]
    }, error = function(e) {
      print(paste("Error restarting Selenium session for", state, ":", e$message))
    })
  }
}

# Closing session after finishing the scrape
tryCatch({ # Important to add in order to not need to manually interrupt after complete
  remDr$close()
  rD$server$stop()
}, error = function(e) {
  print(paste("Error closing Selenium session:", e$message))
})

# Save Results to CSV
write.csv(job_data, "job_data.csv", row.names = FALSE)
print("File saved to job_data.csv")

# Display Results
print(job_data)
