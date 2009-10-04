distances <- function(filename,outfilename=NULL) {
	if (is.null(outfilename)) {
		outf = tempfile(tmpdir="/tmp")
	} else {
		outf = outfilename
	}

	cmdstr = paste(Sys.getenv("NMICA_EXTRA_HOME"),
                   "/bin/nmmotifsum -sep tab -bestHits -motifs ",filename," > ",outf, sep="")
	print(cmdstr)
	system(cmdstr,intern=T)
	results = read.dist.nmica(outf)
	
	if (is.null(outfilename)) {
		file.remove(outf)
	}
	
	return(results)
}
