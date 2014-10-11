##Getting data
data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
data =subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data$Datetime = as.POSIXct(paste(as.Date(data$Date), data$Time))

##Drawing plot
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", col="red", main = "Global Active Power")
dev.copy(png, file = "plot1.png", height=480, width=640)
dev.off()