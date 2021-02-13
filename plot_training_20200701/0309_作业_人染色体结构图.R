## ----------------------------------------------------
options(scipen = 999)


## ----------------------------------------------------
library(tidyverse)
library(RIdeogram)


## ----------------------------------------------------
library(readr)
fai <- read_delim("data/others/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz.fai", 
    "\t", escape_double = FALSE, col_names = FALSE, 
    trim_ws = TRUE)
head(fai)


## ----------------------------------------------------
at_karyotype <- select(fai, Chr = X1, End = X2) %>%
  mutate(Start = 0) %>%
  select(Chr, Start, End)
head(at_karyotype)


## ----------------------------------------------------
write.table(at_karyotype, 
            file = 'data/others/at_karyotype.txt',
            sep = '\t',
            quote = F,
            row.names = F)


## ----------------------------------------------------
at_gene_density <- GFFex(
  input = "data/others/Arabidopsis_thaliana.TAIR10.47.gff3.gz", 
  karyotype = "data/others/at_karyotype.txt", 
  feature = "gene", 
  window = 100000)


## ----------------------------------------------------
ideogram(karyotype = at_karyotype, 
         overlaid = at_gene_density,
         output = 'chromosome6.svg')
convertSVG("chromosome6.svg", 
           file = 'chromosome6',
           device = "pdf")

