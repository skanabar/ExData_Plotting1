## sqldf library for read.csv2.sql()
library(sqldf)

fileName<-'household_power_consumption.txt'
sqlStmt<-"SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

## Read the entries for 1/2/2007 and 2/2/2007
powerData <- read.csv2.sql(file = fileName, sql = sqlStmt)

## Create a png device
png('plot1.png', 480, 480)

## Plot histogram
hist(powerData$Global_active_power, main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)', col = 'red')

dev.off()
