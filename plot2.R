# set the working directory
setwd("D:\\cursuri\\ExploratoryDataAnalysis\\PeerAssigment01");

# Load the data from the, convert the columns to data types and subset the data only to 2007/02/01 and 2007/02/02
PowerConsumption <- subset(read.table("household_power_consumption.txt",header=TRUE, sep=";"
                                      ,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
                                      ,na.strings="?"), as.Date(Date,"%d/%m/%Y") == as.Date("2007-02-01")  | as.Date(Date, "%d/%m/%Y") == as.Date("2007-02-02") );

# add the Date/Time column based on Date and Time columns using strptime
PowerConsumption$DateTime <- strptime(paste(PowerConsumption$Date, PowerConsumption$Time),"%d/%m/%Y %H:%M:%S");

# create bitmap device png, 480x480, filename plot1.png
png("plot2.png", height=480, width=480);

# create graph# 2
#hist(PowerConsumption$Global_active_power, freq=TRUE, col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)");
plot(PowerConsumption$DateTime, PowerConsumption$Global_active_power, pch = NA, xlab = "", ylab = "Global Active Power (kilowatts)");
lines(PowerConsumption$DateTime, PowerConsumption$Global_active_power);

# close png device/file
dev.off();
