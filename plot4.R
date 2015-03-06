plot4 <- function(){
  
  # Load the data
  data <- loadData()
  
  par(mfrow = c(2, 2))
  
  # Create the plot
  with(data, {
    plot(data$dateTime, data$Global_active_power, pch=21, col="white",xlab="",ylab="Global Active Power")
    lines(data$dateTime, data$Global_active_power)
    plot(data$dateTime, data$Voltage, pch=21,col="white" , xlab="datetime", ylab="Voltage")
    lines(data$dateTime, data$Voltage)
    plot(data$dateTime, data$Sub_metering_1, pch=21, col="white",xlab="",ylab="Energy sub metering")
    points(data$dateTime, data$Sub_metering_2, pch=21,col="white" )
    points(data$dateTime, data$Sub_metering_3,pch=21, col="white" )
    lines(data$dateTime, data$Sub_metering_1, col="black")
    lines(data$dateTime, data$Sub_metering_2, col="red")
    lines(data$dateTime, data$Sub_metering_3, col="blue")
    legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1, lty=c(1,1,1))
    plot(data$dateTime, data$Global_reactive_power, pch=21,col="white" , xlab="datetime", ylab="Global_reactive_power")
    lines(data$dateTime, data$Global_reactive_power)
  })
  
  # Write to file. Default size is 480 * 480
  dev.copy(png, file = "plot4.png")
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