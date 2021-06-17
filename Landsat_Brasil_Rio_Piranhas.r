library(rgdal)
library(raster)
path <- "/Users/polinalemenkova/Documents/R/52_SCRIPT_Landsat"
setwd(path)
ls.B1 <- readGDAL("LC08_L1TP_215064_20210522_20210529_02_T1_B1.TIF")
ls.B2 <- readGDAL("LC08_L1TP_215064_20210522_20210529_02_T1_B2.TIF")
ls.B3 <- readGDAL("LC08_L1TP_215064_20210522_20210529_02_T1_B3.TIF")
ls.B4 <- readGDAL("LC08_L1TP_215064_20210522_20210529_02_T1_B4.TIF")
ls.B5 <- readGDAL("LC08_L1TP_215064_20210522_20210529_02_T1_B5.TIF")
ls.B6 <- readGDAL("LC08_L1TP_215064_20210522_20210529_02_T1_B6.TIF")
ls.B7 <- readGDAL("LC08_L1TP_215064_20210522_20210529_02_T1_B7.TIF")
class(ls.B5)
## [1] "SpatialGridDataFrame"
## attr(,"package")
## [1] "sp"
slotNames(ls.B5)
## [1] "data"        "grid"        "bbox"        "proj4string"
summary(ls.B5@data)
str(ls.B5@grid)
# Formal class 'GridTopology' [package "sp"] with 3 slots
#..@ cellcentre.offset: Named num [1:2] 665100 -756900
#.. ..- attr(*, "names")= chr [1:2] "x" "y"
#..@ cellsize         : num [1:2] 30 30
#..@ cells.dim        : int [1:2] 7631 7771
ls.B5@grid@cellcentre.offset
#x       y
#665100 -756900
ls.B5@grid@cellsize
# [1] 7631 7771
ls.B5@bbox
#       min     max
# x  665085  894015
# y -756915 -523785
ls.B5@proj4string
# CRS arguments:
# +proj=utm +zone=24 +datum=WGS84 +units=m +no_defs

#Visualizing Satellite Imagery

ls.B5.1 <- raster(ls.B5)
plot(ls.B5.1, main="Near Infrared Band of the Landsat Image")

ls.B5.2 <- raster(ls.B2)
plot(ls.B5.2, main="Band 2 of the Landsat Image")

ls.B5hist <- hist(ls.B5@data$band1,
breaks =4,
main = "Frequecy Distribution of pixels in\n Near-Infrared Band (NIR)",
col = "wheat3",
xlab = "Reflectance in NIR (DN values)")

ls.B5hist$breaks
# [1]     0 10000 20000 30000 40000 50000 60000
ls.B5hist$counts
# [1]  6163368 28910857  5876111   585117    33334      111

plot(ls.B5.1,
     breaks = c(0,10000, 15000,30000,50000),
     col = terrain.colors(4),
     main="Reflectance in NIR (DN values)")

Band1 <- readGDAL("LC08_L1TP_215064_20210522_20210529_02_T1_B1.TIF")

Band1 <- raster("LC08_L1TP_215064_20210522_20210529_02_T1_B1.TIF")
Band2 <- raster("LC08_L1TP_215064_20210522_20210529_02_T1_B2.TIF")
Band3 <- raster("LC08_L1TP_215064_20210522_20210529_02_T1_B3.TIF")
Band4 <- raster("LC08_L1TP_215064_20210522_20210529_02_T1_B4.TIF")
Band5 <- raster("LC08_L1TP_215064_20210522_20210529_02_T1_B5.TIF")
Band6 <- raster("LC08_L1TP_215064_20210522_20210529_02_T1_B6.TIF")
Band7 <- raster("LC08_L1TP_215064_20210522_20210529_02_T1_B7.TIF")
plot(Band1)
res(Band1)

image <- stack(Band1, Band2, Band3, Band4, Band5, Band6, Band7)
plot(image)
nlayers(image)
# 7
# CRS arguments: +proj=utm +zone=24 +datum=WGS84 +units=m +no_defs
res(image)

# True Color Composite
par(col.axis="white",col.lab="white",tck=0)
plotRGB(image, r = 4, g = 3, b = 2, axes = TRUE,
        stretch = "lin", main = "True Color Composite")
box(col="white")

# False Color Composite
par(col.axis="white",col.lab="white",tck=0)
plotRGB(image, r = 5, g = 4, b = 3, axes = TRUE, stretch = "lin", main = "False Color Composite")
box(col="white")
