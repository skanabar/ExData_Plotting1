## load sqldf library for read.csv2.sql()
library(sqldf)

fileName<-'household_power_consumption.txt'
sqlStmt<-"SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

## Read the entries for 1/2/2007 and 2/2/2007
powerData <- read.csv2.sql(file = fileName, sql = sqlStmt)

## Create formatted datetime column
powerData$datetime <- paste(powerData$Date, powerData$Time)
powerData$datetime <- strptime(powerData$datetime, "%d/%m/%Y %H:%M:%S")

## Create a png device
png('plot4.png', 480, 480)

## Set parameter for 2x2 plots
par(mfrow = c(2, 2))

with(powerData, {
  
  ## Line plot 1
  plot(datetime, Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power')
  
  ## Line plot 2
  plot(datetime, Voltage, type = 'l')
  
  ## Line plot 3
  plot(datetime, Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
  lines(datetime, Sub_metering_2, col='red')
  lines(datetime, Sub_metering_3, col='blue')
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
  
  ## Line plot 4
  plot(datetime, Global_reactive_power, type = 'l')
})

dev.off()