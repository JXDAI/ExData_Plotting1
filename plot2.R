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

##plot the second line graph 
plot(data$date_time, data$Global_active_power, type = "l", xlab = "", ylab = "Blobal Active Power(Kilowatts)")
##save the second plot 
dev.copy(png, 'plot2.png')
dev.off