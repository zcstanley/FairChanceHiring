import pandas as pd
import requests

# Read the CSV file
input_file = 'cities_with_coordinates.csv'
output_file = 'outputfile.csv'
df = pd.read_csv(input_file)

# Function to get population data using the Census API
def get_population(city, state_fips, api_key):
    city = city.strip()
    base_url = "https://api.census.gov/data/2019/pep/population"
    params = {
        'get': 'POP',
        'for': 'place:*',
        'in': f'state:{state_fips}',
        'key': api_key
    }
    response = requests.get(base_url, params=params)
    if response.status_code == 200:
        data = response.json()
        print(data)
        for record in data[1:]:  # Skip the header row
            if city.lower() in record[0].lower():
                print(city)
                return int(record[1])
    return None

state_name_to_fips = {
    'ALABAMA': '01', 'ALASKA': '02', 'ARIZONA': '04', 'ARKANSAS': '05',
    'CALIFORNIA': '06', 'COLORADO': '08', 'CONNECTICUT': '09', 'DELAWARE': '10',
    'FLORIDA': '12', 'GEORGIA': '13', 'HAWAII': '15', 'IDAHO': '16',
    'ILLINOIS': '17', 'INDIANA': '18', 'IOWA': '19', 'KANSAS': '20',
    'KENTUCKY': '21', 'LOUISIANA': '22', 'MAINE': '23', 'MARYLAND': '24',
    'MASSACHUSETTS': '25', 'MICHIGAN': '26', 'MINNESOTA': '27', 'MISSISSIPPI': '28',
    'MISSOURI': '29', 'MONTANA': '30', 'NEBRASKA': '31', 'NEVADA': '32',
    'NEW HAMPSHIRE': '33', 'NEW JERSEY': '34', 'NEW MEXICO': '35', 'NEW YORK': '36',
    'NORTH CAROLINA': '37', 'NORTH DAKOTA': '38', 'OHIO': '39', 'OKLAHOMA': '40',
    'OREGON': '41', 'PENNSYLVANIA': '42', 'RHODE ISLAND': '44', 'SOUTH CAROLINA': '45',
    'SOUTH DAKOTA': '46', 'TENNESSEE': '47', 'TEXAS': '48', 'UTAH': '49',
    'VERMONT': '50', 'VIRGINIA': '51', 'WASHINGTON': '53', 'WEST VIRGINIA': '54',
    'WISCONSIN': '55', 'WYOMING': '56'
}

# Your Census API key
api_key = 'b9efb49373802cf4c14fe6d841459ef1512da65c'

# Add a new column for population
df['PopulationCity'] = df.apply(lambda row: get_population(row['Location'], row['State'], api_key), axis=1)

# Save the updated DataFrame to a new CSV file
df.to_csv(output_file, index=False)
