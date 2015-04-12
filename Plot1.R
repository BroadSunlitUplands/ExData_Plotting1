# Program:  Plot1.R
# Purpose:  To create a histogram of global active power by
#           minute, measured in kilowatts on 1-2 Feb 2007.
# Inputs:   The "Individual Household Electric Power Consumption
#           Data Set" from the UC Irvine Machine Learning 
#           Repository.
# Outputs:  A PNG file, 480 px by 480 px, showing a histogram of
#           global active power.

data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")

df <- data.frame(data)

df$DateTime <- do.call(paste, df[c(1,2)])

df$DateTime <- strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")

df1 <- subset(df, DateTime < as.POSIXct('2007-02-03 00:00:00'))
df2 <- subset(df1, DateTime >= as.POSIXct('2007-02-01 00:00:00'))

begin <- df2

# Plot

png("Plot1.png", width=480, height=480, res=72)

begin$Global_active_power <- as.numeric(as.character(begin$Global_active_power))

hist(begin$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()