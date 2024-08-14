import requests
import pandas as pd
from census import Census
from us import states

# Your Census API key
CENSUS_API_KEY = 'b9efb49373802cf4c14fe6d841459ef1512da65c'

# Initialize the Census object
c = Census(CENSUS_API_KEY)

# Function to get state population
def get_state_population(state_abbr):
    state_fips = states.lookup(state_abbr).fips
    population_data = c.acs5.state(('NAME', 'B01003_001E'), state_fips)
    return population_data[0]['B01003_001E'] if population_data else None

# Function to get county population
def get_county_population(state_abbr, county_name):
    state_fips = states.lookup(state_abbr).fips
    population_data = c.acs5.state_county(('NAME', 'B01003_001E'), state_fips, '*')
    county_name = county_name.strip()
    for county in population_data:
        if county_name.lower() in county['NAME'].lower():
            return county['B01003_001E']
        
    if (county_name.lower() == "macon-bibb county"):
        macon = c.acs5.state_county(('NAME', 'B01003_001E'), state_fips, "193")[0]['B01003_001E']
        bibb = c.acs5.state_county(('NAME', 'B01003_001E'), state_fips, "021")[0]['B01003_001E']
        return macon + bibb
    
    if (county_name.lower() == "prince georges county"):
        return c.acs5.state_county(('NAME', 'B01003_001E'), state_fips, "033")[0]['B01003_001E']
    return None

# Function to get city population
def get_city_population(state_abbr, city_name, state):
    state_fips = states.lookup(state_abbr).fips
    population_data = c.acs5.state_place(('NAME', 'B01003_001E'), state_fips, '*')
    city_name = city_name.strip()

    name = city_name.lower() + " city, " + state.strip().lower()
    for city in population_data:
        # print(city_name.lower() + " city, " + state.strip().lower())
        # print(city['NAME'].lower())
        if (city_name.lower() + " city, " + state.strip().lower()) == city['NAME'].lower():   
            # if (city['B01003_001E']) > city_pop:
            return city['B01003_001E']
        # town not city
        elif (city_name.lower() + " town, " + state.strip().lower()) == city['NAME'].lower():
            return city['B01003_001E']  
        # has a period
        elif (name[:2]+ "." + name[2:]) == city['NAME'].lower():
            return city['B01003_001E']
        # cdp not city
        elif (city_name.lower() + " cdp, " + state.strip().lower()) == city['NAME'].lower():
            return city['B01003_001E']
        # already a city
        elif (city_name.lower() + ", " + state.strip().lower()) == city['NAME'].lower():
            return city['B01003_001E']
        elif (city_name.lower() in city['NAME'].lower()):
            return city['B01003_001E']
    return "NA"


# Function to get population based on location type
def get_population(row):
    location = row['Location']  # Assuming the CSV has a column 'Location_Type'
    # state_abbr = None  # Assuming the CSV has a column 'State_Abbr'
    # location_name = row['Location_Name']  # Assuming the CSV has a column 'Location_Name'
   
    if location.isupper():
        # print(location)
        state_abbr = state_name_to_abbr(location)
        print("STATE")
        pop = get_state_population(state_abbr)
        print(pop)
        return pop
    elif "County" in location:
        print("COUNTY")
        state_abbr = state_name_to_abbr(row['State'])
        pop = get_county_population(state_abbr, location.strip())
        print(pop)
        return pop
    else:
        # None
        state_abbr = state_name_to_abbr(row['State'])
        # print(location)
        print("CITY")
        pop = get_city_population(state_abbr, location.strip(), row['State']) 
        print(pop)
        return pop
    

def state_name_to_abbr(state_name):
    state_name = state_name.strip()
    state = states.lookup(state_name.title())
    return state.abbr if state else None



# print("TEST")

# state_fips = states.lookup("CA").fips
# population_data = c.acs5.state_place(('NAME', 'B01003_001E'), state_fips, '*')
# print(population_data)


# Read the CSV file
df = pd.read_csv('bantheboxwithstates.csv')

# Add a new column for population
df['Population'] = df.apply(get_population, axis=1)

# Save the updated DataFrame to a new CSV file
df.to_csv('locations_with_population.csv', index=False)

print(df)


