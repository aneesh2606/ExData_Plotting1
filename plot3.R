#getting data
data<- read.table('./household_power_consumption.txt', header= TRUE, sep = ";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )
sm1 <- as.numeric(as.character(data$Sub_metering_1))
sm2 <- as.numeric(as.character(data$Sub_metering_2))
sm3 <- as.numeric(as.character(data$Sub_metering_3))
time <- (as.POSIXct(paste(data$Date, data$Time)))
#not excluding '?' as did not find any in data

#plotting data
png('./plot3.png', height = 480, width = 480)
plot(time, sm1, col = "black", ylab = "Energy sub metering", xlab = "", type ="l")
lines(time, sm2, col = "red")
lines(time, sm3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch = "-",pt.cex = 2 )
dev.off()