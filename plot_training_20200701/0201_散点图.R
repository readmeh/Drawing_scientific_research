## ----fig.width=10------------------------------------
library(ggplot2)
library(cowplot)
library(tidyverse)
library(ggsci)

data("diamonds")
set.seed(1000)
small_diamonds <- sample_n(diamonds, size = 500)

p1 <- ggplot(data = small_diamonds, 
             aes(x = carat, y = price)) +
  geom_point(shape = 21, size = 4, 
             color = 'black', aes(fill = cut)) +
  geom_smooth(method = 'lm') +
  scale_fill_npg() +
  labs(title = 'point plot', 
       x = 'weight of the diamond ', 
       y = 'price in US dollars',
       fill = 'quality of the cut') +
  scale_x_continuous(breaks = seq(0,3,0.5)) +
  scale_y_continuous(breaks = seq(0, 15000, 5000), 
                     labels = c('0', '5K', '10K', '15K')) +
  theme_test() + 
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_blank(),
        legend.position = c(0.25, 0.76)) +
  ggtitle('lm')

p2 <- ggplot(data = small_diamonds, 
             aes(x = carat, y = price)) +
  geom_point(shape = 21, size = 4, 
             color = 'black', aes(fill = cut)) +
  geom_smooth(method = 'loess') +
  scale_fill_npg() +
  labs(title = 'point plot', 
       x = 'weight of the diamond ', 
       y = 'price in US dollars',
       fill = 'quality of the cut') +
  scale_x_continuous(breaks = seq(0,3,0.5)) +
  scale_y_continuous(breaks = seq(0, 15000, 5000), 
                     labels = c('0', '5K', '10K', '15K')) +
  theme_test() + 
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_blank(),
        legend.position = c(0.25, 0.76)) +
  ggtitle('loess')

p3 <- ggplot(data = small_diamonds, 
             aes(x = carat, y = price)) +
  geom_point(shape = 21, size = 4, 
             color = 'black', aes(fill = cut)) +
  geom_smooth(method = 'gam') +
  scale_fill_npg() +
  labs(title = 'point plot', 
       x = 'weight of the diamond ', 
       y = 'price in US dollars',
       fill = 'quality of the cut') +
  scale_x_continuous(breaks = seq(0,3,0.5)) +
  scale_y_continuous(breaks = seq(0, 15000, 5000), 
                     labels = c('0', '5K', '10K', '15K')) +
  theme_test() + 
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_blank(),
        legend.position = c(0.25, 0.76)) +
  ggtitle('gam')

p4 <- ggplot(data = small_diamonds, 
             aes(x = carat, y = price, fill = cut)) +
  geom_point(shape = 21, size = 4, color = 'black') +
  geom_smooth() +
  scale_fill_npg() +
  labs(title = 'point plot', 
       x = 'weight of the diamond ', 
       y = 'price in US dollars',
       fill = 'quality of the cut') +
  scale_x_continuous(breaks = seq(0,3,0.5)) +
  scale_y_continuous(breaks = seq(0, 15000, 5000), 
                     labels = c('0', '5K', '10K', '15K')) +
  theme_test() + 
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_blank(),
        legend.position = c(0.25, 0.76)) +
  ggtitle('ggplot(aes(fill = cut))')

plot_grid(p1, p2, p3, p4, labels = LETTERS, align = c('v', 'h'))


## ----------------------------------------------------
cor.test(small_diamonds$carat, small_diamonds$price, method = "pearson")


## ----------------------------------------------------
ggplot(data = small_diamonds, 
             aes(x = carat, y = price)) +
  geom_point(shape = 21, size = 4, 
             color = 'black', aes(fill = cut)) +
  geom_smooth(method = 'lm') +
  scale_fill_npg() +
  labs(x = 'weight of the diamond ', 
       y = 'price in US dollars',
       fill = 'quality of the cut') +
  scale_x_continuous(breaks = seq(0,3,0.5)) +
  scale_y_continuous(breaks = seq(0, 15000, 5000), 
                     labels = c('0', '5K', '10K', '15K')) +
  theme_test() + 
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_blank(),
        legend.position = c(0.15, 0.76)) +
  annotate("text", x = 2, y = 10, 
           label = "Pearson's r = 0.92; Pvalue < 2.2e-16")


## ----------------------------------------------------
ggplot(data = small_diamonds, 
             aes(x = carat, y = price)) +
  geom_point(shape = 21, size = 4, 
             color = 'black', aes(fill = cut)) +
  geom_smooth(method = 'lm') +
  geom_rug(aes(color = cut), show.legend = F) +
  scale_fill_npg() +
  scale_color_npg() +
  labs(x = 'weight of the diamond ', 
       y = 'price in US dollars',
       fill = 'quality of the cut') +
  scale_x_continuous(breaks = seq(0,3,0.5)) +
  scale_y_continuous(breaks = seq(0, 15000, 5000), 
                     labels = c('0', '5K', '10K', '15K')) +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_blank(),
        legend.position = c(0.15, 0.76)) 


## ----------------------------------------------------
library(ggstatsplot)
ggscatterstats(
  data = small_diamonds,
  x = carat,
  y = price,
  xlab = "weight of the diamond",
  ylab = "price in US dollars",
  
  marginal = TRUE,
  # results.subtitle = F
  # "histogram", "boxplot", "density", "violin", "densigram"
  # marginal.type = "histogram"
)

