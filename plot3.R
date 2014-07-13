## load sqldf library for read.csv2.sql()
library(sqldf)

fileName<-'household_power_consumption.txt'
sqlStmt<-"SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

## Read the entries for 1/2/2007 and 2/2/2007
powerData <- read.csv2.sql(file = fileName, sql = sqlStmt)

## Create formatted datetime column
powerData$datetime <- paste(powerData$Date, powerData$Time)
powerData$datetime <- strptime(powerData$datetime, "%d/%m/%Y %H:%M:%S")

png('plot3.png', 480, 480)

## Plot the three lines
  plot(powerData$datetime, powerData$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
  lines(powerData$datetime, powerData$Sub_metering_2, col='red')
  lines(powerData$datetime, powerData$Sub_metering_3, col='blue')
  
  ## Legend box
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
  

dev.off()