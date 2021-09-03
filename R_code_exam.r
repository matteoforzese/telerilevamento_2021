setwd("C:/lab/ESAME")
library(raster)  #permette l'utilizzo dei raster e funzioni annesse
library(RStoolbox) #permette l'uso della Unsupervised Classification
library(ggplot2)  #permette l'uso delle funzioni ggplot
library(gridExtra)   #permette l'uso e creazione di griglie, tabelle e grafici

H1982<-brick("STHE82.jpg")
H1986<-brick("STHE86.jpg")
H1990<-brick("STHE90.jpg")
H1993<-brick("STHE93.jpg")
H1998<-brick("STHE98.jpg")
H2002<-brick("STHE02.jpg")
H2006<-brick("STHE06.jpg")
H2010<-brick("STHE10.jpg")
H2015<-brick("STHE15.jpg")

MSH1982 <- unsuperClass(H1982, nClasses=3) 
MSH1986 <- unsuperClass(H1986, nClasses=3) 

par(mfrow=c(2,1), no.readonly = FALSE)
plot(MSH1982$map)
plot(MSH1986$map)














