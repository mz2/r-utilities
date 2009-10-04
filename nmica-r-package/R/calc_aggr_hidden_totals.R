`calc_aggr_hidden_totals` <-
function(commits) {
aggregate(commits$hid,list(Class = commits$class),mean)}

