library(tidyverse)
library(dplyr)


# Load the CSV file into a data frame
my_data <- read.csv("all_indiv_index.csv")
sort <- read.csv("averaged_data.csv")

# Remove the bottom 4 rows
sort <- sort[1:(nrow(sort) - 4), ]

df_sorted <- sort %>%
  arrange(Average_Value)

my_sorted_data <- df_sorted %>%
  left_join(my_data, by = "State")


df_long <- my_sorted_data %>%
  pivot_longer(cols = starts_with("Value_"), 
               names_to = "Category", 
               values_to = "Value")

# Define old to new category names mapping
category_names <- c(
  "Value_1" = "Ban the Box Index",
  "Value_2" = "Certificates Index",
  "Value_3" = "Record Clearing Index",
  "Value_4" = "Liablity Index",
  "Value_5" = "Licensing"
)

# Update Category names in df_long
df_long$Category <- recode(df_long$Category, !!!category_names)

# Convert State to a factor with levels in the order they appear
df_long$State <- factor(df_long$State, levels = unique(df_long$State))



# Create the plot
ggplot(df_long, aes(x = State, y = Value, fill = Category)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), width = 0.7) +
  scale_fill_brewer(palette = "Set3") +
  labs(title = "Bar Graph with Bars for Each State",
       x = "State",
       y = "Value",
       fill = "Category") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))




