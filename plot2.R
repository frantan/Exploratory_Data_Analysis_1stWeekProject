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
png(filename = "plot2.png", width = 480, height = 480)
#plot Global active power vs time
with(my_days,plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active power (kilowatts)"))
#close graphic device
dev.off()