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

##making plot1 
hist(subdata$Global_active_power,col = "red",xlim = c(0,6), axes = FALSE, 
     main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
axis(1,c(0,2,4,6))
axis(2,c(0,200,400,600,800,1000,1200))
dev.copy(jpeg,"plot1.jpg")
dev.off()

