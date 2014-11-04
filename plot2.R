data_all <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', stringsAsFactor = FALSE, dec = ".")
data_all$Date <- as.Date(data_all$Date, format = "%d/%m/%Y")

data <- subset(data_all, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)

data$Global_active_power <- as.numeric(data$Global_active_power)

plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()