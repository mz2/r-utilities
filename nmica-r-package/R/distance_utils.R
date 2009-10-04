below.thres <- function(distobj,threshold) {
	distmatrix = attr(distobj,"matrix")
	which((distmatrix < threshold) & (distmatrix > 0.0),arr.ind=T)
}

row.col.name <- function(point.2d,distobj) {
	mat = attr(distobj,"matrix")
	return(
		c(
			rownames(mat)[point.2d[1]],
			colnames(mat)[point.2d[2]]
		 )
		)
}

dist.val <- function(point.2d,distobj) {
	mat = attr(distobj,"matrix")
	return(mat[point.2d[1],point.2d[2]])
}

below.thres <- function(distobj,threshold) {
	distmatrix = attr(distobj,"matrix")
	which((distmatrix < threshold) & (distmatrix > 0.0),arr.ind=T)
}
