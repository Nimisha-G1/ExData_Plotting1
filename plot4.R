## read dataset
df <- read.delim("household_power_consumption.txt",sep=";")

## extract required rows and transform data
df1 <- df[df$Date=="1/2/2007"|df$Date=="2/2/2007",]
date_time <- paste(df1$Date , df1$Time)
df1$Time=strptime(date_time,"%d/%m/%Y %H:%M:%S")
df1$Date=as.Date(df1$Date,"%d/%m/%Y")
df1[3:9] <- apply(df1[3:9],2,as.numeric)

## create plot
png(filename = "plot4.png",width= 480, height= 480, units ="px")
par(mfrow=c(2,2))
#plot1
plot(df1$Time, df1$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#plot2
plot(df1$Time, df1$Voltage, type="l", xlab="datetime", ylab="Voltage")
#plot3
plot(df1$Time, df1$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(df1$Time,df1$Sub_metering_2,col="red")
lines(df1$Time,df1$Sub_metering_3,col="blue")
legend("topright", legend= names(df1[7:9]), col=c("black","red","blue"), lty=1, bty="n")
#plot4
plot(df1$Time, df1$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
