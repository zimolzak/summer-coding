library(tidyverse)

starwars %>%
  filter(sex == 'female', eye_color == 'brown')

starwars %>%
  count(sex)

starwars %>%
  filter(is.na(sex) | sex == 'none') %>%
  select(name, sex) 

starwars %>%
  filter(sex == 'female' | eye_color == 'brown') %>%
  count(sex)

hey_look_colors <- c('red', 'blue', 'chartreuse' )

starwars %>%
  filter(height >= 150, height <= 180)

## mutate

starwars %>%
  mutate(
    height_in = height / 2.54,
    height_ft = height_in / 12,
    height_ft_integer = floor(height_ft),
    height_in_remainder = height_in %% 12
  ) %>%
  select(name, starts_with('height'))
