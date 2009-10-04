`calc_aggr_outc_totals` <-
function(commits) {aggregate(commits$outc,list(Class = commits$class),mean)}

