# Load necessary libraries
library(ggplot2)
library(reshape2)
library(corrplot)
setwd("/Users/younghoocho/Desktop/Fall_2024/Course_Data visualization/handsOn")
# Load the dataset
data <- read.csv("dataset.csv")

# Select the relevant columns for correlation analysis
climate_data <- data[, c("Average_Temperature", "Total_Rainfall", "Wheat_Yield", "Corn_Yield")]

# Create a correlation matrix
cor_matrix <- cor(climate_data, use = "complete.obs")

# Print the correlation matrix
print(cor_matrix)

# Create a heatmap of the correlation matrix
heatmap_plot <- corrplot(cor_matrix, method = "color", tl.col = "black", tl.srt = 45)

# Save the heatmap to a PNG file
png(filename = "correlation_heatmap.png", width = 800, height = 600)
corrplot(cor_matrix, method = "color", tl.col = "black", tl.srt = 45)
dev.off()

cat("Correlation matrix and heatmap have been generated and saved.\n")
