library(dplyr)
library(ggplot2)
library(statebins)
library(viridis)



# Load the CSV file into a data frame
my_data <- read.csv("averaged_data.csv")

# View the first few rows of the data frame
head(my_data)

# Convert state names to lowercase for matching
my_data$State <- tolower(my_data$State)

# Multiply the column 'Average_Value' by 100
my_data$Average_Value <- my_data$Average_Value * 100

# Convert the column 'Average_Value' to integers
my_data$Average_Value <- as.integer(my_data$Average_Value)

# Map state abbreviations to full state names
my_state_map <- setNames(state.abb, tolower(state.name))

# Remove the bottom 4 rows
my_data <- my_data[1:(nrow(my_data) - 4), ]

# Add state abbreviations to the data
my_data <- my_data %>%
  mutate(state_abbr = my_state_map[State])

# Create a hexagonal cartogram
ggplot(my_data, aes(state = state_abbr, fill = Average_Value)) +
  geom_statebins() +
  scale_fill_viridis_c() +
  theme_void() +
  labs(title = "Rectangular Cartogram of US States", fill = "Value") +
  theme(plot.title = element_text(hjust = 0.5))
