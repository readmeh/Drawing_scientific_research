## ----------------------------------------------------
library(tidyverse)
library(ggsci)
library(ggrepel)
library(cowplot)


## ----------------------------------------------------
browsers <- read.csv(file = 'data/ggplot/browers.csv') %>%
  arrange(desc(version)) %>%
  mutate(cumsum_share = cumsum(share))
browsers


## ----------------------------------------------------
browsers_sum <- group_by(browsers, browser) %>%
  summarise(browser_share = sum(share)) %>%
  arrange(desc(browser)) %>%
  mutate(cumsum_browser_share = cumsum(browser_share))
browsers_sum


## ----------------------------------------------------
ggplot(data = browsers_sum, aes(x = 1, 
                                y = browser_share)) +
  geom_col(color = "white", width = 1, aes(fill = browser)) +
  geom_text(data =  filter(browsers_sum, browser_share >=5),
            size = 3, 
            color = "white",
            aes(y = cumsum_browser_share - 0.5 * browser_share,
                label = str_c(browser, "\n", browser_share, "%"))) +
  geom_text_repel(data = filter(browsers_sum, browser_share < 5),
                  size = 3,
                  nudge_y = 7,
                  segment.color = "white",
                  min.segment.length = 0,
                  color = "white",
                  aes(y = cumsum_browser_share - 0.5 * browser_share,
                      label = str_c(browser, "\n", browser_share, "%"))
                  ) +
  scale_fill_aaas() 


## ----------------------------------------------------
ggplot(data = browsers_sum, aes(x = 1, 
                                y = browser_share)) +
  geom_col(color = "white", width = 1, aes(fill = browser)) +
  geom_text(data =  filter(browsers_sum, browser_share >=5),
            size = 3, 
            color = "white",
            aes(y = cumsum_browser_share - 0.5 * browser_share,
                label = str_c(browser, "\n", browser_share, "%"))) +
  geom_text_repel(data = filter(browsers_sum, browser_share < 5),
                  size = 3,
                  nudge_y = 7,
                  segment.color = "white",
                  min.segment.length = 0,
                  color = "white",
                  aes(y = cumsum_browser_share - 0.5 * browser_share,
                      label = str_c(browser, "\n", browser_share, "%"))
                  ) +
  scale_fill_aaas() +
  theme_nothing() +
  coord_polar(theta = "y") 


## ----------------------------------------------------
ggplot(data = browsers_sum, aes(x = 1, 
                                y = browser_share)) +
  geom_col(color = "white", width = 1, aes(fill = browser)) +
  geom_text(data =  filter(browsers_sum, browser_share >=5),
            size = 3, 
            color = "white",
            aes(y = cumsum_browser_share - 0.5 * browser_share,
                label = str_c(browser, "\n", browser_share, "%"))) +
  geom_text_repel(data = filter(browsers_sum, browser_share < 5),
                  size = 3,
                  nudge_y = 7,
                  segment.color = "white",
                  min.segment.length = 0,
                  color = "white",
                  aes(y = cumsum_browser_share - 0.5 * browser_share,
                      label = str_c(browser, "\n", browser_share, "%"))
                  ) +
  xlim(-0.5, 1.5) +
  scale_fill_aaas() 


## ----------------------------------------------------
ggplot(data = browsers_sum, aes(x = 1, 
                                y = browser_share)) +
  geom_col(color = "white", width = 1, aes(fill = browser)) +
  geom_text(data =  filter(browsers_sum, browser_share >=5),
            size = 3, 
            color = "white",
            aes(y = cumsum_browser_share - 0.5 * browser_share,
                label = str_c(browser, "\n", browser_share, "%"))) +
  geom_text_repel(data = filter(browsers_sum, browser_share < 5),
                  size = 3,
                  nudge_y = 7,
                  segment.color = "white",
                  min.segment.length = 0,
                  color = "white",
                  aes(y = cumsum_browser_share - 0.5 * browser_share,
                      label = str_c(browser, "\n", browser_share, "%"))
                  ) +
  xlim(-0.5, 1.5) +
  scale_fill_aaas() +
  theme_nothing() +
  coord_polar(theta = "y")


## ----------------------------------------------------
ggplot(data = browsers_sum, aes(x = 1, y = browser_share)) +
  geom_col(color = "white", 
           width = 1,
           aes(fill = browser)) +
  geom_text(data =  filter(browsers_sum, browser_share >=5),
            size = 2.5, 
            color = "white",
            aes(y = cumsum_browser_share - 0.5 * browser_share,
                label = str_c(browser, "\n", browser_share, "%"))) +
  geom_text_repel(data = filter(browsers_sum, browser_share < 5),
                  size = 2.5,
                  nudge_y = 7,
                  segment.color = "white",
                  min.segment.length = 0,
                  color = "white",
                  aes(y = cumsum_browser_share - 0.5 * browser_share,
                      label = str_c(browser, "\n", browser_share, "%"))) +
  geom_col(data = browsers, 
           width = 1,
           aes(x = 2, y = share, fill = version)) +
  geom_text(data = filter(browsers, share > 4), 
            size = 2.5,
            color = "white",
            aes(x = 2, y = cumsum_share - 0.5 * share, 
                label = str_c(version, '\n', share, '%'))) +
  geom_text_repel(data = filter(browsers, share <= 4),
                  size = 2.5,
                  color = "black",
                  nudge_x = 0.1,
                  xlim = c(2.5, Inf),
                  min.segment.length = 0,
                  aes(x = 2.5, y = cumsum_share - 0.5 * share,
                      label = str_c(version, '\n', share, '%'))) +
  scale_fill_igv() +
  xlim(0.5, 2.8) +
  theme_nothing() +
  coord_polar(theta = "y")

