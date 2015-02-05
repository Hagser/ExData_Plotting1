#plot3.R
#read file, but limit to the first 100 000 rows.
f<-read.csv("household_power_consumption.txt",sep = ";",na.strings="?",nrows=100000,dec = ".")
#fetch a subset of the of read rows.
rd <- f[f$Date %in% c("1/2/2007","2/2/2007") ,]
#destroy the f object to clear up memory
f<-NULL
#convert fields to double
for(i in 3:7)
      rd[,i]<-as.double(rd[,i])
#reset plot-row parameters
par(mfrow=c(1,1))
#creates a list of datetimes
days <- strptime(paste(rd$Date, rd$Time, sep=" "), "%d/%M/%Y %H:%M:%S") 
#create lists for sub metering
sM1 <- rd$Sub_metering_1
sM2 <- rd$Sub_metering_2
sM3 <- rd$Sub_metering_3

#plot to PNG
png("plot3.png", width=640, height=480)
#create a plot with the first sub metering
plot(days, sM1, type="l", ylab="Energy sub metering", xlab="")
#adds the two next sub metering values
lines(days, sM2, type="l", col="red")
lines(days, sM3, type="l", col="blue")
#sets up to show a legend of the lines.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#close device
dev.off()