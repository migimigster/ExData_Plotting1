householddata <- "household_power_consumption.txt"
hhdata <- read.table(householddata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
ssd <- hhdata[hhdata$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(ssd$Date, ssd$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(ssd$Global_active_power)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()