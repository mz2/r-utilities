nmmerge <- function(filenames, output) {
	output_str = paste(" -out",output)
	
	nmmerge_cmd = paste(
		Sys.getenv("NMICA_EXTRA_HOME"),
			"/bin/nmmerge",
			" ",paste(filenames,collapse=" "),
			output_str, 
			sep="")
	
	return(system(nmmerge_cmd,intern=T))
}