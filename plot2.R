###################################################################################################################
##### plot2.R 
###################################################################################################################
library(dplyr)  					## Loads the dplyr package so I can use features such as filter  
library(data.table)  				## Loads the data.table package which is a lot faster for handling big data.frames 
setwd("D:\\R\\ExData_Plotting1") 	## sets working directory
houseHoldDataFile = "../data/household_power_consumption.txt"  ## sets file name and location
houseHoldData = data.table(read.table(houseHoldDataFile,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")) ## reads the data file  
houseHoldSubsetData = filter(houseHoldData,Date %in% c("1/2/2007","2/2/2007"))       ## extracts the data from two days only ( 1st and 2nd of Feb 2007)
DateAndTime = strptime(paste(houseHoldSubsetData$Date, houseHoldSubsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 						## merges date + time
png("plot2.png") 																														## allocates png device to write to disk						
plot(DateAndTime, as.numeric(houseHoldSubsetData$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")		## generates the plot
dev.off() 																																## deallocate the device



