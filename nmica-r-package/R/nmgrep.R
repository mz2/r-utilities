nmgrep <- function(names,input_path,output_path,bsub=F) {
	nmgrep_cmd = paste(
		Sys.getenv("NMICA_EXTRA_HOME"),
			"/bin/nmgrep",
			" -names ",names,
			" -motifs ",input_path,
			" > ",output_path, 
			sep="")
        print(nmgrep_cmd)
        
        if (bsub)
        {
        return(paste("nsub",system(
                nmgrep_cmd,
                intern=T)))
        } else {
	return(system(
		nmgrep_cmd,
		intern=T))
        }
}
