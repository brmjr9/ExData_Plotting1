## Bruce Montgomery 4/11/2015 brmjr@computer.org

## Exploratory Data Analysis - Class Project 1 - Plot 2

# Read in data set for specified period (used for all plots)
# Use lubridate for date formatting and logic
library(lubridate)
# Read in data set - with header row, semi-colon seperator, na character is "?"
d <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
# Convert the date and time columns to lubridate values
d$Date <- dmy(d$Date)
d$Time <- hms(d$Time)
# Trim the data down to only 2/1/07 and 2/2/07
dd <- d[d$Date>=dmy("01/02/2007") & d$Date<=dmy("02/02/2007"),]

# plot 2 - line chart of Global_active_power
plot(dd$Global_active_power,type="l",axes=FALSE,xlab="",ylab="Global Active Power (kilowatts)")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"),cex.axis=.9)
axis(2,cex.axis=.9)
box()