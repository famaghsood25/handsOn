# Load necessary libraries
library(ggplot2)
setwd("/Users/younghoocho/Desktop/Fall_2024/Course_Data visualization/handsOn")
# Load the dataset
data <- read.csv("dataset.csv")

# Set up the output directory for the plots
output_dir <- "time_series_plots"
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# Function to generate line plots and save them
generate_line_plot <- function(data, x_column, y_column, output_file, y_label) {
  plot <- ggplot(data, aes_string(x = x_column, y = y_column)) +
    geom_line(color = "blue", size = 1) +
    geom_point(color = "red", size = 2) +
    labs(title = paste("Trend of", y_label, "over Time"), x = "Year", y = y_label) +
    theme_minimal()
  
  ggsave(filename = output_file, plot = plot, path = output_dir, width = 7, height = 5)
}

# Generate line plots for each variable
generate_line_plot(data, "Year", "Average_Temperature", "temperature_trend.png", "Average Temperature")
generate_line_plot(data, "Year", "Total_Rainfall", "rainfall_trend.png", "Total Rainfall")
generate_line_plot(data, "Year", "Wheat_Yield", "wheat_yield_trend.png", "Wheat Yield")
generate_line_plot(data, "Year", "Corn_Yield", "corn_yield_trend.png", "Corn Yield")

cat("Time series line plots have been generated and saved to the 'time_series_plots' directory.\n")

