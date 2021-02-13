## ----eval=FALSE--------------------------------------
## install.packages('pheatmap')


## ----------------------------------------------------
library(tidyverse)
library(pheatmap)


## ----------------------------------------------------
load(file = 'data/geo-cesc/prepare.rdata')
load(file = 'data/geo-cesc/de.rdata')


## ----------------------------------------------------
# 提取 cancer 和 normal 样本编号
cancer_normal_samples <- 
  rownames_to_column(sample_info, var = 'sample_id') %>%
  filter(group == 'Cancer' | group == 'Normal')  %>%
  pull(sample_id)

# 提取 cancer 和 normal 样本信息表
cancer_normal_samples_info <- 
  sample_info[cancer_normal_samples, ]

# 提取前 100 个差异最大基因的表达矩阵  
top100_de <- select(de_result, Gene_Symbol, one_of(cancer_normal_samples)) %>%
  filter(!is.na(Gene_Symbol)) %>%
  distinct(Gene_Symbol, .keep_all = T) %>%
  dplyr::slice(1:100) %>%
  column_to_rownames(var = 'Gene_Symbol')


## ----------------------------------------------------
pheatmap(top100_de[1:20,],
         # 去除样本名称
         show_colnames = F)


## ----------------------------------------------------
pheatmap(top100_de[1:20,],
         show_colnames = F,
         cellwidth = 6,
         cellheight = 6,
         fontsize = 6)


## ----------------------------------------------------
pheatmap(top100_de[1:20,],
         show_colnames = F,
         cellwidth = 6,
         cellheight = 6,
         fontsize = 6,
         # 样本分为 3 块
         cutree_cols = 3)


## ----------------------------------------------------
pheatmap(top100_de[1:20,],
         show_colnames = F,
         cellwidth = 6,
         cellheight = 6,
         fontsize = 6,
         cutree_cols = 2,
         annotation_col = dplyr::select(
           cancer_normal_samples_info, 
           group),
         annotation_colors = list(
            group = c('Cancer' = '#fc8d59', 
                      'Normal' = '#99d594')
         )
)


## ----------------------------------------------------
pheatmap(top100_de[1:20,],
         show_colnames = F,
         cellwidth = 6,
         cellheight = 6,
         fontsize = 6,
         cutree_cols = 2,
         annotation_col = dplyr::select(
           cancer_normal_samples_info, 
           group),
         annotation_colors = list(
            group = c('Cancer' = '#fc8d59', 
                      'Normal' = '#99d594')
         ),
         color = colorRampPalette(c("green","white","red"))(11),
         breaks = seq(0, 20, 2),
         legend_breaks = seq(0, 20, 2),
         legend_labels = seq(0, 20, 2)
)


## ----------------------------------------------------
test_df <- top100_de[1:20,]

test_df[5,8] <- 60
test_df[10,3] <- 50


## ----------------------------------------------------
pheatmap(test_df,
         show_colnames = F,
         cellwidth = 6,
         cellheight = 6,
         fontsize = 6,
         cutree_cols = 2,
         annotation_col = dplyr::select(
           cancer_normal_samples_info, 
           group),
         annotation_colors = list(
            group = c('Cancer' = '#fc8d59', 
                      'Normal' = '#99d594')
         )
)


## ----------------------------------------------------
pheatmap(test_df,
         show_colnames = F,
         cellwidth = 6,
         cellheight = 6,
         fontsize = 6,
         cutree_cols = 2,
         annotation_col = dplyr::select(
           cancer_normal_samples_info, 
           group),
         annotation_colors = list(
            group = c('Cancer' = '#fc8d59', 
                      'Normal' = '#99d594')
         ),
         color = colorRampPalette(c("green","white","red"))(11),
         breaks = seq(0, 20, 2),
         legend_breaks = seq(0, 20, 2),
         legend_labels = seq(0, 20, 2)
)


## ----------------------------------------------------
pheatmap(log2(test_df + 1),
         show_colnames = F,
         cellwidth = 6,
         cellheight = 6,
         fontsize = 6,
         cutree_cols = 2,
         annotation_col = dplyr::select(
           cancer_normal_samples_info, 
           group),
         annotation_colors = list(
            group = c('Cancer' = '#fc8d59', 
                      'Normal' = '#99d594')
         )
)


## ----------------------------------------------------
pheatmap(test_df,
         scale = 'row',
         show_colnames = F,
         cellwidth = 6,
         cellheight = 6,
         fontsize = 6,
         cutree_cols = 2,
         annotation_col = dplyr::select(
           cancer_normal_samples_info, 
           group),
         annotation_colors = list(
            group = c('Cancer' = '#fc8d59', 
                      'Normal' = '#99d594')
         )
)

