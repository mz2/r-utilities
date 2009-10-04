`plot_aggregate_data` <-
function(aggr,classes,classcolors,...) {

for (i in 1:length(classes)) {
    rates <- aggr$x[aggr$Class %in% classes[i]]
    plot.xy(xy.coords(x=(1:length(rates))/length(rates),y=rates),
            col=classcolors[i],...)
}
}

