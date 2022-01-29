#calcolo eterogeneità tramite dati Sentinel
library(raster)
library(RStoolbox)
library(ggplot2) #for ggplot plotting
library(gridExtra) #for plotting ggplots togheter
install.packages("viridis") #pacchetto con scale di colore predefinite
library (viridis)
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
#la prima componente spiega più delle altre perchè l'asse viene passato dentro il ... più ampio


#guardiamo le componenti di sentpca, la prima si chiama PC1
pc1<-sentpca$map$PC1
focalpc1_sd5<-focal(pc1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
plot(focalpc1, col=clsd)

#funzione source carica direttamente un file da una cartella del pc
source("source_test_lezione.r")
source("source_ggplot.r")

#aprire una nuova finestra con ggplot
ggplot()+
#determina "geometria" del raster
geom_raster(focalpc1_sd5, mapping=aes(x=x, y=y, fill=layer))
#creare colorramppalette predefinita direttamente tramite viridis
p1<-ggplot() +
geom_raster(focalpc1_sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis()
#utilizzo colorramppalette "magma"
p2<-ggplot() +
geom_raster(focalpc1_sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option = "magma")  +
ggtitle("Standard deviation of PC1 by magma colour scale")
#utilizzo colorramppalette "inferno"
p3<-ggplot() +
geom_raster(focalpc1_sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option = "inferno")  +
ggtitle("Standard deviation of PC1 by inferno colour scale")
#utilizzare un grid arrange diverso 
#in verticale
grid.arrange(p1,p2,p3, nrow=3)
#in orizzontale
grid.arrange(p1,p2,p3, nrow=1)



