#entropies <- function(filename) {
#	as.numeric(system(paste(Sys.getenv("NMICA_HOME"),"/bin/nmmotifsum -entropy -motifs ",filename," | cut -f2 -d' '",sep=""),intern=T)[-1])
#}

#col.entropies <- function(filename) {
#	as.numeric(system(paste(Sys.getenv("NMICA_HOME")"/bin/nmmotifsum -colEntropy -motifs ",filename," | cut -f3 -d' '",sep=""),intern=T)[-1])
#}