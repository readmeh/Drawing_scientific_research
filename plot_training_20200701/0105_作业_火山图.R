## ----------------------------------------------------
library(readxl)
library(readxl)
de_result <- read_excel("data/vocano/de_result.xlsx", 
    col_types = c("numeric", "text", "text", 
        "text", "text", "numeric", "numeric", 
        "numeric", "numeric", "text", "text", 
        "text", "text", "text", "text", "text", 
        "text", "text"))


## ----------------------------------------------------
library(tidyverse)

selected_genes <- c('FMP27', 'ERG251', 'C5_04050W',
                    'C7_02530C', 'NOT5', 'C6_03800C',
                    'PMC1', 'FEN1', 'ERG3', 'FEN12',
                    'ERG25', 'ERG6', 'MVB12', 'FGR32',
                    'ERG28', 'ERG27')

my_de_result <- select(de_result, GENE_NAME, 
                       log2FoldChange, padj) %>%
  mutate(padj = replace_na(padj, 1)) %>%
  mutate(direction = if_else(padj > 0.05 | abs(log2FoldChange) < 1, 
                             'non-significant', 
                             if_else(log2FoldChange >= 1, 
                                     'up-regulated', 
                                     'down-regulated'))) %>%
  mutate(selected = if_else(GENE_NAME %in% selected_genes, 
                            'Yes', direction))


## ----------------------------------------------------
library(ggplot2)
library(cowplot)
ggplot(data = my_de_result, aes(x = log2FoldChange, 
                                y = -log10(padj))) +
  geom_point(size = 4,
             aes(color = direction),
             show.legend = F) +
  scale_color_manual(
    values = c('#1500FF', '#A9A9A9', '#FF0102')) +
  ylim(0, 50) +
  labs(x = 'Log2(fold change)', y = '-log10(p-value)') +
  theme_half_open()


## ----------------------------------------------------
library(ggplot2)
library(cowplot)
library(ggrepel)
ggplot(data = my_de_result, aes(x = log2FoldChange, 
                                y = -log10(padj))) +
  geom_point(size = 4,
             aes(color = direction),
             show.legend = F) +
  geom_hline(yintercept = -log10(0.05),  # Y轴位置
             linetype = 'dotdash', # 线型
             color = 'grey30') + # 颜色
  geom_vline(xintercept = c(-1, 1), 
             linetype = 'dotdash', color = 'grey30') +
  scale_color_manual(
    values = c('#1500FF', '#A9A9A9', '#FF0102')) +
  ylim(0, 50) +
  labs(x = 'Log2(fold change)', 
       y = '-log10(p-value)') +
  theme_half_open()


## ----------------------------------------------------
library(ggrepel)
ggplot(data = my_de_result, aes(x = log2FoldChange, 
                                y = -log10(padj))) +
  geom_point(size = 4,
             aes(color = direction),
             show.legend = F) +
  geom_text_repel(data = filter(my_de_result, 
                                selected == 'Yes'),
                  size = 5, box.padding = 0.5,
                  aes(label = GENE_NAME)) +
  geom_hline(yintercept = -log10(0.05), 
             linetype = 'dotdash', color = 'grey30') +
  geom_vline(xintercept = c(-1, 1), 
             linetype = 'dotdash', color = 'grey30') +
  scale_color_manual(values = c('#1500FF', '#A9A9A9', '#FF0102')) +
  ylim(0, 50) +
  labs(x = 'Log2(fold change)', y = '-log10(p-value)') +
  theme_half_open()


## ----------------------------------------------------
library(ggrepel)
ggplot(data = my_de_result, aes(x = log2FoldChange, 
                                y = -log10(padj))) +
  geom_point(size = 4,
             aes(color = direction),
             show.legend = F) +
  geom_point(data = filter(my_de_result, 
                           selected == 'Yes'), 
             shape = 21, 
             size = 4, 
             color = 'black', 
             stroke = 0.8) + # 边框粗细
  geom_text_repel(data = filter(my_de_result, 
                                selected == 'Yes'),
                  size = 5, box.padding = 0.5,
                  aes(label = GENE_NAME)) +
  geom_hline(yintercept = -log10(0.05), 
             linetype = 'dotdash', color = 'grey30') +
  geom_vline(xintercept = c(-1, 1), 
             linetype = 'dotdash', color = 'grey30') +
  scale_color_manual(
    values = c('#1500FF', '#A9A9A9', '#FF0102')) +
  ylim(0, 50) +
  labs(x = 'Log2(fold change)', 
       y = '-log10(p-value)') +
  theme_half_open()

