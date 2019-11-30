
library(tidyverse)
# FIXME how to kill the session again?
tv::tv_turn_on_own_session()
rstudioapi::viewer("http://127.0.0.1:1234")



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

