plot.nmperf <- function(logdata) {
        split.screen(c(1,2))

        screen(n=2)
        plot(logdata$time,col="#666666",ylab="Time per iteration (ms)",xlab="# Iteration", main="Per-iteration performance vs iteration")

        screen(n=1)
        plot(logdata$likelihood ~ logdata$iteration,col="red", ylab="Log probability", xlab="# Iteration", main="Likelihood, evidence, weights vs iteration")
        points(logdata$evidence ~ logdata$iteration, col="blue")
        points(logdata$weight ~ logdata$iteration)
        legend("bottomright", legend=c("Likelihood","Evidence","Weight"),fill=c("red","blue","black"))
}
