
library(sqldf)
mydata <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")
closeAllConnections()
DateTime <- strptime(paste(mydata$Date,mydata$Time),"%d/%m/%Y %H:%M:%S")
mydata <- cbind(DateTime,mydata)

png(filename = "plot2.png", width = 480, height = 480)

plot(mydata$DateTime,mydata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
