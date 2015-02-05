#plot1.R
#read file, but limit to the first 100 000 rows.
f<-read.csv("household_power_consumption.txt",sep = ";",na.strings="?",nrows=100000,dec = ".")
#convert field to Date
f[,"Date"]<-as.Date(f[,"Date"],"%d/%M/%Y")
#convert field to Time
f[,"Time"]<-strptime(f[,"Time"],format = "%H:%M:%S")
#fetch a subset of the of read rows.
rd<-subset(x=f,f[,"Date"]==as.Date("2007-02-01")|f[,"Date"]==as.Date("2007-02-02"))
#destroy the f object to clear up memory
f<-NULL
#convert field "Global_active_power" to double
rd[,3]<-as.double(rd[,3])

#plot to PNG
png("plot1.png", width=640, height=480)
#reset plot-row parameters
par(mfrow=c(1,1))
hist(rd$Global_active_power,xlab = "Global Active Power (kilowatts)",main="Global Active Power",col="red")
#close device
dev.off()