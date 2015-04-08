##Purpose: create a histogram of Global Active Power vs. Frequency for 2007-02-01/02
#Input: string containing name of file in folder, already unzipped. 

plot1 <- function(data_set){
     #Read the data file, already unzipped, as a data frame
     NRG <- read.table(data_set,
                       sep=";",
                       na.strings="?",
                       header=TRUE)
     #unfortunately this week I don't have time to work out how to efficiently 
     #subset the dates before reading the file -- been very sick 

     #Subset the dates of interest
     of_interest <- NRG[c(grep("01/02/2007",NRG$Date)),]
     of_interest <- rbind(of_interest,NRG[c(grep("02/02/2007",NRG$Date)),])
     
     #create the png file
     png(filename = "plot1.png",
         width = 480, height = 480)
     
     #Generate the histogram
     hist(of_interest$Global_active_power,
          col="red",
          xlab="Global Active Power (kilowatts)",
          ylab="Frequency",
          main="Global Active Power")
     
     dev.off()
}