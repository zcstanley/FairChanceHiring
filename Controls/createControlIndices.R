
# Read the CSV file into a data frame
controls <- read.csv("Controls/clean_vars.csv")

# Calculate z-scores for employment_perc and unemployment_perc
controls$employment_perc_z <- scale(controls$employment_perc)
controls$unemployment_perc_z <- scale(controls$unemployment_perc)

# Calculate z-scores for median_income, poverty_perc, and no_highschool
controls$median_income_z <- scale(controls$median_income)
controls$poverty_perc_z <- scale(controls$poverty_perc)
controls$no_highschool_z <- scale(controls$no_highschool)

# Calculate z-scores for bills_introduced and bills_enacted
controls$bills_introduced_z <- scale(controls$bills_introduced)
controls$bills_enacted_z <- scale(controls$bills_enacted)

# Create a new dataframe called control_indices with "macroeconomy", "socioeconomics", "politics", and "state" columns
control_indices <- data.frame(
  state = controls$state,
  macroeconomy = rowMeans(cbind(controls$employment_perc_z, -1 * controls$unemployment_perc_z), na.rm = TRUE),
  socioeconomics = rowMeans(cbind(controls$median_income_z, -1 * controls$poverty_perc_z, -1 * controls$no_highschool_z), na.rm = TRUE),
  politics = rowMeans(cbind(controls$bills_introduced_z, controls$bills_enacted_z), na.rm = TRUE)
)

# Save control_indices as a CSV file
write.csv(control_indices, "Controls/control_indices.csv", row.names = FALSE)

head(control_indices)
