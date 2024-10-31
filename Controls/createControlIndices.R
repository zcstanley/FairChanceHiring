
# Read the CSV file into a data frame
controls <- read.csv("clean_vars.csv")
regression <- read.csv("regression.csv")
education <- read.csv("education.csv")
regression$licensing_burden <- as.numeric(gsub(",", "", regression$licensing_burden))

# Calculate z-scores for employment types
cols_w_employment <- 34:46

# Employment z-scores data frame
employment_z_scores <- data.frame(State = controls[[1]])

# Loop over each column in the range and calculate the z-scores
for (i in cols_w_employment) {
  employment_z_scores[[paste0(names(controls)[i], "_z")]] <- scale(controls[[i]], center = TRUE, scale = TRUE)
}

# Create employment z-scores csv
write.csv(employment_z_scores, "employment_z_scores.csv", row.names = FALSE)

# Calculate z-scores for employment_perc and unemployment_perc
controls$employment_perc_z <- scale(controls$employment_perc)
controls$unemployment_perc_z <- scale(controls$unemployment_perc)

# Calculate z-scores for median_income, poverty_perc, no_highschool and college
controls$median_income_z <- scale(controls$median_income)
controls$poverty_perc_z <- scale(controls$poverty_perc)
controls$no_highschool_z <- scale(controls$no_highschool)
controls$college_deg_z <- scale(education$BSDegreeOrHigher)

# Calculate z-scores for bills_introduced, bills_enacted and average licensing cost 
controls$bills_introduced_z <- scale(controls$bills_introduced)
controls$bills_enacted_z <- scale(controls$bills_enacted)
regression$avg_license_cost_z <- scale(regression$licensing_burden)


# Calculate diversity index using Shannon Entropy, sum(-p*log(p))
race_columns <- c("white_perc", "blkAA_perc", "AIAN_perc", "asian_perc", "PI_perc", "other_perc", "twomore_perc")
# Check that the race columns sum to 1
all(abs(rowSums(controls[race_columns], na.rm = TRUE) - 1) < 1e-10)

# Compute the entropy for each row
controls$entropy <- apply(controls[race_columns], 1, function(p) {
  p <- p[p > 0]  # Avoid log(0) by considering only positive probabilities
  -sum(p * log(p))
})


# Create a new dataframe called control_indices with "macroeconomy", "socioeconomics", "politics", and "state" columns
control_indices <- data.frame(
  state = controls$state,
  macroeconomy = rowMeans(cbind(controls$employment_perc_z, -1 * controls$unemployment_perc_z), na.rm = TRUE),
  socioeconomics = rowMeans(cbind(controls$median_income_z, -1 * controls$poverty_perc_z, -1 * controls$no_highschool_z, controls$college_deg_z), na.rm = TRUE),
  politics = rowMeans(cbind(controls$bills_introduced_z, controls$bills_enacted_z, regression$avg_license_cost_z), na.rm = TRUE),
  diversity = controls$entropy
)

# Save control_indices as a CSV file
write.csv(control_indices, "control_indices.csv", row.names = FALSE)

head(control_indices)
