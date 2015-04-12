## Bruce Montgomery 4/11/2015 brmjr@computer.org

## Exploratory Data Analysis - Class Project 1 - Plot 4

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

# plot 4 - 2x2 chart group

par(mfrow=c(2,2))  # making a rowwise 2x2 graph page
with(dd, {

  # Plot 1,1 - A line graph of Global Active Power
  plot(dd$Global_active_power,type="l",axes=FALSE,xlab="",ylab="Global Active Power")
  axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
  axis(2)
  box()
  
  # Plot 1,2 - A Voltage line graph
  plot(Voltage,ylab="Voltage",xlab="datetime",type="l",axes=FALSE)
  axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
  axis(2,at=c(234,236,238,240,242,244,246),labels=c("234","","238","","242","","246"))
  box()

  # Plot 2,1 - A combination of the three sub metering values on 1 graph
  with(dd,plot(Sub_metering_1,ylab="Energy sub metering",xlab="",axes=FALSE,type="l"))
  with(dd,lines(Sub_metering_2,col="red"))
  with(dd,lines(Sub_metering_3,col="blue"))
  legend("topright",lty=1,lwd=2,cex=.8,bty="n",
         col=c("black","red","blue"),
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
  axis(2)
  box()
  
  # Plot 2,2 - A line graph of Global Reactive Power
  plot(dd$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l",axes=FALSE)
  axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
  axis(2)
  box()
  
  
})


