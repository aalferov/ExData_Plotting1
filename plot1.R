##This script makes the first plot as requested in the Assignment 1
load("data.table")

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

#Draw the histogram & save it to PNG file
png('plot1.png')
hist(as.numeric(targetDF$Global_active_power),xlab="Global Active Power (kilowatts))",col = "red",main = "Global Active Power")
dev.off()


