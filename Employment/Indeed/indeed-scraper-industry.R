# Load Packages
library(tidyverse)
library(RSelenium)
library(rvest)

# Define List of States
# states <- c("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado",
#             "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho",
#             "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana",
#             "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota",
#             "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada",
#             "New Hampshire", "New Jersey", "New Mexico", "New York",
#             "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon",
#             "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota",
#             "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington",
#             "West Virginia", "Wisconsin", "Wyoming")

states <- c("Alamaba", "Alaska", "Arizona")

# Define List of Industries
industries <- c("retail", "food service", "construction", "waste management", "home health", "manufacturing", "hospitality")

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

# Scrape Data for Each State and Industry (with and without Fair Chance filter)
for (state in states) {
  for (industry in industries) {
    # Rotate user agent
    user_agent <- sample(user_agents, 1)
    remDr$executeScript("Object.defineProperty(navigator, 'userAgent', {get: function () { return arguments[0]; }});", list(user_agent))
    
    # Define the base URL (without the Fair Chance filter)
    url_base <- paste0("https://www.indeed.com/jobs?q=", industry, "&l=", gsub(" ", "+", state))
    
    # Define the URL with the Fair Chance filter
    url_fair_chance <- paste0(url_base, "&sc=0kf%3Aattr%28Q5R8A%29%3B&vjk=")
    
    # Define a function to scrape data from a URL
    scrape_jobs <- function(url) {
      remDr$navigate(url)
      Sys.sleep(sample(20:30, 1))  # Random delay to avoid detection
      
      totalJobs <- tryCatch({
        page_source <- remDr$getPageSource() %>% .[[1]] %>% read_html()
        total_jobs_text <- page_source %>%
          html_elements(".jobsearch-JobCountAndSortPane-jobCount span") %>%
          html_text()
        if (length(total_jobs_text) > 0) {
          total_jobs_text %>%
            {.[1]} %>%
            str_extract("[0-9,]+") %>%
            str_replace_all(",", "") %>%
            as.numeric()
        } else {
          NA
        }
      }, error = function(e) {
        NA  # Return NA if there's an error
      })
      return(totalJobs)
    }
    
    # Scrape data without the Fair Chance filter
    totalJobs_no_filter <- scrape_jobs(url_base)
    
    # Scrape data with the Fair Chance filter
    totalJobs_fair_chance <- scrape_jobs(url_fair_chance)
    
    # Append to the data frame
    job_data <- rbind(job_data, data.frame(State = state, Industry = industry, 
                                           TotalJobs_NoFilter = totalJobs_no_filter, 
                                           TotalJobs_FairChance = totalJobs_fair_chance, 
                                           stringsAsFactors = FALSE))
    
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
