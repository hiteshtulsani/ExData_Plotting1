#Unzip the file
unzip("household_power_consumption.zip")
#Read all Data
powcon <- read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F)

#Subset the data
powconsub <- subset(powcon,Date %in% c("1/2/2007","2/2/2007"))

#Change datatypes, starting with Time
powconsub$Time <- strptime(paste(powconsub$Date,powconsub$Time),format="%d/%m/%Y %T")
powconsub$Date <- as.Date(powconsub$Date,format="%d/%m/%Y")
powconsub$Global_active_power <- as.numeric(powconsub$Global_active_power)
powconsub$Global_reactive_power <- as.numeric(powconsub$Global_reactive_power)
        #Suppress warnings while converting character to numeric as '?' might throw Coersion warning
suppressWarnings(powconsub$Voltage <- as.numeric(powconsub$Voltage))
suppressWarnings(powconsub$Global_intensity <- as.numeric(powconsub$Global_intensity))
suppressWarnings(powconsub$Sub_metering_1 <- as.numeric(powconsub$Sub_metering_1))
suppressWarnings(powconsub$Sub_metering_2 <- as.numeric(powconsub$Sub_metering_2))
suppressWarnings(powconsub$Sub_metering_3 <- as.numeric(powconsub$Sub_metering_3))

#Plot 1
png("plot1.png",width=480,height=480,units="px", bg = "transparent")
hist(powconsub$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()

