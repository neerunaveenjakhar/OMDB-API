rm(list = ls())
library(tidyverse)
library(stringr)
library(curl)
library(jsonlite)
library(httr)
library(usethis)


request <- glue::glue("http://www.omdbapi.com/?t=Interstellar&y=2014&plot=short&r=xml&apikey=929a69ec")
request

glue::glue("http://www.omdbapi.com/?t={title}&y={year}&plot={plot}&r={format}&apikey={api_key}",
           title = "Interstellar",
           year = "2014",
           plot = "short",
           format = "xml",
           api_key = "929a69ec")

omdb <- function(title, year, plot, format, api_key) {
  glue::glue("http://www.omdbapi.com/?t={title}&y={year}&plot={plot}&r={format}&apikey={api_key}")
}

request_json <- omdb(title = "Interstellar", year = "2014", plot = "short", 
                     format = "json", api_key = "929a69ec")

response_json <- GET(request_json)
content(response_json, as = "parsed", type = "application/json") 




