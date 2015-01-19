pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  data <- numeric()
  
  for(i in id){
    fileName <- sprintf("%s/%03G.csv",directory, i)  #ie "specdata/002.csv"
    file <- read.csv(fileName, comment.char = "")    #read in the file
    data <- c(data, file[[c(pollutant)]])            #get the column data and append to data vector
  }
  
  return (mean(data, na.rm = TRUE))                  #return mean, filtering out NA
}