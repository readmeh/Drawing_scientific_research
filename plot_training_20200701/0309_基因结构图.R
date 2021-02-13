## ----eval=FALSE--------------------------------------
## BiocManager::install("wilkox/gggenes")


## ----------------------------------------------------
library(gggenes)
data(example_genes)
head(example_genes)


## ----------------------------------------------------
library(ggplot2)
library(gggenes)

ggplot(example_genes, 
       aes(xmin = start, xmax = end, 
           y = molecule, fill = gene)) +
  geom_gene_arrow(aes(forward = direction)) +
  geom_gene_label(align = "centre", 
                  aes(label = gene)) +
  facet_wrap(~ molecule, 
             scales = "free", 
             ncol = 1) +
  scale_fill_brewer(palette = "Set3") +
  theme_genes()

