loadData <- function(){
  
  library(lubridate)
  library(dplyr)

  # Import all data as character. We cannot import numerics directly as numeric
  # because we need to clean the data
  cols <- c(rep("character",9))
  
  # Read the data
  data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", 
                     header=TRUE, sep=";", colClasses=cols)
  # LOad as a table
  data <- tbl_df(data)
  
  data <- filter(data, dmy(Date) >= ymd("2007/02/01") & dmy(Date) <= ymd("2007/02/02"))
  data <- filter(data, Global_active_power != "?")
  
  data <- mutate(data, Global_active_power = as.numeric(Global_active_power))
  data <- mutate(data, Global_reactive_power = as.numeric(Global_reactive_power))
  data <- mutate(data, Voltage = as.numeric(Voltage))
  data <- mutate(data, Global_intensity = as.numeric(Global_intensity))
  data <- mutate(data, Sub_metering_1 = as.numeric(Sub_metering_1))
  data <- mutate(data, Sub_metering_2 = as.numeric(Sub_metering_2))
  data <- mutate(data, Sub_metering_3 = as.numeric(Sub_metering_3))
  data <- mutate(data, dateTimeDate = dmy_hms(paste(Date, Time)))
  data
  
}