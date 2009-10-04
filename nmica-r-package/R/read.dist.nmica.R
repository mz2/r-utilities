read.dist.nmica <- function(filename) {
	distm = t(read.table(filename,sep="\t",header=T,row.names=1,check.names=F)) 
	dist = as.dist(distm)
	attr(dist,"matrix") = distm
	return(dist)
}
