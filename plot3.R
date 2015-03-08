plot3 <- function(){
  
  # Load the source for the loadData function
  source("loadData.R")
  # Load the data
  data <- loadData()
  
  # Write to file. Create a PNG device that will be written to.
  png("plot3.png", height=480, width=480, units="px")
  
  # Create the plot, set the background color so it is not transparent
  # Note: Using with( data, { ... }) did not work without add data frame name so did not use
  par(bg="white")
  plot(data$dateTime, data$Sub_metering_1, pch=21, col="white",xlab="",ylab="Energy sub metering")
  points(data$dateTime, data$Sub_metering_2, pch=21,col="white" )
  points(data$dateTime, data$Sub_metering_3,pch=21, col="white" )

  
  # Add lines
  lines(data$dateTime, data$Sub_metering_1, col="black")
  lines(data$dateTime, data$Sub_metering_2, col="red")
  lines(data$dateTime, data$Sub_metering_3, col="blue")
  
  # Add legend
  legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1, lty=c(1,1,1))
  
  # Close device
  dev.off()
}
