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
  ## NOTE: Do not round the result!
  
  files <- list.files(directory, full.names = TRUE)
  rdf <- data.frame(pollutant=numeric())
  for (i in id){
    fdf <- read.csv(files[i], header = TRUE)[,pollutant]
    rdf <- rbind(rdf, data.frame(pollutant= fdf))
  }
  mean(unlist(rdf), na.rm = TRUE)
}