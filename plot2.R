# code for reading the data 
d=read.table('./data/household_power_consumption.txt', header = TRUE, sep = ";", dec = ".", na.strings = "?")
x=which(d$Date=="1/2/2007" | d$Date=="2/2/2007")
d1=d[x, ]
x=with(d1, paste(Date, Time))
d1$Time=strptime(x, "%d/%m/%Y %H:%M:%S", tz="GMT")
d1$Date <- NULL

#plot2 
plot(d1$Time, d1$Global_active_power, type="l", 
     ylab='Global Active Power (kilowatts)', xlab="")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()