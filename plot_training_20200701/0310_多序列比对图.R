## ----eval=FALSE--------------------------------------
## BiocManager::install('YuLab-SMU/ggmsa')


## ----------------------------------------------------
library(ggmsa)


## ----------------------------------------------------
 protein_sequences <- 
  system.file("extdata", "sample.fasta", 
              package = "ggmsa")
 miRNA_sequences <- 
   system.file("extdata", "seedSample.fa", 
               package = "ggmsa")
 nt_sequences <- 
   system.file("extdata", "LeaderRepeat_All.fa", 
               package = "ggmsa")



## ----------------------------------------------------
ggmsa(protein_sequences, 
      start = 250, 
      end = 300, 
      seq_name = TRUE,
      # 字体
      font = 'mono',
      # 配色
      color = 'Chemistry_AA',
      ) 


## ----------------------------------------------------
ggmsa(protein_sequences, 
      start = 250, 
      end = 300, 
      seq_name = TRUE,
      # 字体
      font = 'mono',
      # 配色
      color = 'Chemistry_AA',
      ) +
  theme(axis.text.y = element_text(size = 6))


## ----------------------------------------------------
ggmsa(protein_sequences, 
      start = 250, 
      end = 400, 
      seq_name = TRUE,
      # 字体
      font = 'mono',
      # 配色
      color = 'Chemistry_AA',
      ) +
  facet_msa(field = 60) +
  theme(axis.text.y = element_text(size = 6))


## ----------------------------------------------------
ggmsa(protein_sequences, start = 240, end = 280,
      seq_name = T,
      color = "Chemistry_AA",
      font = "mono",
      posHighligthed = c(250,253)) +
  theme(axis.text.y = element_text(size = 6))


## ----------------------------------------------------
ggmsa(nt_sequences,
      seq_name = TRUE,
      font = "mono") +
  geom_seqlogo() +
  geom_GC() +
  scale_size(range = c(0.2, 4)) +
  scale_color_gradient(low = "white", high = "red") +
  theme(axis.text.y = element_text(size = 6))

