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
#----------------------------------------------------------------------------------------
#initialise png graphics
# no need for width and height argument by default it is 480p both
png("plot1.png")

#plot the graph
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (killowatts)")

#turn off graphics
dev.off()