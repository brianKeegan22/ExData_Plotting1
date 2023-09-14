file='household_power_consumption.txt'


hhpower <- read.table(file, header = TRUE, sep = ";", dec = ".")

tab1 <- subset(hhpower, format(as.Date(hhpower$Date, format = "%d/%m/%Y"),"%Y")=="2007")

tab2 <- subset(tab1, format(as.Date(tab1$Date, format = "%d/%m/%Y"),"%m")=="02")

tab <- subset(tab2, format(as.Date(tab2$Date, format = "%d/%m/%Y"),"%d")%in% c('01', '02'))

png("Plot2.png", width=480, height=480)

plot2 <- plot(tab$Global_active_power, type="l",  xaxt = "n", ylab = "Global Active Power(kilowatts)")
axis(1, at = c(0,1500,2900), labels = c("Thu", "Fri","Sat"))

dev.off()