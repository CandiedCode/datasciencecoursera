complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  nobs <- numeric()
  
  for(i in id){
    fileName <- sprintf("%s/%03G.csv",directory, i)  #ie "specdata/002.csv"
    file <- read.csv(fileName, comment.char = "")    #read in the file
    nobs <- c(nobs, sum(complete.cases(file)))       #get the sum of rows that don't have a NA
  }
  
  return (data.frame(id,nobs))
}