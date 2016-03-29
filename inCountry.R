# Function calculate if longitude and latitude is in given country with margin of 50 km
inCountry <- function(country,lon,lat){
  
# Get Border of choosen country
 countryBorder <- map("world",country, plot = FALSE)

# Combine longitude and latitude in matrix
 countryBorder <- cbind(countryBorder$x,countryBorder$y)

# Delete entries with NA
 countryBorder <- na.omit(countryBorder)

# Calculate distance to border  
 dist <- dist2Line(c(lon,lat), countryBorder[,1:2], distfun=distHaversine)

 z <- F

# Calculate if point is in country
  if (toString (map.where("world",lon,lat)) == toString(country)){
    z <- TRUE
  }
# Calculate if point is the range of 50 km to the border
  else if (dist[1,1] <= 50000){
    z <- TRUE
  }
 return(z)
}

