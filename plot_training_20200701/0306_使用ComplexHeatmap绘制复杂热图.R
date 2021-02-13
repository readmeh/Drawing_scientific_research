## ----------------------------------------------------
library(tidyverse)
library(ComplexHeatmap) 
library(circlize)


## ----------------------------------------------------
Heatmap(top100_de[1:20,],
        show_column_names = F,
        # 图例加名字
        name = "Expression",
        # 加列名
        column_title = "Gene Expression Heatmap",
        column_title_side = "top"
        )


## ----------------------------------------------------
library(circlize)
Heatmap(top100_de[1:20,],
        show_column_names = F,
        name = "Expression",
        column_title = "Gene Expression Heatmap",
        column_title_side = "top",
        # 修改颜色
        col = colorRamp2(
          # 将 0，10，20
          breaks = c(0, 10, 20),
          # 分别对应给三种颜色
          colors = c('green','white', 'red')
        )
)


## ----------------------------------------------------
Heatmap(top100_de[1:20,],
        show_column_names = F,
        name = "Expression",
        column_title = "Gene Expression Heatmap",
        column_title_side = "top",
        col = colorRamp2(
          breaks = c(0, 10, 20),
          colors = c('green','white', 'red')
        ),
        # 外边框
        border = 'white',
        # 内边框
        rect_gp = gpar(col = 'white', lwd = 1)
)


## ----eval=FALSE--------------------------------------
## col	Colour for lines and borders.
## fill	Colour for filling rectangles, polygons, ...
## alpha	Alpha channel for transparency
## lty	Line type
## lwd	Line width
## lex	Multiplier applied to line width
## lineend	Line end style (round, butt, square)
## linejoin	Line join style (round, mitre, bevel)
## linemitre	Line mitre limit (number greater than 1)
## fontsize	The size of text (in points)
## cex	Multiplier applied to fontsize
## fontfamily	The font family
## fontface	The font face (bold, italic, ...)
## lineheight	The height of a line as a multiple of the size of text
## font	Font face (alias for fontface; for backward compatibility)


## ----------------------------------------------------
Heatmap(top100_de[1:20,],
        show_column_names = F,
        name = "Expression",
        column_title = "Gene Expression Heatmap",
        column_title_side = "top",
        col = colorRamp2(
          breaks = c(0, 10, 20),
          colors = c('green','white', 'red')
        ),
        border = 'white',
        rect_gp = gpar(col = 'white', lwd = 1),
        # 设置行名字体
        row_names_gp = gpar(fontsize = 8, fontface = 'italic')
)


## ----------------------------------------------------
Heatmap(top100_de[1:20,],
        show_column_names = F,
        name = "Expression",
        column_title = "Gene Expression Heatmap",
        column_title_side = "top",
        col = colorRamp2(
          breaks = c(0, 10, 20),
          colors = c('green','white', 'red')
        ),
        border = 'white',
        rect_gp = gpar(col = 'white', lwd = 1),
        row_names_gp = gpar(fontsize = 8, fontface = 'italic'),
        # 设置列标题
        column_title_gp = gpar(fontface = 'bold')
)


## ----------------------------------------------------
Heatmap(top100_de[1:20,],
        show_column_names = F,
        name = "Expression",
        column_title = "Gene Expression Heatmap",
        column_title_side = "top",
        col = colorRamp2(
          breaks = c(0, 10, 20),
          colors = c('green','white', 'red')
        ),
        border = 'white',
        rect_gp = gpar(col = 'white', lwd = 1),
        row_names_gp = gpar(fontsize = 8, fontface = 'italic'),
        column_title_gp = gpar(fontface = 'bold'),
        # 分为 3 组
        column_km = 3,
        # 组间 gap
        column_gap = unit(0.03, 'npc')
)


## ----------------------------------------------------
Heatmap(top100_de[1:20,],
        show_column_names = F,
        name = "Expression",
        column_title = "Gene Expression Heatmap",
        column_title_side = "top",
        col = colorRamp2(
          breaks = c(0, 10, 20),
          colors = c('green','white', 'red')
        ),
        border = 'white',
        rect_gp = gpar(col = 'white', lwd = 1),
        row_names_gp = gpar(fontsize = 8, fontface = 'italic'),
        column_title_gp = gpar(fontface = 'bold'),
        # 对列分割
        column_split = cancer_normal_samples_info$group
)


## ----------------------------------------------------
column_ha <- HeatmapAnnotation(
  group = cancer_normal_samples_info$group,
  test1 = cancer_normal_samples_info$test1,
  test2 = cancer_normal_samples_info$test2,
  col = list(
    group = c(Cancer = '#fc8d59', Normal = '#99d594'),
    test1 = colorRamp2(
      breaks = c(20, 50, 80),
      colors = c('white', '#E38169', '#E9593F')
    )
  )
)


## ----------------------------------------------------
Heatmap(top100_de[1:20,],
        show_column_names = F,
        name = "Expression",
        column_title = "Gene Expression Heatmap",
        column_title_side = "top",
        col = colorRamp2(
          breaks = c(0, 10, 20),
          colors = c('green','white', 'red')
        ),
        border = 'white',
        rect_gp = gpar(col = 'white', lwd = 1),
        row_names_gp = gpar(fontsize = 8, fontface = 'italic'),
        column_title_gp = gpar(fontface = 'bold'),
        column_km = 3,
        column_gap = unit(0.03, 'npc'),
        # 在上方添加列注释
        top_annotation = column_ha
)


## ----------------------------------------------------
column_ha <- HeatmapAnnotation(
  group = cancer_normal_samples_info$group,
  test1 = cancer_normal_samples_info$test1,
  test2 = anno_points(cancer_normal_samples_info$test2,
                      size = unit(1, "mm"),
                      height = unit(0.5, 'cm'),
                      axis = F),
  test3 = anno_lines(cancer_normal_samples_info$test3,
                     height = unit(0.4, 'cm'),
                     axis = F),
  test4 = anno_barplot(cancer_normal_samples_info$test4,
                       height = unit(0.4, 'cm'),
                       axis_param = list(
                         at = c(0, 50, 100),
                         labels = c('', '50', '100'),
                         gp = gpar(fontsize = 4)
                       )),
  col = list(
    group = c(Cancer = '#fc8d59', Normal = '#99d594'),
    test1 = colorRamp2(
      breaks = c(20, 50, 80),
      colors = c('white', '#E38169', '#E9593F')
    )
  ),
  annotation_name_gp = gpar(fontsize = 8, fontface = 'italic'),
  anno_simple_size = unit(0.02, 'npc')
  )


## ----------------------------------------------------
Heatmap(top100_de[1:20,],
        show_column_names = F,
        name = "Expression",
        column_title = "Gene Expression Heatmap",
        column_title_side = "top",
        col = colorRamp2(
          breaks = c(0, 10, 20),
          colors = c('green','white', 'red')
        ),
        border = 'white',
        rect_gp = gpar(col = 'white', lwd = 1),
        row_names_gp = gpar(fontsize = 6, 
                            fontface = 'italic'),
        column_title_gp = gpar(fontface = 'bold'),
        column_km = 3,
        column_gap = unit(0.03, 'npc'),
        # 在下方添加列注释
        bottom_annotation = column_ha
)


## ----------------------------------------------------
set.seed(123)
key_genes <- sample(rownames(top100_de), size = 20, replace = F)


## ----------------------------------------------------
row_ha <- rowAnnotation(
  key_genes = anno_mark(which(rownames(top100_de) %in% key_genes),
                        labels = key_genes,
                        labels_gp = gpar(fontsize = 6))
)


## ----------------------------------------------------
Heatmap(top100_de,
        show_column_names = F,
        name = "Expression",
        column_title = "Gene Expression Heatmap",
        column_title_side = "top",
        col = colorRamp2(
          breaks = c(0, 10, 20),
          colors = c('green','white', 'red')
        ),
        border = 'white',
        rect_gp = gpar(col = 'white', lwd = 1),
        row_names_gp = gpar(fontsize = 8, fontface = 'italic'),
        column_title_gp = gpar(fontface = 'bold'),
        column_km = 3,
        column_gap = unit(0.03, 'npc'),
        # 在下方添加列注释
        bottom_annotation = column_ha,
        # 在右侧添加行注释
        right_annotation = row_ha,
        show_row_names = F
)

