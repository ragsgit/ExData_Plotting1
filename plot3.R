# Coursera - Exploratory Data Analyis - Project 1 - plot 1, 
# Oct. 2017, Rag Ram

## Constants that can be easily changed.
# Data file link is as of Oct. 2017, may change
projectDir <- "~/work/coursera/graphs/ExData_Plotting1"
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destFile <- "eda1data.zip"
dataFile <- "household_power_consumption.txt"
dateFrom <- "1/2/2007"
dateTo   <- "2/2/2007"
outPutFile <- "plot3.png"

setwd(projectDir)
if (!file.exists(dataFile)) {
  message("File not found, downloading...")
  download.file(fileUrl, destfile= destFile, method="curl")
  unzip(zip.file)
  unzip (destFile, exdir = "./")
  file.remove(zip.file)
  message("File downloaded and unzipped")
}
if (!file.exists(dataFile)) {
  stop("Fatal error, file not downloaded or unzip issue!")
}

# read data from unzip file dataFile,  NA = "?"
# we will read the whole data and then subset later

  message("File data being loaded into memory...")
  dataFull <- read.table(dataFile, header=TRUE, na.strings="?", sep=";")

  # subset the required data
  # select the 2 day data Feb 1 to Feb 2, 2007
  message("File data loaded into memory, subsetting for data range...")
  data <- eda1data_full[(dataFull$Date== dateFrom | dataFull$Date== dateTo ), ]
#date conversion
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(dateTime)

# Just plot as line chart per assignment, then add other lines, and legend
with(data, plot(DateTime,Sub_metering_1, type = "l",col = "black", xlab = "", ylab = "Energy sub metering"))
with(data, lines(DateTime, Sub_metering_2, col="red"))
with(data, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty="solid", cex=0.8)

# export to a png file by copying
message ("Copying plot to file")
dev.copy(png, file=outPutFile, height=480, width=480)
# close the device/file
dev.off()
message("all done")