###################################################################################################################
##### plot4.R 
###################################################################################################################
library(dplyr)  					## Loads the dplyr package so I can use features such as filter  
library(data.table)  				## Loads the data.table package which is a lot faster for handling big data.frames 
setwd("D:\\R\\ExData_Plotting1") 	## sets working directory
houseHoldDataFile = "../data/household_power_consumption.txt"  ## sets file name and location
houseHoldData = data.table(read.table(houseHoldDataFile,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")) ## reads the data file  
houseHoldSubsetData = filter(houseHoldData,Date %in% c("1/2/2007","2/2/2007"))       ## extracts the data from two days only ( 1st and 2nd of Feb 2007)

DateAndTime = strptime(paste(houseHoldSubsetData$Date, houseHoldSubsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ## merges date + time
globalActivePower = as.numeric(houseHoldSubsetData$Global_active_power)								## converts from char to numbers and creates a list	
globalReactivePower = as.numeric(houseHoldSubsetData$Global_reactive_power)
subMetering1 = as.numeric(houseHoldSubsetData$Sub_metering_1)		## converts from char to numbers and creates a list
subMetering2 = as.numeric(houseHoldSubsetData$Sub_metering_2)		## converts from char to numbers and creates a list
subMetering3 = as.numeric(houseHoldSubsetData$Sub_metering_3)		## converts from char to numbers and creates a list
voltage = as.numeric(houseHoldSubsetData$Voltage)
png("plot4.png", width=480, height=480)								## allocates png device to write to disk
par(mfrow = c(2, 2)) 
plot(DateAndTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(DateAndTime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(DateAndTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(DateAndTime, subMetering2, type="l", col="red")
lines(DateAndTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")
plot(DateAndTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off() ## deallocate the device



