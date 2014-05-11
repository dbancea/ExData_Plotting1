# set the working directory
setwd("D:\\cursuri\\ExploratoryDataAnalysis\\PeerAssigment01");

# Load the data from the, convert the columns to data types and subset the data only to 2007/02/01 and 2007/02/02
PowerConsumption <- subset(read.table("household_power_consumption.txt",header=TRUE, sep=";"
                                      ,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
                                      ,na.strings="?"), as.Date(Date,"%d/%m/%Y") == as.Date("2007-02-01")  | as.Date(Date, "%d/%m/%Y") == as.Date("2007-02-02") );



# create bitmap device png, 480x480, filename plot1.png
png("plot1.png", height=480, width=480);

# create histogram
hist(PowerConsumption$Global_active_power, freq=TRUE, col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)");

# close png device/file
dev.off();
