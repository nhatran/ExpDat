#This assignment uses data from
## "http://archive.ics.uci.edu/ml/" UC Irvine Machine Learning Repository
## Project 1, Plot 3

## Download the data and extract the data
 Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
 download.file(Url, destfile = "EXPData.zip")
 unzip("EXPData.zip", "household_power_consumption.txt")
 alldata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subsetting to get only the data needed
 alldata$Date <- as.Date(alldata$Date, format = "%d/%m/%Y")
 data <- subset(alldata, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
 rm(alldata)

## Convert Dates/Times
 DateTime <- paste(data$Date,data$Time)
## data$DateTime <- strptime(DateTime, format="%Y/%m/%d %H:%M:%S")
 data$DateTime <- as.POSIXct(DateTime)



## Making Plots
##* Construct the plot and save it to a PNG file with a width of 480
##pixels and a height of 480 pixels. 

 png(filename = "plot3.png", width = 480, height = 480, bg = "white")

## Plot Sub_metering_1
 plot(data$DateTime, data$Sub_metering_1, type = "l",col = "black",
     xlab = "", ylab="Energy sub metering")

## Plot Sub_metering_2
 lines(data$DateTime, data$Sub_metering_2, col = "red")

## Plot Sub_metering_3
 lines(data$DateTime, data$Sub_metering_3, col = "blue")

## Add the legend
 legend(x = "topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
     lty = c(1,1), lwd = 2, col = c("black","red","blue"))

dev.off()


