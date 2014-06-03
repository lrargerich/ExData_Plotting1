# Creates plot2.png (frog)

# Read the data
data <- read.table("data/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

data$Sub_metering_1=as.numeric(data$Sub_metering_1)
data$Sub_metering_2=as.numeric(data$Sub_metering_2)
data$Sub_metering_3=as.numeric(data$Sub_metering_3)

data$Date=as.Date(data$Date,format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Time=strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

# Subset only the records we are going to use
gdata <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

png(file="plot2.png")


plot(gdata$Time,gdata$Global_active_power,
     type='l',
     xlab="",
     ylab="Global Active Power (kilowats)")

dev.off()