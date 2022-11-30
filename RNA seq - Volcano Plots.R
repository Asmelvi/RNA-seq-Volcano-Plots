library(readxl)
library(EnhancedVolcano)
library(clusterProfiler)
library(org.Mm.eg.db)
library(AnnotationDbi)

################### First Plot Compare D0 ALI D14 ALI Fold change P value sign or non

data_1st_file = read_xlsx("PATH")
df = data.frame(data_1st_file)
df

EnhancedVolcano(df, x = "Log2.Fold.change", y = "P.value", lab = df$Gene.Symbol, title = "Compare D0 ALI D14 ALI")

names1 = (df[df$P.value < 0.05,])[,1]
names2 = (df[df$Log2.Fold.change > 1,])[,1]

shared_upper_regulated_genes = Reduce(intersect, list(names1, names2))
print(shared_upper_regulated_genes)

names1 = (df[df$P.value < 0.05,])[,1]
names2 = (df[df$Log2.Fold.cahnge < -1,])[,1]
names2
shared_upper_regulated_genes = Reduce(intersect, list(names1, names2))
print(shared_upper_regulated_genes)


################### Second Plot compare D14 ALI IL3 D14 DAPT FOLD CHANGE P VALUE SIG NON SIG

data_1st_file = read_xlsx("PATH")
df = c()
df = data.frame(data_1st_file)
df

EnhancedVolcano(df, x = "Log2.Fold.Change", y = "P.Value", lab = df$GeneSym, title = "Compare D14 ALI IL3 D14 DAPT")


names1 = (df[df$P.Value < 0.05,])[,1]
names2 = (df[df$Log2.Fold.Change > 2,])[,1]

shared_upper_regulated_genes = Reduce(intersect, list(names1, names2))
print(shared_upper_regulated_genes)

names1 = (df[df$P.Value < 0.05,])[,1]
names2 = (df[df$Log2.Fold.Change < -2,])[,1]
names2
shared_upper_regulated_genes = Reduce(intersect, list(names1, names2))
print(shared_upper_regulated_genes)

################### Third Plot compare D14 ALI IL3 D14 DAPT FOLD CHANGE P VALUE SIG NON SIG

data_1st_file = read_xlsx("PATH")
df = c()
df = data.frame(data_1st_file)
df

EnhancedVolcano(df, x = "Log2.Fold.Change", y = "P.value", lab = df$Gene.Symbol, title = "Compare D14 ALI NON INFECTION D14 ALI INFECTION")

names1 = (df[df$P.value < 0.05,])[,1]
names2 = (df[df$Log2.Fold.Change > 1,])[,1]

shared_upper_regulated_genes = Reduce(intersect, list(names1, names2))
print(shared_upper_regulated_genes)

names1 = (df[df$P.value < 0.05,])[,1]
names2 = (df[df$Log2.Fold.Change < -1,])[,1]
names2
shared_upper_regulated_genes = Reduce(intersect, list(names1, names2))
print(shared_upper_regulated_genes)

################### Fourth Plot Compare mTEC source with D14 Fold change P value sigin or non(1)

data_1st_file = read_xlsx("PATH")
df = c()
df = data.frame(data_1st_file)
df

EnhancedVolcano(df, x = "Log2.Fold.Change", y = "P.value", lab = df$Gene.Symbol, title = "Compare mTEC source with D14")

names1 = (df[df$P.value < 0.05,])[,1]
names2 = (df[df$Log2.Fold.Change > 1,])[,1]

shared_upper_regulated_genes = Reduce(intersect, list(names1, names2))
print(shared_upper_regulated_genes)

names1 = (df[df$P.value < 0.05,])[,1]
names2 = (df[df$Log2.Fold.Change < -1,])[,1]
names2
shared_upper_regulated_genes = Reduce(intersect, list(names1, names2))
print(shared_upper_regulated_genes)

################### Fivth Plot Compare Source mTEC and D0ALI fold change p value siginifcant and non significant

data_1st_file = read_xlsx("PATH")
df = c()
df = data.frame(data_1st_file)
df

EnhancedVolcano(df, x = "Log2.Fold.Change", y = "P.Value", lab = df$Gene.Symbol, title = "Compare Source mTEC and D0ALI")

names1 = (df[df$P.Value < 0.05,])[,1]
names2 = (df[df$Log2.Fold.Change > 1,])[,1]

shared_upper_regulated_genes = Reduce(intersect, list(names1, names2))
print(shared_upper_regulated_genes)

names1 = (df[df$P.Value < 0.05,])[,1]
names2 = (df[df$Log2.Fold.Change < -1,])[,1]
names2
shared_upper_regulated_genes = Reduce(intersect, list(names1, names2))
print(shared_upper_regulated_genes)

################### Sixth Plot compare source mTEC and D14 ALI fold change p value signi non signi

data_1st_file = read_xlsx("PATH")
df = c()
df = data.frame(data_1st_file)
df

EnhancedVolcano(df, x = "Log2.Fold.Change", y = "P.Value", lab = df$Gene.Symbol, title = "Compare source mTEC and D14 ALI")

names1 = (df[df$P.Value < 0.05,])[,1]
names2 = (df[df$Log2.Fold.Change > 1,])[,1]

shared_upper_regulated_genes = Reduce(intersect, list(names1, names2))
print(shared_upper_regulated_genes)

names1 = (df[df$P.Value < 0.05,])[,1]
names2 = (df[df$Log2.Fold.Change < -1,])[,1]
names2
shared_upper_regulated_genes = Reduce(intersect, list(names1, names2))
print(shared_upper_regulated_genes)


################### 
################### Heatmap and 
################### clustering
################### 

library(ggplot2)
library(ComplexHeatmap)

data_2st_file = read_xlsx("C:/Users/Avalon/Desktop/RNA Seq/ListDGE.xlsx", sheet = "Arranged")
data_3st_file = read_xlsx("C:/Users/Avalon/Desktop/RNA Seq/ListDGE.xlsx", sheet = "Sheet6")

df2 = data.frame(data_2st_file)
df3 = data.frame(data_3st_file)

df2_optimized = data.frame(df2["Gene.Symbol"], df2["AV.Source"], df2["AV.D0ALI"], df2["AV.D1.ALI"], df2["AV.D14.ALI"])

Heatmap(as.matrix(df2_optimized), cluster_rows = FALSE, cluster_columns = TRUE)
