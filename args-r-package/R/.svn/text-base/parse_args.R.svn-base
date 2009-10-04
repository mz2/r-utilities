`parse_args` <- function(args=NULL,set_argv=T,remove_r_args=T) {
    arglist = list()
    
	if (is.null(args) && remove_r_args) {
		args = commandArgs()[-1]
		args = args[!(args %in% c("--quiet","--slave","--no-save"))]
		
		if (length(args) == 0) {return()}
	}
	
    orig_warn_level <- options("warn")
    options(warn = -1)
    
    for (i in 1:length(args)) {
        tmp <- unlist(strsplit(args[i],split=c("=")))
        #print(tmp)
        key <- tmp[1]
        value <- tmp[2]
        
        if (!is.na(key) &! is.na(value)) {
            if (length(grep("[\\,,;]",value)) > 0) {
                value = unlist(strsplit(value,"[\\,,;]"))
            } 
            if (is.na(as.numeric(value))) {
                if (is.na(as.logical(value))) {
                    arglist[[key]] <- as.character(value)
                } else {
                    arglist[[key]] <- as.logical(value)
                }
            } else {
                arglist[[key]] <- as.numeric(value)
            }
        } else if (is.na(value)) {
            arglist[[key]] <- TRUE
        }
    }
    
    options("warn" = orig_warn_level$warn)
	if (!("argv" %in% ls())) {assign("argv",arglist,.GlobalEnv)}
	else {cat("\"argv\" already present in .GlobalEnv. Will not overwrite it.")}
    return(arglist);
}