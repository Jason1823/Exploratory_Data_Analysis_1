##Loading the data

## Read the file
file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";",na.strings = "?")

## Remove the na
data <- na.omit(data)

##subset the data
subdata <-data[data$Date %in% c("1/2/2007","2/2/2007"),]

##convert the date and the time
subdata$Date <- as.Date(subdata$Date, "%d/%m/%Y")
time <- paste(subdata$Date, subdata$Time)
subdata$Time <- strptime(time, "%Y-%m-%d %H:%M:%S")

##making plot3
plot(subdata$Time,subdata$Sub_metering_1, type = "l",xlab = "", ylab = "Energy sub metering")
lines(subdata$Time,subdata$Sub_metering_2,col = "red")
lines(subdata$Time,subdata$Sub_metering_3,col = "blue")

##adding the legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty = 1)
dev.copy(jpeg,"plot3.jpg")
dev.off()
