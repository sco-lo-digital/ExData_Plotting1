#Work of Scott Jacobs
#Coursera: Exploratory Data Anaalysis
#Course Project 1

#Read in needed rows for analysis.
power<-read.table("household_power_consumption.txt", sep=";", skip= 66637, nrows= 2880, na.strings="?")
#Add names to columns
names(power)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#To use strptime
power$Time<-paste(power$Date, power$Time, sep="")
#Convert dates to appropriate class
power$Date<-as.Date(power$Date, "%d/%m/%Y")
#Converts times to appropriate class
power$Time<-strptime(power$Time, "%d/%m/%Y %H:%M:%S")
#PNG
png(filename= "plot4.png", width = 480, height = 480, pointsize = 12, bg="white")
#Set parameters
par(mfrow = c(2,2))
par(mar= c(4,4,1,1))
#Upper Left Plot
plot(power$Time, power$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#Upper Right Plot
plot(power$Time, power$Voltage, type="l", xlab="datetime", ylab="Voltage")
#Lower Left Plot
plot(power$Time, power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power$Time, power$Sub_metering_2, col="red")
lines(power$Time, power$Sub_metering_3, col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        bty="n",
        lty=c(1, 1, 1),
        col=c("black","red","blue"), cex=.5, text.font=.05)
#Lower Right Plot
plot(power$Time, power$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
#Close device
dev.off()