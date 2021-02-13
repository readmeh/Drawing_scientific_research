## ---- message=FALSE----------------------------------
library(tidyverse)


## ---- message=FALSE----------------------------------
# data.frame
gene_exp_df <- read.delim("data/R_basic/gene_exp.txt", row.names=1)

# tibble
library(readr)
gene_exp_tbl <- read_delim("data/R_basic/gene_exp.txt", 
    "\t", escape_double = FALSE, trim_ws = TRUE)


## ----------------------------------------------------
library(tibble)
as_tibble(rownames_to_column(gene_exp_df, var = "gene_id"))


## ----------------------------------------------------
as.data.frame(column_to_rownames(gene_exp_tbl, var = "gene_id"))


## ----------------------------------------------------
library(readr)
de_result <- read_delim("data/R_basic/de_result.txt", 
    "\t", escape_double = FALSE, trim_ws = TRUE)


## ----------------------------------------------------
dplyr::select(de_result, gene_id, logFC, padj = FDR)


## ---- eval=FALSE-------------------------------------
## dplyr::select(de_result, -pvalue)


## ----------------------------------------------------
mutate(de_result, FC = 2 ** logFC)


## ----------------------------------------------------
filter(de_result, abs(logFC) >= 1 & FDR < 0.05)


## ----------------------------------------------------
filter(gene_exp_tbl, !is.na(sample2))


## ----------------------------------------------------
arrange(de_result, FDR)


## ----------------------------------------------------
arrange(de_result, desc(FDR))


## ----------------------------------------------------
library(readr)
gene_function <- read_delim("data/R_basic/gene_function.txt", 
    "\t", escape_double = FALSE, trim_ws = TRUE)


## ----------------------------------------------------
left_join(de_result, gene_function, by = c('gene_id' = 'gene_name'))


## ----------------------------------------------------
dplyr::select(de_result, gene_id,  logFC, padj = FDR) %>%
  filter(abs(logFC) > 1 &  padj < 0.05) %>%
  left_join(gene_function, by = c('gene_id' = 'gene_name')) 

