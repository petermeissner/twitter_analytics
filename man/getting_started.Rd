% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/getting_started.R
\name{getting_started}
\alias{getting_started}
\title{function for setting things up}
\usage{
getting_started()
}
\description{
\itemize{ \item{function loads twitteR package that should have been
installed beforehand via:
\code{devtools::install_github("geoffjentry/twitteR")}} \item{function loads
user credentials via \code{Sys.getenv()} to than do OAuth with server}
\item{function assumes that you have saved your credentials in .Renviron file
in user path ( \code{normalizePath("~/")} ) as described here:
\url{http://stat545-ubc.github.io/bit003_api-key-env-var.html} } }
}

