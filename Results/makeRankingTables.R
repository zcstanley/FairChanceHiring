# Load necessary library
library(dplyr)

# Read the first 51 lines of the CSV
positive_index <- read.csv("Policy/PositiveIndex.csv", nrows = 50)

# Ensure column names are correctly assigned
colnames(positive_index) <- c("State", "Ban_the_Box", "Licensing", "Record_Clearing", 
                              "Certificate", "Liability", "Total_Average_Index")


# Rank states for each component index (lower rank = better score)
positive_index_new <- positive_index %>%
  mutate(
    Ban_the_Box_Rank = rank(-Ban_the_Box, ties.method = "min"),
    Licensing_Rank = rank(-Licensing, ties.method = "min"),
    Record_Clearing_Rank = rank(-Record_Clearing, ties.method = "min"),
    Certificate_Rank = rank(-Certificate, ties.method = "min"),
    Liability_Rank = rank(-Liability, ties.method = "min"),
    Total_Average_Index_Rank = rank(-Total_Average_Index, ties.method = "min")
  )

# Sort by Total Average Index Rank
ranked_table <- positive_index_new %>%
  arrange(Total_Average_Index_Rank) %>%
  mutate(Total_Average_Index = round(Total_Average_Index, 2)) %>%  # Round to 2 decimals
  select(
    Total_Average_Index_Rank, State, Total_Average_Index, 
    Ban_the_Box_Rank, Licensing_Rank, Record_Clearing_Rank, 
    Certificate_Rank, Liability_Rank
  ) %>%
  rename(Rank = Total_Average_Index_Rank)

# Save as csv
write.csv(ranked_table, "Results/ranked_table_pos.csv", row.names = FALSE)


# Read the CSV file
negative_index <- read.csv("Policy/NegativeIndex.csv")

# Ensure column names are correctly assigned
colnames(negative_index) <- c("State", "Consequence_Count", "Average_Law_Index", "Combined_Index")

# Rank states (lower Combined Index = higher rank)
negative_index <- negative_index %>%
  mutate(
    Rank = rank(Combined_Index, ties.method = "min"),  # Lower index = higher rank
    Consequence_Count_Rank = rank(Consequence_Count, ties.method = "min"),  # Higher count = higher rank
    Average_Law_Index_Rank = rank(-Average_Law_Index, ties.method = "min")  # Higher index = higher rank
  )

# Sort by Combined Index Rank
ranked_table <- negative_index %>%
  arrange(Rank) %>%
  mutate(Combined_Index = round(Combined_Index)) %>%
  select(Rank, State, Combined_Index, Consequence_Count_Rank, Consequence_Count, Average_Law_Index_Rank)

# Save as csv
write.csv(ranked_table, "Results/ranked_table_neg.csv", row.names = FALSE)

