below.thres <- function(distobj,threshold) {
	distmatrix = attr(distobj,"matrix")
	which((distmatrix < threshold) & (distmatrix > 0.0),arr.ind=T)
}
