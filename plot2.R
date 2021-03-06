setwd("C:/Users/EV010409/Documents/Coursera/Exploratory_Data_Analysis")
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Global_active_power<-as.numeric(levels(data$Global_active_power))[data$Global_active_power]
data$DateFilter<-as.Date(as.character(data$Date), '%d/%m/%Y')
date$TimeFilter<-as.character(data$Time)
subdata<-subset(data, DateFilter >= '2007-02-01' & DateFilter <= '2007-02-02')
subdata$DateWhole<-paste(subdata$DateFilter, as.character(subdata$Time))
subdata$DateP<-as.POSIXct(subdata$DateWhole)

png(file="plot2.png")
plot(subdata$DateP,subdata$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()
