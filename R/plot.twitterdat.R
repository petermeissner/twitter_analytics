#' plot method for twitterdat
#'
#'
#'@param x data to be plotted
#'@param info type of data to be plotted

plot.twitterdat <- function(x, 
                            info=c("n_friends","n_following","n_follower",
                                   "n_tweets","dtweets","n_lists",
                                   "n_favs","dfavs"), 
                            ...)
{
  x <- tw_data
  x$date    <- as.POSIXct(x$date)
  x         <- arrange (x, screen_name, date)
  x         <- group_by(x, screen_name)
  x <- mutate(x,  d_tweets = (  n_tweets - lag(n_tweets) ) / 
                            ( as.numeric((date     - lag(date))     )  / (60*60*24)) 
                  d_favs
              )
  select(x, screen_name, date, n_tweets, dtweets)
  
  x$dfavs   <- abs(rnorm(length(x$n_friends),100,35))  
    
  cols      <- c("#3B9AB264","#F21A0064","#EBCC2A64",
                 "#FF9AB264","#FF1A0064","#FFCC2A64",
                 "#3BFFB264","#F2FF0064","#EBFF2A64")
    maxy <- rep(max(x[,info], na.rm=T), length(x$date))
    plot(x$date, maxy, 
         ylab="n",xlab="date", 
         ylim=c(0, max(maxy, na.rm=T) ),
         type="n") 
    for ( i in seq_along(info) )  {
      points(x$date, x[, info[i]], col=cols[i], pch=19)
    }
    
    ids <- unique(x$id)
    for( i in seq_along(ids) ){
      iffer <- x$id==ids[i]
      for ( k in seq_along(info) ){
        lines(x$date[iffer], x[,info[k]][iffer], col=cols[k])
      }
    }
    legend("topleft", 
           col     = cols[seq_along(info)], 
           legend  = info,
           lwd     = 5
           )
}


