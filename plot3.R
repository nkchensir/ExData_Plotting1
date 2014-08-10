setwd("D:/mooc/Exploratory Data Analysis/pro1")
Sys.setlocale("LC_TIME", "C")


myfile <- file("household_power_consumption.txt", "r")
line=readLines(myfile,n=1)
mynames=strsplit(line,split=";")[[1]]
options(stringsAsFactors = FALSE)
data <- data.frame()
while( length(line) != 0 ) {
  line=readLines(myfile,n=1)
  #  print(line)
  curlist = strsplit(line,split=";")[[1]]
  curDate = as.Date(curlist[1], "%d/%m/%Y")
  if(curDate =="2007-02-01" | curDate =="2007-02-02")
  {
    data = rbind(data,curlist)
  }
  if(curDate>"2007-02-02")
    break
  
  
}
colnames(data) = mynames

png(filename="D:/mooc/Exploratory Data Analysis/pro1/plot3.png", height=480, width=480, 
    bg="white")
plot(times,as.numeric(data$Sub_metering_1),type="l",
     ylab="Energy sub metering",xlab="")
lines(times,as.numeric(data$Sub_metering_2),col="red")
lines(times,as.numeric(data$Sub_metering_3),col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"),lty=1)
dev.off()