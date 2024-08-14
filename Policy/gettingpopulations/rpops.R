# Load libraries
library(tidyverse)
library(tidycensus)

# Set census API key
census_api_key("b9efb49373802cf4c14fe6d841459ef1512da65c")

# Load the CSV file into a data frame
my_data <- read.csv("bantheboxwithstates.csv")


# Clean data
my_data$Location <- trimws(my_data$Location)
my_data$State <- trimws(my_data$State)

# View the first few rows of the data frame
head(my_data)

# Define the function
square_function <- function(x, y) {
  # Capitalize the first letter of each word
  x <- tools::toTitleCase(tolower(x))
  y <- tools::toTitleCase(tolower(y))
  combined_string <- paste(x, y)
  return(combined_string)
}

# Function to get population
get_pop_func <- function(city_name, state) {
  
  # Check if the location includes "County"
  is_county <- grepl("County", city_name)
  
  # Check if location is uppercase 
  
  
  if (!is_county & !(city_name == toupper(city_name))) {
    
    # print(city_name)
    
    state <- tools::toTitleCase(tolower(state))
    
    # print(state)
    
    # Get population data
    population_data <- get_acs(
      geography = "place",
      variables = "B01003_001",  # Total population
      state = state,
      survey = "acs5"
    )
    
    # Filter for the specific city
    city_population <- population_data %>%
      filter(NAME == paste0(city_name, " city, ", state))
    
    # print(nrow(city_population))
    
    if (nrow(city_population) > 0) {
      return(city_population$estimate[1])
    } else {
      return(NA)  # Return NA if city not found
    }
  } else {
    
    if (is_county) {
      
      print("COUNTY")
      
      state <- tools::toTitleCase(tolower(state))
      
      population_data <- get_acs(
        geography = "county",
        variables = "B01003_001",
        state = state,
        survey = "acs5"
      )
      # 
      # filtered_data <- population_data
      # print(population_data)
      
      
      county_name <- city_name
      print(county_name)

      filtered_data <- population_data %>%
        filter(NAME == county_name)

      print(filtered_data$estimate[1])
      
      if (nrow(filtered_data) > 0) {
        return(filtered_data$estimate[1])
      } else {
        print("here: no county")
        return(NA)  # Return NA if city not found
      }
    }
    
    else {
      return(NA)  # Return NA for county or invalid cases
    }
    
  }
}

# Use rowwise to apply the function to each row
my_data <- my_data %>%
  rowwise() %>%
  mutate(Population = get_pop_func(Location, State)) %>%
  ungroup()  # Ungroup to return to regular data frame


population_data <- get_acs(
  geography = "county",
  variables = "B01003_001",
  state = state,
  county = 'Macon-Bibb County',
  survey = "acs5"
)



# View the updated data frame
print(my_data)
