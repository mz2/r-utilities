`calc_aggr_outc` <-
function(commits, count_hidden=T) {
if (!count_hidden) {
return(aggregate(commits$outc[commits$hidden == "false"],
                list(Class = commits$class[commits$hidden == "false"],
                Period = commits$period[commits$hidden == "false"]),
                mean))
} else {
return(aggregate(commits$outc,
                    list(Class = commits$class,
                    Period = commits$period),
                    mean))
}
}

