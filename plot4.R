# Creates plot4.png (frog)

data <- read.table("data/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

data$Sub_metering_1=as.numeric(data$Sub_metering_1)
data$Sub_metering_2=as.numeric(data$Sub_metering_2)
data$Sub_metering_3=as.numeric(data$Sub_metering_3)

data$Date=as.Date(data$Date,format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Time=strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

# Subset only the records we are going to use
gdata <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

png(file="plot4.png")
par(mfrow=c(2,2))

with(gdata,{
    plot(Time,Global_active_power,
         type='l',
         xlab="",
         ylab="Global Active Power (kilowats)")
    plot(Time,Voltage,
               type='l',
               xlab="datetime",
               ylab="Voltage")
    plot(gdata$Time,gdata$Sub_metering_1,
         col="black",
         type='l',
         ylab="Energy sub metering",xlab="")
    
    lines(gdata$Time,gdata$Sub_metering_2,col="red")
    lines(gdata$Time,gdata$Sub_metering_3,col="blue")
    
    legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,pt.cex=1,cex=0.8,bty="n")
    plot(Time,Global_reactive_power,
         type='l',
         xlab="datetime",
         ylab="Global_reactive_power")
     })
dev.off()
