corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  correlations <- numeric()
  completedCasesPerFile <- complete(directory)
  idsGreaterThanThreshold <- completedCasesPerFile[completedCasesPerFile["nobs"] > threshold,1]
  
  for(i in idsGreaterThanThreshold){
    fileName <- sprintf("%s/%03G.csv",directory, i)  #ie "specdata/002.csv"
    file <- read.csv(fileName, comment.char = "")    #read in the file
    completedRows <- file[complete.cases(file), ]    #get the completed rows in file 
    correlations <- c(correlations, cor(completedRows$sulfate, completedRows$nitrate)) #correlate
  }
  
  return (correlations)
}