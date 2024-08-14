import requests
from bs4 import BeautifulSoup
import pandas as pd

# URL of the webpage to scrape
url = "https://www.ncsl.org/civil-and-criminal-justice/certificates-of-rehabilitation-and-limited-relief#anchor5488"

# Send a GET request to fetch the HTML content
response = requests.get(url)
response.raise_for_status()  # Raise an exception for HTTP errors

# Parse the HTML content using BeautifulSoup
soup = BeautifulSoup(response.content, 'html.parser')

# Initialize lists to store the data
states = []
statutes = []
descriptions = []

# Find the table that contains the data
table = soup.find('table')

# Ensure the table exists
if table:
    # Find all rows in the table
    rows = table.find_all('tr')

    for row in rows:
        # Extract the state from the 'data-id' attribute of the <tr> tag
        state_tag = row.find('th')
        print(state_tag)

        state = state_tag.text.strip() if state_tag else ''
        states.append(state)

        # Extract the statute from the <span> tag
        statute_tags = row.find_all('span')
        per_state_stat = []
        for statute_tag in statute_tags: 
            statute = statute_tag.text.strip() if statute_tag else ''
            per_state_stat.append(statute)
        statutes.append(per_state_stat)


        # Extract the description from the <p> tag
        description_tag = row.find('p')
        description = description_tag.text.strip() if description_tag else ''
        descriptions.append(description)

print(states)
print(len(states))
print("statues:")
print(len(statutes))
print(statutes) 
print("descriptions")
# print(descriptions)

# Create a DataFrame using the extracted data
df = pd.DataFrame({
    'state': states,
    'statute': statutes,
    # 'description': descriptions
})

# Display the DataFrame
print(df)

# Optionally, save the DataFrame to a CSV file
df.to_csv('scraped_data.csv', index=False)
