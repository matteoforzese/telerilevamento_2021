setwd("C:/lab/")
library(raster)
library(RStoolbox) #per la classificazione
install.packages("ggplot2") #Per utilizzare le funzioni di ggplot
library(ggplot2)
library(ggplot2)
install.packages("gridExtra")
library(gridExtra)
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

#unsupervised classification, mostra indice vegetazionale, suddiviso in x classi
d1c <- unsuperClass(defor1, nClasses=2)
plot(d1c$map)
d2c <- unsuperClass(defor2, nClasses=2)
plot(d2c$map)
d2c3<-unsuperClass(defor2, nClasses=3)
plot(d2c3$map)

#frequenza delle due classi
freq(d1c$map)
 #  value  count
#[1,]     1  35314
#[2,]     2 305978
s1<-305978+35314

#proporzioni
prop1<-freq(d1c$map)/s1
#       count
#[1,] 0.1034715
#[2,] 0.8965285
#si può prendere il n.di pixel anche dalle informazioni
s2<-342726

freq(d2c$map)
#value count
#   value  count
#[1,]     1 177948
#[2,]     2 164778
prop2<-freq(d2c$map)/s2
#    count
#[1,]0.5192136
#[2,]0.4807864

#Creare dataframe su r
cover <- c("Agriculture","Forest")
percent_1992<- c(10.3,89.7)
percent_2006<- c(51.9,48.1)
percentages<-data.frame(cover, percent_1992, percent_2006)
percentages

#plot
p1<-ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
p2<-ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

#grafico
grid.arrange(p1, p2, nrow = 1)





