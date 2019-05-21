##Loading packages
library(downloader)
library(lubridate)

##Downloading data
if(!dir.exists("./data")){dir.create("./data")}
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download(url, dest="./data/dataset.zip", mode="wb") 
unzip ("./data/dataset.zip", exdir = "./data")

##Reading data
data <- read.csv("./data/household_power_consumption.txt", sep = ";", 
                 header = TRUE,na.strings="?", nrows=2075259, check.names=F, 
                 stringsAsFactors=F, comment.char="", quote='\"')

##set the date format
data$Date <- dmy(data_full$Date)


##subset data based on date
data_feb <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

##plot 1
hist(data_feb$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)" )
dev.copy(png,'plot1.png', width=480, height=480)
dev.off()