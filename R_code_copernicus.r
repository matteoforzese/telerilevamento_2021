#visualizing copernicus data
install.packages("ncdf4")
library(raster)
library(ncdf4)
setwd("C:/lab/")
water<-raster("c_gls_WB100_202103010000_GLOBE_S2_V1.0.1.nc")
cl <- colorRampPalette(c('light blue','green','red','yellow'))(100) #
plot(water, col=cl)
#resamplig
waterres<-aggregate(water, fact=100)
plot(waterres, col=cl)
