#' script logging my twitter statistics

# packages
require(twitteR)
require(twitteranalytics)

# working dir
setwd("D:/Peter/Dropbox/RPackages/")

# logging some more
dump <- "ADCR.twitterlog"
reset_time <- 15*60

Sys.sleep(reset_time)
  getting_started()
  tw_data <- twitter_log("marvin_dpr"     , file = dump)
Sys.sleep(reset_time)
  getting_started()
  tw_data <- twitter_log("simonsaysnothin", file = dump)
Sys.sleep(reset_time)
  getting_started()
  tw_data <- twitter_log("christianrubba" , file = dump)
Sys.sleep(reset_time)
  getting_started()
  tw_data <- twitter_log("jonas_nijhuis"  , file = dump)
Sys.sleep(reset_time)
  getting_started()
  tw_data <- twitter_log("RDataCollection", file = dump)

plot(tw_data)
tw_data


















