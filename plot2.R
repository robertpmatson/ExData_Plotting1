plot2 <- function(){
  
  # Load the data
  data <- loadData()

  # Create the plot
  plot( data$dateTime, data$Global_active_power,  pch=21, col="white", xlab="", ylab="Global Active Power (kilowatts)")
  # Add lines
  lines(data$dateTime, data$Global_active_power)
  
  # Write to file. Default size is 480 * 480
  dev.copy(png, file = "plot2.png")
  dev.off()
  
}

loadData <- function(){
  
  library(lubridate)
  cols <- c(rep("character",9))
  data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", 
                     header=TRUE, sep=";", colClasses=cols)
  data <- data[dmy(data$Date) >= ymd("2007/02/01") & dmy(data$Date) <= ymd("2007/02/02"),]
  data <- data[data$Global_active_power != "?",]
  
  data$Global_active_power <- as.numeric(data$Global_active_power)
  data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
  data$Voltage <- as.numeric(data$Voltage)
  data$Global_intensity <- as.numeric(data$Global_intensity)
  data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
  data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
  data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
  data$dateTimeDate <- dmy_hms(paste(data$Date, data$Time))
  data
  
}