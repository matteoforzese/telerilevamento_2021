#using knitr to create a report

setwd("C:/lab/")

#Permette di usare le funzioni e codici knit R
install.packages("knitr")

library(knitr)

#creare automaticamente un report basato su uno script di R e un template
stitch("R_code_greenland.r.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
#risolto errore aggiungendo .txt
