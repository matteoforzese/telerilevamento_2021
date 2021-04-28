setwd("C:/lab/")
library (raster)
library (RStoolbox)
p224r63_2011<-brick("p224r63_2011_masked.grd")
plot(p224r63_2011)
#Plot banda 1 su banda 2
plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)
#per trovare correlazione tra tutte le variabili a due a due
pairs(p224r63_2011)
#a causa di pesantezza di pca diminuiamo la grandezza del file abbassandone la risoluzione
#aggregate cells: resampling (ricampionamento)
p224r63_2011res<-aggregate(p224r63_2011, fact=10)
par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="lin")
#principal component analysis: passiamo asse lungo...?
p224r63_2011res_pca <- rasterPCA(p224r63_2011res)
summary(p224r63_2011res_pca$model)
dev.off()
plotRGB(p224r63_2011res_pca$map, r=1,g=2,b=3,stretch="lin")
#add from students
str(p224r63_2011res_pca)
