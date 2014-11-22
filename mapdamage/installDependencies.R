#Installing deps for mapDamage 2.0
#This installs the dependencies in R as described by the authors here:
#http://ginolhac.github.io/mapDamage/ 

if(!require("inline")) {
    install.packages("optparse", repos = "http://cran.r-project.org")
}

if(!require("gam")) {
    source("http://bioconductor.org/biocLite.R")
    biocLite("NOISeq")
}

if(!require("Rcpp")) {
    install.packages("XML", repos = "http://cran.r-project.org")
}

if(!require("ggplot2")) {
    source("http://bioconductor.org/biocLite.R")
    biocLite("Repitools")
}
