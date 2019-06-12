<!-- README.md is generated from README.Rmd. Please edit that file -->



<!-- badges: start -->
[![Travis build status](https://travis-ci.org/news-r/stocknews.svg?branch=master)](https://travis-ci.org/news-r/stocknews)
[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/news-r/stocknews?branch=master&svg=true)](https://ci.appveyor.com/project/news-r/stocknews)
<!-- badges: end -->

# stocknews

Access [Stock News API](https://stocknewsapi.com) from R.

## Installation

``` r
# install.packages("remotes")
remotes::install_github("news-r/stocknews")
```

## Setup

Create a free account at [stocknewsapi.com](https://stocknewsapi.com) to create an API key.

```r
stocknews_key("xxXXxxXx")
```

Note that you can specify the `STOCKNEWS_API_KEY` key as an environment variable in your `.Renviron` for convenience.


## Example


```r
library(stocknews)

tickers <- sn_tickers(c("AMZN", "GOOG"))
(sections <- sn_category("general"))
#> # A tibble: 5 x 9
#>   title  news_url  image_url  text  sentiment type  source_name date  tags 
#>   <chr>  <chr>     <chr>      <chr> <chr>     <chr> <chr>       <chr> <lis>
#> 1 How t… https://… https://s… If y… Neutral   Video Investors … Tue,… <chr…
#> 2 The c… https://… https://s… "Bec… Negative  Arti… CNBC        Tue,… <chr…
#> 3 Top t… https://… https://s… How … Negative  Video CNBC Telev… Tue,… <chr…
#> 4 Inves… http://w… https://s… Ever… Neutral   Arti… GuruFocus   Tue,… <chr…
#> 5 Poshm… https://… https://s… Posh… Positive  Video Yahoo Fina… Tue,… <chr…
```
