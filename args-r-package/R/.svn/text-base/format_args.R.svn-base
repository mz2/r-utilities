`format_args` <- function(args, key_prefix="-",key_value_sep="=",value_sep=" ",scientific=F) {
    str = ""
    keys = names(args)
	if (is.null(keys)) {return("")}
	
    for (i in 1:length(keys)) {
	    key = keys[i]
		value = args[key]
		as_logic = as.logical(as.character(value))
	    is_logical = !is.na(value) &! is.na(as_logic) && (length(as_logic) > 0)
	    is_true = is_logical && as.logical(args[keys[i]])
	
	    if (length(value) > 1) {value <- paste(value,collapse=value_sep)}
	
		if (!is.null(value) &! is.na(value) && ((is_logical &! is_true) || !is_logical)) {
        	str = paste(str,key_prefix,key,key_value_sep,format(value,scientific=scientific)," ",sep="",collapse=" ")
		} 
		
		if (is_logical && is_true) {
			str = paste(str," ",key_prefix,keys[i]," ",sep="",collapse="")
		}
    }
    
    return(sub(' +$', '',str))
}