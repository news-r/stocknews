#' Setup
#' 
#' Setup your session, all subsequent calls will be done using the API key.
#'
#' @param key Your API key, freely available at \url{https://stocknewsapi.com/}.
#' 
#' @note You can specify \code{STOCKNEWS_API_KEY} as environment variable, likely in your \code{.Renviron} file.
#' 
#' @examples
#' \dontrun{
#' stocknews_key("xXXxxXxXxXXx")  
#' }
#' 
#' @import httr
#' @import assertthat
#' 
#' @export
stocknews_key <- function(key){
  assert_that(!missing(key), msg = "Missing key")
  Sys.setenv(STOCKNEWS_KEY = key)
}

#' Tickers
#' 
#' Get tickers data.
#' 
#' @export
sn_stickers <- function(tickers, pages = 1){
  assert_that(!misisng(tickers), msg = "Missing tickers")
  tickers <- paste0(tickers, collapse = ",")
  url <- parse_url(BASE_URL)
  url$path <- BASE_PATH
  url$query <- list(
    tickers = tickers,
    token = Sys.getenv("STOCKNEWS_KEY")
  )
  url <- build_url(url)
  response <- GET(url)
  stop_for_status(response)
  content(response)
}