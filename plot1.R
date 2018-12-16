#getting data
data<- read.table('./household_power_consumption.txt', header= TRUE, sep = ";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
#not excluding '?' as did not find any in data

#plotting data
png('./plot1.png', height = 480, width = 480)
hist(data$Global_active_power,col= "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", ylim = c(0,1200))
dev.off()