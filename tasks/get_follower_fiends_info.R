# script getting daily information on follower statistics etc.

# install:
# devtools::install_github("geoffjentry/twitteR")

# loading package, loading credentials, establishing connection
getting_started()

# connections
user <- getUser("marvin_dpr")

# possible methods:
# ls('package:twitteR')
# user methods:
# getClass('user')

# getting data
user_data <- as.data.frame(user)
friends   <- user$getFriends()
followers <- user$getFollowers()

# munging data
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

followers_data$friend <-  followers_data$id %in%  friends_data$id
friends_data <- followers_data[order(followers_data$friend,followers_data$screenname), ]






