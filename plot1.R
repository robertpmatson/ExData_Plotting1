plot1 <- function(){
  
  source("loadData.R")
  # Load the data
  data <- loadData()
  
  # Create the plot, set the background color so it is not transparent
  par(bg="white")
  hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="orangered")
  
  # Write to file. Default size is 480 * 480
  dev.copy(png, file = "plot1.png")
  # Close device
  dev.off()
  
}