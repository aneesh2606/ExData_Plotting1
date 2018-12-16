#getting data
data<- read.table('./household_power_consumption.txt', header= TRUE, sep = ";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )
gl_ac_power <- as.numeric(as.character(data$Global_active_power))
time <- (as.POSIXct(paste(data$Date, data$Time)))
#not excluding '?' as did not find any in data

#plotting data
png('./plot2.png', height = 480, width = 480)
plot(time, gl_ac_power, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")
dev.off()