setwd("C:/lab/")
library (raster)
library (RStoolbox)
p224r63_2011<-brick("p224r63_2011_masked.grd")
plot(p224r63_2011)
#Plot banda 1 su banda 2
plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)
#per trovare correlazione tra tutte le variabili a due a due
pairs(p224r63_2011)
