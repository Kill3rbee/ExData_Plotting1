powerData <- function() {
    #Required libraries
    library(data.table)
    library(dplyr)
    
    # Local data zip file
    dataFileZIP <- "./Power.zip"
    
    # Name of unzipped file
    dirFile <- "./household_power_consumption.txt"
    
    # Download the dataset (. ZIP), if it does not exist
    if (file.exists(dataFileZIP) == FALSE) {
      # Sometimes changing https to http and skip method="curl" 
      # in the download.file works if having problems with curl
      fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(fileUrl, destfile = "Power.zip")
    }
    
    # Uncompress data file if non exists
    if (file.exists(dirFile) == FALSE) {
      unzip("./Power.zip")
    }
    
    # Read file
    mydf <- fread("./household_power_consumption.txt", sep=';',na.strings ="?",header=TRUE, colClasses = "character")
  
    # convert date and time variables to Date/Time class
    mydf$Date <-   as.Date(mydf$Date, "%d/%m/%Y") 
    mydf <- mutate(mydf, Time = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S')))
    mydf <- filter(mydf, Date >= "2007-02-01", Date < "2007-02-03") 
    
    # convert character variables to numeric
    mydf$Global_active_power <- as.numeric(mydf$Global_active_power)
    mydf$Global_reactive_power <- as.numeric(mydf$Global_reactive_power)
    mydf$Voltage <- as.numeric(mydf$Voltage)
    mydf$Global_intensity <- as.numeric(mydf$Global_intensity)
    mydf$Sub_metering_1 <- as.numeric(mydf$Sub_metering_1)
    mydf$Sub_metering_2 <- as.numeric(mydf$Sub_metering_2)
    
    powerConsum <- tbl_df(mydf)
    rm("mydf")
    
    return(powerConsum)
}