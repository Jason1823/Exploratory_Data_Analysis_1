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

##making plot2
with(subdata, plot(Time, Global_active_power, type = "l",
                   ylab = "Global Active Power (kilowatts)",xlab = ""))
dev.copy(png,"plot2.png")
dev.off()