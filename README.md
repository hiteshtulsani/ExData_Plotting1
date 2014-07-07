Exploratory Data Analysis
========================================================
Course Project 1 - Readme
--------------------------------------------------------

***
### Submitted by: Hitesh Tulsani

***
#### The goal of this project is to consume the data from <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb], which is taken from <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine Learning Repository</a>, a popular repository for machine learning datasets and reproduce the plots given in the assigment using base plotting system.

***

The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

The plots were reproduced in following pairs:

        Script | Produces
        -------|---------
        plot1.R| plot1.png
        plot2.R| plot2.png
        plot3.R| plot3.png
        plot4.R| plot4.png

***
## Scripts' description:
***

### Common Assumptions:
<ul>
<li> The zip file is downloaded in the working directory </li>
<li> The scripts needs to unzip the .zip file as the first step </li>
</ul>

### 1. plot1.r:-


1. <b>Unzip the downloaded zip file:</b> This script starts by unzipping the "household_power_consumption.zip" presumably present in the working directory:

    ```{r}
        unzip("household_power_consumption.zip")
    ```

2. <b>Read All Data:</b> All the data is loaded in a data.frame called powcon:

    ```{r}
        powcon <- read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F)
    ```
    * Note: All the vectors will be loaded as <b>characters</b>. Their datatypes will be changed in subsequent steps


3. <b>Subset the data:</b> The data read in the step above is subset for dates <b>1st Feb 2007</b> and <b>2nd Feb 2007</b> and loaded in a variable called powconsub

    ```{r}
        powconsub <- subset(powcon,Date %in% c("1/2/2007","2/2/2007"))
    ```

4. <b>Change the datatypes:</b> The data-types of powconsub vectors are changed as follows: 
    * <b>powconsub$Time:</b> Data and Time vectors were pasted together and the time was striped using <b>strptime()</b> function:
    
    ```{r}
        powconsub$Time <- strptime(paste(powconsub$Date,powconsub$Time),format="%d/%m/%Y %T")
    ```
    * <b>powconsub$Date</b>: Date vector was rewritten using <b>as.Date()</b>:
    
    ```{r}
        powconsub$Date <- as.Date(powconsub$Date,format="%d/%m/%Y")
    ```
    * Following vectors were converted to <b>numeric types</b> and enclosed inside <b>suppressWarnings()</b> method (where necessary), as "?" in data produce coersion warnings:
    
    ```{r}
        #Global_active_power
                powconsub$Global_active_power <- as.numeric(powconsub$Global_active_power)
        
        #Global_reactive_power
                powconsub$Global_reactive_power <- as.numeric(powconsub$Global_reactive_power)
        
        #Voltage with suppressWarning
                suppressWarnings(powconsub$Voltage <- as.numeric(powconsub$Voltage))
        
        #Global_intensity with suppressWarning
                suppressWarnings(powconsub$Global_intensity <- as.numeric(powconsub$Global_intensity))
        
        #Sub_metering_1 with suppressWarning
                suppressWarnings(powconsub$Sub_metering_1 <- as.numeric(powconsub$Sub_metering_1))
        
        #Sub_metering_2 with suppressWarning
                suppressWarnings(powconsub$Sub_metering_2 <- as.numeric(powconsub$Sub_metering_2))
        
        #Sub_metering_3 with suppressWarning
                suppressWarnings(powconsub$Sub_metering_3 <- as.numeric(powconsub$Sub_metering_3))
    ```
5. <b>plot1.png</b> was reproduced using following code:
    ```{r}
        png("plot1.png",width=480,height=480,units="px", bg = "transparent")
        hist(powconsub$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
        dev.off()
    ```
6. The <b>reproduced plot</b> is as shown below:

   ![plot1.png](plot1.png)

### 2. plot2.r:-


1. <b>Unzip the downloaded zip file:</b> This script starts by unzipping the "household_power_consumption.zip" presumably present in the working directory:

    ```{r}
        unzip("household_power_consumption.zip")
    ```

2. <b>Read All Data:</b> All the data is loaded in a data.frame called powcon:

    ```{r}
        powcon <- read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F)
    ```
    * Note: All the vectors will be loaded as <b>characters</b>. Their datatypes will be changed in subsequent steps


3. <b>Subset the data:</b> The data read in the step above is subset for dates <b>1st Feb 2007</b> and <b>2nd Feb 2007</b> and loaded in a variable called powconsub

    ```{r}
        powconsub <- subset(powcon,Date %in% c("1/2/2007","2/2/2007"))
    ```

4. <b>Change the datatypes:</b> The data-types of powconsub vectors are changed as follows: 
    * <b>powconsub$Time:</b> Data and Time vectors were pasted together and the time was striped using <b>strptime()</b> function:
    
    ```{r}
        powconsub$Time <- strptime(paste(powconsub$Date,powconsub$Time),format="%d/%m/%Y %T")
    ```
    * <b>powconsub$Date</b>: Date vector was rewritten using <b>as.Date()</b>:
    
    ```{r}
        powconsub$Date <- as.Date(powconsub$Date,format="%d/%m/%Y")
    ```
    * Following vectors were converted to <b>numeric types</b> and enclosed inside <b>suppressWarnings()</b> method (where necessary), as "?" in data produce coersion warnings:
    
    ```{r}
        #Global_active_power
                powconsub$Global_active_power <- as.numeric(powconsub$Global_active_power)
        
        #Global_reactive_power
                powconsub$Global_reactive_power <- as.numeric(powconsub$Global_reactive_power)
        
        #Voltage with suppressWarning
                suppressWarnings(powconsub$Voltage <- as.numeric(powconsub$Voltage))
        
        #Global_intensity with suppressWarning
                suppressWarnings(powconsub$Global_intensity <- as.numeric(powconsub$Global_intensity))
        
        #Sub_metering_1 with suppressWarning
                suppressWarnings(powconsub$Sub_metering_1 <- as.numeric(powconsub$Sub_metering_1))
        
        #Sub_metering_2 with suppressWarning
                suppressWarnings(powconsub$Sub_metering_2 <- as.numeric(powconsub$Sub_metering_2))
        
        #Sub_metering_3 with suppressWarning
                suppressWarnings(powconsub$Sub_metering_3 <- as.numeric(powconsub$Sub_metering_3))
    ```
5. <b>plot2.png</b> was reproduced using following code:
    ```{r}
        png("plot2.png",width=480,height=480,units="px", bg = "transparent")
        plot(powconsub$Time,powconsub$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
        dev.off()
    ```
6. The <b>reproduced plot</b> is as shown below:

   ![plot2.png](plot2.png)

### 3. plot3.r:-


1. <b>Unzip the downloaded zip file:</b> This script starts by unzipping the "household_power_consumption.zip" presumably present in the working directory:

    ```{r}
        unzip("household_power_consumption.zip")
    ```

2. <b>Read All Data:</b> All the data is loaded in a data.frame called powcon:

    ```{r}
        powcon <- read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F)
    ```
    * Note: All the vectors will be loaded as <b>characters</b>. Their datatypes will be changed in subsequent steps


3. <b>Subset the data:</b> The data read in the step above is subset for dates <b>1st Feb 2007</b> and <b>2nd Feb 2007</b> and loaded in a variable called powconsub

    ```{r}
        powconsub <- subset(powcon,Date %in% c("1/2/2007","2/2/2007"))
    ```

4. <b>Change the datatypes:</b> The data-types of powconsub vectors are changed as follows: 
    * <b>powconsub$Time:</b> Data and Time vectors were pasted together and the time was striped using <b>strptime()</b> function:
    
    ```{r}
        powconsub$Time <- strptime(paste(powconsub$Date,powconsub$Time),format="%d/%m/%Y %T")
    ```
    * <b>powconsub$Date</b>: Date vector was rewritten using <b>as.Date()</b>:
    
    ```{r}
        powconsub$Date <- as.Date(powconsub$Date,format="%d/%m/%Y")
    ```
    * Following vectors were converted to <b>numeric types</b> and enclosed inside <b>suppressWarnings()</b> method (where necessary), as "?" in data produce coersion warnings:
    
    ```{r}
        #Global_active_power
                powconsub$Global_active_power <- as.numeric(powconsub$Global_active_power)
        
        #Global_reactive_power
                powconsub$Global_reactive_power <- as.numeric(powconsub$Global_reactive_power)
        
        #Voltage with suppressWarning
                suppressWarnings(powconsub$Voltage <- as.numeric(powconsub$Voltage))
        
        #Global_intensity with suppressWarning
                suppressWarnings(powconsub$Global_intensity <- as.numeric(powconsub$Global_intensity))
        
        #Sub_metering_1 with suppressWarning
                suppressWarnings(powconsub$Sub_metering_1 <- as.numeric(powconsub$Sub_metering_1))
        
        #Sub_metering_2 with suppressWarning
                suppressWarnings(powconsub$Sub_metering_2 <- as.numeric(powconsub$Sub_metering_2))
        
        #Sub_metering_3 with suppressWarning
                suppressWarnings(powconsub$Sub_metering_3 <- as.numeric(powconsub$Sub_metering_3))
    ```
5. <b>plot3.png</b> was reproduced using following code:
    ```{r}
        png(file='plot3.png',width = 480, height = 480, units = "px", bg = "transparent")
        plot(powconsub$Time,powconsub$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
        lines(powconsub$Time,powconsub$Sub_metering_2,col='red')
        lines(powconsub$Time,powconsub$Sub_metering_3,col='blue')
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
        dev.off()
    ```
6. The <b>reproduced plot</b> is as shown below:

   ![plot3.png](plot3.png)

### 4. plot4.r:-


1. <b>Unzip the downloaded zip file:</b> This script starts by unzipping the "household_power_consumption.zip" presumably present in the working directory:

    ```{r}
        unzip("household_power_consumption.zip")
    ```

2. <b>Read All Data:</b> All the data is loaded in a data.frame called powcon:

    ```{r}
        powcon <- read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F)
    ```
    * Note: All the vectors will be loaded as <b>characters</b>. Their datatypes will be changed in subsequent steps


3. <b>Subset the data:</b> The data read in the step above is subset for dates <b>1st Feb 2007</b> and <b>2nd Feb 2007</b> and loaded in a variable called powconsub

    ```{r}
        powconsub <- subset(powcon,Date %in% c("1/2/2007","2/2/2007"))
    ```

4. <b>Change the datatypes:</b> The data-types of powconsub vectors are changed as follows: 
    * <b>powconsub$Time:</b> Data and Time vectors were pasted together and the time was striped using <b>strptime()</b> function:
    
    ```{r}
        powconsub$Time <- strptime(paste(powconsub$Date,powconsub$Time),format="%d/%m/%Y %T")
    ```
    * <b>powconsub$Date</b>: Date vector was rewritten using <b>as.Date()</b>:
    
    ```{r}
        powconsub$Date <- as.Date(powconsub$Date,format="%d/%m/%Y")
    ```
    * Following vectors were converted to <b>numeric types</b> and enclosed inside <b>suppressWarnings()</b> method (where necessary), as "?" in data produce coersion warnings:
    
    ```{r}
        #Global_active_power
                powconsub$Global_active_power <- as.numeric(powconsub$Global_active_power)
        
        #Global_reactive_power
                powconsub$Global_reactive_power <- as.numeric(powconsub$Global_reactive_power)
        
        #Voltage with suppressWarning
                suppressWarnings(powconsub$Voltage <- as.numeric(powconsub$Voltage))
        
        #Global_intensity with suppressWarning
                suppressWarnings(powconsub$Global_intensity <- as.numeric(powconsub$Global_intensity))
        
        #Sub_metering_1 with suppressWarning
                suppressWarnings(powconsub$Sub_metering_1 <- as.numeric(powconsub$Sub_metering_1))
        
        #Sub_metering_2 with suppressWarning
                suppressWarnings(powconsub$Sub_metering_2 <- as.numeric(powconsub$Sub_metering_2))
        
        #Sub_metering_3 with suppressWarning
                suppressWarnings(powconsub$Sub_metering_3 <- as.numeric(powconsub$Sub_metering_3))
    ```
5. <b>plot4.png</b> was reproduced using following code:
    ```{r}
        png(file='plot4.png',width = 480, height = 480, units = "px", bg = "transparent")
        par(mfrow=c(2,2))
        plot(powconsub$Time,powconsub$Global_active_power,ylab="Global Active Power",xlab="",type="l")
        plot(powconsub$Time,powconsub$Voltage,ylab="Voltage",xlab="datetime",type="l")
        plot(powconsub$Time,powconsub$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
        lines(powconsub$Time,powconsub$Sub_metering_2,col='red')
        lines(powconsub$Time,powconsub$Sub_metering_3,col='blue')
        legend("topright",bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
        plot(powconsub$Time,powconsub$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")
        dev.off()
    ```
6. The <b>reproduced plot</b> is as shown below:

   ![plot4.png](plot4.png)