##This script makes the fourth plot as requested in the Assignment 1
library("data.table")

#Download & unzip text file with the dataset
setwd("D:/Coursera/Data Science/Exploratory Data Analysis/ExData_Plotting1")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- "household_power_consumption.zip"
download.file(url, file)
unzip(file)

#Load & subset required data from txt file into a target dataframe
hpcDF <- fread("household_power_consumption.txt",header = TRUE,sep = ";")
hpcDF$Date <-as.Date(hpcDF$Date, format='%d/%m/%Y')
targetDF <- hpcDF[hpcDF$Date %in%  as.Date(c('2007-02-01','2007-02-02')), ]
datetime <- as.POSIXct(paste(targetDF$Date,targetDF$Time))
targetDF <- cbind(targetDF,datetime)

#Draw the histogram & save it to PNG file
png("plot4.png")
par(mfrow=c(2,2))
plot(targetDF$datetime,targetDF$Global_active_power, type = "l",xlab="DateTime",ylab= "Global Active Power (kilowatts)")
plot(targetDF$datetime,targetDF$Voltage,type = "l",xlab="DateTime",ylab="Voltage")
plot(targetDF$datetime,targetDF$Sub_metering_1,type = "l",xlab="DateTime",ylab="Energy sub metering", format="%a")
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
lines(targetDF$datetime,targetDF$Sub_metering_2,type = "l",col="red")
lines(targetDF$datetime,targetDF$Sub_metering_3,type = "l",col="blue")
plot(targetDF$datetime,targetDF$Global_reactive_power,type = "l",xlab="DateTime",ylab="Global_reactive_power")
dev.off()
