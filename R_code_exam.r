setwd("C:/lab/ESAME")
library(raster)  #permette l'utilizzo dei raster e funzioni annesse
library(RStoolbox) #permette l'uso della Unsupervised Classification
library(ggplot2)  #permette l'uso delle funzioni ggplot
library(gridExtra)   #permette l'uso e creazione di griglie, tabelle e grafici

H1979<-brick("STHE79.jpg")
H1980<-brick("STHE80.jpg")
H1982<-brick("STHE82.jpg") 
H1986<-brick("STHE86.jpg")
H1990<-brick("STHE90.jpg")
H1993<-brick("STHE93.jpg")
H1998<-brick("STHE98.jpg")
H2002<-brick("STHE02.jpg")
H2006<-brick("STHE06.jpg")
H2010<-brick("STHE10.jpg")
H2015<-brick("STHE15.jpg")

H1979<-reclassify(H1979, cbind(253:255, NA))
H1980<-reclassify(H1980, cbind(253:255, NA))
H1982<-reclassify(H1982, cbind(253:255, NA))
H1986<-reclassify(H1986, cbind(253:255, NA))


plotRGB(H1986, r=1, g=2, b=3)
par(mfrow=c(2,1), no.readonly = FALSE)
plot(H1980$map)
plotRGB(IH1986$map)

MSH1979 <- unsuperClass(H1979, nClasses=3)
MSH1980 <- unsuperClass(H1980, nClasses=3)
MSH1982 <- unsuperClass(H1982, nClasses=3) 
MSH1986 <- unsuperClass(H1986, nClasses=3) 

par(mfrow=c(4,1), no.readonly = FALSE)
plot(MSH1979$map)
plot(MSH1980$map)
plot(MSH1982$map)
plot(MSH1986$map)





BWG<-colorRampPalette(c("black","white","green"))(100)
GWBcolorRampPalette(c("green","white","black"))(100)
par(mfrow=c(3,1), no.readonly = FALSE)

plot(MSH1979$map, col=BWG)
plot(MSH1982$map, col=BWG)
plot(MSH1986$map, col=BWG) 
plotRGB(H1982, r=2, g=2, b=1)















