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

times <- paste(data$Date,data$Time)
times <- strptime(times,"%d/%m/%Y %H:%M:%S")


png(filename="D:/mooc/Exploratory Data Analysis/pro1/plot2.png", height=480, width=480, 
    bg="white")
plot(times,as.numeric(data$Global_active_power),type="l",
     ylab="Global Active Power(kilowatts)",xlab="")
dev.off()