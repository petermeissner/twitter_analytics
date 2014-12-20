# script getting daily information on follower statistics etc.

# install:
# devtools::install_github("geoffjentry/twitteR")

# package
library(twitteR)

# functions
'%notin%' <- function(a,b) !(a %in% b)

# credentials
getting_started()

# connections
user <- getUser("marvin_dpr")

# possible methods:
if ( 1==2 ) {
  ls(user)
  user$created
  user$description
  user$favoritesCount
  user$followersCount
  user$followRequestSent
  user$friendsCount
  user$getClass()
  user$getFollowerIDs()
  user$getFollowers()
  user$getFollowersCount()
  user$id
  user$initFields()
  user$initialize()
  user$lang
  user$lastStatus
  user$listedCount
  user$location
  user$name
  user$profileImageUrl
  user$protected
  user$screenName
  user$statusesCount
  user$url
  user$verified
}

# getting data
user_data <- as.data.frame(user)
friends   <- user$getFriends()
followers <- user$getFollowers()


not_following_back 
surplus <- followers[!(names(followers) %in% names(friends))]
surplus <- 
  data.frame( id         = names(surplus), 
              name       = unlist(lapply(surplus,function(x) x$name)),
              screenname = unlist(lapply(surplus,function(x) x$screenName))
              
              )







