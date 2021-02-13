## ----fig.fullwidth = T, fig.width=10-----------------
library(ggplot2)
library(ggsci)
library(cowplot)
p <- ggplot(data = small_diamonds, aes(x = carat, y = price)) +
  geom_point(shape = 21, size = 4, 
             color = 'black', aes(fill = cut)) +
  scale_fill_npg() +
  labs(title = 'point plot', 
       x = 'weight of the diamond ', 
       y = 'price in US dollars',
       fill = 'quality of the cut') +
  scale_x_continuous(breaks = seq(0,3,0.5)) +
  scale_y_continuous(breaks = seq(0, 15000, 5000), 
                     labels = c('0', '5K', '10K', '15K'))
  

p1 <- p +theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_blank(),
        legend.position = c(0.22, 0.7)) +
  ggtitle('theme_bw')

p2 <- p + theme_classic() + 
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_blank(),
        legend.position = c(0.22, 0.7)) +
  ggtitle('theme_classic')

p3 <- p + theme_test() + 
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_blank(),
        legend.position = c(0.22, 0.7)) +
  ggtitle('theme_test')

p4 <- p + theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_blank(),
        legend.position = c(0.22, 0.7)) +
  ggtitle('theme_minimal')

p5 <- p + theme_void() + 
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_blank(),
        legend.position = c(0.22, 0.7)) +
  ggtitle('theme_void')


## ----fig.width=10, fig.height=10, fig.fullwidth = T----
p6 <- p +theme_half_open() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_blank(),
        legend.position = c(0.04, 0.7)) +
  ggtitle('theme_half_open')


p7 <- p +theme_minimal_grid() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_blank(),
        legend.position = c(0.04, 0.7)) +
  ggtitle('theme_minimal_grid')

p8 <- p +theme_minimal_hgrid() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_blank(),
        legend.position = c(0.04, 0.7)) +
  ggtitle('theme_minimal_hgrid')

p9 <- p +theme_minimal_vgrid() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_blank(),
        legend.position = c(0.04, 0.7)) +
  ggtitle('theme_minimal_vgrid')

plot_grid(p1, p2, p3, p4, p5, p6, p7, p8, p9, labels = LETTERS)


## ----------------------------------------------------
p + theme(axis.title = element_text(size = 15), 
    plot.title = element_text(hjust = 0.5), 
    legend.key = element_rect(fill = NA), 
    legend.background = element_rect(fill = NA), 
    legend.position = c(0.085, 0.7)) +
  labs(title = "I am title", subtitle = "I am subtitle", 
    caption = "I am caption")


## ----------------------------------------------------
library(scales)
my_cols <- c('#e41a1c', '#377eb8', '#4daf4a', '#984ea3', '#ff7f00')
show_col(my_cols)


## ----------------------------------------------------
library(ggplot2)
library(cowplot)
p <- ggplot(data = small_diamonds, aes(x = carat, y = price)) +
  geom_point(shape = 21, size = 4, 
             color = 'black', aes(fill = cut)) +
  labs(x = 'weight of the diamond ', 
       y = 'price in US dollars',
       fill = 'quality of the cut') +
  scale_x_continuous(breaks = seq(0,3,0.5)) +
  scale_y_continuous(breaks = seq(0, 15000, 5000), 
                     labels = c('0', '5K', '10K', '15K')) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_blank(),
        legend.position = c(0.1, 0.8)) +
  ggtitle('')
p


## ----------------------------------------------------
library(scales)
my_cols <- c('#e41a1c', '#377eb8', '#4daf4a', '#984ea3', '#ff7f00')
show_col(my_cols)


## ----------------------------------------------------
p + scale_fill_manual(values = my_cols)


## ----fig.width=10, fig.height=10, fig.fullwidth = T----
library(RColorBrewer)
par(mar=c(3,4,2,2))
display.brewer.all()


## ----------------------------------------------------
show_col(brewer.pal(9, 'Set1'))


## ----fig.width=10, fig.height=10, fig.fullwidth = T----
p <- p + theme(legend.position = c(0.23, 0.7))
p1 <- p + scale_fill_brewer(palette = 'Set1') + ggtitle('Set1')
p2 <- p + scale_fill_brewer(palette = 'Set2') + ggtitle('Set2')
p3 <- p + scale_fill_brewer(palette = 'Set3') + ggtitle('Set3')
p4 <- p + scale_fill_brewer(palette = 'Pastel1') + ggtitle('Pastel1')
p5 <- p + scale_fill_brewer(palette = 'Pastel2') + ggtitle('Pastel2')
p6 <- p + scale_fill_brewer(palette = 'Paired') + ggtitle('Paired')
p7 <- p + scale_fill_brewer(palette = 'Dark2') + ggtitle('Dark2')
p8 <- p + scale_fill_brewer(palette = 'Accent') + ggtitle('Accent')
p9 <- p + scale_fill_brewer(palette = 'Paired') + ggtitle('Paired')

plot_grid(p1, p2, p3, p4, p5, p6, p7, p8, p9, labels = LETTERS)


## ----------------------------------------------------
library(ggsci)
my_cols <- pal_npg("nrc")(9)
show_col(my_cols)


## ----------------------------------------------------
library(paletteer)

p + scale_fill_paletteer_d("awtools::mpalette") +
  ggtitle('awtools::mpalette')


## ----------------------------------------------------
library(ggplot2)
library(cowplot)
p <- ggplot(data = small_diamonds, aes(x = carat, y = price)) +
  geom_point(shape = 21, size = 4, 
             color = 'black', aes(fill = depth)) +
  labs(x = 'weight of the diamond ', 
       y = 'price in US dollars') +
  scale_x_continuous(breaks = seq(0,3,0.5)) +
  scale_y_continuous(breaks = seq(0, 15000, 5000), 
                     labels = c('0', '5K', '10K', '15K')) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_blank(),
        legend.position = c(0.1, 0.8)) 


## ----------------------------------------------------
p + scale_fill_gradient(low = '#FCDAC9', high = '#7C0D0D')



## ----------------------------------------------------
p + scale_fill_gradient2(low = 'green', high = 'red', 
                         mid = 'white', midpoint = 60)


## ----------------------------------------------------
p + scale_fill_gradient2(low = 'blue', high = 'red', 
                         mid = 'white', midpoint = 60)


## ----------------------------------------------------
p + scale_fill_gsea() 

