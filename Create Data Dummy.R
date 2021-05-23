# Conjoint Analysis
  
# Market Research Using Conjoint Analysis In R (Profile Book)
# References : https://www.coursera.org/learn/applying-data-analytics-business-in-marketing
# ============================================================================

# Install Library
library("conjoint")
library("fpc")

# ============================================================================
# Make A factorial Data
# Let’s start with an example. Imagine you want to determine which of the 
# PAGES, GENRE and AUTHOR features is the most 
# important for a successful Data Science Book. 
# Here are feature values we will study:
#   *   PAGES (less than 500 Pages, 500-1000 Pages, +1000 Pages)
#   *   GENRE (FICTION, NON-FICTION)
#   *   AUTHOR (KNOWN, UNKNOWN)
# ============================================================================

# Declaration of features and feature values
pages <- c("LESS THAN 500 PAGES", "500 TO 1000 PAGES", "MORE THAN 1000 PAGES")
genre <- c("FICTION","NON-FICTION")
author <- c("KNOWN", "UNKNOWN")

factor_levels <- as.data.frame(c(pages,genre,author))
colnames(factor_levels) <- "Levels"

factor_levels

# All concept generation
data <- expand.grid(pages, genre, author)
colnames(data) <- c("Pages", "Genre", "Author")

data

# ============================================================================
# Make a Full Factorial Design
# Full of the combination of factor levels are considered 
# ============================================================================

# Pemilihan konsep Relevan 
facdesign <- caFactorialDesign(data = data, type = "full")
encdesign <- caEncodedDesign(facdesign)

# Memeriksa apakah konsep yang dipilih relevan untuk diteliti 
cor(encdesign)

# ============================================================================
# Make A Respon for Each Profile books
# Make A 10 People respon for each Profile book to compare them
# ============================================================================

# Isi 10 responden secara acak dari seluruh 12 profil 
set.seed(1)
response <- as.data.frame(sample(1:12, 12, rep=FALSE))
for (i in 2 : 10){
  temp <- as.data.frame(sample(1:12, 12, rep=FALSE))
  response <- cbind(response, temp)
}

response <- t(response)
row.names(response) <- c(1:10)
colnames(response) <- c(paste("Profile", c(1:12)))
response <- as.data.frame(response)

response
