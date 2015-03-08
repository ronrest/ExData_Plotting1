################################################################################
#                                                                          SETUP
################################################################################
dataFile <- "household_power_consumption.txt"

# The range of datetimes that we are interested in looking at
startDate <- strptime("2007-02-01 0:0:0", format="%Y-%m-%d %H:%M:%S")
endDate <- strptime("2007-02-02 23:59:0", format="%Y-%m-%d %H:%M:%S")


################################################################################
#                                                                    IMPORT DATA
################################################################################
# Since the process of extracting the relevant rows of data from the data file  
# is something that is shared by all of the plotN.R scripts, this code has been 
# placed in a separate R file called "getData.R"
# This was done to make the code recyclable, and easily editable from one single 
# location. 
# 
# Its just a matter of calling the getDataInDateRange() function, and telling it 
# where the data file is located, and specifying the start and end date-times of 
# interest. 

source("getData.R")
df <- getDataInDateRange(dataFile, startDate, endDate)


################################################################################
#                                                                   CREATE PLOT3
################################################################################
png("plot3.png", width=480, heigh=480, units="px")
with(df, {
    plot(Timestamp, Sub_metering_1, 
         col="black", 
         type="l", 
         xlab="", 
         ylab="Energy sub metering")
    points(Timestamp, Sub_metering_2, 
           col="red", 
           type="l")
    points(Timestamp, Sub_metering_3, 
           col="blue", 
           type="l")
    legend("topright", 
           pch=NA, 
           lty=1, 
           col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()

