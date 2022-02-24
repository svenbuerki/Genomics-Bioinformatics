#A function to extract functions in a package as well as their defintion line (from the doc)
# - Input: package name
# - Outout: a data.frame with 3 cols.
PkgFunDescr <- function(pkg){
  #Extract all functions and their structure in pkg
  pkgFun <- ls(paste("package", pkg, sep= ":"))
  
  #Discard functions that are ambiguous
  ToRm <- grep("<-", FunTmp)
  #Reduced FunTmp
  Fun <- pkgFun[-ToRm]
  
  #Definition
  Def <- NULL
  print("Processing extraction of definitions for each function")
  #Set a progress bar
  pb <- txtProgressBar(min = 0, max = length(Fun), style = 3)
  for(j in 1:length(Fun)){
    #Extract definition line for function
    DefTmp <- gsub("[_\b]", "", capture.output(tools::Rd2txt(utils:::.getHelpFile(as.character(help(Fun[j], package = paste0(pkg)))))))[1] 
    Def <- rbind(Def, DefTmp)
    # update progress bar
    setTxtProgressBar(pb, j)
  }
  close(pb)
  
  #Merge vectors into a data.frame
  OUT <- data.frame("Function" = Fun, "Package" = rep(pkg, length(Fun)), "Definition" = Def)
  
  #Print results
  OUT
}

