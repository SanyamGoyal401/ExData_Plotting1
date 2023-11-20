power <- read.table("household_power_consumption.txt", skip = 1, sep=';')
colnames(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

power$Date = as.Date(power$Date, "%d/%m/%Y")

data_new <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02", ]

data_new$Global_active_power = as.numeric(data_new$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(data_new$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (killowatts)")
dev.off()