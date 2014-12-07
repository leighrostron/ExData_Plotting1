##download zip file from link provided in course notes
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##open zip file and place txt file into Data directory

## Read in the full dataset
datafull <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
datafull$Date <- as.Date(datafull$Date, format="%d/%m/%Y")

## Subsetting the data to the required dates
data <- subset(datafull, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Make Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to png file of required size
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()