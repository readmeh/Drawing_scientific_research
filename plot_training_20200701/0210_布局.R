## ----------------------------------------------------
library(tidyverse)
library(cowplot)
library(patchwork)
library(ggsci)
library(ggrepel)


## ----------------------------------------------------
mtcars_tbl <- rownames_to_column(mtcars, var = 'car') %>%
  mutate(cyl = factor(cyl),
         am = if_else(am == 1, 'A', 'M'),
         vs = if_else(vs == 1, 'V', 'L'))
head(mtcars_tbl)


## ----------------------------------------------------
ggplot(mtcars_tbl, aes(x = wt, y = mpg)) +
  geom_point(shape = 21, 
             alpha = 0.5, 
             aes(size = disp, fill = factor(cyl))) +
  scale_fill_npg() +
  scale_size(range = c(1, 20)) +
  facet_grid(factor(vs)~factor(am), 
             scales = 'free') + # free, free_x, free_y
  theme_bw()


## ----------------------------------------------------
small_diamonds <- sample_n(diamonds, size = 500)
ggplot(data = small_diamonds, aes(x = carat, y = price)) +
  geom_point(shape = 21, size = 2, 
             color = 'black', aes(fill = cut)) +
  scale_fill_npg() +
  facet_wrap(~color, ncol = 3) +
  theme_bw() +
  theme(legend.position = c(0.65, 0.15), 
        legend.direction = 'horizontal')


## ----------------------------------------------------
library(ggforce)
ggplot(mtcars_tbl, aes(x = .panel_x, y = .panel_y)) +
  geom_point(shape = 21, 
             aes(fill = factor(cyl))) +
  scale_fill_npg() +
  facet_matrix(vars(mpg, disp, wt, qsec)) +
  theme_bw()


## ----------------------------------------------------
library(ggforce)
ggplot(iris, aes(x = Petal.Length, 
                 y = Petal.Width, color = Species)) +
  geom_point(size = 3) +
  scale_color_lancet() +
  theme_test() +
  facet_zoom(x = Species == 'versicolor',
             zoom.size = 1) # 与原图的比例


## ----------------------------------------------------
ggplot(iris, aes(x = Petal.Length, 
                 y = Petal.Width, color = Species)) +
  geom_point(size = 3) +
  scale_color_lancet() +
  theme_test() +
  facet_zoom(xlim = c(3.5, 5.3), ylim = c(1.3,2), zoom.size = 1) 


## ----------------------------------------------------
ggplot(mtcars_tbl, aes(x = wt, y = mpg)) +
  geom_point(shape = 21, 
             size = 4,
             aes(fill = cyl)) +
  scale_fill_npg() +
  theme_bw() +
  facet_zoom(xlim = c(2, 3),
             zoom.size = 1)


## ----------------------------------------------------
mtcars_tbl_all <- mutate(mtcars_tbl, zoom = NA)


## ----------------------------------------------------
mtcars_tbl_zoom <- filter(mtcars_tbl, wt > 2 & wt < 3) %>%
  mutate(zoom = T)


## ----------------------------------------------------
ggplot(mtcars_tbl_all, aes(x = wt, y = mpg)) +
  geom_point(shape = 21, 
             size = 4,
             aes(fill = cyl)) +
  geom_text_repel(data = mtcars_tbl_zoom, aes(label = car)) +
  scale_fill_npg() +
  theme_bw() +
  facet_zoom(xlim = c(2, 3), 
             zoom.data = zoom, # T 仅放大，F 仅全图，NA 都显示
             zoom.size = 1) 


## ----------------------------------------------------
small_diamonds_zoom <- mutate(small_diamonds, 
                              color_num = as.numeric(color))


## ----------------------------------------------------
ggplot(data = small_diamonds_zoom, aes(x = color_num, y = price)) +
  geom_point(shape = 21, size = 4, aes(fill = cut)) +
  scale_x_continuous(
    name = 'color',
    breaks = 1:7,
    labels = levels(small_diamonds_zoom$color)) +
  facet_zoom(xlim = 2:4) +
  theme_bw()


## ----------------------------------------------------
library(ggforce)
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(size = 3) +
  geom_mark_ellipse(aes(label = Species)) +
  scale_color_lancet() +
  theme_test()


## ----------------------------------------------------
library(ggforce)
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(size = 3) +
  geom_mark_hull(aes(label = Species)) +
  scale_color_lancet() +
  theme_test()


## ----------------------------------------------------
iris_stat <- group_by(iris, Species) %>%
  summarise(Petal.Length = mean(Petal.Length), 
            Petal.Width = mean(Petal.Width))
iris_stat


## ----------------------------------------------------
tbl_pos <- tibble(x = 7, y = 0.2, tb = list(iris_stat))
tbl_pos


## ----------------------------------------------------
library(ggpmisc)
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(size = 3) +
  geom_table(data = tbl_pos, aes(x = x, y = y, label = tb)) +
  scale_color_lancet() +
  theme_test() +
  theme(legend.position = c(0.1, 0.8))


## ----------------------------------------------------
p0 <- ggplot(iris, aes(Species, Sepal.Length)) +
  geom_boxplot(aes(fill = Species), outlier.shape = 21) +
  scale_fill_lancet() +
  theme_classic() +
  theme(legend.position = 'none', 
        axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        plot.background = element_blank())
p0


## ----------------------------------------------------
plot_pos <- tibble(x = 7, y = 0, plot = list(p0))
plot_pos


## ----------------------------------------------------
library(ggpmisc)
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(size = 3) +
  geom_plot(data = plot_pos, aes(x = x, y = y, label = plot)) +
  scale_color_lancet() +
  theme_test() +
  theme(legend.position = c(0.1, 0.8))


## ----------------------------------------------------
library(ggplot2)
library(patchwork)
p1 <- ggplot(mtcars) + 
  geom_point(aes(mpg, disp, color = factor(cyl))) + 
  ggtitle('Plot 1') 

p2 <- ggplot(mtcars) + 
  geom_boxplot(aes(gear, disp, group = gear, fill = factor(gear))) + 
  ggtitle('Plot 2')

p3 <- ggplot(mtcars) + 
  geom_point(aes(hp, wt, color = factor(cyl))) + 
  ggtitle('Plot 3')

p4 <- ggplot(mtcars) + 
  geom_bar(aes(gear)) + 
  facet_wrap(~cyl) + 
  ggtitle('Plot 4')


## ----------------------------------------------------
p1 / ((p2 / p3) | p4) +
  plot_layout(heights = c(1, 2), widths = c(2, 1)) +
  plot_annotation(title = 'The surprising story about mtcars',
                  tag_levels = 'A') &
  theme_bw()


## ----------------------------------------------------
p1 + p3 + plot_layout(guides = 'collect') &
  theme_bw()

