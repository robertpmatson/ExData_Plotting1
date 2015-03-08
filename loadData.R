loadData <- function(){
  
  # LIbrary used for date processing
  library(lubridate)
  # LIbrary used for data frame processing
  library(dplyr)

  # Import all data as character. We cannot import numerics directly as numeric
  # because we need to clean the data
  cols <- c(rep("character",9))
  
  # Read the data
  data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", 
                     header=TRUE, sep=";", colClasses=cols)
  # LOad as a table
  data <- tbl_df(data)
  
  # Filter for the dates
  data <- filter(data, dmy(Date) >= ymd("2007/02/01") & dmy(Date) <= ymd("2007/02/02"))
  # Remove entries without a numeric
  data <- filter(data, Global_active_power != "?")
  
  # Set numeric columns to numeric types
  data <- mutate(data, Global_active_power = as.numeric(Global_active_power))
  data <- mutate(data, Global_reactive_power = as.numeric(Global_reactive_power))
  data <- mutate(data, Voltage = as.numeric(Voltage))
  data <- mutate(data, Global_intensity = as.numeric(Global_intensity))
  data <- mutate(data, Sub_metering_1 = as.numeric(Sub_metering_1))
  data <- mutate(data, Sub_metering_2 = as.numeric(Sub_metering_2))
  data <- mutate(data, Sub_metering_3 = as.numeric(Sub_metering_3))
  # Add a column that has the Date and Time columns appended and converted to a posixCT date time
  data <- mutate(data, dateTimeDate = dmy_hms(paste(Date, Time)))
  data
  
}