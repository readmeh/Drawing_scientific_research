## ----eval=FALSE--------------------------------------
## BiocManager::install('omarwagih/ggseqlogo')


## ----------------------------------------------------
nt_sequences <- 
   system.file("extdata", "LeaderRepeat_All.fa", 
               package = "ggmsa")


## ----------------------------------------------------
seqs_dna$MA0001.1


## ----------------------------------------------------
library(ggplot2)
library(ggseqlogo)

data(ggseqlogo_sample)
ggplot() + geom_logo(seqs_dna$MA0001.1) + 
  theme_logo()


## ----------------------------------------------------
ggplot() + geom_logo(seqs_dna) + 
  theme_logo() + 
  facet_wrap(~ seq_group, ncol=4, 
             scales='free_x') 

