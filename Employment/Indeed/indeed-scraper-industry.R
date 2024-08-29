# Load Packages
library(tidyverse)
library(RSelenium)
library(rvest)

# Define List of States
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

# Define List of Industries
industries <- c("retail", "food service", "construction", "waste management", "home health")

# Define multiple user agent strings, good to avoid scraping detection
user_agents <- c(
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0",
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36",
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15"
)

# Set Up Selenium Session
rD <- rsDriver(browser = "firefox", port = 4575L, chromever = NULL, check = FALSE)
remDr <- rD[["client"]]

# Initialize data frame
job_data <- data.frame(State = character(), Industry = character(), TotalJobs = numeric(), stringsAsFactors = FALSE)

# Scrape Data for Each State and Industry
for (state in states) {
  for (industry in industries) {
    # Rotate user agent
    user_agent <- sample(user_agents, 1)
    remDr$executeScript("Object.defineProperty(navigator, 'userAgent', {get: function () { return arguments[0]; }});", list(user_agent))
    
    # Define the base URL
    url <- paste0("https://www.indeed.com/jobs?q=", industry, "&l=", gsub(" ", "+", state))
    
    # Navigate to the URL
    remDr$navigate(url)
    
    Sys.sleep(sample(20:30, 1))  # Increase the random delay to avoid detection
    
    # Log current state and industry
    print(paste("Scraping data for", industry, "in", state))
    
    # Scrape the total number of job postings
    totalJobs <- tryCatch({
      page_source <- remDr$getPageSource() %>% .[[1]] %>% read_html()
      
      # Log if page source is retrieved successfully
      if (!is.null(page_source)) {
        print(paste("Page source retrieved for", industry, "in", state))
      }
      
      total_jobs_text <- page_source %>%
        html_elements(".jobsearch-JobCountAndSortPane-jobCount span") %>%
        html_text()
      
      # Log if the selector found any elements
      if (length(total_jobs_text) > 0) {
        print(paste("Job count element found for", industry, "in", state))
        total_jobs_text %>%
          {.[1]} %>%
          str_extract("[0-9,]+") %>%
          str_replace_all(",", "") %>%
          as.numeric()
      } else {
        print(paste("No job count element found for", industry, "in", state))
        NA
      }
    }, error = function(e) {
      print(paste("Error occurred for", industry, "in", state, ":", e$message))
      NA  # Return NA if there's an error
    })
    
    # Append to the data frame
    job_data <- rbind(job_data, data.frame(State = state, Industry = industry, TotalJobs = totalJobs, stringsAsFactors = FALSE))
    
    # Optionally restart Selenium session after every few states to avoid detection
    if (which(states == state) %% 5 == 0) {
      remDr$close()
      rD$server$stop()
      Sys.sleep(120)  # Increase sleep time to 2 minutes before restarting
      rD <- rsDriver(browser = "firefox", port = 4575L, chromever = NULL, check = FALSE)
      remDr <- rD[["client"]]
    }
  }
}

# Closing session after finishing the scrape
tryCatch({ 
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
