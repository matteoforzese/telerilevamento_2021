#using knitr to create a report
setwd("C:/lab/")
library(knitr)
stitch("R_code_greenland.r.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
#risolto errore aggiungendo .txt
