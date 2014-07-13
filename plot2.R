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
png("plot2.png", 480, 480)

## Line plot
plot(powerData$datetime, powerData$Global_active_power, type = 'l', 
     xlab = '', ylab = 'Global Active Power (kilowatts)')

dev.off()
