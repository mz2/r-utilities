motifsets <- function(
	clusters, 
	k,
	alphab=F,
	input_path=NULL,
	output_path="./",
	output_type="all",
	min_cols=2,
	file_prefix="",
	bsub=F,
	cuts=NULL) {
	
	ct = NULL
	if (is.null(cuts)) {
		ct = cutree(clusters,k)
	} else {
		if (is.matrix(cuts) || is.data.frame(cuts)) {
			ct = cuts[,1]
			names(ct) = cuts[,2]
		} else if (is.vector(cuts)) {
			if (is.null(names(cuts))) {
				stop("clusters should be named")
			}
			ct = cuts
		} else {
			stop("clusters should be either a n rows x 2 columns matrix, data frame or a vector with entries named")
		}
	}
	ret = list()
	#print("foo")
	#print(k)
	for (i in 1:k) {
		#print(i)
		#print(ct)
		ns = names(ct)[ct == i]
		if (alphab) {ns = sort(ns)}
		ret[[i]] = ns
	}
	#print("bar")
	
	if (!is.null(output_path) && !is.null(input_path)) {
		output_dir = paste(output_path,"/",sep="",collapse="")
		output_path = paste(output_path,"/",file_prefix,sep="",collapse="")
		
		for (i in 1:k) {
			if (length(ret[[i]]) == 0) {
				next
			}
			print(output_type)
			opath_tmp = paste(output_path, i,".xms",sep="",collapse="")
			opath = paste(output_path, i,"_",output_type,".xms",sep="",collapse="")
			
			print(opath)
			#print(ret[[i]])
			nmgrep(
				paste(ret[[i]],collapse=" "), 
				input_path, 
				opath_tmp)
						
			nmalign(
				opath_tmp,
				opath,
				min_cols=min_cols,
				output_type=output_type,bsub=bsub)
				
			file.remove(opath_tmp)
		}
	
		
		#if (output_type=="collect_avgs") {
		#	cmdstr = paste(
		#		Sys.getenv("NMICA_EXTRA_HOME"),"/bin/nmmerge -ignoreErrors ",
		#			paste(list.files(output_dir,pattern="_avg.xms",full.names=T),collapse=" ")
		#			," -out ",opath_joined_avgs,sep="",collapse="")
		#	print(cmdstr)
		#	system(cmdstr)
		#}
	}
	return(ret)
}
