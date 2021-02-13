## ----------------------------------------------------
set1 <- sample(LETTERS, size = 20)
set2 <- sample(LETTERS, size = 20)
set3 <- sample(LETTERS, size = 20)
set4 <- sample(LETTERS, size = 20)
set5 <- sample(LETTERS, size = 20)
set6 <- sample(LETTERS, size = 20)


## ----------------------------------------------------
set1


## ----------------------------------------------------
set2


## ----------------------------------------------------
dplyr::union(set1, set2)


## ----------------------------------------------------
dplyr::intersect(set1, set2)


## ----------------------------------------------------
dplyr::setdiff(set1, set2)


## ----------------------------------------------------
Reduce(union, list(set1, set2, set3))


## ----------------------------------------------------
Reduce(intersect, list(set1, set2, set3))


## ----------------------------------------------------
Reduce(setdiff, list(set1, set2, set3))


## ----eval=FALSE--------------------------------------
## BiocManager::install("VennDiagram")


## ----------------------------------------------------
library(VennDiagram)
library(RColorBrewer)
library(scales)
venn.diagram(
  x = list(set1 = set1, set2 = set2, 
           set3 = set3, set4 = set4),
  filename = 'output/4sets.tiff',
  col = 'black',
  fill = brewer_pal(palette = 'Set2')(4)
)


## ----------------------------------------------------
library(VennDiagram)
library(RColorBrewer)
library(scales)
venn.diagram(
  x = list(set1 = set1, set2 = set2, 
           set3 = set3, set4 = set4, set5 = set5),
  filename = 'output/5sets.tiff',
  col = 'black',
  fill = brewer_pal(palette = 'Set2')(5)
)


## ----eval=FALSE--------------------------------------
## BiocManager::install('krassowski/complex-upset')


## ----------------------------------------------------
library(ggplot2)
library(ComplexUpset)


## ----------------------------------------------------
library(readr)
Orthogroups <- read_delim("data/Orthogroups.GeneCount.tsv", 
    "\t", escape_double = FALSE, trim_ws = TRUE)


## ----------------------------------------------------
Species <- colnames(Orthogroups)[2:5]
Species


## ----------------------------------------------------
Orthogroups[Species] <- Orthogroups[Species] > 0
Orthogroups <- Orthogroups[1:5]


## ----------------------------------------------------
upset(Orthogroups, 
      Species,
      name = NULL,
      height_ratio = 0.4,
      width_ratio = 0.2,
      min_size=100
      )

