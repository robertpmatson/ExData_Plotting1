plot2 <- function(){
  
  source("loadData.R")
  # Load the data
  data <- loadData()
  
  # Create the plot, set the background color so it is not transparent
  par(bg="white")
  plot( data$dateTime, data$Global_active_power,  pch=21, col="white", xlab="", ylab="Global Active Power (kilowatts)")
  # Add lines
  lines(data$dateTime, data$Global_active_power)
  
  # Write to file. Default size is 480 * 480
  dev.copy(png, file = "plot2.png")
  # Close device
  dev.off()
  
}
