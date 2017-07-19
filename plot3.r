### Exploratory Analysis project 1
##Plot3
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
df <- unzip(temp)
unlink(temp)
df1<-read.csv2("household_power_consumption.txt", stringsAsFactors = F)
df1$Date<-as.Date(df1$Date, format="%d/%m/%Y")
#subset
df1<-df1[df1$Date %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"),]


#Construct the plot and save it to a PNG file 
#with a width of 480 pixels and a height of 480 pixels
df1$Global_active_power<-as.numeric(df1$Global_active_power)
df1$DT<-strptime(paste(df1$Date,df1$Time), format = "%Y-%m-%d %H:%M:%S")

plot(df1$DT,df1$Sub_metering_1,xlab="", ylab="Energy sub metering",type="l", col="black")
points(df1$DT,df1$Sub_metering_2, col = "red",type="l")
points(df1$DT,df1$Sub_metering_3, col = "blue",type="l")
legend("topright", col = c("black","red", "blue"), c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1))
dev.copy(png, file = "plot3.png",width=480, height=480)
dev.off()


