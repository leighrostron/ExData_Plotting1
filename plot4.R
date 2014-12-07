## download zip file from link provided in course notes
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## open zip file and place txt file into Data directory

## Read in the full dataset
datafull <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
datafull$Date <- as.Date(datafull$Date, format="%d/%m/%Y")

## Subsetting the data to the required dates
data <- subset(datafull, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Combine date and time to give single date & time value 
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## open png file device, set filename and picture size
png(file="plot4.png", height=480, width=480)

## Set global plot environment variables - set 2 x 2 matrix and
## set margins and text size
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

## Write data to plot 4
with (data, {
    plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
    plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="")
    plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power",xlab="")
})

## Close off the write to the png file
dev.off()