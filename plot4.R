#getting data
data<- read.table('./household_power_consumption.txt', header= TRUE, sep = ";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )
gl_ac_power <- as.numeric(as.character(data$Global_active_power))
gl_reac_power <- as.numeric(as.character(data$Global_reactive_power))
Voltage <- as.numeric(as.character(data$Voltage))
sm1 <- as.numeric(as.character(data$Sub_metering_1))
sm2 <- as.numeric(as.character(data$Sub_metering_2))
sm3 <- as.numeric(as.character(data$Sub_metering_3))
time <- (as.POSIXct(paste(data$Date, data$Time)))
#not excluding '?' as did not find any in data

#plotting data
png('./plot4.png', height = 480, width = 480)
par(mfrow= c(2,2))

plot(time, gl_ac_power, type = "l", ylab = "Global Active Power", xlab = "")  #top left

plot(time, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")  #top right

plot(time, sm1, col = "black", ylab = "Energy sub metering", xlab = "", type ="l")  #bottom left
lines(time, sm2, col = "red")
lines(time, sm3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch = "-", pt.cex = 2, cex = 0.8, bty = "n" )

plot(time,gl_reac_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")   #bottom right
dev.off()