read.nmlog <- function(input_path) {
        logdata = read.table(input_path)
        colnames(logdata) = c("iteration","weight","likelihood","evidence","time")
		class(logdata) = c("nmperf")
        return(logdata)
}

