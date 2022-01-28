setwd("C:/lab/")
library(raster)
library(RStoolbox)

#importo immagine tramite funzione brick
sol <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
sol

#utilizzo plotRGB per visualizzare l'immagine, stretch per usare tutto il range di colori da 0 a 255
plotRGB(sol, 1,2,3, stretch="lin")
plotRGB(sol, 2,1,3, stretch="lin")
plotRGB(sol, 3,2,1, stretch="lin")
set.seed(42)

#UNSUPERVISED CLASSIFICATION: Tecnica che consiste nel fornire al sistema informatico una serie di input che egli riclassificherà ed organizzerà sulla base di caratteristiche comuni per cercare di effettuare ragionamenti e previsioni sugli input successivi, permette di classificare ad esempio quando una determinata patch del suolo risulta essere X (es. acqua) o Y (es. bosco)
soc <- unsuperClass(sol, nClasses=3)

#prova con 20 classi
snt <- unsuperClass(sol, nClasses=20)
plot(snt$map,col=cl)

cl <- colorRampPalette(c('yellow','red','black'))(100)
plot(soc$map,col=cl)

#download immagine da ESA, chiamata "Spiral_snapshot_pillars"
spiral<-brick("Spiral_snapshot_pillars.jpg")
spiralUC<-unsuperClass(spiral, nClasses=3)
plot(spiralUC$map,col=cl)



par(mfrow=c(1,2))
plotRGB(sol, 1,2,3, stretch="lin")
plot(soe$map,col=cl)
cl <- colorRampPalette(c('yellow','black','red'))(100)
par(mfrow=c(1,2))
plotRGB(sol, 1,2,3, stretch="lin")
plot(soc$map,col=cl)





#GRAN CANYON DATA
setwd("C:/lab/")
library(raster)
library(RStoolbox)
gc<-brick("dolansprings_oli_2013088_canyon_lrg.jpg")
plotRGB(gc, 1,2,3, stretch="lin")

#utilizzo stretch diverso 
plotRGB(gc, 1,2,3, stretch="hist")
gcc2 <- unsuperClass(gc, nClasses=2)
plot(gcc2$map)

#aumento numero classi
gcc4 <- unsuperClass(gc, nClasses=4)
plot(gcc4$map)
