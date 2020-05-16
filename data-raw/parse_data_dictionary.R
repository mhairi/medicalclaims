library(tidyverse)

df <- read_csv("data-raw/data_dictionary.csv")


for (i in 1:nrow(df)){

  cat("#'   \\item{", df$Variable[i], "}{", df$Description[i], "}", sep = "")
  cat("\n")

}
