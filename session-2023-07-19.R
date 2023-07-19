library(tidyverse)

starwars %>%
  filter(sex == 'female', eye_color == 'brown')
