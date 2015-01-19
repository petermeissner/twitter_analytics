

try(setwd("C:/Dropbox/RPackages"))

library(twitteranalytics)
library(dplyr)
library(lme4)

path        <- "twitter_analytics/data"
name        <- "all"
dump        <- paste0(path, "/", name,".twitterlog")
tw_data <- get_twitter_log(dump)


x <- tw_data
info=c("n_friends","n_following","n_follower",
       "n_tweets","d_tweets","n_lists",
       "n_favs")
