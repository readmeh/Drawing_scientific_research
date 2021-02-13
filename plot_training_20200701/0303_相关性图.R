## ----eval=F------------------------------------------
## BiocManager::install("houyunhuang/ggcor")
## 
## library(ggcor)
## library(tidyverse)


## ----------------------------------------------------
m1 <- mtcars[, c('mpg', 'qsec')]
m2 <- mtcars[, c('cyl', 'disp', 'hp', 'drat', 'wt', 'vs', 'am')]


## ----------------------------------------------------
head(m1)


## ----------------------------------------------------
head(m2)


## ----------------------------------------------------
ggcor::quickcor(m2, type = "full") + # upper, lower, full
  geom_square() # geom_circle2, geom_color, geom_ellipse2


## ----------------------------------------------------
quickcor(m2, type = "upper") + # upper, lower, full
  geom_circle2()


## ----------------------------------------------------
quickcor(m2, type = "upper", cor.test = T) + 
  geom_circle2() +
  geom_mark(size = 2.5)


## ----------------------------------------------------
quickcor(m2, cor.test = T) + 
  geom_circle2(data = get_data(type = "lower", 
                               show.diag = F)) +
  geom_mark(data = get_data(type = "upper", 
                            show.diag = F), size = 2.5) +
  geom_abline(slope = -1, intercept = 8)


## ----------------------------------------------------
link_cor <- correlate(m1, m2, cor.test = T) %>%
  as_cor_tbl() %>%
  select(spec = .row.names, env = .col.names, r, p.value) %>%
  mutate(
    rd = cut(r, breaks = c(-Inf, 0.2, 0.4, Inf),
                  labels = c("< 0.2", "0.2 - 0.4", ">= 0.4")),
         
    pd = cut(p.value, breaks = c(-Inf, 0.01, 0.05, Inf),
                  labels = c("< 0.01", "0.01 - 0.05", ">= 0.05")))

link_cor


## ----------------------------------------------------
quickcor(m2, type = "upper", cor.test = T) +
  geom_circle2() +
  geom_mark(size = 2.5) +
  ggcor::anno_link(data = link_cor, aes(color = pd, size = rd)) +
  scale_size_manual(values = c(0.5, 1, 2)) +
  scale_colour_manual(values = c("#D95F02", "#1B9E77", "#A2A2A288")) 

