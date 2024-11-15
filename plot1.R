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

# View the first few rows of data to confirm
head(subset_data)

# Plot 1: Global Active Power vs Time
png("plot1.png", width=480, height=480)
plot(subset_data$datetime, subset_data$Global_active_power, type="l", xlab="Datetime", ylab="Global Active Power (kilowatts)")
dev.off()  # Save and close the plot
