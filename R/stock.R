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
#' @import purrr
#' @import httr
#' @import assertthat
#' 
#' @export
stocknews_key <- function(key){
  assert_that(!missing(key), msg = "Missing key")
  Sys.setenv(STOCKNEWS_API_KEY = key)
}

#' Call
#' 
#' Get news by tickers and categories.
#' 
#' @param q Vector of tickers or a valid section (\code{alltickers}, \code{general}).
#' @param ... Any other parameter from \url{https://stocknewsapi.com/documentation}.
#' @param pages Number of pages to retrieve.
#' 
#' @examples
#' \dontrun{
#' tickers <- sn_tickers(c("AMZN", "GOOG"))
#' sections <- sn_category("general")  
#' }
#' 
#' @name calls
#' @export
sn_tickers <- function(q, ..., pages = 1){
  assert_that(!missing(q), msg = "Missing `q`")
  tickers <- paste0(q, collapse = ",")
  parsed_url <- parse_url(BASE_URL)
  parsed_url$path <- BASE_PATH
  query <- list(
    items = 50,
    ...,
    tickers = tickers,
    token = .get_token()
  )
  
  map(seq(pages), function(p){
    query$page <- p
    parsed_url$query <- query
    url <- build_url(parsed_url)
    response <- GET(url)
    warn_for_status(response)
    content(response)
  }) %>% 
    map("data") %>% 
    flatten() %>% 
    .parse()
}

#' @rdname calls
#' @export
sn_category <- function(q = "alltickers", ..., pages = 1){
  assert_that(!missing(q), msg = "Missing `q`")
  parsed_url <- parse_url(BASE_URL)
  parsed_url$path <- c(BASE_PATH, "category")
  query <- list(
    items = 50,
    ...,
    section = q,
    token = .get_token()
  )
  
  map(seq(pages), function(p){
    query$page <- p
    parsed_url$query <- query
    url <- build_url(parsed_url)
    response <- GET(url)
    warn_for_status(response)
    content(response)
  }) %>% 
    map("data") %>% 
    flatten() %>% 
    .parse()
}