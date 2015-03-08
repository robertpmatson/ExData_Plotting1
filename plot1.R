plot1 <- function(){
  
  # Load the source for the loadData function
  source("loadData.R")
  # Load the data
  data <- loadData()
  
  # Write to file. Create a PNG device that will be written to.
  png("plot1.png", height=480, width=480, units="px")
  
  # Create the plot, set the background color so it is not transparent
  par(bg="white")
  hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="orangered")
  
  # Close device
  dev.off()
  
}