setwd("C:/lab/ESAME")
library(raster)  #permette l'utilizzo dei raster e funzioni annesse
library(RStoolbox) #permette l'uso della Unsupervised Classification
library(ggplot2)  #permette l'uso delle funzioni ggplot
library(gridExtra)  #permette l'uso e creazione di griglie, tabelle e grafici

#Importo le immagini tramite la funzione "brick()" 
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

#Plotto tramite la funzione "plotRGB" le immagini con colori naturali, in questo caso con la banda del rosso è la prima, quella del verde la seconda e quella del blu la terza
#Le prime tre immagini non hanno la banda del blu perchè sono state raccolte dal satellite Landsat3 che ne è privo
#Uso stretch "hist" per acuire il contrasto di colore
par(mfrow=c(3,4))
plotRGB(H1979, r=2, g=3, stretch="hist")
plotRGB(H1980, r=2, g=3, stretch="hist")
plotRGB(H1982, r=2, g=3, stretch="hist")
plotRGB(H1986, r=1, g=2, b=3, stretch="hist")
plotRGB(H1990, r=1, g=2, b=3, stretch="hist")
plotRGB(H1993, r=1, g=2, b=3, stretch="hist")
plotRGB(H1998, r=1, g=2, b=3, stretch="hist")
plotRGB(H2002, r=1, g=2, b=3, stretch="hist")
plotRGB(H2006, r=1, g=2, b=3, stretch="hist")
plotRGB(H2010, r=1, g=2, b=3, stretch="hist")
plotRGB(H2015, r=1, g=2, b=3, stretch="hist")
dev.off()

#Classifico le aree in 3 differenti classi tramite la funzione "unsuperClass()"
#Utilizzo la banda del rosso che sembra garantire il miglior contrasto tra le varie zone
MSH1979<- unsuperClass(H1979$STHE79.2, nClasses=3)
MSH1980<- unsuperClass(H1980$STHE80.2, nClasses=3)
MSH1982<- unsuperClass(H1982$STHE82.2, nClasses=3)
MSH1986<- unsuperClass(H1986$STHE86.1, nClasses=3)
MSH1990<- unsuperClass(H1990$STHE90.1, nClasses=3)
MSH1993<- unsuperClass(H1993$STHE93.1, nClasses=3)
MSH1998<- unsuperClass(H1998$STHE98.1, nClasses=3)
MSH2002<- unsuperClass(H2002$STHE02.1, nClasses=3)
MSH2006<- unsuperClass(H2006$STHE06.1, nClasses=3)
MSH2010<- unsuperClass(H2010$STHE10.1, nClasses=3)
MSH2015<- unsuperClass(H2015$STHE15.1, nClasses=3)

#Creo tramite la funzione "colorRampPalette()" un set di colori che rappresenti con il verde le aree alberate, con il nero la roccia vulcanica e in bianco le aree agricole e a bassa vegetazione
BWG<-colorRampPalette(c("black","white","green"))(100)

#calcolo le frequenze tramite la funzione "freq()"
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

#Calcolo area totale con somma delle frequenze di pixel delle aree sviluppate tramite unsuperClass
AreaTot<-345600

#Calcolo delle percentuali di area occupate dalle 3 classi, tramite la formula Frequenza/Area totale
P79<-freq(MSH1979$map)/AreaTot 
#Altro 0,28 Vulcanica 0,06 Alberi 0,66
P80<-freq(MSH1980$map)/AreaTot 
#Altro 0,32 Vulcanica 0,28 Alberi 0,40
P82<-freq(MSH1982$map)/AreaTot 
#Altro 0,31 Vulcanica 0,24 Alberi 0,45
P86<-freq(MSH1986$map)/AreaTot 
#Altro 0,33 Vulcanica 0,29 Alberi 0,38
P90<-freq(MSH1990$map)/AreaTot 
#Altro 0,29 Vulcanica 0,30 Alberi 0,41
P93<-freq(MSH1993$map)/AreaTot 
#Altro 0,29 Vulcanica 0,27 Alberi 0,44
P98<-freq(MSH1998$map)/AreaTot 
#Altro 0,28 Vulcanica 0,27 Alberi 0,45
P02<-freq(MSH2002$map)/AreaTot 
#Altro 0,24 Vulcanica 0,22 Alberi 0,54
P06<-freq(MSH2006$map)/AreaTot 
#Altro 0,22 Vulcanica 0,20 Alberi 0,58
P10<-freq(MSH2010$map)/AreaTot 
#Altro 0,21 Vulcanica 0,19 Alberi 0,60
P15<-freq(MSH2015$map)/AreaTot 
#Altro 0,17 Vulcanica 0,16 Alberi 0,67

#creo una lista di valori per ogni classe, una lista degli anni in cui sono state scattate queste immagini e un data frame comprendente tutte e quattro le liste
ALTRO=c(0.28, 0.32, 0.31, 0.33, 0.29, 0.29, 0.28, 0.24, 0.22, 0.21, 0.17) 
VULCANICA=c(0.06, 0.28, 0.24, 0.29, 0.30, 0.27, 0.27, 0.22, 0.20, 0.19, 0.16)
ALBERI=c(0.66, 0.40, 0.45, 0.38, 0.41, 0.44, 0.45, 0.54, 0.58, 0.60, 0.67)
ANNO=c(1979, 1980, 1982, 1986, 1990, 1993, 1998, 2002, 2006, 2010, 2015) 
SAINTHELEN= data.frame (ANNO, ALTRO, VULCANICA, ALBERI)

#Creo un grafico lineare tramite la funzione "geom_line()"
graph<-ggplot(SAINTHELEN, aes(x=ANNO)) +
geom_line(aes(y=ALBERI, color="ALBERI"), size=5) +
geom_line(aes(y=ALTRO, color="BASSA VEGETAZIONE"), size=5) +
geom_line(aes(y=VULCANICA, color="ROCCIA VULCANICA"), size=5) + theme_bw(base_size=25) + 
ggtitle("Variazione vegetazione nel tempo") + xlab("ANNO") + ylab("ALBERI, ROCCIA VULCANICA, ALTRO") +
scale_color_manual(name = "LEGENDA", values = c("ALBERI" = "green", "ROCCIA VULCANICA" = "black", "BASSA VEGETAZIONE" = "grey"))
graph

#Creo tre grafici a barre tramite la funzione "geom_bar()"
bpa<- ggplot(SAINTHELEN, aes(x=ANNO, y=ALBERI, fill=ALBERI)) +
geom_bar(width = 1, stat = "identity") +
theme_bw(base_size=25) +
ggtitle("Variazione copertura arborea nel corso del tempo") +
xlab("ANNO") + ylab("ALBERI")
bpa

bpv<- ggplot(SAINTHELEN, aes(x=ANNO, y=VULCANICA, fill=VULCANICA)) +
geom_bar(width = 1, stat = "identity") + 
theme_bw(base_size=25) +
ggtitle("Variazione roccia vulcanica nel corso del tempo") +
xlab("ANNO") + ylab("ROCCIA VULCANICA")
bpv

bpo<-ggplot(SAINTHELEN, aes(x=ANNO, y=ALTRO, fill= ALTRO)) +
geom_bar(width = 1, stat = "identity") + 
theme_bw(base_size=25) +
ggtitle("Variazione bassa vegetazione nel corso del tempo") +
xlab("ANNO") + ylab("BASSA VEGETAZIONE")
bpo

grid.arrange(bpa, bpv, nrow=2)
