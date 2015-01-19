#' plot method for twitterdat
#'
#'
#'@param x data to be plotted
#'@param info type of data to be plotted

tw_plot_d_tweets <- function(x, ...)
{
  x <- tw_data
  x$date  <- as.POSIXct(x$date)
  x       <- arrange (x, screen_name, date)
  x       <- group_by(x, screen_name)
  x       <- mutate(  x,  
               n_tweets_lag = lag(n_tweets), 
               d_tweets =
                 ( (  n_tweets - lag(n_tweets) ) ) / 
                 (( as.numeric(date)-as.numeric( lag(date)) )/(60*60*24))
              )
  x$party <- ifelse(is.na(x$party) | x$party=="", "none", x$party )
  
  cols    <- c("#3B9AB264","#FF9AB264",)
  cols    <- list(peaks ="#FF9AB2FF",
                  none  ="#3B9AB264", 
                  cdu   ="#1B346C64",
                  csu   ="#1B346C64",
                  gruene="#89B151A0",
                  linke ="#FF246B64",
                  spd   ="#F54B1A64", 
                  fdp   ="#F8E03E64")
  
  # plot
  maxy    <- rep(max(x$d_tweets, na.rm=T), length(x$date))
  maxy[1] <- min(x$d_tweets, na.rm=T)
  plot(x$date, maxy, 
       ylab="tweets per day",xlab="date", 
       ylim=c(0, max(maxy, na.rm=T) ),
       type="n") 
  ids <- unique(x$id)
  for( i in seq_along(ids) ){
    iffer <- x$id==ids[i]
    color <- cols[[x$party[iffer][1]]]
    lines(x$date[iffer], x$d_tweets[iffer], col=color)
  }
  
  # model
    model  <- lmer(d_tweets ~ (1 | screen_name), data = x)
  
  # residual plot
    res    <- residuals(model) 
    res    <- ifelse( res>=0, res, 0 )
    iffer  <- res > quantile(res, 0.99)
    date   <- x[as.numeric(rownames(model@frame)),"date"]$date
    tweets <- x[as.numeric(rownames(model@frame)),"d_tweets"]$d_tweets
    points(date[iffer], tweets[iffer], col=cols[["peaks"]], pch=20)
  
  # legend
   legend("topleft", 
           col     = unlist(cols), 
           legend  = names(cols),
           pch     = c(20,20)
           )
}


