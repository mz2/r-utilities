`calc_aggr_hidden_commits_totals` <-
function(commits) {
aggregate(commits$hidcommit,list(Class = commits$class),mean)}

