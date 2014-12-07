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

## Make up Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to png file of required size
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()