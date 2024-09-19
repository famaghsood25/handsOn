# Load necessary libraries
library(ggplot2)

# Load the dataset
data <- read.csv("dataset.csv")

# Set up the output directory for the plots
output_dir <- "plots"
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# Function to generate histograms and save them
generate_histogram <- function(data, column_name, output_file) {
  plot <- ggplot(data, aes_string(x = column_name)) +
    geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
    labs(title = paste("Histogram of", column_name), x = column_name, y = "Frequency") +
    theme_minimal()
  
  ggsave(filename = output_file, plot = plot, path = output_dir, width = 7, height = 5)
}

# Function to generate boxplots and save them
generate_boxplot <- function(data, column_name, output_file) {
  plot <- ggplot(data, aes_string(y = column_name)) +
    geom_boxplot(fill = "orange", color = "black") +
    labs(title = paste("Boxplot of", column_name), y = column_name) +
    theme_minimal()
  
  ggsave(filename = output_file, plot = plot, path = output_dir, width = 7, height = 5)
}

# Generate histograms for each variable
generate_histogram(data, "Average_Temperature", "histogram_temperature.png")
generate_histogram(data, "Total_Rainfall", "histogram_rainfall.png")
generate_histogram(data, "Wheat_Yield", "histogram_wheat_yield.png")
generate_histogram(data, "Corn_Yield", "histogram_corn_yield.png")

# Generate boxplots for each variable
generate_boxplot(data, "Average_Temperature", "boxplot_temperature.png")
generate_boxplot(data, "Total_Rainfall", "boxplot_rainfall.png")
generate_boxplot(data, "Wheat_Yield", "boxplot_wheat_yield.png")
generate_boxplot(data, "Corn_Yield", "boxplot_corn_yield.png")

cat("Histograms and boxplots have been generated and saved to the 'plots' directory.\n")

