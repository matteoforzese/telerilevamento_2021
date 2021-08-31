#Time series analisys
#Greenland increase of temperature
#Data and code from Emanuela Cosma

library(raster)

#installare pacchetto che ottimizza la visualizzazione dei dati raster
install.packages("rasterVis")

library(rasterVis)

#La working directory è impostata nella cartella greenland all'interno della cartella lab
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

#creare una lista di file 
r.list<-list.files(pattern="lst")
r.list

#funzione che applica un'altra funzione a una lista di file 
import<-lapply(r.list, raster)
import

#riunire file in un unico blocco
TGr<-stack(import)
TGr
plot(TGr)

#sovrapposizione tre immagini associate ad R, G e B
plotRGB(TGr,1,2,3,stretch="Lin")

#singola legenda per blocco intero che viene plottato tutto insieme, con Level plot vediamo colori molto più dettagliati rispetto a normale plot
levelplot(TGr)
cl<-colorRampPalette(c("blue","light blue","pink","red"))(100)
levelplot(TGr, col.regions=cl)
levelplot(TGr, col.regions=cl,names.attr=c("July 2000", "July 2005","July 2010","July 2015"))
levelplot(TGr, col.regions=cl, main="LST variation in time", names.attr=c("July 2000", "July 2005","July 2010","July 2015"))

#Melt, dati sullo scioglimento
#nuova lista
meltlist<-list.files(pattern="melt")
meltgreenland<-lapply(meltlist, raster)
melt<-stack(meltgreenland)
levelplot(melt)

#sottrazione tra due matrici di dati, colori mappa X - colori mappa Y
melt_amount<-melt$X2007annual_melt-melt$X1979annual_melt

clb<-colorRampPalette(c("white","blue","pink","red"))(100)
plot(melt_amount,col=clb)

install.packages("knitr")


