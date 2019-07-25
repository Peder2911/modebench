
set.seed(1914)

library(microbenchmark)
library(Rcpp)
library(ggplot2)

sourceCpp('vanilla.cpp')
sourceCpp('modal.cpp')

values <- lapply(1:1000,function(x){sample(1:100,size = 100, replace = TRUE)})

mrk <- microbenchmark("vanilla"={lapply(values,.getMode,ties = 3)},
                      "mymode"={lapply(values,.staticGetMode)},
                      "fromr"={lapply(values,raster::modal,ties = 'random')},
                      "mean"={lapply(values,mean)},
                      "min"={lapply(values,min)})

ggsave('results.png',autoplot(mrk),device = 'png')
