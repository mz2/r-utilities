nmalign <- function(input_path, output_path, min_cols=2,output_type="avg",bsub=F) {
	nmalign_all_cmd = paste(
		Sys.getenv("NMICA_EXTRA_HOME"),
			"/bin/nmalign -minCols ",min_cols,
			" -outputType ",output_type," ",paste(input_path,collapse=" "),
			" > ",output_path, 
			sep="",collapse="")
	if (bsub) {nmalign_all_cmd = paste("bsub -o",paste(output_path,".bout",sep=""),nmalign_all_cmd)}
	print(nmalign_all_cmd)
	return(system(nmalign_all_cmd))
}
