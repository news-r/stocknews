BASE_URL <- "https://stocknewsapi.com"
BASE_PATH <- c("api", "v1")

.get_token <- function(){
  token <- Sys.getenv("STOCKNEWS_API_KEY")
  assert_that(nchar(token) > 1, msg = "Missing key, see `stocknews_key`")
  return(token)
}


.parse <- function(content){
  map_dfr(
    content,
    function(row){
      row <- map(row, function(cell){
        if(length(cell) > 1) cell <- list(cell)
        if(is.null(cell)) cell <- NA
        return(cell)
      })
      dplyr::as_tibble(row)
    }
  )
}