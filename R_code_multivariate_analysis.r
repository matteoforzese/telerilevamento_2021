#Si possono vedere file/immagini con diversa varianza/variabilità utilizzando delle funzioni. Queste prendono il nome di ANALISI MULTIVARIATE
setwd("C:/lab/")
library (raster)
library (RStoolbox)
p224r63_2011<-brick("p224r63_2011_masked.grd")
plot(p224r63_2011)
#Plot banda 1 su banda 2, otterremo un piano cartesiano XY con una scia di punti che studiano la varianza dei colori
plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)

#per trovare correlazione tra tutte le variabili a due a due
pairs(p224r63_2011)

#a causa di pesantezza della pca diminuiamo la grandezza del file abbassandone la risoluzione 
#aggregate cells: resampling (ricampionamento)
p224r63_2011res<-aggregate(p224r63_2011, fact=10)

par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="lin")

#principal component analysis
#funzione rasterPCA permette di identificare la PCA passando da una variabilità maggiore ad una minore, che sia però rappresentativa. 
p224r63_2011res_pca <- rasterPCA(p224r63_2011res)

#spiega quasi la totalità della varianza in questo modello (è praticamente un riassunto)
summary(p224r63_2011res_pca$model)

dev.off()
plotRGB(p224r63_2011res_pca$map, r=1,g=2,b=3,stretch="lin")

#add from students: visualizzare in modo compatto la struttura di un oggetto R 
str(p224r63_2011res_pca)
