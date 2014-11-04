data_all <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', stringsAsFactor = FALSE, dec = ".")
data_all$Date <- as.Date(data_all$Date, format = "%d/%m/%Y")

data <- subset(data_all, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)

data$Global_active_power <- as.numeric(data$Global_active_power)

Sub_metering_1 <- as.numeric(data$Sub_metering_1)
Sub_metering_2 <- as.numeric(data$Sub_metering_2)
Sub_metering_3 <- as.numeric(data$Sub_metering_3)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(data, {
	plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
	plot(datetime, Voltage, type = "l", ylab = "Voltage", xlab = "")
	plot(datetime, Sub_metering_1, type = "l", ylab = "Voltage", xlab = "")
	lines(datetime, Sub_metering_2, col = 'Red')
	lines(datetime, Sub_metering_3, col = 'Blue')
	legend("topright", col=c("black", "red", "blue"), lty = 1, lwd =2 , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	plot(datetime, Global_reactive_power, type = "l", ylab="Global Rective Power",xlab="")
})

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()