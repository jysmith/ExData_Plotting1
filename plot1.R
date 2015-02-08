# Read data file and extract the part for 2007-02-01 and 2007-02-02
data_raw <- read.table("household_power_consumption.txt", header=TRUE,
                       sep=";", na.strings="?", nrows=2080000,
                       colClasses=c(rep("character",2), rep("numeric",7)) )

data <- data_raw[data_raw$Date == "1/2/2007" | data_raw$Date == "2/2/2007",]
rm(data_raw)  # clear large data frame

# Create plot1
png(filename="plot1.png", width=480, height=480)

hist(data$Global_active_power, col="red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()
