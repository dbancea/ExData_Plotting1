# set the working directory
setwd("D:\\cursuri\\ExploratoryDataAnalysis\\PeerAssigment01");

# Load the data from the, convert the columns to data types and subset the data only to 2007/02/01 and 2007/02/02
PowerConsumption <- subset(read.table("household_power_consumption.txt",header=TRUE, sep=";"
                                      ,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
                                      ,na.strings="?"), as.Date(Date,"%d/%m/%Y") == as.Date("2007-02-01")  | as.Date(Date, "%d/%m/%Y") == as.Date("2007-02-02") );

# add the Date/Time column based on Date and Time columns using strptime
PowerConsumption$DateTime <- strptime(paste(PowerConsumption$Date, PowerConsumption$Time),"%d/%m/%Y %H:%M:%S");

# create bitmap device png, 480x480, filename plot4.png
png("plot4.png", height=480, width=480);

# create graph# 4

# set multiplot dimensions 2x2
par(mfcol = c(2,2));

# plot Global Active Power
plot(PowerConsumption$DateTime, PowerConsumption$Global_active_power, pch = NA, xlab = "", ylab = "Global Active Power (kilowatts)");
lines(PowerConsumption$DateTime, PowerConsumption$Global_active_power);

# plot Energy sub metering
plot(PowerConsumption$DateTime, PowerConsumption$Sub_metering_1, pch = NA, xlab = "", ylab = "Energy sub metering");
lines(PowerConsumption$DateTime, PowerConsumption$Sub_metering_1, col = "black");
lines(PowerConsumption$DateTime, PowerConsumption$Sub_metering_2, col = "red");
lines(PowerConsumption$DateTime, PowerConsumption$Sub_metering_3, col = "blue");

# add the legend to the plot, top right
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1, 1, 1), bty = "n", col = c("black", "red", "blue"));


# plot Voltage
plot(PowerConsumption$DateTime, PowerConsumption$Voltage, pch = NA, xlab = "datetime", ylab="Voltage");
lines(PowerConsumption$DateTime, PowerConsumption$Voltage, lwd = 0.2, col = "grey30");

# plot Global Reactive Power
plot(PowerConsumption$DateTime, PowerConsumption$Global_reactive_power, pch = NA, xlab = "datetime", ylab = "Global_reactive_power");
lines(PowerConsumption$DateTime, PowerConsumption$Global_reactive_power, lwd = 0.2, col = "grey30");

# close png device/file
dev.off();
