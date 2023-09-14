file='household_power_consumption.txt'


hhpower <- read.table(file, header = TRUE, sep = ";", dec = ".")

tab1 <- subset(hhpower, format(as.Date(hhpower$Date, format = "%d/%m/%Y"),"%Y")=="2007")

tab2 <- subset(tab1, format(as.Date(tab1$Date, format = "%d/%m/%Y"),"%m")=="02")

tab <- subset(tab2, format(as.Date(tab2$Date, format = "%d/%m/%Y"),"%d")%in% c('01', '02'))

png("Plot1.png", width=480, height=480)

plot1 <- hist(as.numeric(tab$Global_active_power), main="Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col = "red")

dev.off()