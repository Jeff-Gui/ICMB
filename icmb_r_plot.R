setwd('/Users/jefft/Desktop')
data <- read.table('p_scan.txt')
enzyme = list()
pyruvate = list()
i = 6
j = 1
while (i < 708){
  enzyme[j] <- data$V1[i]
  pyruvate[j] <- data$V2[i]
  j <- (j + 1)
  i <- (i + 7)
}
plot(enzyme, pyruvate)

data2 <- read.table('main scan_change aerobic.txt')
library(ggplot2)
s = 101
t = 1
rate_constant = list()
lactate_acid = list()
while (s < 5203){
  rate_constant[t] <- (data2$V1[s])
  lactate_acid[t] <- (data2$V2[s])
  t <- (t + 1)
  s <- (s + 102)
}
plot(rate_constant, lactate_acid, type='o')
lines(lowess(rate_constant, lactate_acid))
lines(lactate_acid,predict(loess(lactate_acid~rate_constant)))
