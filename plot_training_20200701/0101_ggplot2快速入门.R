## ----------------------------------------------------
library(tidyverse)
data("diamonds")
set.seed(1000)
small_diamonds <- sample_n(diamonds, size = 500)


## ----------------------------------------------------
ggplot(data = small_diamonds, aes(x = carat, y = price)) +
  theme_classic()


## ----------------------------------------------------
ggplot(data = small_diamonds, aes(x = carat, y = price)) +
  geom_point() +
  theme_classic()


## ----------------------------------------------------
ggplot(data = small_diamonds, aes(x = carat, y = price)) +
  geom_point(aes(color = cut)) +
  theme_classic()


## ----------------------------------------------------
library(ggsci)
ggplot(data = small_diamonds, aes(x = carat, y = price)) +
  geom_point(aes(color = cut)) +
  scale_color_npg() +
  theme_classic()

