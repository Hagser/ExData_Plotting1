#plot2.R
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
#creates a list of values 
GAPS <- rd$Global_active_power

#plot to PNG
png("plot2.png", width=640, height=480)
#reset plot-row parameters
par(mfrow=c(1,1))
plot(days,GAPS,xlab="",ylab = "Global Active Power (kilowatts)",main="",col="black",type="l")
#close device
dev.off()
