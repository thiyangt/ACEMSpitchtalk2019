## ---- pkg
## devtools::install_github("yihui/xaringan")
##devtools::install_github("libjohn/dukeslides")
library(xaringan)
library(dukeslides)


## saveGIF
library(animation)
library(tourr)
library(seer)
library(Mcomp)
data(M1)
yearly_m1 <- subset(M1, "yearly")
M1yearly_features <- seer::cal_features(yearly_m1, database="M1", h=6, highfreq = FALSE)
saveGIF(animate(M1yearly_features[, 1:25], grand_tour(d = 2), display = display_xy()))
if(Sys.getenv("RSTUDIO") == "1" & # check if running in RStudio
   .Platform$OS.type == "unix") quartz() else X11()
quartz.save(animate(M1yearly_features[, 1:25], grand_tour(d = 2), display = display_xy()), type = "gif")

