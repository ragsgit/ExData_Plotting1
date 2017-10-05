# Coursera - Exploratory Data Analyis - Project 1 - plot 1, 
# Oct. 2017, Rag Ram

## Constants that can be easily changed.
# Data file link is as of Oct. 2017, may change
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destFile <- "eda1data.zip"
dataFile <- "household_power_consumption.txt"
dateFrom <- "1/2/2007"
dateTo   <- "2/2/2007"
outPutFile <- "plot2.png"

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
message("File data being loaded into memory...")
# read data from unzip file dataFile,  NA = "?"
# we will read the whole data and then subset later
eda1data_full <- read.table(dataFile, header=TRUE, na.strings="?", sep=";")
# subset the required data
# select the 2 day data Feb 1 to Feb 2, 2007
message("File data loaded into memory, subsetting for data range...")
eda1data_subset <- eda1data_full[(eda1data_full$Date== dateFrom | data_full$Date== dateTo ), ]

#date conversion
eda1data_subset$Date <- as.Date(eda1data_subset$Date, format="%d/%m/%Y")
dateTime <- paste(eda1data_subset$Date, eda1data_subset$Time)
eda1data_subset$DateTime <- as.POSIXct(dateTime)

# Just plot as line chart per assignment
# using y ~ x
plot(eda1data_subset$DateTime, eda1data_subset$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

# export to a png file by copying
message ("Copying plot to file")
dev.copy(png, file=outPutFile, height=480, width=480)
# close the device/file
dev.off()
message("all done")