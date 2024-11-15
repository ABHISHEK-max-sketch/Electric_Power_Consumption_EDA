# Load necessary libraries
library(dplyr)
library(lubridate)

# Read the dataset
data <- read.csv("C:/Users/ASUS/household_power_consumption.txt", sep=";", na.strings="?")


# Convert Date and Time to Date/Time classes
data$datetime <- dmy_hms(paste(data$Date, data$Time))
data$Date <- dmy(data$Date)  # Convert Date to Date type

# Subset data for February 1 and 2, 2007
subset_data <- filter(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Plot 3: Voltage over time
png("plot3.png", width=480, height=480)
plot(subset_data$datetime, subset_data$Voltage, type="l", xlab="Datetime", ylab="Voltage (Volts)")
dev.off()  # Save and close the plot
