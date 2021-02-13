## ----------------------------------------------------
library(tidyverse)
library(cowplot)
library(gapminder)
data("gapminder")


## ----------------------------------------------------
gapminder_filter <- 
  filter(gapminder, country %in% c('China', 'India', 'Japan'))
gapminder_filter


## ----------------------------------------------------
ggplot(data = gapminder_filter, 
       aes(x = year, y = lifeExp, color = country)) +
  geom_line() +
  geom_point(shape = 21, size =2, fill = "white") +
  scale_color_aaas() +
  theme_minimal_hgrid()  + 
  theme(legend.position = c(0.85, 0.16))

