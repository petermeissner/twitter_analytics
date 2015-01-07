#' logging twitter statistics
#' 
#' @param screen_name name or id for which statistics should be gathered
#' @param file wether or not info should be added to log file, might be either T/F or the name of the log-file; if set to true the log file name will consists of the account namewit hending 'twitterlog'
twitter_log <- function(screen_name, file=T){
  # little paste helper 
  '%.%' <- function(a,b) paste0(a,b)
  # only screen_nbame supplied or more? 
  if ( is.list(screen_name) ) {
    data_input  <- screen_name$extra
    screen_name <- screen_name$name
  }
  # file name for dumping data
  if ( file == T ) {
    fname <- screen_name  %.% ".twitterlog"
  } 
  if ( is.character(file) ) {
    fname <- file
  } 
  # retrievingh data
  ff_data   <- get_ff_data(screen_name)
  user      <- getUser(screen_name)
  data <- 
    data.frame( date        = Sys.time(), 
                id          = user$id,
                screen_name = screen_name,
                n_tweets    = user$statusesCount,
                n_favs      = user$favoritesCount,
                n_following = user$friendsCount,
                n_follower  = user$followersCount,
                n_friends   = sum(ff_data$friend),
                n_lists     = user$listedCount,
                stringsAsFactors=F)
  # adding possible further data
  for( i in seq_along(names(data_input)) ) {
    data[, names(data_input)[i] ] <- data_input[[i]]
  }
  # producing pseudo-json for new data to be appended to file 
  data_pseudojson <- stringr::str_replace_all(jsonlite::toJSON(data),"(^\\[)|(\\]$)","")
  # append new pseudo-json to file and load whole data from file thereafter
  if ( file != F  ) {
    if( file.exists(fname) ){
      write(paste0(" , ", data_pseudojson), file=fname, append=TRUE)
    }else{
      write(data_pseudojson, file=fname, append=TRUE)
    }
    if ( file.exists(fname) ) {
      data <- get_twitter_log(fname)
    } 
  } 
  # return whole data
  invisible(data)
}








