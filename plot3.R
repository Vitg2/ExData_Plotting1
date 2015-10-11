# code for reading the data 
d=read.table('./data/household_power_consumption.txt', header = TRUE, sep = ";", dec = ".", na.strings = "?")
x=which(d$Date=="1/2/2007" | d$Date=="2/2/2007")
d1=d[x, ]
x=with(d1, paste(Date, Time))
d1$Time=strptime(x, "%d/%m/%Y %H:%M:%S", tz="GMT")
d1$Date <- NULL

#plot3
plot(d1$Time, d1$Sub_metering_1, type="l", ylab='Energy sub-metering', xlab="")
lines(d1$Time, d1$Sub_metering_2, col="red")
lines(d1$Time, d1$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), cex = 0.8, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()