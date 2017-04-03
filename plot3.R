#read the data
my_data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", 
                    colClasses=c("factor", "factor", "numeric", "numeric","numeric", "numeric", "numeric", "numeric", "numeric"))
#convert the Date
my_data$Date<-as.Date(my_data$Date, "%d/%m/%Y")
#select only the days 2007-02-01 and 2007-02-02
my_days<-subset(my_data, Date=="2007-02-01" | Date=="2007-02-02")
#add date info in the variable Time
my_days$Time<-paste(my_days$Date, my_days$Time, sep=" ")
my_days$Time<-strptime(my_days$Time, "%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "C") #to have days' names in English
#open graphic device
png(filename = "plot3.png", width = 480, height = 480)
#plot Sub_metering_1 vs Time
with(my_days,plot(Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
#plot Sub_metering_2 vs Time not overwriting the previous plot, and with same axes limits
par(new=TRUE)
with(my_days,plot(Time, Sub_metering_2, type="l", col="red", axes = FALSE, xlab ="", ylab ="", ylim=c(0,35)))
#plot Sub_metering_3 vs Time not overwriting the previous plot, and with same axes limits
par(new=TRUE)
with(my_days,plot(Time, Sub_metering_3, type="l", col="blue", axes=FALSE, xlab="", ylab="", ylim=c(0,35)))
#legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue")) 
#close graphic device
dev.off()