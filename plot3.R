rm(list=ls(all=TRUE))  # remove all variables

setwd('C:/Coursera/R/ExpDataAnal/1 week')   # set WD

data=read.table('household_power_consumption.txt', dec=".", sep=";", 
                header=TRUE, na.strings="?")


data$Date<-as.Date(data$Date, "%d/%m/%Y")


datapoint <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02" ) , ]

datapoint$Date <- as.POSIXct(paste(datapoint$Date, 
                                   datapoint$Time), format="%Y-%m-%d %H:%M:%S")

##harmasplot
par(mfrow = c(1, 1))

with(datapoint, plot(datapoint$Date, datapoint$Sub_metering_1,
                     
                     type = "n",
                     xlab="",
                     ylab="Energy sub metering"))

lines(datapoint$Date, datapoint$Sub_metering_1)
lines(datapoint$Date, datapoint$Sub_metering_2, col="red")
lines(datapoint$Date, datapoint$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", 
                                                                       "Sub_metering_2",
                                                                       "Sub_metering_3"))

dev.copy(png, file = "plot3.png",  width = 480, height = 480, units = "px") 
dev.off()
