complete <- function( directory, id = 1:332) {
  files <- list.files(directory, full.names = TRUE)
  rdf <- data.frame(id = numeric(), nobs = numeric() )
  for (i in id){
    fdf <- read.csv(files[i], header = TRUE)
    n <- sum(complete.cases(fdf))
    rdf <- rbind(rdf,data.frame(id=i, nobs=n))
  }
  rdf
}