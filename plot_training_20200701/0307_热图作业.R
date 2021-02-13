## ----------------------------------------------------
mat_expr <- read.csv(file = 'data/ComplexHeatmap/example3/mat_expr.csv', 
                     row.names = 1)
mat_meth <- read.csv(file = 'data/ComplexHeatmap/example3/mat_meth.csv', 
                     row.names = 1)
sample_info <- read.csv(file = 'data/ComplexHeatmap/example3/sample_info.csv', 
                        row.names = 1)
gene_info <- read.csv(file = 'data/ComplexHeatmap/example3/gene_info.csv', 
                      row.names = 1)


## ----------------------------------------------------
library(circlize)
library(ComplexHeatmap)

ht_opt(
    legend_title_gp = gpar(fontsize = 8, fontface = "bold"), 
    legend_labels_gp = gpar(fontsize = 8), 
    heatmap_column_names_gp = gpar(fontsize = 8),
    heatmap_column_title_gp = gpar(fontsize = 10),
    heatmap_row_title_gp = gpar(fontsize = 8)
)

h <- Heatmap(mat_meth,
        name = 'Methylation',
        col = colorRamp2(c(0, 0.5, 1), 
                         c("blue", "white", "red")),
        show_row_names = F,
        cluster_columns = F,
        column_title = 'Methylation',
        top_annotation = HeatmapAnnotation(
          type = sample_info$type,
          col = list(type = c("Tumor" = "pink", 
                              "Control" = "royalblue")),
          annotation_name_side = 'left'),
        row_km = 2,
        row_split = gene_info$meth_direction) +
  Heatmap(gene_info$meth_direction,
          name = 'direction',
          col = c("hyper" = "red", "hypo" = "blue")) +
  Heatmap(mat_expr,
          name = 'Expression',
          col = colorRamp2(c(-2, 0, 2), c("green", "white", "red")),
          show_row_names = F,
          cluster_columns = F,
          column_title = 'Expression',
          top_annotation = HeatmapAnnotation(
          type = sample_info$type,
          col = list(type = c("Tumor" = "pink", 
                              "Control" = "royalblue")),
          show_annotation_name = F)) +
  Heatmap(gene_info$cor_pvalue,
          name = '-log10(cor_p)',
          col = colorRamp2(c(0, 2, 4), c("white", "white", "red"))) +
  Heatmap(gene_info$gene_type,
          name = 'gene_type',
          col = c('protein_coding' = '#8DD3C7', 
                  'psedo-gene' = '#FEFBB3',
                  'lincRNA' = '#BEBADA',
                  'others'= '#F07F70',
                  'microRNA' = '#80B1D4')) +
  Heatmap(gene_info$gene_anno,
          name = 'gene_anno') +
  Heatmap(gene_info$dist,
          name = 'dist tss',
          col = colorRamp2(c(0, 10000), 
                           c("black", "white")))

draw(h, heatmap_legend_side = 'bottom')

