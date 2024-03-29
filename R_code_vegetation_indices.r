library(raster)

#per indici di vegetazione
library(RStoolbox)

#pacchetto che calcola riflessione della luce per capire l'indice di vegetazione di una determinata foto (si può estrapolare il tipo di vegetazione, lo status della vegetazione, etc)
install.packages("rasterdiv")
library(rasterdiv) 

library(rasterVis)
setwd("C:/lab/")
defor1 <- brick("defor1.png")
defor2 <- brick("defor2.png")
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

#per calcolare il DVI, difference vegetation index. E' un indice di vegetazione, è dato dalla differenza tra la riflettanza nell’infrarosso vicino e quella nel rosso, sa cala la vegetazione è meno in salute
#Digito defor1 e defor 2 per vedere i nomi delle bande e poi sottrarli
defor1
dvi1<-defor1$defor1.1-defor1$defor1.2
plot(dvi1)
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi1, col=cl, main="DVI at time 1")

#stessa procedura per defor2
defor2
dvi2<-defor2$defor2.1-defor2$defor2.2
plot(dvi2, col=cl, main="DVI at time 2")
par(mfrow=c(1,2))
plot(dvi1, col=cl)
plot(dvi2, col=cl)

#differenza tra indici di vegetazione
difdvi <- dvi1 - dvi2
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cld)

# il DVI può essere normalizzato per ottenere l'NDVI
# i valori di riflettanza dipendono dai bit. In calcolo del DVI posso confrontare solo immagini con gli stessi bit. 
#NDVI assume valori che vanno da -1 a 1 e permette confronti anche tra immagini a bit differenti.
#ndvi 
#NDVI=(NIR-RED) / (NIR+RED)
ndvi1<- (defor1$defor1.1-defor1$defor1.2) / (defor1$defor1.1+defor1$defor1.2)
plot(ndvi1, col=cl)
ndvi2<- (defor2$defor2.1-defor2$defor2.2) / (defor2$defor2.1+defor2$defor2.2)
plot(ndvi2, col=cl)

#La funzione si potrebbe calcolare anche con RStoolbox::spectralIndices
vi1<-spectralIndices(defor1, green=3, red=2, nir=1)
plot(vi1, col=cl)
vi2<-spectralIndices(defor2, green=3, red=2, nir=1)
plot(vi2, col=cl)
difndvi<- ndvi1-ndvi2
plot(difndvi, col=cld)

#worldwide NDVI
plot(copNDVI)
#funzione per cambiare valori in altri valori
#i pixel coi valori 253, 254, 255 (acqua) saranno settati come "NA"
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)
#levelplot è media di valori per riga e colonna, utilizzo pacchetto rasterVis
levelplot(copNDVI)




