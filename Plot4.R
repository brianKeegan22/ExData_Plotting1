file='household_power_consumption.txt'


hhpower <- read.table(file, header = TRUE, sep = ";", dec = ".")

tab1 <- subset(hhpower, format(as.Date(hhpower$Date, format = "%d/%m/%Y"),"%Y")=="2007")

tab2 <- subset(tab1, format(as.Date(tab1$Date, format = "%d/%m/%Y"),"%m")=="02")

tab <- subset(tab2, format(as.Date(tab2$Date, format = "%d/%m/%Y"),"%d")%in% c('01', '02'))

png("Plot4.png", width=480, height=480)


par(mfrow=c(2,2))
plot(tab$Global_active_power, type="l", xaxt = "n", ylab = "Global Active Power(kilowatts)")
axis(1, at = c(0,1500,2900), labels = c("Thu", "Fri","Sat"))

plot(tab$Voltage, type="l", xaxt = "n", xlab = "datetime" ,ylab = "Voltage")
axis(1, at = c(0,1500,2900), labels = c("Thu", "Fri","Sat"))

with(tab, plot(tab$Sub_metering_1, type="l", xaxt = "n", ylab = "Energy sub metering"))
with(tab, points(tab$Sub_metering_2, col="red", type="l"))
with(tab, points(tab$Sub_metering_3, col="blue", type="l"))
legend("topright", pch=1,col=c("black","red","blue"),legend=c("Sub_metering 1","Sub_metering 2","Sub_metering 3"))
axis(1, at = c(0,1500,2900), labels = c("Thu", "Fri","Sat"))

plot(tab$Global_reactive_power, type="l", xaxt = "n", xlab = "datetime", ylab = "Global Reactive Power")
axis(1, at = c(0,1500,2900), labels = c("Thu", "Fri","Sat"))

dev.off()