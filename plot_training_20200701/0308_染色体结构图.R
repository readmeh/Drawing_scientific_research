## ----eval=FALSE--------------------------------------
## BiocManager::install('TickingClock1992/RIdeogram')


## ----------------------------------------------------
library(RIdeogram)


## ----------------------------------------------------
options(scipen = 999)
library(RIdeogram)
data("human_karyotype")
data("gene_density")
data("LTR_density")
data("Random_RNAs_500")


## ----------------------------------------------------
head(human_karyotype)


## ----------------------------------------------------
head(gene_density)


## ----------------------------------------------------
head(Random_RNAs_500)


## ----------------------------------------------------
ideogram(karyotype = human_karyotype, 
         output = 'output/chromosome1.svg')
convertSVG("output/chromosome1.svg", 
           file = 'output/chromosome1',
           device = "png")


## ----------------------------------------------------
ideogram(karyotype = human_karyotype, 
         overlaid = gene_density,
         output = 'output/chromosome2.svg')
convertSVG("output/chromosome2.svg", 
           file = 'output/chromosome2',
           device = "png")


## ----------------------------------------------------
ideogram(karyotype = human_karyotype, 
         overlaid = gene_density,
         label = Random_RNAs_500, 
         label_type = 'marker',
         output = 'output/chromosome3.svg')
convertSVG("output/chromosome3.svg", 
           file = 'output/chromosome3',
           device = "png")


## ----------------------------------------------------
ideogram(karyotype = human_karyotype, 
         overlaid = gene_density,
         label = LTR_density, 
         label_type = 'heatmap',
         output = 'output/chromosome4.svg')
convertSVG("output/chromosome4.svg", 
           file = 'output/chromosome4',
           device = "png")


## ----------------------------------------------------
ideogram(karyotype = human_karyotype, 
         overlaid = gene_density,
         label = Random_RNAs_500, 
         label_type = 'marker',
         colorset1 = c('#FFEB96', '#FF9B3C', '#E62200'),
         output = 'chromosome5.svg')
convertSVG("chromosome5.svg", 
           file = 'chromosome5',
           device = "png")

