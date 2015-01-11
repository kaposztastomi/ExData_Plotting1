rm(list=ls(all=TRUE))  # remove all variables

setwd('C:/Coursera/R/ExpDataAnal/1 week')   # set WD

data=read.table('household_power_consumption.txt', dec=".", sep=";", 
                header=TRUE, na.strings="?")


data$Date<-as.Date(data$Date, "%d/%m/%Y")



head(data)

datapoint <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02" ) , ]

par(mfrow = c(1, 1))


##egyesplott
hist(datapoint$Global_active_power,
     main="Global active power",
     xlab="Global Active Power (kilowatts)",
     col="Red")

dev.copy(png, file = "plot1.png",  width = 480, height = 480, units = "px") 
dev.off()