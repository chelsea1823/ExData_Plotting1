# read in data
header <- scan("household_power_consumption.txt", nlines = 1, sep = ";", what = character())
data <- read.table("household_power_consumption.txt",sep = ";", header = FALSE, skip= 66637,nrows=2880)
names(data) <- header
data$datetime <- strptime(paste(data$Date, data$Time, sep =" "), format="%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(data$Global_active_power)

# plot
png(filename="plot1.png")
hist(GlobalActivePower, col = 2, main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
