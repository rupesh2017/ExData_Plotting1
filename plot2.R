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
png("plot2.png")

#create plot
plot(x,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#turn off graphics
dev.off()

#caution:
# plot(wday(data$Date,label=TRUE),data$Global_active_power)
#Don't worry about converting to weekdays, r can do some smart things 
# if you let it choose the labels
