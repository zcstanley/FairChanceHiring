# Load required libraries for data manipulation (tidyverse) and parallel processing (pbmcapply)
library(tidyverse)
library(pbmcapply)

# Load policy variables and control variables from CSV files (URLs)
policyvars <- read.csv("https://raw.githubusercontent.com/qsideinstitute/FairChanceHiring/refs/heads/main/Employment/control-vars/regression.csv")
controlvars <- read.csv("https://raw.githubusercontent.com/qsideinstitute/FairChanceHiring/refs/heads/main/Employment/control-vars/control_vars_clean.csv")

# Clean up control variables
cleancontrolvars <- controlvars %>%
  # Convert "N/A" strings to actual NA values for missing data
  mutate(across(where(is.character), ~ na_if(., "N/A"))) %>%
  # Remove commas from numeric fields and convert them to numeric type
  mutate(
    bills_introduced = str_remove_all(bills_introduced, ",") %>% as.numeric(),
    bills_enacted = str_remove_all(bills_enacted, ",") %>% as.numeric()
  ) %>%
  # Create percentage columns based on total_population
  mutate(
    white_perc = white_total / total_population,
    blkAA_perc = blkAA_total / total_population,
    AIAN_perc = AIAN_total / total_population,
    asian_perc = asian_total / total_population,
    PI_perc = PI_total / total_population,
    other_perc = other_total / total_population,
    twomore_perc = twomore_total / total_population
  ) %>%
  # Select only columns that have no missing values
  select(where(~ all(!is.na(.)))) %>%
  # Remove unnecessary columns (fips, gov_party, det_sentencing, total_population, and original totals)
  select(-fips, -gov_party, -det_sentencing, -total_population, 
         -white_total, -blkAA_total, -AIAN_total, -asian_total, 
         -PI_total, -other_total, -twomore_total)

# Merge the policyvars and controlvars datasets by their common columns
data <- merge(policyvars, cleancontrolvars)

# Set the random seed to ensure reproducibility of the random selections in the following steps
set.seed(123)

# Define the outcome variable and the explanatory variables that are always included in the model
outcome_var <- "fair_chance"
always_include_vars <- c("tot_pos_index", "neg_combo_index")

# Define potential covariates for the model, excluding 'state' (which is an identifier), the outcome variable,
# and the always-included explanatory variables
covariates <- setdiff(names(data), c("state", outcome_var, always_include_vars))

# Function to run one regression and extract the estimates for tot_pos_index and neg_combo_index
run_random_regression <- function() {
  # Randomly select between 3 and 8 covariates for each regression
  num_covariates <- sample(3:8, 1)
  selected_covariates <- sample(covariates, num_covariates)
  
  # Construct the regression formula dynamically
  formula <- as.formula(
    paste(outcome_var, "~", paste(c(always_include_vars, selected_covariates), collapse = " + "))
  )
  
  # Run the linear model (regression)
  model <- lm(formula, data = data)
  
  # Extract the coefficient estimates for 'tot_pos_index' and 'neg_combo_index'
  coef_tot_pos_index <- coef(model)["tot_pos_index"]
  coef_neg_combo_index <- coef(model)["neg_combo_index"]
  
  # Return the estimates as a data frame
  return(data.frame(tot_pos_index = coef_tot_pos_index, 
                    neg_combo_index = coef_neg_combo_index))
}

# Run 100,000 random regressions in parallel using all available CPU cores for faster computation
results <- pbmclapply(1:100000, function(x) run_random_regression(), mc.cores = parallel::detectCores())

# Combine the results from the 10,000 regressions into a single data frame
results_df <- bind_rows(results)


# Plot the distribution of tot_pos_index estimates
plot1 <- ggplot(as.data.frame(results_df), aes(x = tot_pos_index)) +
  geom_histogram(binwidth = 0.01, fill = "blue", alpha = 0.7) +
  labs(title = "Distribution of Coef Estimates for tot_pos_index", x = "Estimate", y = "Frequency")

# Save the first plot
ggsave("coef_estimates_distribution_tot_pos_index.png", plot = plot1, width = 8, height = 6, dpi = 300)

# Plot the distribution of neg_combo_index estimates
plot2 <- ggplot(as.data.frame(results_df), aes(x = neg_combo_index)) +
  geom_histogram(binwidth = 0.001, fill = "green", alpha = 0.7) +
  labs(title = "Distribution of Coef Estimates for neg_combo_index", x = "Estimate", y = "Frequency")

# Save the second plot
ggsave("coef_estimates_distribution_neg_combo_index.png", plot = plot2, width = 8, height = 6, dpi = 300)

# Display the plots
print(plot1)
print(plot2)
