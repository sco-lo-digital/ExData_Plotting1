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
png(filename= "plot2.png", width = 480, height = 480, pointsize = 12, bg="white")
#Plot
plot(power$Time, power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Close device
dev.off()

