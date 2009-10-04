`plot_commits` <- function(commits, width=12,height=12,file=NULL,count_hidden=F, period_count=10, aggr_hidden=NULL) {
	aggr_outc = calc_aggr_outc(commits,count_hidden)
	aggr_hidden = NULL
	if (count_hidden) {aggr_hidden = calc_aggr_hidden(commits)}
	if (!is.null(file)) {pdf(file, width=width,height=height)}
	#else {plot.new(width=width,height=height)}
	classes <- unique(aggr_outc$Class)
	classcolors_outc <- rainbow(length(classes))
	classcolors_hid <- rainbow(length(classes),alpha=0.5)
	plot(NULL,
	        main="Rate vs 'time'",
	        ylim=c(0,1),
	        xlim=c(0,1),
	        ylab="Commit rate",
	        xlab=paste("Fraction of simulation steps done thus far",
	                "(duration divided to",max(period_count),"parts)"))
        
	plot_aggregate_data(aggr_outc,classes,classcolors_outc,lty=1,type="l",lwd=3)
	if (count_hidden &! is.null(aggr_hidden)) {
		plot_aggregate_data(aggr_hidden,classes,classcolors_hid,lty=0,type="p",lwd=2,pch=19)
	}
	legend(0.8, 0.12,classes,fill=classcolors_outc)
	if (!is.null(file)) {dev.off()}
}