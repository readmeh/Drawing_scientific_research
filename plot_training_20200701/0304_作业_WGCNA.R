## ----------------------------------------------------
load(file = 'data/ggcor/wgcna.rdata')


## ----------------------------------------------------
library(tidyverse)
library(ggcor)
MEs <- net$MEs
colnames(MEs) <- str_remove(colnames(MEs), 'ME')
head(MEs)


## ----------------------------------------------------
link_cor <- correlate(datTraits[,1:3], 
                      MEs, cor.test = T, use = "p") %>%
  as_cor_tbl() %>%
  select(Traits = .row.names, 
         Modules = .col.names, 
         r, p.value) %>%
  mutate(rd = cut(r, breaks = c(-Inf, 0.2, 0.4, Inf),
                  labels = c("< 0.2", "0.2 - 0.4", ">= 0.4")),
         pd = cut(p.value, breaks = c(-Inf, 0.01, 0.05, Inf),
                  labels = c("< 0.01", "0.01 - 0.05", ">= 0.05")))
link_cor


## ----------------------------------------------------
p <- quickcor(MEs, type = "upper", cluster= T) +
  geom_square() +
  ggcor::anno_link(data = link_cor, aes(color = pd, size = rd)) +
  scale_size_manual(values = c(0.5, 1, 2)) +
  scale_colour_manual(values = c("#D95F02", "#1B9E77", "#A2A2A288")) 
p

