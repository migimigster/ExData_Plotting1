## Getting full dataset
householddata <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                      nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
householddata$Date <- as.Date(householddata$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(householddata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(householddata)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
