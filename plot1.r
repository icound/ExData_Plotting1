### Exploratory Analysis project 1
##Plot1
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
str(df1)
df1$Global_active_power<-as.numeric(df1$Global_active_power)
p1<-function(){
hist(df1$Global_active_power, col="red", main= "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
}
p1()