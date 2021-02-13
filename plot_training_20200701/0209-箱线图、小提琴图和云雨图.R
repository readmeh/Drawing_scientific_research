## ----------------------------------------------------
library(tidyverse)
library(ggplot2)
library(ggsci)
library(cowplot)
library(ggsignif)


## ----------------------------------------------------
head(iris)


## ----------------------------------------------------
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_point(aes(color = Species)) +
  scale_color_lancet() +
  xlab('') +
  theme_cowplot()


## ----------------------------------------------------
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_point(aes(color = Species),
             position = position_jitter(width = 0.15)) +
  scale_color_lancet() +
  xlab('') +
  theme_cowplot()


## ----------------------------------------------------
iris_sum <- group_by(iris, Species) %>%
  summarise(Sepal.Length.mean = mean(Sepal.Length),
            Sepal.Length.sd = sd(Sepal.Length))
iris_sum


## ----------------------------------------------------
ggplot(iris_sum, aes(x = Species, y = Sepal.Length.mean, 
                     color = Species)) +
  geom_point() +
  geom_errorbar(aes(ymin = Sepal.Length.mean - Sepal.Length.sd,
                    ymax = Sepal.Length.mean + Sepal.Length.sd),
                width = 0.1) +
  scale_color_lancet() +
  theme_classic()


## ----------------------------------------------------
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_boxplot(aes(fill = Species), outlier.shape = 21) +
  scale_fill_lancet() +
  xlab('') +
  theme_cowplot()


## ----------------------------------------------------
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_boxplot(aes(fill = Species), outlier.shape = 21) +
  geom_signif(
    comparisons = list(c("setosa", "versicolor"), 
                       c("versicolor", "virginica")),  # 设置比对
    map_signif_level = T, # 星号代替 pvalue ?
    y_position = c(7.3, 8.2)) + # 位置
  scale_fill_lancet() +
  xlab('') +
  theme_cowplot()


## ----------------------------------------------------
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_boxplot(aes(fill = Species), outlier.shape = 21) +
  geom_point(size = 0.5,
             position = position_jitter(width = 0.15)) + 
  geom_signif(comparisons = list(c("setosa", "versicolor"), 
                                 c("versicolor", "virginica")),
              map_signif_level = T,
              y_position = c(7.3, 8.2)) +
  scale_fill_lancet() +
  scale_color_lancet() +
  xlab('') +
  theme_cowplot()


## ----------------------------------------------------
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_violin(aes(fill = Species)) +
  geom_boxplot(width = 0.1) +
  geom_point(size = 0.5,
             position = position_jitter(width = 0.15)) + 
  geom_signif(comparisons = list(c("setosa", "versicolor"), 
                                 c("versicolor", "virginica")),
              map_signif_level = T,
              y_position = c(7.3, 8.2)) +
  scale_fill_lancet() +
  xlab('') +
  theme_classic()


## ----------------------------------------------------
library(ggbeeswarm)
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_quasirandom(aes(color = Species),
                size = 3, # 点大小
                cex = 3, # 点距离
                method = "smiley") + # 默认分布
  geom_signif(comparisons = list(c("setosa", "versicolor"), 
                                 c("versicolor", "virginica")),
              map_signif_level = T,
              y_position = c(7.3, 8.2)) +
  theme_half_open()


## ----------------------------------------------------
library(ggbeeswarm)
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_beeswarm(aes(color = Species),
                size = 3, # 点大小
                cex = 3) + # 点距离
  geom_signif(comparisons = list(c("setosa", "versicolor"), 
                                 c("versicolor", "virginica")),
              map_signif_level = T,
              y_position = c(7.3, 8.2)) +
  theme_bw()


## ----------------------------------------------------
library(gghalves)
ggplot(iris, aes(x = Species, y = Sepal.Width)) +
  geom_half_violin(
    aes(fill = Species), 
    side = 'r', # l:left;r:right
    position = position_nudge(x = .25, y = 0), # 位置微移
    adjust = 1/2) + # 调整 binwidth
  geom_boxplot(width = 0.1,
               position = position_nudge(x = .25, y = 0)) +
  geom_point(
    position = position_jitter(width = .15), #  width 为扰动距离
    size = .4) + # 点大小
  scale_fill_brewer(palette = "Dark2") +  
  theme_classic() +
  coord_flip()


## ----------------------------------------------------
iris_tidy <- select(iris, Sepal = Sepal.Length, Petal = Petal.Length, Species) %>%
  gather(key = Tissue, value = Length, 1:2)
head(iris_tidy)


## ----------------------------------------------------
ggplot(iris_tidy, aes(Tissue, Length)) +
  geom_boxplot(aes(fill = Tissue), 
               outlier.shape = 21, 
               width = 0.5,
               position = "dodge") +
  geom_signif(comparisons = list(c("Petal", "Sepal")),
              map_signif_level = T) +
  scale_fill_lancet() +
  xlab('') +
  facet_grid(~Species, scales = 'free_x') +
  theme_cowplot()

