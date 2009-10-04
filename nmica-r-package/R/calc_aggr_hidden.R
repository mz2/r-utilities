`calc_aggr_hidden` <-
function(commits)  {aggregate(commits$hid,
                list(Class = commits$class,
                Period = commits$period),
                mean)}

