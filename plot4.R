# read in data
header <- scan("household_power_consumption.txt", nlines = 1, sep = ";", what = character())
data <- read.table("household_power_consumption.txt",sep = ";", header = FALSE, skip= 66637,nrows=2880)
names(data) <- header
datetime <- strptime(paste(data$Date, data$Time, sep =" "), format="%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
# plot a 
plot(datetime, data$Global_active_power,type = "l", ylab = "Global Active Power", xlab = NA)
# plot b
plot(datetime, data$Voltage, ylab = "Voltage", type = "l")
# plot c 
plot(datetime, data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = NA)
lines(datetime, data$Sub_metering_2, type="l", col="red" )
lines(datetime, data$Sub_metering_3, type="l", col="blue" )
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(1, 1, 1), cex = 0.4, col = c(1, 2, 4))
# plot d
plot(datetime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power")
dev.off()




