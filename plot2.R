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
#                                                                   CREATE PLOT2
################################################################################
png("plot2.png", width=480, heigh=480, units="px")
with(df, plot(Timestamp, Global_active_power, 
              type="l", 
              xlab="", 
              ylab="Global Active Power (kilowatts)"))
dev.off()
