#' script logging my twitter statistics

# packages
library(twitteranalytics)
library(twitteR)

# working dir
try(setwd("D:/Peter/Dropbox/RPackages/"))
try(setwd("C:/Dropbox/RPackages"))

# credentials
try_file <- "C:/Users/Peter/Documents/tw_marvindpr_bot.credentials"
##try_file <- "C:/Users/Peter/Documents/tw_marvindpr.credentials"
if(file.exists(try_file)){
  cred_file <- try_file
}
try_file <- "D:/Users/Peter/Documents/tw_marvinuni.credentials"
##try_file <- "D:/Users/Peter/Documents/tw_marvindpr.credentials"
if(file.exists(try_file)){
  cred_file <- try_file
}
tmp <- readLines(cred_file)
  api_key = stringr::str_replace(
                  grep("twitter_api_key=", tmp, value = T), 
                  "twitter_api_key=", "")
  api_secret = stringr::str_replace(
                  grep("twitter_api_secret=", tmp, value = T), 
                  "twitter_api_secret=", "")
  access_token = stringr::str_replace(
                  grep("twitter_access_token=", tmp, value = T), 
                  "twitter_access_token=", "")
  access_token_secret = stringr::str_replace(
                  grep("twitter_access_token_secret=", tmp, value = T), 
                  "twitter_access_token_secret=", "")
setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)
2


# logging options
path        <- "twitter_analytics/data"
name        <- "all"
dump        <- paste0(path, "/", name,".twitterlog")
sample_size <- 1


# account list
twitter_accounts <- list(
  list(name="marvin_dpr"     , extra=list(adcr=TRUE, type="ADCR author")),
  list(name="simonsaysnothin", extra=list(adcr=TRUE, type="ADCR author")), 
  list(name="christianrubba" , extra=list(adcr=TRUE, type="ADCR author")), 
  list(name="jonas_nijhuis"  , extra=list(adcr=TRUE, type="ADCR author")), 
  list(name="RDataCollection", extra=list(adcr=TRUE, type="ADCR author")),
  list(name="RenateKuenast",   extra=list(type="DPA-GermanPoliticians", party="gruene", certified=T)),
  list(name="b_riexinger",     extra=list(type="DPA-GermanPoliticians", party="linke",  certified=T)),
  list(name="ArminLaschet",    extra=list(type="DPA-GermanPoliticians", party="cdu",    certified=T)),
  list(name="Markus_Soeder",   extra=list(type="DPA-GermanPoliticians", party="csu",    certified=T)),
  list(name="peter_simone",    extra=list(type="DPA-GermanPoliticians", party="gruene", certified=T)),
  list(name="GoeringEckardt",  extra=list(type="DPA-GermanPoliticians", party="gruene", certified=T)),
  list(name="MGrosseBroemer",  extra=list(type="DPA-GermanPoliticians", party="cdu",    certified=T)),
  list(name="sigmargabriel",   extra=list(type="DPA-GermanPoliticians", party="spd",    certified=T)),
  list(name="PetraPauMaHe",    extra=list(type="DPA-GermanPoliticians", party="linke",  certified=T)),
  list(name="HanneloreKraft",  extra=list(type="DPA-GermanPoliticians", party="spd",    certified=T)),
  list(name="JTrittin",        extra=list(type="DPA-GermanPoliticians", party="gruene", certified=T)),
  list(name="ToniHofreiter",   extra=list(type="DPA-GermanPoliticians", party="gruene", certified=T)),
  list(name="SteinbachErika",  extra=list(type="DPA-GermanPoliticians", party="cdu",    certified=T)),
  list(name="KoenigsGruen",    extra=list(type="DPA-GermanPoliticians", party="gruene", certified=T)),
  list(name="peteraltmaier",   extra=list(type="DPA-GermanPoliticians", party="cdu",    certified=T)),
  list(name="MdB_Stroebele",   extra=list(type="DPA-GermanPoliticians", party="gruene", certified=T)),
  list(name="jensspahn",       extra=list(type="DPA-GermanPoliticians", party="cdu",    certified=F)),
  list(name="ThomasOppermann", extra=list(type="DPA-GermanPoliticians", party="spd",    certified=T)),
  list(name="c_lindner",       extra=list(type="DPA-GermanPoliticians", party="fdp",    certified=T)),
  list(name="groehe",          extra=list(type="DPA-GermanPoliticians", party="cdu",    certified=T)),
  list(name="oezoguz",         extra=list(type="DPA-GermanPoliticians", party="spd",    certified=T)),
  list(name="ernst_klaus",     extra=list(type="DPA-GermanPoliticians", party="linke",  certified=T)),
  list(name="rainerarnold",    extra=list(type="DPA-GermanPoliticians", party="spd",    certified=T)),
  list(name="WinneHermann",    extra=list(type="DPA-GermanPoliticians", party="gruene", certified=T)),
  list(name="AndiScheuer",     extra=list(type="DPA-GermanPoliticians", party="csu",    certified=T)),
  list(name="_A_K_K_",         extra=list(type="DPA-GermanPoliticians", party="cdu",    certified=T)),
  list(name="SWagenknecht",    extra=list(type="DPA-GermanPoliticians", party="linke",  certified=T)),
  list(name="juergenhardt",    extra=list(type="DPA-GermanPoliticians", party="cdu",    certified=T)),
  list(name="OlafScholz",      extra=list(type="DPA-GermanPoliticians", party="spd",    certified=T)),
  list(name="JuliaKloeckner",  extra=list(type="DPA-GermanPoliticians", party="cdu",    certified=T)),
  list(name="katjakipping",    extra=list(type="DPA-GermanPoliticians", party="linke",  certified=T)),
  list(name="BaerbelHoehn",    extra=list(type="DPA-GermanPoliticians", party="gruene", certified=T)),
  list(name="petertauber",     extra=list(type="DPA-GermanPoliticians", party="cdu",    certified=T)),
  list(name="CarenLay",        extra=list(type="DPA-GermanPoliticians", party="linke",  certified=T)),
  list(name="bodoramelow",     extra=list(type="DPA-GermanPoliticians", party="linke",  certified=F)),
  list(name="Missfelder",      extra=list(type="DPA-GermanPoliticians", party="cdu",    certified=T)),
  list(name="bueti",           extra=list(type="DPA-GermanPoliticians", party="gruene", certified=T)),
  list(name="FlorianPronold",  extra=list(type="DPA-GermanPoliticians", party="spd",    certified=T)),
  list(name="cem_oezdemir",    extra=list(type="DPA-GermanPoliticians", party="gruene", certified=T)),
  list(name="Halina_Waw",      extra=list(type="DPA-GermanPoliticians", party="linke",  certified=T)),
  list(name="tsghessen",       extra=list(type="DPA-GermanPoliticians", party="spd",    certified=T)),
  list(name="MartinSchulz",    extra=list(type="DPA-GermanPoliticians", party="spd",    certified=T)),
  list(name="davidmcallister", extra=list(type="DPA-GermanPoliticians", party="cdu",    certified=T)),
  list(name="Ralf_Stegner",    extra=list(type="DPA-GermanPoliticians", party="spd",    certified=T)),
  list(name="sven_giegold",    extra=list(type="DPA-GermanPoliticians", party="gruene", certified=T)),
  list(name="nouripour",       extra=list(type="DPA-GermanPoliticians", party="gruene", certified=T)),
  list(name="Volker_Beck",     extra=list(type="DPA-GermanPoliticians", party="gruene", certified=T)),
  list(name="danielbahr",      extra=list(type="DPA-GermanPoliticians", party="fdp",    certified=T)),
  list(name="philipproesler",  extra=list(type="DPA-GermanPoliticians", party="fdp",    certified=T)),
  list(name="hubertus_heil",   extra=list(type="DPA-GermanPoliticians", party="",       certified=T))
)

# sampling [sample_size] accounts
name_list <- unlist(lapply(twitter_accounts, '[[', "name"))
tw_data <- get_twitter_log(dump)
obs <- aggregate(  
          tw_data$screen_name, 
          by=list(name=tw_data$screen_name), 
          FUN=length)
count <- data.frame(screen_name=name_list, count=obs$x[match(name_list, obs$name)])
count$count[is.na(count$count)] <- 0
twitter_accounts_sample <- twitter_accounts[
                             sample( seq_along(count$count)[
                               count$count==min(count$count)], sample_size) ]

# looping through accounts and retrieve data 
for ( i in seq_along(twitter_accounts_sample) ) {
  remaining_requests <- min(as.numeric(getCurRateLimitInfo()$remaining))
  message(paste(remaining_requests, "remaining"))
  if(remaining_requests < 10){
    reset_time         <- max(as.numeric(getCurRateLimitInfo()$reset))-as.numeric(Sys.time())
    message("reset time is in ",round(reset_time)," seconds ; at ", Sys.time()+reset_time)
    for( ii in 1:10){
      message(  paste(  "... waiting ", 
                  round((reset_time-(reset_time/10)*(ii-1))/60,2), 
                  "minutes" ))
      Sys.sleep(reset_time/10)
    }
  }
  message(paste0(i, "/",
            length(twitter_accounts_sample), 
            " : ", twitter_accounts_sample[i]))
  # getting data
  message( paste( "that took",
        round( system.time( try( 
        tw_data <- twitter_log(twitter_accounts_sample[[i]], file = dump) 
        ))[3]/60, 2),
        " minutes"))
}

limits <- getCurRateLimitInfo()
iffer  <- limits$remaining == min(limits$remaining)
limits[iffer, ]

 
# doing some graphing 
tw_data <- get_twitter_log(dump)
pdf(file="twitter_analytics/graphics/twitter_adcr.pdf", width=10, height=7)
  plot(tw_data[tw_data$adcr==T & !is.na(tw_data$adcr), ])
dev.off()

pdf(file=("twitter_analytics/graphics/twitter_RDataCollection.pdf"), width=10, height=7)
  plot(tw_data[tw_data$screen_name=="RDataCollection", ])
dev.off()

# doing some graphing 
tw_data <- get_twitter_log(dump)
pdf(file=paste0("twitter_analytics/graphics/all",".pdf"), width=10, height=7)
  plot(tw_data)
dev.off()





