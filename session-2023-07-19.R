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
  ) -> sw_heights_units

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




## Exercise

# average ht of males and female humans with homeworld Tatooine.

sw_heights_units %>%
  filter(homeworld == 'Tatooine', species == 'Human') %>%
  group_by(sex) %>%
  summarise(n = n(), avg_ht_cm = mean(height), avg_ht_ft = mean(height_ft))

# Aw c'mon, Darth and Anakin is double-counting! Are we gonna split hairs here?
# Do we really think that "the good man who was your father was destroyed. So,
# what I told you was true... from a certain point of view."

# 5.38 and 6.05 agree with on-screen results in class.

starwars %>%
  select(name, height, species) %>%
  arrange(desc(height))

# Grievous is really 216 cm tall?  I guess he hunches down, because he doesn't
# look so tall.




## Combine data

tbl_x <- tibble(
  person = letters[1:10],
  x = runif(10)
  )

tbl_y <- tibble(
  person = letters[3:12],
  y = runif(10)  # note the different var name
)

##### NOTE TO SELF

# Good example of DRY. How would we make sure it's the right dimension of each
# column? Not copy paste. Say where the thing starts.

bind_cols(tbl_x, tbl_y)  # ooh, probably not what you want
bind_rows(tbl_x, tbl_y)

