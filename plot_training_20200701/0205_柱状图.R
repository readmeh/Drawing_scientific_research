## ----------------------------------------------------
small_diamonds <- filter(diamonds, 
                         cut == c('Very Good', 'Premium', 'Ideal'))


## ----fig.width=10------------------------------------
library(ggplot2)
library(cowplot)
library(ggsci)
p1 <- ggplot(data = small_diamonds, aes(x = color)) +
  geom_bar(aes(fill = cut),
           position = 'stack',
           color = 'black',
           width = .7) +
  scale_fill_lancet() +
  scale_y_continuous(expand = c(0, 0)) +
  theme_half_open() +
  ggtitle('position_stack')

p2 <- ggplot(data = small_diamonds, aes(x = color)) +
  geom_bar(aes(fill = cut),
           position = 'fill',
           color = 'black',
           width = .7) +
  scale_fill_lancet() +
  scale_y_continuous(expand = c(0, 0)) +
  theme_half_open()+
  ggtitle('position_fill')

p3 <- ggplot(data = small_diamonds, aes(x = color)) +
  geom_bar(aes(fill = cut),
           position = 'dodge',
           color = 'black',
           width = .7) +
  scale_fill_lancet() +
  scale_y_continuous(expand = c(0, 0)) +
  theme_half_open() +
  ggtitle('position_dodge')



plot_grid(p1, p2, p3)


## ----------------------------------------------------
ggplot(data = small_diamonds, aes(x = color)) +
  geom_bar(aes(fill = cut),
           position = 'stack',
           color = 'black',
           width = .7) +
  geom_text(stat = 'count', 
            aes(label = ..count..),
            position = 'stack',
            vjust = -0.5) +
  scale_fill_lancet() +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 3500)) +
  theme_half_open() +
  ggtitle('position_stack')


## ----------------------------------------------------
small_diamonds_count <- group_by(small_diamonds, color, cut) %>%
  summarise(count = n()) %>%
  arrange(color, desc(cut)) %>%
  mutate(cumsum = cumsum(count),
         prop = count / sum(count),
         cumprop = cumsum(count) / sum(count))
small_diamonds_count


## ----------------------------------------------------
ggplot(data = small_diamonds_count) +
  geom_col(aes(x = color, y = count, fill = cut),
           position = 'stack',
           color = 'black',
           width = .7) +
  geom_text(aes(x = color, y = cumsum - count / 2, label = count)) +
  scale_fill_lancet() +
  scale_y_continuous(expand = c(0, 0)) +
  theme_half_open()+
  ggtitle('position_stack')


## ----------------------------------------------------
ggplot(data = small_diamonds_count) +
  geom_col(aes(x = color, y = count, fill = cut),
           position = 'fill',
           color = 'black',
           width = .7) +
  geom_text(aes(x = color, y = cumprop - prop / 2, 
                label = scales::percent(prop, accuracy = 0.1))) +
  scale_fill_lancet() +
  scale_y_continuous(expand = c(0, 0)) +
  theme_half_open()+
  ggtitle('position_fill')

