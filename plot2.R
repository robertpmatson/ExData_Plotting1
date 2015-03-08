plot2 <- function(){
  
  # Load the source for the loadData function
  source("loadData.R")
  # Load the data
  data <- loadData()
  
  # Write to file. Create a PNG device that will be written to.
  png("plot2.png", height=480, width=480, units="px")
  
  # Create the plot, set the background color so it is not transparent
  par(bg="white")
  plot( data$dateTime, data$Global_active_power,  pch=21, col="white", xlab="", ylab="Global Active Power (kilowatts)")
  # Add lines
  lines(data$dateTime, data$Global_active_power)
  
  # Close device
  dev.off()
  
}
