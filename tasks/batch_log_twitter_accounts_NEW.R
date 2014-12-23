#' script logging my twitter statistics

# packages
library(twitteranalytics)

# working dir
try(setwd("D:/Peter/Dropbox/RPackages/"))
try(setwd("C:/Dropbox/RPackages/"))

# logging some more
i<-1
name <- "ADCR"
dump <- paste0(name,".twitterlog")
reset_time <- 1 #15*60
twitter_accounts <- list(
    list(name="marvin_dpr"     , extra=list(adcr=TRUE)),
    list(name="simonsaysnothin", extra=list(adcr=TRUE)), 
    list(name="christianrubba" , extra=list(adcr=TRUE)), 
    list(name="jonas_nijhuis"  , extra=list(adcr=TRUE)), 
    list(name="RDataCollection", extra=list(adcr=TRUE))   
  )

for ( i in seq_along(twitter_accounts)) {
  getting_started()
  tw_data <- twitter_log(twitter_accounts[[i]]$name     , file = dump)  
  Sys.sleep(reset_time)
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


















