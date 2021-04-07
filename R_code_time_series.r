#Time series analisys
#Greenland increase of temperature
#Data and code from Emanuela Cosma

library(raster)
setwd("C:/lab/greenland")
#creare oggetto Rasterlayer
lst_2000<-raster("lst_2000.tif")
lst_2005<-raster("lst_2005.tif")
lst_2010<-raster("lst_2010.tif")
lst_2015<-raster("lst_2015.tif")
#immagine con i 4 elementi 2x2
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)
#lista di file 
list.files()
r.list<-list.files(pattern="lst")
r.list
#funzione che applica un'altra funzione a una lista di file 
import<-lapply(r.list, raster)
import
#riunire file in un unico blocco
TGr<-stack(import)
plot(TGr)
#sovrapposizione tre immagini associate ad R, G e B
plotRGB(TGr,1,2,3,stretch="Lin")
