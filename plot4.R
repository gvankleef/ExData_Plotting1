data <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##subset the data for the days in feb
data_feb <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

##format datetime variable for the plot
data_feb$Date <- as.Date(data_feb$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_feb$Date), data_feb$Time)
data_feb$Datetime <- as.POSIXct(datetime)


## Plot 4
par(mfcol = c(2,2), mar = c(4,4,1,1))
with(data_feb, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power", xlab="")
})
with(data_feb, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Energy sub metering", xlab="", col = "black")
        points(Sub_metering_2~Datetime, type="l", col = "red")
        points(Sub_metering_3~Datetime, type="l", col = "blue")
        legend("topright", col = c("black","red","blue"),
               legend = c("Sub metering_1","Sub metering_2","Sub metering_3"),lwd=1, bty = "n")
})
with(data_feb, {
        plot(Voltage~Datetime, type="l",
             ylab="Voltage", xlab="")
})
with(data_feb, {
        plot(Global_reactive_power~Datetime, type="l",
             , xlab="")
})
dev.copy(png,'plot4.png', width=480, height=480)
dev.off()