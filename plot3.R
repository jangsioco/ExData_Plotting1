library(sqldf)
mydata <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")
closeAllConnections()
DateTime <- strptime(paste(mydata$Date,mydata$Time),"%d/%m/%Y %H:%M:%S")
mydata <- cbind(DateTime,mydata)

png(filename = "plot3.png", width = 480, height = 480)

plot(mydata$DateTime,mydata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(mydata$DateTime,mydata$Sub_metering_2, col="Red")
lines(mydata$DateTime,mydata$Sub_metering_3, col="Blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"), bty='o', cex=.75)

dev.off()