`mean_acceptance_rate` <-
function(commits) {mean(commits$outc[commits$hidden == "false"])}

