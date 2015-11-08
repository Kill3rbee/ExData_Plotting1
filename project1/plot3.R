# Name of dataframe
df_name <- "powerConsum"

if (exists(df_name) == FALSE){
  source("powerData.R")
  powerConsum <- powerData()
}

png(file="plot3.png",width=480,height=480)
with(powerConsum, {
  plot(Sub_metering_1 ~ Time, 
       type = "l", 
       ylab = "Global Active Power (kilowatts)", 
       xlab = "")
  lines(Sub_metering_2 ~ Time, col = 'Red')
  lines(Sub_metering_3 ~ Time, col = 'Blue')
})

legend("topright", col = c("black", "red", "blue"), 
       lty = 1, 
       lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()