##Purpose: create a plot Global Active Power over 2007-02-01 and 2007-02-02

plot2 <- function(data_set){
     #Read the data file, already unzipped, as a data frame
     NRG <- read.table(data_set,
                       sep=";",
                       na.strings="?",
                       header=TRUE)
     #unfortunately this week I don't have time to work out how to efficiently 
     #subset the dates before reading the file -- been very sick 
     
     #Subset the dates of interest
     of_interest <- NRG[c(which(NRG$Date=="1/2/2007")),]
     of_interest <- rbind(of_interest,NRG[c(which(NRG$Date=="2/2/2007")),])
     
     #Create a date/time column
     date_time <- strptime(paste(of_interest$Date, of_interest$Time), 
                           "%d/%m/%Y %H:%M:%S")
     
     #create the png file
     png(filename = "plot2.png",
         width = 480, height = 480)
     
     #Plot time vs. Global Active Power
     plot(date_time,of_interest$Global_active_power,
          xlab="",
          ylab="Global Active Power(kilowatts)",
          pch=".")
     
     #Add the connecting line
     lines(date_time,of_interest$Global_active_power)
     
     dev.off()
}