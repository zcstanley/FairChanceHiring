library(dplyr)

# Read the CSV file into a data frame
fairchance_data <- read.csv("Employment/Indeed/indeed-industry-fairchance.csv")

# Select rows where industry is "food service" or "retail"
fairchance_filtered <- subset(fairchance_data, industry %in% c("food service", "retail"))

# Group by state and compute fair chance job posting rates in retail + food service
fairchance_grouped <- fairchance_filtered %>%
  group_by(state) %>%
  summarise(
    total_jobs = sum(totalIndustry),
    fair_chance_jobs = sum(fairChance)
  ) %>%
  ungroup() %>%
  mutate(
    fair_chance_rate = ( fair_chance_jobs / total_jobs ) * 1000
    )

# Save control_indices as a CSV file
write.csv(fairchance_grouped, "Employment/Indeed/indeed-retail-foodservice-fairchance.csv", row.names = FALSE)

# Preview the first few rows of the filtered data
head(fairchance_grouped)
