plot3 <- function(){
  
  source("loadData.R")
  # Load the data
  data <- loadData()
  
  # Create the plot, set the background color so it is not transparent
  par(bg="white")
  with(data, {
    plot(data$dateTime, data$Sub_metering_1, pch=21, col="white",xlab="",ylab="Energy sub metering")
    points(data$dateTime, data$Sub_metering_2, pch=21,col="white" )
    points(data$dateTime, data$Sub_metering_3,pch=21, col="white" )
  })
  
  # Add lines
  lines(data$dateTime, data$Sub_metering_1, col="black")
  lines(data$dateTime, data$Sub_metering_2, col="red")
  lines(data$dateTime, data$Sub_metering_3, col="blue")
  
  legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1, lty=c(1,1,1))
  
  # Write to file. Default size is 480 * 480
  dev.copy(png, file = "plot3.png")
  # Close device
  dev.off()
}
