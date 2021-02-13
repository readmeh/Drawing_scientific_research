## ----------------------------------------------------
library(PCAtools)
gene_exp <- read.table(file = 'data/rnaseq-apple/gene_exp.txt', 
                       sep = '\t', header = T, row.names = 1)

sample_info <- read.table(file = 'data/rnaseq-apple/sample_info.txt', 
                          sep = '\t', header = T, row.names = 1)

pca <- pca(gene_exp, metadata = sample_info)

biplot(pca, x = 'PC1', y = 'PC2')


## ----------------------------------------------------
library(tidyverse)
pca_rotated_plus <- rownames_to_column(pca$rotated, 
                                       var = 'sample_name') %>%
  left_join(rownames_to_column(sample_info, var = 'sample_name'), 
            by = 'sample_name')


## ----------------------------------------------------
library(cowplot)
library(ggsci)
ggplot(pca_rotated_plus, aes(x = PC1, y = PC2)) +
  geom_point(size = 8, aes(shape = strain, fill = stage)) +
  labs(x = 'PC1 (68% variance explained)',
       y = 'PC2 (11% variance explained)') +
  scale_shape_manual(values = 21:22) +
  scale_fill_brewer(palette = 'Set2') + 
  theme_half_open() 


## ----------------------------------------------------
library(cowplot)
library(ggsci)
ggplot(pca_rotated_plus, aes(x = PC1, y = PC2)) +
  geom_point(size = 8, aes(fill = stage, shape = strain)) +
  labs(x = 'PC1 (68% variance explained)',
       y = 'PC2 (11% variance explained)') +
  scale_shape_manual(values = 21:24) +
  scale_fill_brewer(palette = 'Set3') + 
  theme_half_open() +
  guides(fill = guide_legend(override.aes=list(shape=21)))


## ----------------------------------------------------
library(cowplot)
library(ggsci)
ggplot(pca_rotated_plus, aes(x = PC1, y = PC2)) +
  geom_point(size = 8, aes(fill = stage, shape = strain)) +
  labs(x = 'PC1 (68% variance explained)',
       y = 'PC2 (11% variance explained)') +
  scale_shape_manual(values = 21:24) +
  scale_fill_brewer(palette = 'Set3') + 
  theme_half_open() +
  guides(fill = guide_legend(override.aes=list(shape=21))) + 
  theme(
    legend.position = c(0.18, 0.85), 
    legend.direction = "horizontal",
    legend.background = element_rect(fill = "gray95"))


## ----------------------------------------------------
library(cowplot)
library(ggsci)
ggplot(pca_rotated_plus, aes(x = PC1, y = PC2)) +
  geom_point(size = 8, aes(fill = stage, shape = strain)) +
  stat_ellipse(aes(color = stage)) +
  labs(x = 'PC1 (68% variance explained)',
       y = 'PC2 (11% variance explained)') +
  scale_shape_manual(values = 21:24) +
  scale_fill_brewer(palette = 'Set2') + 
  scale_color_brewer(palette = 'Set2') + 
  theme_half_open() +
  guides(fill = guide_legend(override.aes=list(shape=21))) + 
  theme(
    legend.position = c(0.18, 0.85), 
    legend.direction = "horizontal",
    legend.background = element_rect(fill = "gray95"))

