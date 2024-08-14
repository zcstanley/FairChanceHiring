# Load necessary library
library(ggplot2)

# Step 1: Read the CSV file
df <- read.csv("scatterplot.csv")

# Step 2: Create the scatterplot
ggplot(df, aes(x = Burden.Rank, y = Licensing.Index, label = State)) +
  geom_point(color = "blue") +  # Add points
  geom_text(nudge_x = 0.01, nudge_y = 0.01, size = 3) +  # Add state labels
  geom_smooth(method = "lm", se = FALSE, color = "red") +  # Add regression line
  ggtitle("Licensing Scatterplot of 50 States") +
  xlab("Burden Rank") +
  ylab("Licensing Index") +
  theme_minimal()

# Step 2: Create the scatterplot
ggplot(df, aes(x = Burden.Rank, y = Average_Value, label = State)) +
  geom_point(color = "blue") +  # Add points
  geom_text(nudge_x = 0.01, nudge_y = 0.01, size = 3) +  # Add state labels
  geom_smooth(method = "lm", se = FALSE, color = "red") +  # Add regression line
  ggtitle("Average Positive Scatterplot of 50 States") +
  xlab("Burden Rank") +
  ylab("Average Value") +
  theme_minimal()

# Step 2: Create the scatterplot
ggplot(df, aes(x = Burden.Rank, y = Combined.Negative.Index, label = State)) +
  geom_point(color = "blue") +  # Add points
  geom_text(nudge_x = 0.01, nudge_y = 0.01, size = 3) +  # Add state labels
  geom_smooth(method = "lm", se = FALSE, color = "red") +  # Add regression line
  ggtitle("Average Negative Scatterplot of 50 States") +
  xlab("Burden Rank") +
  ylab("Negative Index") +
  theme_minimal()

# Step 2: Create the scatterplot
ggplot(df, aes(x = Average_Value, y = Combined.Negative.Index, label = State)) +
  geom_point(color = "blue") +  # Add points
  geom_text(nudge_x = 0.01, nudge_y = 0.01, size = 3) +  # Add state labels
  geom_smooth(method = "lm", se = FALSE, color = "red") +  # Add regression line
  ggtitle("Average Negative Scatterplot of 50 States") +
  xlab("Positive Index") +
  ylab("Negative Index") +
  theme_minimal()