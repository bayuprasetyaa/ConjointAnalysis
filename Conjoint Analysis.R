# Utilitas Sebagian atau (Partial Utility)
partutil <- caPartUtilities(y = response[1:5,], x = encdesign, z = factor_levels)

util <- caUtilities(y = response, x = encdesign, z = factor_levels)

#Analisis Conjoint 
analysis <- Conjoint(response, encdesign, factor_levels)
analysis

# Memperoleh bilai penting dari masing-masing faktor 
importance <- caImportance(response, encdesign)
Factor <- c("Pages","Genre", "Author")

factorimp <- as.data.frame(cbind(Factor,importance))
factorimp

#segmentation dan plot clustering 
pref <- as.vector(t(response))
seg <- caSegmentation(pref, encdesign, c = 2)

cluster <- as.data.frame(seg$sclu)
colnames(cluster) <- "Cluster"

plotcluster(seg$util, seg$sclu, pch = 20, xlab = "", ylab = "")
