# read the table
t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
str(t)

library(lubridate)

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
t <- subset(t,dmy(t$Date) >= "2007-2-1" & dmy(t$Date) <= "2007-2-2")

## combine the date and time column and create a new column called dt (i.e date_time)
dt <- paste(t$Date, t$Time)
## format the dt column to POSIXct
dt <- dmy_hms(dt)
## add the dt column to the original dataset t
t <- cbind(t,dt)

hist(t$Global_active_power, main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col="red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()



