#visualizing copernicus data
#ci serviranno la libreria Raster per leggere i raster e la libreria NCD per leggere i file ncd
install.packages("ncdf4")
library(raster)
library(ncdf4)
setwd("C:/lab/")

#caricamento di un nuovo file .nc su R
water<-raster("c_gls_WB100_202103010000_GLOBE_S2_V1.0.1.nc")
cl <- colorRampPalette(c('light blue','green','red','yellow'))(100) #
plot(water, col=cl)

#riclassificare i colori dell'immagine
water<- raster::reclassify(lswt, cbind(252:255, NA), right=TRUE) 

#resampling, modifica la quantità di pixel/risoluzione dell'immagine, aggregando pixel in pixel più grandi attraverso la loro media, riduce il peso del file. 
#Il 100 corrisponde al numero di celle raggruppate per formare delle celle più grandi. Con 50 si diminuisce di 2500 volte la risoluzione 
waterres<-aggregate(water, fact=100)
plot(waterres, col=cl)
