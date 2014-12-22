#' script logging my twitter statistics

# packages
library(twitteR)
library(twitteranalytics)

# working dir
setwd("D:/Peter/Dropbox/RPackages/")

# logging some more
name <- "ADCR"
dump <- paste0(name,".twitterlog")
reset_time <- 15*60
twitter_accounts <- c(  "marvin_dpr",
                        "simonsaysnothin", 
                        "christianrubba", 
                        "jonas_nijhuis", 
                        "RDataCollection"   )

for ( i in seq_along(twitter_accounts)) {
  Sys.sleep(reset_time)
  getting_started()
  tw_data <- twitter_log(twitter_accounts[i]     , file = dump)  
}


tw_data <- get_twitter_log(dump)
pdf(file=paste0(name,".pdf"), width=10, height=7)
  plot(tw_data)
dev.off()

png(file=paste0(name,".png"), width=1920, height=1080)
  plot(tw_data)
dev.off()

pdf(file="marvin_dpr.pdf", width=10, height=7)
  plot(tw_data[tw_data$screen_name=="marvin_dpr",])
dev.off()

png(file="marvin_dpr.png", width=1920, height=1080)
  plot(tw_data[tw_data$screen_name=="marvin_dpr",])
dev.off()


tw_data


















