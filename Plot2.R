# Program:  Plot2.R
# Purpose:  To create a line graph of global active power by
#           minute, measured in kilowatts on 1-2 Feb 2007.
# Inputs:   The "Individual Household Electric Power Consumption
#           Data Set" from the UC Irvine Machine Learning 
#           Repository.
# Outputs:  A PNG file, 480 px by 480 px, showing a line graph 
#           of global active power by minute.

data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")

df <- data.frame(data)

df$DateTime <- do.call(paste, df[c(1,2)])

df$DateTime <- strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")

df1 <- subset(df, DateTime < as.POSIXct('2007-02-03 00:00:00'))
df2 <- subset(df1, DateTime >= as.POSIXct('2007-02-01 00:00:00'))

begin <- df2

# Plot

x <- begin$DateTime
y <- begin$Global_active_power

png("Plot2.png", width=480, height=480, res=72)

plot(x, y, axes=TRUE, type="l", lty=1, xlab=NA, ylab="Global Active Power (kilowatts)", frame=TRUE)

dev.off()