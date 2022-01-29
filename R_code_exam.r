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
WGB<-colorRampPalette(c("white","green","black"))(100)
GBW<-colorRampPalette(c("green","black","white"))(100)
GWB<-colorRampPalette(c("green","white","black"))(100)
BGW<-colorRampPalette(c("black","green","white"))(100)
WBG<-colorRampPalette(c("white","black","green"))(100)

MSH1979<- unsuperClass(H1979$STHE79.2, nClasses=3,stretch="hist")
MSH1980<- unsuperClass(H1980$STHE80.2, nClasses=3,stretch="hist")
MSH1982<- unsuperClass(H1982$STHE82.2, nClasses=3,stretch="hist")
MSH1986<- unsuperClass(H1986$STHE86.1, nClasses=3,stretch="hist")
MSH1990<- unsuperClass(H1990$STHE90.1, nClasses=3,stretch="hist")
MSH1993<- unsuperClass(H1993$STHE93.1, nClasses=3,stretch="hist")
MSH1998<- unsuperClass(H1998$STHE98.1, nClasses=3,stretch="hist")
MSH2002<- unsuperClass(H2002$STHE02.1, nClasses=3,stretch="hist")
MSH2006<- unsuperClass(H2006$STHE06.1, nClasses=3,stretch="hist")
MSH2010<- unsuperClass(H2010$STHE10.1, nClasses=3,stretch="hist")
MSH2015<- unsuperClass(H2015$STHE15.1, nClasses=3,stretch="hist")

plot(MSH1979$map, col=BWG)
freq(MSH1979$map) #Altro 95306 Vulcanica 21912 Alberi 228382
plot(MSH1980$map, col=BWG)
freq(MSH1980$map) #Altro 112500 Vulcanica 96058 Alberi 137042
plot(MSH1982$map, col=BWG)
freq(MSH1982$map) #Altro 108518 Vulcanica 82530 Alberi 154552
plot(MSH1986$map, col=BWG)
freq(MSH1986$map) #Altro 112503 Vulcanica 102022 Alberi 131075
plot(MSH1990$map, col=BWG)
freq(MSH1990$map) #Altro 101195 Vulcanica 104194 Alberi 140211 
plot(MSH1993$map, col=BWG)
freq(MSH1993$map) #Altro 101674 Vulcanica 92231 Alberi 151695
plot(MSH1998$map, col=BWG)
freq(MSH1998$map) #Altro 95659 Vulcanica 92701 Alberi 157240
plot(MSH2002$map, col=BWG)
freq(MSH2002$map) #Altro 82039 Vulcanica 76983 Alberi 186578
plot(MSH2006$map, col=BWG)
freq(MSH2006$map) #Altro 74597 Vulcanica 71047 Alberi 199956
plot(MSH2010$map, col=BWG)
freq(MSH2010$map) #Altro 73229 Vulcanica 64062 Alberi 208309
plot(MSH2015$map, col=BWG)
freq(MSH2015$map) #Altro 57983 Vulcanica 54346 Alberi 233271
AreaTot<-345600

P79<-freq(MSH1979$map)/AreaTot #Altro 0,28 Vulcanica 0,06 Alberi 0,66
P80<-freq(MSH1980$map)/AreaTot #Altro 0,32 Vulcanica 0,28 Alberi 0,40
P82<-freq(MSH1982$map)/AreaTot #Altro 0,31 Vulcanica 0,24 Alberi 0,45
P86<-freq(MSH1986$map)/AreaTot #Altro 0,33 Vulcanica 0,29 Alberi 0,38
P90<-freq(MSH1990$map)/AreaTot #Altro 0,29 Vulcanica 0,30 Alberi 0,41
P93<-freq(MSH1993$map)/AreaTot #Altro 0,29 Vulcanica 0,27 Alberi 0,44
P98<-freq(MSH1998$map)/AreaTot #Altro 0,28 Vulcanica 0,27 Alberi 0,45
P02<-freq(MSH2002$map)/AreaTot #Altro 0,24 Vulcanica 0,22 Alberi 0,54
P06<-freq(MSH2006$map)/AreaTot #Altro 0,22 Vulcanica 0,20 Alberi 0,58
P10<-freq(MSH2010$map)/AreaTot #Altro 0,21 Vulcanica 0,19 Alberi 0,60
P15<-freq(MSH2015$map)/AreaTot #Altro 0,17 Vulcanica 0,16 Alberi 0,67

ALTRO=c(0.28, 0.32, 0.31, 0.33, 0.29, 0.29, 0.28, 0.24, 0.22, 0.21, 0.17) 
VULCANICA=c(0.06, 0.28, 0.24, 0.29, 0.30, 0.27, 0.27, 0.22, 0.20, 0.19, 0.16)
ALBERI=c(0.66, 0.40, 0.45, 0.38, 0.41, 0.44, 0.45, 0.54, 0.58, 0.60, 0.67)
ANNO=c(1979, 1980, 1982, 1986, 1990, 1993, 1998, 2002, 2006, 2010, 2015) 
SAINTHELEN= data.frame (ANNO, ALTRO, VULCANICA, ALBERI)

ggplot(SAINTHELEN, aes(x=ANNO)) + 
geom_line(aes(y=ALBERI), color="Green",show.legend=TRUE,na.rm=TRUE) +
geom_line(aes(y=ALTRO), color="Grey", show.legend=TRUE,na.rm=TRUE) +
geom_line(aes(y=VULCANICA), color="Black", show.legend=TRUE, na.rm=TRUE)

bpa<- ggplot(SAINTHELEN, aes(x=ANNO, y=ALBERI, fill=ALBERI)) +
geom_bar(width = 1, stat = "identity") 
bpa
bpv<- ggplot(SAINTHELEN, aes(x=ANNO, y=VULCANICA, fill=VULCANICA)) +
geom_bar(width = 1, stat = "identity") 
bpv
bpo<-ggplot(SAINTHELEN, aes(x=ANNO, y=ALTRO, fill=ALTRO)) +
geom_bar(width = 1, stat = "identity")
bpo

ggplot(SAINTHELEN, aes(x = ANNO)) +  
  geom_bar((y = ALBERI/sum(100)))


















MSH1979 <- unsuperClass(H1979$STHE79.2, nClasses=3,stretch="lin")
MSH1980 <- unsuperClass(H1980$STHE80.2, nClasses=3,stretch="lin")
MSH1982 <- unsuperClass(H1982$STHE82.2, nClasses=3,stretch="lin")
MSH1986 <- unsuperClass(H1986$STHE86.1, nClasses=3,stretch="lin")
MSH1990 <- unsuperClass(H1990$STHE90.1, nClasses=3,stretch="lin")
MSH1993 <- unsuperClass(H1993$STHE93.1, nClasses=3,stretch="lin")
MSH1998 <- unsuperClass(H1998$STHE98.1, nClasses=3,stretch="lin")
MSH2002 <- unsuperClass(H2002$STHE02.1, nClasses=3,stretch="lin")
MSH2006 <- unsuperClass(H2006$STHE06.1, nClasses=3,stretch="lin")
MSH2010 <- unsuperClass(H2010$STHE10.1, nClasses=3,stretch="lin")
MSH2015 <- unsuperClass(H2015$STHE15.1, nClasses=3,stretch="lin")
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

par(mfrow=c(3,4), no.readonly = FALSE)
MSH1979 <- unsuperClass(H1979$STHE79.2, nClasses=2,stretch="lin")
plot(MSH1979$map, col=BWG)
MSH1980 <- unsuperClass(H1980$STHE80.2, nClasses=2,stretch="lin")
plot(MSH1980$map, col=BWG)
MSH1982 <- unsuperClass(H1982$STHE82.2, nClasses=2,stretch="lin")
plot(MSH1982$map, col=BWG)
MSH1986 <- unsuperClass(H1986$STHE86.1, nClasses=2,stretch="lin")
plot(MSH1986$map, col=BWG)
MSH1990 <- unsuperClass(H1990$STHE90.1, nClasses=2,stretch="lin")
plot(MSH1990$map, col=BWG)
MSH1993 <- unsuperClass(H1993$STHE93.1, nClasses=2,stretch="lin")
plot(MSH1993$map, col=BWG)
MSH1998 <- unsuperClass(H1998$STHE98.1, nClasses=2,stretch="lin")
plot(MSH1998$map, col=BWG)
MSH2002 <- unsuperClass(H2002$STHE02.1, nClasses=2,stretch="lin")
plot(MSH2002$map, col=BWG)
MSH2006 <- unsuperClass(H2006$STHE06.1, nClasses=2,stretch="lin")
plot(MSH2006$map, col=BWG)
MSH2010 <- unsuperClass(H2010$STHE10.1, nClasses=2,stretch="lin")
plot(MSH2010$map, col=BWG)
MSH2015 <- unsuperClass(H2015$STHE15.1, nClasses=2,stretch="lin")
plot(MSH2015$map, col=BWG)


MSH1979 <- unsuperClass(H1979$STHE79.3, nClasses=2,stretch="lin")
MSH1980 <- unsuperClass(H1980$STHE80.3, nClasses=2,stretch="lin")
MSH1982 <- unsuperClass(H1982$STHE82.3, nClasses=2,stretch="lin")
AMSH1979 <- unsuperClass(H1979$STHE79.3, nClasses=2,stretch="lin")
AMSH1980 <- unsuperClass(H1980$STHE80.3, nClasses=2,stretch="lin")
AMSH1982 <- unsuperClass(H1982$STHE82.3, nClasses=2,stretch="lin")
plot(MSH1979$map)
plot(MSH1980$map)
plot(MSH1982$map)
plot(AMSH1979$map)
plot(AMSH1980$map)
plot(AMSH1982$map)

par(mfrow=c(2,3))
plot(H1980$STHE80.1)
plot(H1980$STHE80.2)
plot(H1980$STHE80.3)
plot(H1986$STHE86.1)
plot(H1986$STHE86.2)
plot(H1986$STHE86.3)

par(mfrow=c(3,2))
plot(H1979$STHE79.2)
plot(MSH1979$map)
plot(H1980$STHE80.2)
plot(MSH1980$map)
plot(H1986$STHE86.1)
plot(MSH1986$map)
