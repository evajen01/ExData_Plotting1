setwd("C:/Users/EV010409/Documents/Coursera/Exploratory_Data_Analysis")
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Global_active_power<-as.numeric(levels(data$Global_active_power))[data$Global_active_power]
data$Date<-as.Date(as.character(data$Date), '%d/%m/%Y')
subdata<-subset(data, Date >= '2007-02-01' & Date <= '2007-02-02')
hist(subdata$Global_active_power, breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
