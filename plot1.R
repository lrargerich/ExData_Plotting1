# Creates plot1.png (frog)

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

png(file="plot1.png")

hist(gdata$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowats)",
     main="Global Active Power",
     axes=TRUE)

axis(side=1,at=seq(0,4,by=2))
axis(side=2,at=seq(0,1221,by=200))
dev.off()