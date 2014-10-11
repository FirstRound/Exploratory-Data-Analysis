##Getting data
data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
data =subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data$Datetime = as.POSIXct(paste(as.Date(data$Date), data$Time))

##Drawing plot
with(data, {
   plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
   lines(Sub_metering_2~Datetime,col='Red')
   lines(Sub_metering_3~Datetime,col='Blue')
   })
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd =2, lty=1)

##Saving plot
dev.copy(png, file="plot3.png", height=480, width=640)
dev.off()