#reads a distance matrix if called with a single, otherwise a table
nmmotifsum <- function(xmsfile,
                       otherMotifs=NULL,
                       metaMotifs=NULL,
                       bestHits=F,
                       entropy=F,
                       length=F,
                       bg=F,
                       gcContent=F,
                       pseudocount=0.0,
                       pairedOutput=F,
                       sep="tab") {
  flagstr = ""
  if (!is.null(metaMotifs) || !is.null(otherMotifs)) {bestHits = T}
  if (!is.null(otherMotifs)) {flagstr = paste(flagstr,"-otherMotifs",otherMotifs)}
  if (!is.null(metaMotifs)) {flagstr = paste(flagstr,"-metaMotifs",metaMotifs)}
  if (length) {flagstr = paste(flagstr,"-length")}
  if (entropy) {flagstr = paste(flagstr,"-entropy")}
  if (bg) {flagstr = paste(flagstr,"-bg")}
  if (gcContent) {flagstr = paste(flagstr,"-gcContent")}

  if (bestHits) {flagstr = paste(flagstr,"-bestHits")}
  if (pseudocount > 0) {flagstr = paste(flagstr,"-pseudoCount",pseudocount)}
  flagstr = paste(flagstr,"-sep",sep) 
  #output options
  if (pairedOutput) {flagstr = paste(flagstr, "-pairedOutput")}

  tempoutputf = tempfile("motifsum","/tmp")
  print(tempoutputf)
  system(paste("nmmotifsum -motifs",xmsfile,flagstr,">",tempoutputf))
  system(paste("cat",tempoutputf))
  if (bestHits &! pairedOutput) {
    dat = read.dist.nmica(tempoutputf)
  } else { 
    dat = read.delim(tempoutputf,sep="\t")
  }
  unlink(tempoutputf)

  dat
}
