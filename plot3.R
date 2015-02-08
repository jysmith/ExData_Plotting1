# Read data file and extract the part for 2007-02-01 and 2007-02-02
data_raw <- read.table("household_power_consumption.txt", header=TRUE,
                       sep=";", na.strings="?", nrows=2080000,
                       colClasses=c(rep("character",2), rep("numeric",7)) )

data <- data_raw[data_raw$Date == "1/2/2007" | data_raw$Date == "2/2/2007",]
rm(data_raw)  # clear large data frame

# Convert strings to Date/Time class
time <- strptime( paste(data$Date, data$Time) , "%d/%m/%Y %T" )

# Create plot3
png(filename="plot3.png", width=480, height=480)

plot(time, data$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
points(time, data$Sub_metering_2, type="l", col="red")
points(time, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
