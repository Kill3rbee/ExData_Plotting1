# Name of dataframe
df_name <- "powerConsum"

if (exists(df_name) == FALSE){
  source("powerData.R")
  powerConsum <- powerData()
}

png(file="plot2.png",width=480,height=480)
plot(powerConsum$Global_active_power ~ powerConsum$Time, 
     type = "l",
     ylab = "Global Active Power (kilowatts)", 
     xlab = "")
dev.off()