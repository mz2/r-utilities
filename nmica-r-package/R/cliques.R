clique.vals <- function(x,dmatrix,cutoff,rns,cns) {
	ri = which(rns == x)
	ci = which(cns == x)
	if (ri != ci) {stop(paste("row and column index for ",x,"should be equal!"))}
	
	rvals = c()
	len = length(rns)
	if (ri < len) {
		rvals = dmatrix[ri,(ri+1):len]
	}
	
	cvals = c()
	if (ri > 1) {
		cvals = dmatrix[1:(ri-1),ci]
	}
	
	vals = c(rvals,cvals)
	vals = vals[vals <= cutoff]
	
	vals
}

cliques <- function(dmatrix,cutoff) {
	dmatrix = as.matrix(dists)
	rns = rownames(dmatrix)
	cns = colnames(dmatrix)

	len = length(rns)
	
	vals = sapply(rownames(dmatrix),
		clique.vals,
		dmatrix=dmatrix,
		cutoff=cutoff,
		rns=rownames(dmatrix),
		cns=colnames(dmatrix))
	
	vals
}