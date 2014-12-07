##download zip file from link provided in course notes
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##open zip file and place txt file into Data directory

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
png(file="plot3.png", height=480, width=480)

## Make up plot 3 - call initial line with plot, then add additional sources with lines
plot(data$Sub_metering_1~data$Datetime, type="l", ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_2~data$Datetime,col='Red')
lines(data$Sub_metering_3~data$Datetime,col='Blue')

## set the legend in top right
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close off the write to the png file
dev.off()