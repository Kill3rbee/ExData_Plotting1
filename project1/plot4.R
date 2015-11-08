# Name of dataframe
df_name <- "powerConsum"

if (exists(df_name) == FALSE){
  source("powerData.R")
  powerConsum <- powerData()
}

png(file="plot4.png",width=480,height=480)
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(powerConsum, {
  plot(Global_active_power ~ Time, 
       type = "l", 
       ylab = "Global Active Power", 
       xlab = "")
  
  plot(Voltage ~ Time, type = "l", 
       ylab = "Voltage", 
       xlab = "Datetime")
  
  plot(Sub_metering_1 ~ Time, 
       type = "l", 
       ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_2 ~ Time, col = 'Red')
  lines(Sub_metering_3 ~ Time, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), 
         lty = 1, 
         lwd = 2, 
         bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power ~ Time, 
       type = "l", 
       ylab = "Global_rective_power", 
       xlab = "Datetime")
})
dev.off()