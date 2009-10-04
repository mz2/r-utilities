read.nmshuffle <- function(filename) {
	nmshuffletable = read.table(filename)
	class(nmshuffletable) = c("nmshuffle","data.frame")
	colnames(nmshuffletable) = c("motif0","motif1","score","hits","hitrate")
	nmshuffletable
}