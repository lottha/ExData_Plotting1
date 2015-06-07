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

plot3 <- function(){
  #   create plot3 for the week 1 project 
  dt <- data_clean(data_read())
  
  plot(dt$DateTime,dt$Sub_metering_1, type ='l',xlab='', ylab='Energy sub metering', main='')
  points(dt$DateTime, dt$Sub_metering_2,col='orangered', type='l')
  points(dt$DateTime, dt$Sub_metering_3,col='blue', type='l')
  legend('topright', lty = 1, col= c('black','orangered','blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
  dev.copy(png, file = "plot3.png")
  dev.off()
}