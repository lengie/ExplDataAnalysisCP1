##Purpose: create a plot Global Active Power over 2007-02-01 and 2007-02-02

plot3 <- function(data_set){
     #Read the data file, already unzipped, as a data frame
     NRG <- read.table(data_set,
                       sep=";",
                       na.strings="?",
                       header=TRUE)
     #unfortunately this week I don't have time to work out how to efficiently 
     #subset the dates before reading the file -- been very sick 
     
     #Subset the dates of interest and make a new data frame with them
     of_interest <- NRG[c(which(NRG$Date=="1/2/2007")),]
     of_interest <- rbind(of_interest,NRG[c(which(NRG$Date=="2/2/2007")),])
     
     #Create a date/time column
     date_time <- strptime(paste(of_interest$Date, of_interest$Time), 
                           "%d/%m/%Y %H:%M:%S")
     
     #create the png file
     png(filename = "plot3.png",
         width = 480, height = 480)
     
     #Plot time vs. Sub metering
     with(of_interest,{
          plot(date_time,Sub_metering_1,
               pch=".") #no need to specify color
          
          plot(date_time,of_interest$Sub_metering_2,
               pch=".",
               col="blue")
          
          plot(date_time,Sub_metering_3,
               pch=".",
               col="red")
          ylab="Energy sub metering"
     })
     
     #Add the connecting lines
     lines(date_time,of_interest$Sub_metering_1,col="black")
     lines(date_time,of_interest$Sub_metering_2,col="blue")
     lines(date_time,of_interest$Sub_metering_3,col="red")
     
     #Add the legend
     legend("topright",lwd=1,col=c("black","red","blue"),
            legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     
     dev.off()
}