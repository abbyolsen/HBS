###### HBS correlation plot

## AUTHOR: Joanna DiSpirito
## CREATED: 08/01/20
## LAST MODIFIED: 05/30/23


## README
# This analysis imports a csv file of Pearson correlation coefficients calculated in SAS. 


## --- load libraries -----------------------------------------------------------------------------------
libraries <- c("tidyr", "corrplot", "RColorBrewer")

lapply(X = libraries, require, character.only=TRUE)

## --- Set working directory -----------------------------------------------------------------------------------
path <- '/Volumes/Macintosh HD/Users/Abby/Documents/HBS/'


## --- Load input files -----------------------------------------------------------------------------------

# downloaded tsv file
f <- list.files(path = paste0(path, "input"), pattern = "HBS_correlations_diagtozero_minus4.csv", full.names = T)
dat.input <- read.csv(f)


## --- EDA --------------------------------------------------------------------------------

# convert df to matrix
mat <- as.matrix(dat.input[sapply(dat.input, is.numeric)])
rownames(mat) <- dat.input$Variables

# look at distributions of correlation values
summary(mat)
min(mat)
max(mat)

#  find min and max values in the matrix, rounded
cormin <- round(min(mat, na.rm = T), 1)
cormax <- round(max(mat, na.rm = T), 1)

# round_any(max(mat, na.rm = T), accuracy = 0.1, f = ceiling)  
  
# plot heatmap squares
# print plot 
f <- "output/hbs_corrplot_squares_minus4.pdf"
pdf (file = paste0(path,f), width = 9, height = 9)
corrplot(mat, is.corr = FALSE, 
         type = "upper", col = rev(brewer.pal(n = 6, name = "RdBu")),
         tl.cex =0.5, tl.col = "black", cl.cex = 0.7, cl.ratio = 0.1,
         order = "hclust", na.label = "NA",
         method = "color", outline = T) # cl.lim = c(cormin, cormax), 
dev.off()


# plot heatmap circles
# print plot
# f <- "output/hbs_corrplot_circles.pdf"
# pdf (file = paste0(path,f), width = 9, height = 9)
corrplot(mat, is.corr = FALSE, 
         type = "upper", col = rev(brewer.pal(n = 6, name = "RdBu")),
         tl.cex =0.6, tl.col = "black", cl.cex = 0.7, cl.ratio = 0.1,
         order = "hclust", na.label = "NA",
         outline = F) # 
# dev.off()