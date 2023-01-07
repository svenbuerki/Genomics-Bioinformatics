########
#Script to generate documentation on R functions used in class
########

#Source UDF
source("Functions/PkgFunDescr.R")

#List of packages
pkg <- c("base", "utils", "ape", "rentrez")

OUT <- NULL
for(i in 1:length(pkg)){
  print(paste("Processing pkg", pkg[i], sep = " "))
  #Extract functions info for target pkg
  tmp <- PkgFunDescr(pkg = pkg[i])
  #Save output
  OUT <- rbind(OUT, tmp)
}
#Export Table as CSV
write.csv(OUT, file = "Data/R_functions_Table.csv", row.names = F, quote = F)

#EXTRACT function structure
#x <- capture.output(args(substr), split=T)
#x[1]