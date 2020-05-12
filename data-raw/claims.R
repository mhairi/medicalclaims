## code to prepare `DATASET` dataset goes here
library(tidyverse)

claims <- read_csv("data-raw/sample_data.csv")

usethis::use_data(claims, overwrite = TRUE)
