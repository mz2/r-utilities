`calc_aggr_hidden_commits` <-
function(commits) {aggregate(commits$hidcommit,
list(Class = commits$class,
Period = commits$period),
mean)}

