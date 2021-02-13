## ----------------------------------------------------
library(tidyverse)
HIV <- tibble(Triplet = str_c('Triplet', 1:7, sep = ' '),
              From = c(rep('Zambia', 4), rep('South Africa', 3)), 
              `Group A` = c('28/1687 (1.64)', 
                            '33/2086 (1.57)', 
                            '23/1695 (1.36)', 
                            '41/2013 (2.04)', 
                            '36/1507 (2.35)', 
                            '26/1808 (1.43)', 
                            '13/2195 (0.57)'),
              `Group B` = c('19/1979 (0.94)', 
                            '29/2408 (1.20)', 
                            '22/1687 (1.30)', 
                            '19/1698 (1.13)', 
                            '33/1811 (1.80)', 
                            '26/2078 (1.24)', 
                            '10/2488 (0.40)'),
              `Group C` = c('24/2054 (1.17)', 
                            '33/2262 (1.48)', 
                            '29/1811 (1.63)', 
                            '37/1561 (2.39)', 
                            '28/1304 (2.15)', 
                            '32/1375 (2.31)', 
                            '14/2195 (0.59)'))
HIV


## ----------------------------------------------------
library(tidyr)
HIV <- gather(HIV, key = Group, value = Value, 3:5) %>%
  separate(col = Value, # 拆分这一列
           sep = ' ',  # 分割符
           into = c('Number', 'Ratio')) %>% # 分割成的两列
  separate(col = Number, 
           sep = '/', into = c('Num', 'Total')) %>%
  mutate(Ratio = as.numeric(str_remove_all(Ratio, '\\(|\\)')),
         Num = as.numeric(Num),
         Total = as.numeric(Total))
HIV


## ----------------------------------------------------
library(ggrepel)
p1 <- ggplot(data = filter(HIV, Group %in% c('Group A', 'Group C')), 
       aes(x = Group, y = Ratio, color = Triplet)) +
  geom_line(aes(group = Triplet)) +
  geom_point(aes(size = Num)) +
  geom_text_repel(data = filter(HIV, Group == 'Group A'),
                  nudge_x = -0.15,
                  show.legend = F,
                  color = 'black',
                  segment.size = 0,
                  aes(label = str_remove(Triplet, 'Triplet '))) +
  geom_text_repel(data = filter(HIV, Group == 'Group C'),
                  nudge_x = 0.15,
                  show.legend = F,
                  color = 'black',
                  segment.size = 0,
                  aes(label = str_remove(Triplet, 'Triplet '))) +
  
  scale_color_jco() +
  scale_size(name = 'No. of Envents:',
             breaks = seq(10, 40, 10),
             labels = seq(10, 40, 10),
             limits = c(10, 50),
             range = c(1, 4)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 2.5)) +
  labs(x = '', y = 'HIV Infections\n(per 100 persons)') +
  theme_half_open() 

p2 <- ggplot(data = filter(HIV, Group %in% c('Group A', 'Group B')), 
       aes(x = Group, y = Ratio, color = Triplet)) +
  geom_line(aes(group = Triplet)) +
  geom_point(aes(size = Num)) +
  geom_text_repel(data = filter(HIV, Group == 'Group A'),
                  nudge_x = -0.15,
                  color = 'black',
                  segment.size = 0,
                  show.legend = F,
                  aes(label = str_remove(Triplet, 'Triplet '))) +
  geom_text_repel(data = filter(HIV, Group == 'Group B'),
                  nudge_x = 0.15,
                  color = 'black',
                  segment.size = 0,
                  show.legend = F,
                  aes(label = str_remove(Triplet, 'Triplet '))) +
  
  scale_color_jco() +
  scale_size(name = 'No. of Envents:',
             breaks = seq(10, 40, 10),
             labels = seq(10, 40, 10),
             limits = c(10, 50),
             range = c(1, 4)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 2.5)) +
  labs(x = '', y = 'HIV Infections\n(per 100 persons)') +
  theme_half_open() 



## ----------------------------------------------------
library(patchwork)
p1 + p2 + plot_layout(guides = "collect") & 
  theme(legend.position = 'top')

