setwd("C:/lab/ESAME")
library(raster)  #permette l'utilizzo dei raster e funzioni annesse
library(RStoolbox) #permette l'uso della Unsupervised Classification
library(ggplot2)  #permette l'uso delle funzioni ggplot
library(gridExtra)   #permette l'uso e creazione di griglie, tabelle e grafici
library(rasterdiv)

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


BWG<-colorRampPalette(c("black","white","green"))(100)

MSH1979 <- unsuperClass(H1979, nClasses=3,stretch="lin")
MSH1980 <- unsuperClass(H1980, nClasses=3,stretch="lin")
MSH1982 <- unsuperClass(H1982, nClasses=3,stretch="lin") 
MSH1986 <- unsuperClass(H1986, nClasses=3,stretch="lin") 
MSH1990 <- unsuperClass(H1990, nClasses=3,stretch="lin")
MSH1993 <- unsuperClass(H1993, nClasses=3,stretch="lin")
MSH1998 <- unsuperClass(H1998, nClasses=3,stretch="lin")
MSH2002 <- unsuperClass(H2002, nClasses=3,stretch="lin")
MSH2006 <- unsuperClass(H2006, nClasses=3,stretch="lin")

par(mfrow=c(5,2))
plot(MSH1979$map, col=BWG)
plot(MSH1980$map, col=BWG)
plot(MSH1982$map, col=BWG)
plot(MSH1986$map, col=BWG)
plot(MSH1990$map, col=BWG)
plot(MSH1993$map, col=BWG)
plot(MSH1998$map, col=BWG)
plot(MSH2002$map, col=BWG)
plot(MSH2006$map, col=BWG)

plot(MSH1979$map)
freq(MSH1979$map)


BWG<-colorRampPalette(c("black","white","green"))(100)
GWB<-colorRampPalette(c("green","white","black"))(100)
par(mfrow=c(3,1), no.readonly = FALSE)

plot(MSH1979$map, col=BWG)
plot(MSH1982$map, col=BWG)
plot(MSH1986$map, col=BWG) 
plotRGB(H1982, r=2, g=2, b=1)


H1979<-reclassify(H1979, cbind(253:255, NA))
H1980<-reclassify(H1980, cbind(253:255, NA))
H1982<-reclassify(H1982, cbind(253:255, NA))
H1986<-reclassify(H1986, cbind(253:255, NA))

MSH1979 <- unsuperClass(H1979$MSH1979.2, nClasses=3,stretch="lin")










