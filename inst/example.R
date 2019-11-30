
library(tidyverse)

tv::on()

iris %>% 
  filter(Species == "virginica") %>% 
  mutate(abb = Species)

nycflights13::flights %>% 
  select(-time_hour, -dest, -distance)

mtcars %>% 
  as_tibble() %>% 
  mutate(ddd = carb) %>% 
  mutate(ddd2 = carb)

