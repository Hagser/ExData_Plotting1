#plot4.R
#read file, but limit to the first 100 000 rows.
f<-read.csv("household_power_consumption.txt",sep = ";",na.strings="?",nrows=100000,dec = ".")
#fetch a subset of the of read rows.
rd <- f[f$Date %in% c("1/2/2007","2/2/2007") ,]

#destroy the f object to clear up memory
f<-NULL

#convert fields to double
for(i in 3:7)
      rd[,i]<-as.double(rd[,i])

#creates a list of datetimes
days <- strptime(paste(rd$Date, rd$Time, sep=" "), "%d/%M/%Y %H:%M:%S") 

#plot to PNG
png(filename="plot4.png",width=640,height=480)
#set plot parameters to add plots in 2 rows and 2 columns
par(mfrow=c(2,2))
#create plot for Global Active Power
plot(days,rd$Global_active_power,xlab="days",ylab = "Global Active Power (kilowatts)",main="",col="black",type="l")

#create plot for Voltages
plot(days,rd$Voltage,xlab="days",ylab = "Voltage",main="",col="black",type="l")

#create a plot with the first sub metering
plot(days, rd$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="days")
#adds the two next sub metering values
lines(days, rd$Sub_metering_2, type="l", col="red")
lines(days, rd$Sub_metering_3, type="l", col="blue")
#sets up to show a legend of the lines.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#create plot for Global REActive power

plot(days,rd$Global_reactive_power,xlab="days",ylab = "Global Reactive Power (kilowatts)",main="",col="black",type="l")
#close device
dev.off()
