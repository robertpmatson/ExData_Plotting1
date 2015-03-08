plot4 <- function(){
  
  # Load the source for the loadData function
  source("loadData.R")
  # Load the data
  data <- loadData()
  
  # Write to file. Create a PNG device that will be written to.
  png("plot4.png", height=480, width=480, units="px")
  
  # Set the background color so it is not transparent
  par(bg="white")
  # Set the grid to a 2 * 2 grid
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
    legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1, lty=c(1,1,1), box.col = "white", inset=0.01)
    plot(data$dateTime, data$Global_reactive_power, pch=21,col="white" , xlab="datetime", ylab="Global_reactive_power")
    lines(data$dateTime, data$Global_reactive_power)
  })
  
  # Close device
  dev.off()
  
}