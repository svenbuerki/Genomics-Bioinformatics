## ---- JellyFishR --------
#1. Load the output of Jellyfish in R
Clean <- read.table('Orchid_21mer_SRR5759389_pe12_max100.trimmed.norare.histo')

#2. Execute this user defined function to infer genome size and plot k-mer distribution
#A function to infer genome size (1C or haploid) on jellyfish output
#input - hist = table containing output of Jellyfish (hist file)
#         - plotKmers if "TRUE" outputs a graph
GenomeSize <- function(hist, plotKmers){
  #Infer Genome size
  x <- grep(min(hist[1:20,2]),hist[,2])
  tmp <- hist[x:1000,1]*hist[x:1000,2]
  #Infer the total number of kmers in the distribution
  Totkmers <- sum(as.numeric(as.vector(tmp)))
  #Infer Peak of coverage (when enough data is equal to mean) of the genome (13x)
  PeakCov <- grep(max(hist[x:1000,2]), hist[,2])
  #Genome size (1C or haploid) is the area under the curve, which is the Total numner of K-mers/Mean coverage
  GenomeSizeOut <- Totkmers/PeakCov
  GenomeSizeOut <- round(GenomeSizeOut/1000000,2)
  print(GenomeSizeOut)
  if(plotKmers == "TRUE"){
    #Plot 
    plot(hist[2:200,], type='n', ylim=c(0,20000000), xlab='Coverage', ylab='Frequency', main="K-mer (k=21) distribution")
    #Plot trimmed data
    lines(hist[2:200,])
    #These are low coverage K-mers (K=1:8), which have very high frequencies
    rect(xleft=0, ybottom=0, xright=x, ytop=20000000, col='red')
    text(x=25, y=hist[PeakCov,2]+3000000, paste("Error k-mers", sep='\n'), cex=.7, col='red')
    #Add the distribution line
    lines(hist[2:200,], type='l')
    #Add a line showing the peak of coverage (here at 26x)
    segments(x0 = PeakCov, y0 = 0, x1=PeakCov, y1=hist[PeakCov,2], lty=2)
    text(x=26, y=hist[PeakCov,2]+900000, paste("Peak cov.: ", PeakCov, "x", sep=''), cex=.6)
    text(x=50, y=8000000, paste("True k-mers", sep='\n'), cex=.8)
    text(x=170, y=18500000, paste("Estimated genome size: ", GenomeSizeOut, "Mb", sep=''), cex=.6)
  }
}

#3. Estimate genome size on cleaned reads using the function GenomeSize
pdf("GenomeSize.pdf")
GenomeSize(Clean, plotKmers = "TRUE")
dev.off()
