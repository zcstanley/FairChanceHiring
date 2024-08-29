# Load Packages
library(tidyverse)
library(RSelenium)
library(rvest)

# List of States and Industries
states <- c("Alabama", "Alaska", "Arizona")
industries <- c("retail", "food service", "construction", "waste management", "home health")

# Set Up Selenium Session
rD <- rsDriver(browser = "firefox", port = 4575L, chromever = NULL, check = FALSE) 
remDr <- rD[["client"]]

# Define multiple user agent strings
user_agents <- c(
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0",
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36",
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15"
)

# Initialize data frame
job_data <- data.frame(State = character(), Industry = character(), FairChance = character(), stringsAsFactors = FALSE)

# Create loop to iterate over each state and industry
for (state in states) {
  for (industry in industries) {
    
    # Alternate the user agents
    user_agent <- sample(user_agents, 1)
    remDr$executeScript("Object.defineProperty(navigator, 'userAgent', {get: function () { return arguments[0]; }});", list(user_agent))
    
    # Define the base URL
    url <- paste0("https://www.indeed.com/jobs?q=", industry, "&l=", state)
    
    # Navigate to the URL
    print(paste("Navigating to URL for", state, "-", industry))
    remDr$navigate(url)
    
    Sys.sleep(sample(20:30, 1))  # Random delay to avoid detection
    
    # Try to click the "Encouraged to apply" filter button
    filter_found <- tryCatch({
      filter_button <- remDr$findElement(using = "xpath", value = "//button[div[@class='yosegi-FilterPill-pillLabel' and text()='Encouraged to apply']]")
      remDr$executeScript("arguments[0].scrollIntoView();", list(filter_button))
      filter_button$clickElement()
      
      Sys.sleep(3)
      
      TRUE
    }, error = function(e) {
      print(paste("Filter not found for", state, "-", industry, ":", e$message))
      FALSE
    })
    
    if (!filter_found) {
      fairChance <- "no filter"
    } else {
      # Try to click the "Fair chance" checkbox and update button
      fair_chance_found <- tryCatch({
        fair_chance_checkbox <- remDr$findElement(using = "xpath", value = "//input[@type='checkbox' and @value='Q5R8A']")
        remDr$executeScript("arguments[0].scrollIntoView();", list(fair_chance_checkbox))
        fair_chance_checkbox$clickElement()
        
        update_button <- remDr$findElement(using = "xpath", "//button[@type='submit' and contains(@class, 'css-4of6ml')]")
        update_button$clickElement()
        
        Sys.sleep(5)
        
        TRUE
      }, error = function(e) {
        print(paste("Fair chance checkbox not found for", state, "-", industry, ":", e$message))
        FALSE
      })
      
      if (!fair_chance_found) {
        fairChance <- "no fair chance"
      } else {
        # Scrape the total number of job postings
        fairChance <- tryCatch({
          page_source <- remDr$getPageSource() %>% .[[1]] %>% read_html()
          
          fair_chance_text <- page_source %>%
            html_elements(".jobsearch-JobCountAndSortPane-jobCount span:nth-child(1)") %>%
            html_text()
          
          if (length(fair_chance_text) > 0) {
            fair_chance_text %>%
              str_extract("[0-9,]+") %>%
              str_replace_all(",", "") %>%
              as.numeric()
          } else {
            NA
          }
        }, error = function(e) {
          print(paste("Error occurred while scraping data for", state, "-", industry, ":", e$message))
          NA
        })
      }
    }
    
    # Append to the data frame
    job_data <- rbind(job_data, data.frame(State = state, Industry = industry, FairChance = fairChance, stringsAsFactors = FALSE))
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
