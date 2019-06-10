.onAttach <- function(...) {

  key <- Sys.getenv("STOCKNEWS_API_KEY")

  msg <- "No API key found, see `stocknews_key`"
  if(nchar(key) > 1) msg <- "API key loaded!"

  packageStartupMessage(msg)

}