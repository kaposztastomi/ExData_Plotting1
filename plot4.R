rm(list=ls(all=TRUE))  # remove all variables

setwd('C:/Coursera/R/ExpDataAnal/1 week')   # set WD

data=read.table('household_power_consumption.txt', dec=".", sep=";", 
                header=TRUE, na.strings="?")


data$Date<-as.Date(data$Date, "%d/%m/%Y")


datapoint <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02" ) , ]

datapoint$Date <- as.POSIXct(paste(datapoint$Date, 
                                   datapoint$Time), format="%Y-%m-%d %H:%M:%S")

##negyedik
par(mfrow = c(2, 2))
with(datapoint, {
plot(datapoint$Date, datapoint$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(datapoint$Date, datapoint$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datapoint$Date, datapoint$Sub_metering_1,
     type = "n",
     xlab="",
     ylab="Energy sub metering")

lines(datapoint$Date, datapoint$Sub_metering_1)
lines(datapoint$Date, datapoint$Sub_metering_2, col="red")
lines(datapoint$Date, datapoint$Sub_metering_3, col="blue")
legend("topright", lty = 1, bty="n", col = c("black","red", "blue"), legend = c("Sub_metering_1", 
                                                                       "Sub_metering_2",
                                                                       "Sub_metering_3"))     
plot(datapoint$Date, datapoint$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

})

dev.copy(png, file = "plot4.png",  width = 480, height = 480, units = "px") 
dev.off()

