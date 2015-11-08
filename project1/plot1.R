# Name of dataframe
df_name <- "powerConsum"

if (exists(df_name) == FALSE){
  source("powerData.R")
  powerConsum <- powerData()
}

png(file="plot1.png",width=480,height=480)
hist(powerConsum$Global_active_power, 
     col = "red", 
     main = paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)")
dev.off()
