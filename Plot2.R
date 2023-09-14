file='household_power_consumption.txt'
##file is in current dir

hhpower <- read.table(file, header = TRUE, sep = ";", dec = ".")
##storing data in hhpower variable

tab1 <- subset(hhpower, format(as.Date(hhpower$Date, format = "%d/%m/%Y"),"%Y")=="2007")
##tab1 contains subset of data for 2007

tab2 <- subset(tab1, format(as.Date(tab1$Date, format = "%d/%m/%Y"),"%m")=="02")
##tab2 contains subset of data for Feb 2007

tab <- subset(tab2, format(as.Date(tab2$Date, format = "%d/%m/%Y"),"%d")%in% c('01', '02'))
##tab has the final data set for 1st to 2nd Feb 2007


png("Plot2.png", width=480, height=480)

plot2 <- plot(tab$Global_active_power, type="l",  xaxt = "n", ylab = "Global Active Power(kilowatts)")
axis(1, at = c(0,1500,2900), labels = c("Thu", "Fri","Sat"))

dev.off()