## ----------------------------------------------------
library(ggsci)
ggplot(data = small_diamonds, aes(x = carat, y = price)) +
  geom_point(shape = 21, size = 4, 
             color = 'black', aes(fill = cut)) +
  scale_fill_npg() +
  theme_classic()


## ----------------------------------------------------
library(ggsci)
data(mtcars)
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(shape = 21, 
             alpha = 0.5, 
             aes(size = disp, fill = factor(cyl))) +
  scale_fill_npg() +
  scale_size(range = c(1, 20)) +
  theme_bw()


## ----------------------------------------------------
library(ggsci)
ggplot(data = small_diamonds, aes(x = carat, y = price)) +
  geom_point(shape = 21, size = 4, 
             color = 'black', aes(fill = cut)) +
  scale_fill_npg() +
  labs(title = 'point plot', 
       x = 'weight of the diamond ', 
       y = 'price in US dollars',
       fill = 'quality of the cut') +
  theme_classic()


## ----------------------------------------------------
library(ggsci)
ggplot(data = small_diamonds, aes(x = carat, y = price)) +
  geom_point(shape = 21, size = 4, 
             color = 'black', aes(fill = cut)) +
  scale_fill_npg() +
  labs(title = 'point plot', 
       x = 'weight of the diamond ', 
       y = 'price in US dollars',
       fill = 'quality of the cut') +
  scale_x_continuous(breaks = seq(0,3,0.5)) +
  scale_y_continuous(breaks = seq(0, 15000, 5000), 
                     labels = c('0', '5K', '10K', '15K')) +
  theme_classic()

