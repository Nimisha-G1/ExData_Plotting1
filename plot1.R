## read dataset
df <- read.delim("household_power_consumption.txt",sep=";")

## extract required rows and transform data
df1 <- df[df$Date=="1/2/2007"|df$Date=="2/2/2007",]
date_time <- paste(df1$Date , df1$Time)
df1$Time=strptime(date_time,"%d/%m/%Y %H:%M:%S")
df1$Date=as.Date(df1$Date,"%d/%m/%Y")
df1[3:9] <- apply(df1[3:9],2,as.numeric)

## create plot
png(filename = "plot1.png",width= 480, height= 480, units ="px")
hist(df1$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
