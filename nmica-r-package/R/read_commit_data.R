`read_commit_data` <-
function(log_filename,period_count=10,fill=F) {
	commits = read.table(log_filename,fill=F);
	#if (is.null(commits) || 
	#	is.na(commits) || 
	#	length(commits) == 0 ||
	#	ncol(commits) == 0 || 
	#	nrow(commits == 0)) {return(NULL)}
	
	commits = cbind(commits, commits[,3] == "true",commits[,4] == "commit", commits[,3] == "true" & commits[,4] == "commit")
	commits = cbind(commits,periods(commits,as.numeric(period_count)))
	colnames(commits) = c("class","penalty","hidden","outcome","hid","outc","hidcommit","period")
	return(commits)
}

