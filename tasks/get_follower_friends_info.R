# script getting daily information on follower statistics etc.

# install:
# devtools::install_github("geoffjentry/twitteR")

# package loading
require(twitteranalytics)
# possible methods:
# ls('package:twitteR')
# user methods:
# getClass('user')

# loading package, loading credentials, establishing connection
getting_started()

# connections
user <- getUser("marvin_dpr")

# getting data
get_ff_data("marvin_dpr")






