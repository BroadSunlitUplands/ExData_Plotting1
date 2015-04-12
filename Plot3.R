# Program:  Plot3.R
# Purpose:  To create a line graph of energy sub metering by
#           minute, with three sub meterings.
# Inputs:   The "Individual Household Electric Power Consumption
#           Data Set" from the UC Irvine Machine Learning 
#           Repository.
# Outputs:  A PNG file, 480 px by 480 px, showing a line graph 
#           of energy sub metering by minute.

data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")

df <- data.frame(data)

df$DateTime <- do.call(paste, df[c(1,2)])

df$DateTime <- strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")

df1 <- subset(df, DateTime < as.POSIXct('2007-02-03 00:00:00'))
df2 <- subset(df1, DateTime >= as.POSIXct('2007-02-01 00:00:00'))

begin <- df2

# Plot

x <- begin$DateTime
y31 <- as.numeric(as.character(begin$Sub_metering_1))
y32 <- as.numeric(as.character(begin$Sub_metering_2))
y33 <- as.numeric(as.character(begin$Sub_metering_3))

png("Plot3.png", width=480, height=480, res=72)

plot(x, y31, axes=TRUE, type="l", lty=1, xlab=NA, ylab="Energy sub metering", frame=TRUE)
lines(x, y32, col = "red", lwd=1)
lines(x, y33, col = "blue")
legend("topright", bty="n", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()