library(raster)
library(RStoolbox)
setwd("C:/lab/")
sent <- brick("sentinel.png")
sent
#dato che si usa la sequenza di default non usiamo r=1, g=2 e b=3 
plotRGB(sent, stretch="lin") 
nir<-sent$sentinel.1
red<-sent$sentinel.2
ndvi<-(nir-red)/(nir+red)
plot(ndvi)
cl <- colorRampPalette(c('black','white','red','magenta','green'))(100) # 
plot(ndvi,col=cl)
#funzione focal per dati statistici, sd in questo caso è la deviazione standard
ndvisd3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=sd)
plot(ndvisd3)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) #
plot(ndvisd3, col=clsd)
ndvimean3<-focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=mean)
plot(ndvimean3, col=clsd)
ndvisd13 <- focal(ndvi, w=matrix(1/169, nrow=13, ncol=13), fun=sd)
plot(ndvisd13, col=clsd)
ndvisd5 <- focal(ndvi, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
plot(ndvisd5, col=clsd)
#esiste un altro metodo, la PCA
sentpca <- rasterPCA(sent)
plot(sentpca$map)
#per vedere da cosa è composta
sentpca
summary(sentpca$model)
#la prima componente spiega più delle altre 

