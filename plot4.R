##set the working directory 
setwd("/Users/bigboss/documents/R")

##read data that corresponds to specific date range
data <- read.table("household_power_consumption.txt",sep = ";",skip = 66637, nrow = 2880)

##rename the imported data 
require(dplyr)
data <- rename(data, Date = V1, Time = V2, Global_active_power = V3, Global_reactive_power = V4, Voltage = V5, Global_intensity = V6, Sub_metering_1 = V7, Sub_metering_2 = V8, Sub_metering_3 = V9)

##combine date and time 
data$date_time <- paste(data$Date, data$Time)
##transform the date and time format 
require(lubridate)
data$date_time <- dmy_hms(data$date_time)
##set the parameter
par(mfrow = c(2,2))
##plot the first graph 
plot(data$date_time, data$Global_active_power, type = "l", xlab = "", ylab = "Blobal Active Power")
##plot the second graph 
plot(data$date_time, data$Voltage, type = "l", xlab = "datetime" ,ylab = "Voltage")
##plot the third graph 
plot(data$date_time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(data$date_time, data$Sub_metering_2, type = "l", xlab = "", col = "red")
lines(data$date_time, data$Sub_metering_3, type = "l", xlab = "", col = "blue")
legend("topright", legend = c("sub_metering_1","sub_metering_2", "sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1), box.lwd = 0, cex = 0.5)
##plot the forth graph 
plot(data$date_time, data$Global_reactive_power, type = "l", xlab = "datetime" ,ylab = "Voltage")
##save the forth plot 
dev.copy(png, 'plot4.png')
dev.off