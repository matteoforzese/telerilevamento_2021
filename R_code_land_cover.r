setwd("C:/lab/")
library(raster)
library(RStoolbox) #per la classificazione
install.packages("ggplot2")
library(ggplot2)
defor1 <- brick("defor1.png") 
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
#aggiungere coordinate all'immagine
ggRGB(defor1, r=1, g=2, b=3, stretch="Lin")
defor2 <- brick("defor2.png")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
ggRGB(defor2, r=1, g=2, b=3, stretch="Lin")
par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
#il par non è sufficiente per ggRGB, quindi si utilizza un altro pacchetto
install.packages("gridExtra")
library(gridExtra)
#mettere insieme vari pezzi all'interno di un grafico
# multiframe con ggplot2 e gridExtra
p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
grid.arrange(p1, p2, nrow=2)
