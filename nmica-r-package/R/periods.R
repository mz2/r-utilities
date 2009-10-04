`periods` <-
function(commits, n) {
    period = rep(0, nrow(commits))
    l = round(nrow(commits) / n)
    for (i in 0:(n-1)) {
        period[(i*l):min((i*l+l),nrow(commits))] = i + 1
    }
    return(period)
}

