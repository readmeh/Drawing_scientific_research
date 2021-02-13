## ----------------------------------------------------
library(ggplot2)
library(ggsci)
library(ggridges)
library(cowplot)


## ----------------------------------------------------
ggplot(diamonds, aes(x = price)) +
  geom_histogram(aes(fill = cut), color = 'black', 
                 position = 'dodge', bins = 20) +
  theme_classic() +
  scale_fill_brewer(palette = 'Set1') +
  theme(legend.background = element_blank(), 
        legend.position = c(0.91, 0.8))


## ----------------------------------------------------
ggplot(diamonds, aes(price)) +
  geom_density(alpha = 0.4, aes(color = cut)) +
  xlim(c(0, 10000)) +
  scale_fill_brewer(palette = 'Set1') +
  #scale_y_discrete(expand = c(0, 0)) +
  #scale_x_continuous(expand = c(0, 0)) +
  theme_classic() +
  theme(legend.background = element_blank(), 
        legend.position = c(0.91, 0.8))


## ----------------------------------------------------
ggplot(diamonds, aes(x = price)) +
  geom_histogram(aes(fill = cut, y = ..density..), color = 'black', 
                 position = 'dodge', bins = 20) +
  geom_density() +
  theme_classic() +
  scale_fill_brewer(palette = 'Set1') +
  theme(legend.background = element_blank(), 
        legend.position = c(0.91, 0.8))


## ----------------------------------------------------
library(ggridges)
ggplot(diamonds, aes(x = price, y = cut)) +
  geom_density_ridges(alpha = 0.4, aes(fill = cut)) +
  xlim(c(0, 10000)) +
  ylab('') +
  scale_fill_lancet() +
  scale_y_discrete(expand = c(0, 0)) +
  scale_x_continuous(expand = c(0, 0)) +
  theme_classic() +
  theme(legend.background = element_blank(),
        legend.position = c(0.82, 0.9), 
        legend.direction = "horizontal")

