#set working directory
#reading data
#find column class to read file faster
a <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";",nrows = 5)
classes <- sapply(a,class)

#read the file 
file <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";",nrow=2075259,colClasses = classes,na.strings = "?")

#change the date which was factor to date class
file$Date <- as.Date(file$Date,"%d/%m/%Y")

#subset required date
data <- file[file$Date >="2007-02-01" & file$Date<="2007-02-02",]

#format both date and time in combination,also paste convert the time of factor class to
#character class and strptime change it to time class

x <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")

#-----------------------------------------------------------------------------------------
#initialise png graphics
# no need for width and height argument by default it is 480p both
png("plot3.png")

#create plot
plot(x,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")

#add another curve to plot using lines()
lines(x,data$Sub_metering_2,type="l",col="red")
lines(x,data$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","red","blue"),lty=rep(1,3))

#turn off graphics
dev.off()