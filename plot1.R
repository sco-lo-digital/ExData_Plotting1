#Work of Scott Jacobs
#Coursera: Exploratory Data Anaalysis
#Course Project 1

#Read in needed rows for analysis.
power<-read.table("household_power_consumption.txt", sep=";", skip= 66637, nrows= 2880, na.strings="?")
#Add names to columns
names(power)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
power$Time<-paste(power$Date, power$Time, sep="")
#Convert dates to appropriate class
power$Date<-as.Date(power$Date, "%d/%m/%Y")
power$Time<-strptime(power$Time, "%d/%m/%Y %H:%M:%S")
#PNG
png(filename= "plot1.png", width = 480, height = 480, pointsize = 12, bg="white")
#Graph
hist(power$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab= "Frequency", right=FALSE, col="red", xlim= c(0,8), ylim=c(0,1200), nclass="Sturges", axes=F)
axis(side=1, at=seq(0,6,2))
axis(side=2, at=seq(0,1200, 200))
#Close device
dev.off()
par(mar=c(5,5,8,5))