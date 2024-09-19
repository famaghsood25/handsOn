##Maghsoood# Load necessary libraries
library(dplyr)

# Load the dataset
data <- read.csv("dataset.csv")

# Function to calculate mode
get_mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Calculate summary statistics for each column
calculate_stats <- function(column) {
  mean_val <- mean(column, na.rm = TRUE)
  median_val <- median(column, na.rm = TRUE)
  mode_val <- get_mode(column)
  sd_val <- sd(column, na.rm = TRUE)
  min_val <- min(column, na.rm = TRUE)
  max_val <- max(column, na.rm = TRUE)
  
  cat("Mean:", mean_val, "\n")
  cat("Median:", median_val, "\n")
  cat("Mode:", mode_val, "\n")
  cat("Standard Deviation:", sd_val, "\n")
  cat("Min:", min_val, "\n")
  cat("Max:", max_val, "\n\n")
}

# Temperature stats
cat("Temperature Statistics:\n")
calculate_stats(data$Average_Temperature)

# Rainfall stats
cat("Rainfall Statistics:\n")
calculate_stats(data$Total_Rainfall)

# Wheat yield stats
cat("Wheat Yield Statistics:\n")
calculate_stats(data$Wheat_Yield)

# Corn yield stats
cat("Corn Yield Statistics:\n")
calculate_stats(data$Corn_Yield)