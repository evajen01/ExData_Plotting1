setwd("C:/Users/EV010409/Documents/Coursera/Exploratory_Data_Analysis")
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Global_active_power<-as.numeric(levels(data$Global_active_power))[data$Global_active_power]
data$DateFilter<-as.Date(as.character(data$Date), '%d/%m/%Y')
subdata<-subset(data, DateFilter >= '2007-02-01' & DateFilter <= '2007-02-02')
subdata$DateWhole<-paste(subdata$DateFilter, as.character(subdata$Time))
subdata$DateP<-as.POSIXct(subdata$DateWhole)

png(file="plot4.png")

par(mfrow=c(2,2)) #plots top/bottom
#top-left plot
plot(subdata$DateP,subdata$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
plot(subdata$DateP,subdata$Voltage, xlab="datetime", ylab="Voltage", type="l")
plot(subdata$DateP,subdata$Sub_metering_1, xlab="", ylab="Energy sub metering", col="black", type="l")
lines(subdata$DateP,subdata$Sub_metering_2, col="red")
lines(subdata$DateP,subdata$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(subdata$DateP,subdata$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()
