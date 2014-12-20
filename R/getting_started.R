#' function for setting things up
#' 
#' \itemize{ \item{function loads twitteR package that should have been
#' installed beforehand via:
#' \code{devtools::install_github("geoffjentry/twitteR")}} \item{function loads
#' user credentials via \code{Sys.getenv()} to than do OAuth with server} 
#' \item{function assumes that you have saved your credentials in .Renviron file
#' in user path ( \code{normalizePath("~/")} ) as described here:
#' \url{http://stat545-ubc.github.io/bit003_api-key-env-var.html} } }
#' 


getting_started <- function(){
  require(twitteR)
  api_key             <<- Sys.getenv("twitter_api_key")
  api_secret          <<- Sys.getenv("twitter_api_secret")
  access_token        <<- Sys.getenv("twitter_access_token")
  access_token_secret <<- Sys.getenv("twitter_access_token_secret")
  twitteR::setup_twitter_oauth(api_key,
                      api_secret,
                      access_token,
                      access_token_secret)
}
