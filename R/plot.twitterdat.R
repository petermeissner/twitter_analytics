#' plot method for twitterdat
#'
#'
#'@param x data to be plotted

plot.twitterdat <- function(x, ...){
  maxy <- rep(max(x$n_following, x$n_follower, na.rm=T), length(x$date))
  plot(x$date, maxy, 
       ylab="n",xlab="date", 
       ylim=c(0, max(maxy, na.rm=T) ),
       type="n") 
  points(x$date, x$n_following, col="#3B9AB264", pch=19)
  points(x$date, x$n_follower,  col="#F21A0064", pch=19)
  points(x$date, x$n_friends,   col="#EBCC2A64", pch=19)
  ids <- unique(x$id)
  for( i in seq_along(ids) ){
    iffer <- x$id==ids[i]
    lines(x$date[iffer], x$n_following[iffer], col="#3B9AB2")
    lines(x$date[iffer], x$n_follower[iffer],  col="#F21A00")
    lines(x$date[iffer], x$n_friends[iffer],   col="#EBCC2A")
  }
  legend("topleft", 
         col     = c ("#3B9AB264", "#F21A0064", "#EBCC2A64" ), 
         legend  = c ("following", "follower", "friend"),
         lwd= 5
         )
}
