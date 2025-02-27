% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stock.R
\name{stocknews_key}
\alias{stocknews_key}
\title{Setup}
\usage{
stocknews_key(key)
}
\arguments{
\item{key}{Your API key, freely available at \url{https://stocknewsapi.com/}.}
}
\description{
Setup your session, all subsequent calls will be done using the API key.
}
\note{
You can specify \code{STOCKNEWS_API_KEY} as environment variable, likely in your \code{.Renviron} file.
}
\examples{
\dontrun{
stocknews_key("xXXxxXxXxXXx")  
}

}
