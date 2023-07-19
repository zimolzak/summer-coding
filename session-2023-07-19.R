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

hey_look_colors <- c('red', 'blue', 'chartreuse', 'mauve', 'purple', 'puce', 'sienna')

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

## summarize

# remember ctrl-shift-m

starwars %>% 
  summarise(n = n(), height = mean(height)) # will get NA

starwars %>% 
  summarise(n = n(), height = mean(height, na.rm = TRUE))
# 174 mean

starwars %>% filter(is.na(height)) # huh, Finn, Rey, Phasma, BB8 are NA height.

## group by

starwars %>%
  group_by(species) %>%
  summarise(n = n(), height = mean(height, na.rm = TRUE)) %>%
  arrange(desc(n))

# okay, gungans and Kaminoans and Wookiees are tall.

starwars %>%
  group_by(species, sex) %>%
  summarise(n = n(), height = mean(height, na.rm = TRUE)) %>%
  arrange(desc(n))

# there is ungroup() too.

