setwd("~/lab")
library(raster)
library(RStoolbox)
#importo immagine tramite funzione brick
sol <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
sol
#utilizzo plotRGB per visualizzare l'immagine, stretch per usare tutto il range di colori da 0 a 255
plotRGB(sol, 1,2,3, stretch="lin")
plotRGB(sol, 2,1,3, stretch="lin")
cplotRGB(sol, 3,2,1, stretch="lin")
set.seed(42)
soc <- unsuperClass(sol, nClasses=3)

#prova con 20 classi
snt <- unsuperClass(sol, nClasses=20)
plot(snt$map,col=cl)

cl <- colorRampPalette(c('yellow','red','black'))(100)
plot(soc$map,col=cl)
#download image from ESA, called "Spiral_snapshot_pillars"
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
