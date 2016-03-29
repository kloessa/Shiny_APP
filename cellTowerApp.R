# Include libraries
library(shiny)
library(maps)
library(leaflet)
library(geosphere)

#setwd("~/Dokumente/R/WebApp")

cellTowerApp <- function(){

## Read Database for all towers from csv    
#cellTowers <- read.csv("Data/cell_towers.csv", header = T)  

## Extract towers in Egypt (lon,lat,range)
#towersEgypt <- cellTowers[cellTowers$mcc==602,]
#towersEgypt <- towersEgypt[,c("lon","lat","range")]

## If range of tower == 0 set range to 10 km
#towersEgypt$range[towersEgypt$range == 0] <- 10000

## Write data in csv
#write.csv(towersEgypt,"Data/cell_towers_Egypt.csv")

## Extract towers in Iceland (lon,lat,range)
#towersIceland <- cellTowers[cellTowers$mcc==274,]
#towersIceland <- towersIceland[,c("lon","lat","range")]

## If range of tower == 0 set range to 10 km
#towersIceland$range[towersIceland$range == 0] <- 10000

## Write data in csv
#write.csv(towersIceland,"Data/cell_towers_Iceland.csv")  

# Include function nearTower  
source('nearTower.R') 

# Include function inCountry     
source('inCountry.R') 
  
# Run web App  
runApp()

return()
}


