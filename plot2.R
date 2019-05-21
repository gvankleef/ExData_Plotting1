##Loading packages
library(downloader)
library(lubridate)

##Downloading data
if(!dir.exists("./data")){dir.create("./data")}
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download(url, dest="./data/dataset.zip", mode="wb") 
unzip ("./data/dataset.zip", exdir = "./data")

##Reading data
data <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##subset the data for the days in feb
data_feb <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

##format datetime variable for the plot
data_feb$Date <- as.Date(data_feb$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_feb$Date), data_feb$Time)
data_feb$Datetime <- as.POSIXct(datetime)


## Plot 2
with(data, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
})
dev.copy(png,'plot2.png', width=480, height=480)
dev.off()