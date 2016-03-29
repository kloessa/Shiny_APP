# Function calculate if given longitude and latitude is in range of a cell tower
nearTower <- function(data,lon,lat){

# Calculate distance to cell towers in km 
 dist <- acos(sin(as.numeric(lat)* pi / 180)  * sin(as.numeric(data$lat)* pi / 180) 
            + cos(as.numeric(lat)* pi / 180) * cos(as.numeric(data$lat)* pi / 180) *
              cos(as.numeric(data$lon)* pi / 180  - as.numeric(lon)* pi / 180)) * 6371

# Calculate if point is in range of a cell tower
 z <- F
 z <- max(as.numeric(data$range) - dist * 1000) > 0

 return(z)
}