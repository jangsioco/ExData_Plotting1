library(sqldf)
mydata <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")
closeAllConnections()
DateTime <- strptime(paste(mydata$Date,mydata$Time),"%d/%m/%Y %H:%M:%S")
mydata <- cbind(DateTime,mydata)

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2)) 
plot(mydata$DateTime, mydata$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power") 

plot(mydata$DateTime, mydata$Voltage, type="l", 
     xlab="datetime", ylab="Voltage") 

plot(mydata$DateTime, mydata$Sub_metering_1, type="l", col="black", 
     xlab="", ylab="Energy sub metering") 
lines(mydata$DateTime, mydata$Sub_metering_2, col="red") 
lines(mydata$DateTime, mydata$Sub_metering_3, col="blue") 
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, bty = "n", cex = 0.75) 

plot(mydata$DateTime, mydata$Global_reactive_power, type="n", 
     xlab="datetime", ylab="Global_reactive_power") 
lines(mydata$DateTime, mydata$Global_reactive_power)

dev.off()