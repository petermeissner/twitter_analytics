#' function for getting data on follower and followings 
#'
#' the function retrieves name, id, screen_name of followers (those who listen to you) and following (those you listen to) as well as friends (those you listen to and which listen back and vice versa)
#' 
#' @param screen_name name of the twitter account to be analyzed which is passed to twitteR::getUser()

get_ff_data <- function(screen_name){
  user      <- getUser(screen_name)
  friends   <- user$getFriends()
  followers <- user$getFollowers()
  followers_data <- 
    data.frame( id         = names(followers), 
                name       = unlist(lapply(followers,function(x) x$name)),
                screenname = unlist(lapply(followers,function(x) x$screenName)),
                stringsAsFactors=F
    )
  friends_data <- 
    data.frame( id         = names(friends), 
                name       = unlist(lapply(friends,function(x) x$name)),
                screenname = unlist(lapply(friends,function(x) x$screenName)),
                stringsAsFactors=F
    )
  friends_data$follower <-  friends_data$id %in%  followers_data$id
  friends_data <- friends_data[order(friends_data$follower,friends_data$screenname), ]
  friends_data$following <- TRUE
  
  followers_data$following <-  followers_data$id %in%  friends_data$id
  followers_data <- followers_data[order(followers_data$following,followers_data$screenname), ]
  followers_data$follower <- TRUE
  
  data <- rbind(followers_data, friends_data)
  data$friend <- data$following & data$follower
  
  data <- data[!duplicated(data),]
  
  return(data)
}
