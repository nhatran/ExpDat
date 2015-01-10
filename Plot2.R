#This assignment uses data from
## "http://archive.ics.uci.edu/ml/" UC Irvine Machine Learning Repository
## Project 1, Plot 2

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

 png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")

 plot(data$DateTime,data$Global_active_power,type = "l", xlab = "",
     ylab="Global Active Power (Killowats)")


dev.off()


