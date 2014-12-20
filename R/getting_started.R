#' function setting things up 

getting_started <- function(){
  api_key             <<- Sys.getenv("twitter_api_key")
  api_secret          <<- Sys.getenv("twitter_api_secret")
  access_token        <<- Sys.getenv("twitter_access_token")
  access_token_secret <<- Sys.getenv("twitter_access_token_secret")
  twittR::setup_twitter_oauth(api_key,
                      api_secret,
                      access_token,
                      access_token_secret)
}
