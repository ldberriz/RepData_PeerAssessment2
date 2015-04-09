require("plyr")
require("ggplot2")

## Function to download the zip file if not already there
dnldfile <- function(fileURL, fname) {  
  if(!file.exists(fname)) {
    download.file(fileURL, destfile=fname) 
  }
}

# Generic function to unzip and extract .zip files:
getZFile <- function(fzip,fname) {
  if (!file.exists(fzip)) {dnldfile(fzip,fname)}
  unzip(fname)  
}

# Generic function to unzip and extract .zip files:
getbZFile <- function(fzip,fname) {
  if (!file.exists(fzip)) {dnldfile(fzip,fname)}
  bzfile(fname)  
}

# Function to read a file into a data frame unless the data frame already exists.
readDFile <- function(dframe, datafile) {
  if (class(try(class(dframe)=="data.frame", TRUE)) == "try-error") {
    dframe <- read.csv(datafile)
  }
}
  