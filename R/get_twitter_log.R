#' function for retrieving twitter log from log-file
get_twitter_log <- function(fname){
  data <- jsonlite::fromJSON( 
      paste0(  "[", 
               paste(readLines(fname), collapse="\n") ,
               "]"
            )
  )
  data$date <- as.POSIXlt(data$date)
  data$id   <- as.numeric(data$id)
  class(data) <- c("twitterdat", class(data))
  
  return(data)
}
