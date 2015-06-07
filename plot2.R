data_read <- function(){
  #   utility function that read the data set for the week 1 project  
  dt <- read.table('household_power_consumption.txt', sep =';', header = T, na.strings='?')
  
  return (dt)
}

data_clean <- function(dt){
  #   utility function that cleans and subset the data set for the week 1 project  
  dt_2007 <- dt[dt$Date == '1/2/2007' | dt$Date == '2/2/2007', ]
  dt_2007$DateTime <- strptime(paste(dt_2007$Date, dt_2007$Time),'%d/%m/%Y %H:%M:%S')
  
  return (dt_2007)
}

plot2 <- function(){
  #   create plot2 for the week 1 project 
  dt <- data_clean(data_read())
  
  plot(dt$DateTime,dt$Global_active_power, type ='l',xlab='', ylab='Global Active Power (kilowatts)', main='')
  dev.copy(png, file = "plot2.png")
  dev.off()
}