library(readr)
library(dplyr)

claims <- read_csv("data-raw/sample_data.csv")

#we need to reflect per unit spending for items like physician-administered drugs
#doing this will control for difference dosage levels at the patient level

claims <- claims %>%
  mutate(total_by_n = if_else(qty != 0, total/qty, total))

usethis::use_data(claims, overwrite = TRUE)
