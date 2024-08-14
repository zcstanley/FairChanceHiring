import pandas as pd
from geopy.geocoders import Nominatim
import time
from us import states

# Read the CSV file
df = pd.read_csv('banthebox_with_population.csv')

# Initialize geolocator
geolocator = Nominatim(user_agent="city_geocoder")

# Function to get latitude and longitude
def get_lat_long(city):
    try:
        location = geolocator.geocode(city)
        print(city)
        return (location.latitude, location.longitude)
    except:
        return (None, None)

def state_name_to_abbr(state_name):
    state_name = state_name.strip()
    state = states.lookup(state_name.title())
    return state.abbr if state else None

def combine_citystate(row):
    if row['Location'].strip().isupper():
        return row['Location']
    else:
        state = state_name_to_abbr(row['State'].strip())
        city_state = row['Location'].strip() + ', ' + state + ', USA'
        return city_state

df['City, ST'] = df.apply(combine_citystate, axis=1)

# Apply the geocoding function to each city
df[['Latitude', 'Longitude']] = df['City, ST'].apply(lambda city: pd.Series(get_lat_long(city)))

# Save the results to a new CSV file
df.to_csv('cities_with_coordinates.csv', index=False)

# Display the DataFrame
print(df)
