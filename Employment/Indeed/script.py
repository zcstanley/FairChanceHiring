import pandas as pd
import random
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.firefox.options import Options
from bs4 import BeautifulSoup
from webdriver_manager.firefox import GeckoDriverManager
import re

def extract_job_count(soup):
    job_count_element = soup.select_one('div.jobsearch-JobCountAndSortPane-jobCount')
    if job_count_element:
        job_count_text = job_count_element.get_text(strip=True)
        match = re.search(r'([\d,]+)', job_count_text)
        if match:
            return int(match.group(1).replace(',', ''))
    return 0
# List of States
states = [
    "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut",
    "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa",
    "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan",
    "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire",
    "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma",
    "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee",
    "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"
]

# Randomly choose one state from the list
state = random.choice(states)
industries = ["retail", "food service", "construction", ]

# Set up Selenium with Firefox
options = Options()

driver = webdriver.Firefox(service=Service(GeckoDriverManager().install()), options=options)

# Define multiple user agent strings
user_agents = [
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15"
]

# Initialize an empty list to store job data
job_data_list = []

# Loop through the randomly selected state
for industry in industries:
    
    # Alternate the user agents
    user_agent = random.choice(user_agents)
    driver.execute_script("Object.defineProperty(navigator, 'userAgent', {get: function () { return arguments[0]; }});", user_agent)

    # Define the base URL
    url = f"https://www.indeed.com/jobs?q={industry}&l={state}"
    
    # Navigate to the URL
    print(f"Navigating to URL for {state} - {industry}")
    driver.get(url)
    
    time.sleep(random.randint(40, 50))  # Random delay to avoid detection

    # Try to click the "Encouraged to apply" filter button
    filter_found = False
    try:
        filter_button = driver.find_element(By.XPATH, "//button[div[@class='yosegi-FilterPill-pillLabel' and text()='Encouraged to apply']]")
        driver.execute_script("arguments[0].scrollIntoView();", filter_button)
        filter_button.click()
        time.sleep(3)
        filter_found = True
    except Exception as e:
        print(f"Filter not found for {state} - {industry}: {e}")
    
    fairChance = "no filter" if not filter_found else "filter applied"

    # Try to click the "Fair chance" checkbox and update button
    if filter_found:
        fair_chance_found = False
        try:
            fair_chance_checkbox = driver.find_element(By.XPATH, "//input[@type='checkbox' and @value='Q5R8A']")
            driver.execute_script("arguments[0].scrollIntoView();", fair_chance_checkbox)
            fair_chance_checkbox.click()
            
            update_button = driver.find_element(By.XPATH, "//button[@type='submit' and contains(@class, 'css-4of6ml')]")
            update_button.click()
            time.sleep(5)
            fair_chance_found = True
        except Exception as e:
            print(f"Fair chance checkbox not found for {state} - {industry}: {e}")
        
        fairChance = "fair chance applied" if fair_chance_found else "no fair chance"

    # Scrape job postings without scrolling
    page_source = driver.page_source
    soup = BeautifulSoup(page_source, 'html.parser')
    
    job_cards = soup.select('.job_seen_beacon')  # Select job cards
    
    fair_chance_count = 0  # Counter for fair chance jobs
    
    for job in job_cards:
        job_title = job.select_one('h2.jobTitle').get_text(strip=True) if job.select_one('h2.jobTitle') else 'N/A'
        company = job.select_one('span.companyName').get_text(strip=True) if job.select_one('span.companyName') else 'N/A'
        location = job.select_one('div.companyLocation').get_text(strip=True) if job.select_one('div.companyLocation') else 'N/A'

        # Increment total jobs count
        fair_chance_count += 1
        # Check if it's a fair chance job
        is_fair_chance = "Yes" if fairChance == "fair chance applied" else "No"
        if is_fair_chance == "Yes":
            fair_chance_count += 1  # Increment fair chance count

        # Add job data to list
        job_data_list.append({
            "State": state,
            "Industry": industry,
            "JobTitle": job_title,
            "Company": company,
            "Location": location,
        })

    # Show the total number of jobs and fair chance jobs found
    print(f"Total jobs found for {state} - {industry}: {fairChance}")
    print(f"Fair chance jobs found: {fair_chance_count}")
    fairchance_state_count =f"{state} + {industry} + {fair_chance_count} "


# Create DataFrame from the list of job data
job_data = pd.DataFrame(job_data_list)

# If there are duplicates, drop them
job_data = job_data.drop_duplicates()

# Closing session after finishing the scrape
driver.quit()

# Load existing data
try:
    existing_data = pd.read_csv("job_data.csv")
except FileNotFoundError:
    existing_data = pd.DataFrame()  # Create an empty DataFrame if file doesn't exist

# Append new data to existing data
if not job_data.empty:
    combined_data = pd.concat([existing_data, job_data], ignore_index=False).drop_duplicates()
    combined_data.to_csv("job_data.csv", index=False)
    print("File updated: job_data.csv")
else:
    print("No new data to save.")

# Display Results
print(combined_data)
print(fairchance_state_count)
