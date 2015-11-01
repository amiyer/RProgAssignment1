corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  files <- list.files(directory, full.names = TRUE)
  rv <-  c(numeric())
  for(i in seq_along(files)){
    wdf <- read.csv(files[i], header = TRUE)
    if( sum( complete.cases(wdf)) >= threshold) {
      rv <- c(rv, cor( wdf[complete.cases(wdf),"sulfate"], wdf[complete.cases(wdf),"nitrate"] ))
    }
    
  }
  rv
}