### Exploratory Analysis project 1
##Plot2
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


p2<-function(){
plot(df1$DT, df1$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
}
p2

