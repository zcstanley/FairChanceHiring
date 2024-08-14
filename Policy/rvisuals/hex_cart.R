library(dplyr)
library(ggplot2)
library(viridis)

# Example dataset
data <- data.frame(
  state = c('Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 
            'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 
            'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 
            'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 
            'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 
            'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 
            'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 
            'Wisconsin', 'Wyoming'),
  value = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 
            21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 
            39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50)
)

# Define hexagon coordinates for each state
hex_coords <- data.frame(
  state = c('alabama', 'alaska', 'arizona', 'arkansas', 'california', 'colorado', 'connecticut',
            'delaware', 'florida', 'georgia', 'hawaii', 'idaho', 'illinois', 'indiana', 'iowa',
            'kansas', 'kentucky', 'louisiana', 'maine', 'maryland', 'massachusetts', 'michigan',
            'minnesota', 'mississippi', 'missouri', 'montana', 'nebraska', 'nevada', 'new hampshire',
            'new jersey', 'new mexico', 'new york', 'north carolina', 'north dakota', 'ohio',
            'oklahoma', 'oregon', 'pennsylvania', 'rhode island', 'south carolina', 'south dakota',
            'tennessee', 'texas', 'utah', 'vermont', 'virginia', 'washington', 'west virginia',
            'wisconsin', 'wyoming'),
  x = c(5, 1, 2, 4, 1, 3, 8, 8, 7, 6, 2, 2, 7, 6, 5, 4, 5, 5, 10, 8, 9, 6, 5, 4, 5, 2, 3, 2, 10,
        9, 3, 9, 7, 3, 6, 4, 2, 8, 9, 7, 3, 6, 4, 2, 9, 8, 1, 10, 5, 3),
  y = c(3, 5, 4, 3, 3, 3, 5, 4, 2, 3, 5, 4, 4, 3, 3, 3, 4, 2, 6, 4, 5, 2, 2, 2, 2, 4, 3, 4, 5,
        5, 3, 1, 2, 4, 2, 3, 2, 5, 3, 2, 3, 3, 1, 4, 6, 3, 6, 2, 2, 4)
)

# Merge data with hex_coords
data$state <- tolower(data$state)
plot_data <- inner_join(hex_coords, data, by = "state")

# Function to create hexagon vertices
hexagon <- function(center, size = 1) {
  angles <- seq(0, 2 * pi, length.out = 7)
  x_hex <- center[1] + size * cos(angles)
  y_hex <- center[2] + size * sin(angles)
  return(data.frame(x = x_hex, y = y_hex))
}

# Generate hexagons for each state
hex_df <- do.call(rbind, lapply(1:nrow(plot_data), function(i) {
  hex <- hexagon(c(plot_data$x[i], plot_data$y[i]), size = 0.4)
  hex$state <- plot_data$state[i]
  hex$value <- plot_data$value[i]
  return(hex)
}))

# Plot the hexagons
ggplot() +
  geom_polygon(data = hex_df, aes(x = x, y = y, group = state, fill = value), color = "black") +
  geom_text(data = plot_data, aes(x = x, y = y, label = toupper(state)), color = "white", size = 3) +
  scale_fill_viridis_c() +
  theme_void() +
  labs(title = "Hexagonal Cartogram of US States", fill = "Value") +
  theme(plot.title = element_text(hjust = 0.5))
