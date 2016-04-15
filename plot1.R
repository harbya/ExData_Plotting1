###################################################################################################################
##### plot1.R 
###################################################################################################################
library(dplyr)  					## Loads the dplyr package so I can use features such as filter  
library(data.table)  				## Loads the data.table package which is a lot faster for handling big data.frames 
setwd("D:\\R\\ExData_Plotting1") 	## sets working directory
houseHoldDataFile = "../data/household_power_consumption.txt"  ## sets file name and location
houseHoldData = data.table(read.table(houseHoldDataFile,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")) ## reads the data file  
houseHoldSubsetData = filter(houseHoldData,Date %in% c("1/2/2007","2/2/2007"))       ## extracts the data from two days only ( 1st and 2nd of Feb 2007)
png("plot1.png")                                                         ## allocates png device to write to disk
hist(as.numeric(houseHoldSubsetData$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")  ## generates the plot and places it into plot1.png
dev.off()  																																  ## deallocates the device


