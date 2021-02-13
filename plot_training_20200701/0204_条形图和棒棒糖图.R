## ----------------------------------------------------
library(tidyverse)
data("mtcars")
mtcars_tbl <- rownames_to_column(mtcars, var = 'car') %>%
  mutate(cyl = factor(cyl))
head(mtcars_tbl)


## ----------------------------------------------------
library(ggsci)
ggplot(mtcars_tbl, aes(x = car, y = mpg)) +
  geom_bar(stat = 'identity', 
           aes(fill = cyl), 
           width = 0.6) +
  scale_fill_npg() +
  labs(fill = 'cyl') +
  theme_classic() +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 90, 
                                   hjust = 1, 
                                   vjust = 0.3),
        legend.position = 'top')


## ----eval=F------------------------------------------
## library(ggsci)
## ggplot(mtcars_tbl, aes(x = car, y = mpg)) +
##   geom_col(aes(fill = factor(cyl)),
##            width = 0.6) +
##   scale_fill_npg() +
##   labs(fill = 'cyl') +
##   theme_classic() +
##   theme(axis.title.x = element_blank(),
##         axis.text.x = element_text(angle = 90,
##                                    hjust = 1,
##                                    vjust = 0.3),
##         legend.position = 'top')


## ----------------------------------------------------
# mpg 降序排列
mtcars_tbl <- arrange(mtcars_tbl, desc(mpg))
# 设置 car 的因子顺序为表中顺序
mtcars_tbl <- mutate(mtcars_tbl, car = factor(car, levels = car))


## ----------------------------------------------------
ggplot(mtcars_tbl, aes(x = car, y = mpg)) +
  geom_col(aes(fill = factor(cyl)), 
           width = 0.6) +
  scale_fill_npg() +
  labs(fill = 'cyl') +
  theme_classic() +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 90, 
                                   hjust = 1, 
                                   vjust = 0.3),
        legend.position = c(0.5, 0.9),
        legend.direction = "horizontal")


## ----------------------------------------------------
# mpg 降序排列
mtcars_tbl <- arrange(mtcars_tbl, cyl, mpg)
# 设置 car 的因子顺序为表中顺序
mtcars_tbl <- mutate(mtcars_tbl, car = factor(car, levels = car))
# 画图的代码不需要任何修改
ggplot(mtcars_tbl, aes(x = car, y = mpg)) +
  geom_col(aes(fill = cyl), 
           width = 0.6) +
  scale_fill_npg() +
  labs(fill = 'cyl') +
  theme_classic() +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 90, 
                                   hjust = 1, 
                                   vjust = 0.3),
        legend.position = c(0.5, 0.9),
        legend.direction = "horizontal")


## ----------------------------------------------------
mtcars_tbl$mpg_z <- 
  (mtcars_tbl$mpg -mean(mtcars_tbl$mpg))/sd(mtcars_tbl$mpg)

mtcars_tbl$mpg_grp <- factor(ifelse(mtcars_tbl$mpg_z > 0, 
                                    "hight", "low"), 
                     levels = c("hight", "low"))

mtcars_tbl$car <- fct_reorder(mtcars_tbl$car, 
                              mtcars_tbl$mpg_z)

ggplot(mtcars_tbl, aes(x = car, y = mpg_z)) +
  geom_bar(stat = 'identity', 
           aes(fill = mpg_grp), 
           width = 0.6) +
  scale_fill_npg() +
  labs(y = 'mpg z-score', fill = 'cyl') +
  theme_classic() +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 90, 
                                   hjust = 1, 
                                   vjust = 0.3),
        legend.position = c(0.5, 0.9),
        legend.direction = "horizontal")


## ----fig.width=8, fig.height=8-----------------------
ggplot(mtcars_tbl, aes(x = car, y = mpg_z)) +
  geom_bar(stat = 'identity', aes(fill = mpg_grp), width = 0.6) +
  scale_fill_npg() +
  labs(x = '', y = 'mpg z-score', fill = 'cyl') +
  theme_minimal() +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 90, 
                                   hjust = 1, 
                                   vjust = 0.3)) +
  coord_flip()


## ----------------------------------------------------
# mpg 降序排列
mtcars_tbl <- arrange(mtcars_tbl, cyl, mpg)
# 设置 car 的因子顺序为表中顺序
mtcars_tbl <- mutate(mtcars_tbl, car = factor(car, levels = car))
# 画图的代码不需要任何修改
ggplot(mtcars_tbl, aes(x = car, y = mpg, color = cyl)) +
  geom_segment(aes(x = car, 
                   xend = car, 
                   y = 0, 
                   yend = mpg)) +
  geom_point(aes(x = car, y = mpg, ), size = 4) +
  scale_color_npg() +
  labs(color = 'cyl') +
  theme_classic() +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 90, 
                                   hjust = 1, 
                                   vjust = 0.3),
        legend.position = c(0.5, 0.9),
        legend.direction = "horizontal")

