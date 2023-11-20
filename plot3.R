power <- read.table("household_power_consumption.txt", skip = 1, sep=';', dec = ".")
colnames(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

power$Date = as.Date(power$Date, "%d/%m/%Y")

data_new <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02", ]

datetime <- paste(data_new$Date, data_new$Time, sep = " ")
datetime <- strptime(datetime, format="%Y-%m-%d %H:%M:%S")

data_new$Sub_metering_1 <- as.numeric(data_new$Sub_metering_1)
data_new$Sub_metering_2 <- as.numeric(data_new$Sub_metering_2)
data_new$Sub_metering_3 <- as.numeric(data_new$Sub_metering_3)


png("plot3.png", width = 480, height = 480)
plot(datetime, data_new$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub metering")
lines(datetime, data_new$Sub_metering_2, type = "l", col = "red")
lines(datetime, data_new$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()

