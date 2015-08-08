# read in data
header <- scan("household_power_consumption.txt", nlines = 1, sep = ";", what = character())
data <- read.table("household_power_consumption.txt",sep = ";", header = FALSE, skip= 66637,nrows=2880)
names(data) <- header
datetime <- strptime(paste(data$Date, data$Time, sep =" "), format="%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(data$Global_active_power)

# plot 
png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower,type = "l", ylab = "Global Active Power (kilowatts)", xlab = NA)
dev.off()
