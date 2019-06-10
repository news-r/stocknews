BASE_URL <- "https://stocknewsapi.com"
BASE_PATH <- c("api", "v1")

.get_token <- function(){
  token <- Sys.getenv("STOCKNEWS_API_KEY")
  assert_that(nchar(token) > 1, msg = "Missing key, see `stocknews_key`")
  return(token)
}