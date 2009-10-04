spattern = "(\\w+\\d+)\\_.*"
mpattern = "[\\w,\\d]+\\_\\D*(\\d+)" #sc100_20 or sp100_motif10

hclust.colors <- function(
		color_by_set=T,
		setlabels=NULL,k) {
	
	#print(color_by_set)
	#print(is.null(setlabels))
	
	if (color_by_set && (!is.null(setlabels))) {
      colors = rainbow(length(levels(setlabels)))
      mcolors = as.character(factor(setlabels,labels=colors))
    } else {
	  mcolors = sample(k)
    }

  return(mcolors)
}

hclust.mplot <- function(
		distobj, 
		k, 
		color_by_set=T, 
		set_pattern=spattern, 
		m_pattern=mpattern) {
	
	clusters = hclust(distobj)
	setlabels = hclust.setlabels(clusters, set_pattern)
	clusters$labels = gsub(m_pattern,"\\1",clusters$labels,perl=T)
	mcolors = hclust.colors(color_by_set, setlabels,k)

	A2Rplot(clusters,
			k=k,
			fact.sup=setlabels,
			boxes=F,
			col.up='gray',
			col.down=mcolors
			)
}

hclust.dplot <- function(
		distobj, 
		k, 
		color_by_set=T, 
		set_pattern=spattern, 
		m_pattern=mpattern,...) {
	
	clusters = hclust(distobj)
	setlabels = hclust.setlabels(clusters, set_pattern)
	uniqcols = rainbow(length(levels(setlabels)))
	numlevs = length(levels(setlabels))
	uniqcols = hsv(1:numlevs/numlevs,s=0.7,v=1.0)
	mcolors = as.character(factor(setlabels,labels=uniqcols))
	darkuniqcols = hsv(1:numlevs/numlevs,s=0.7,v=0.7)
	mdarkcolors = as.character(factor(setlabels,labels=darkuniqcols))
	setlabelcolor = data.frame(
		set=setlabels, 
		motif=clusters$labels, 
		color=mcolors,mdarkcolors)
	
	clusters = as.dendrogram(clusters)
	
	col.labels <<- function(dend) {
	    if (is.leaf(dend)) {
			myattr <- attributes(dend)
			colour <- as.character(
				setlabelcolor$color[ setlabelcolor$motif == myattr$label ])
			darkcolours <- as.character(
				setlabelcolor$darkcolor[ setlabelcolor$motif == myattr$label ])
			#print(as.character(setlabelcolor$color[ setlabelcolor$motif == myattr$label ]))
			attr(dend, "edgePar") <- c(
									attr$edgePar, 
									list(col=colour))
			attr(dend, "nodePar") <- c(
									attr$nodePar, 
									list(lab.col=colour)
								)			
    	}
		dend
	}
	
	
	#clusters$labels = gsub(m_pattern,"\\1",clusters$labels,perl=T)
	
	dL <- dendrapply(clusters, col.labels)
	#browser()
	extremes = par("usr")
	op = par(cex = 0.25,cex.axis=3.5)
	plot(dL,...)
	par(op)
	legend("topright", legend=as.character(levels(setlabels)), fill=uniqcols)
	
}

hclust.mset <- function(distobj,k,set_pattern=spattern,m_pattern=mpattern) {
  clusters = hclust(distobj)
  return(clusters)
}

hclust.setlabels <- function(clusters,set_pattern=spattern) {
	factor(gsub(set_pattern,"\\1",clusters$labels,perl=T))
}
