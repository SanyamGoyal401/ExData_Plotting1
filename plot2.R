power <- read.table("household_power_consumption.txt", skip = 1, sep=';', dec = ".")
colnames(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

power$Date = as.Date(power$Date, "%d/%m/%Y")

data_new <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02", ]

datetime <- paste(data_new$Date, data_new$Time, sep = " ")
datetime <- strptime(datetime, format="%Y-%m-%d %H:%M:%S")
datetime

data_new$Global_active_power <- as.numeric(data_new$Global_active_power)
globalActivePower <- data_new$Global_active_power

png("plot2.png", width = 480, height = 480)
plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (killowatts)")
dev.off()

