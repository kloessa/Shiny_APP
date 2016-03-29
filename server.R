# Define server logic required to draw a map and text
shinyServer(function(input, output) {

# Get country name 
 countryInput <- reactive({input$country})

# Map output
 output$map <- renderLeaflet({

# Return the requested dataset
  mapCountry <- map("world", toString(countryInput()), exact = TRUE, plot = FALSE)
  
# Read data of celltower locations  
  data <- read.csv(paste0("Data/cell_towers_",toString(countryInput()),
                                    ".csv"),header = TRUE)    
    
# Draw map with clustered celltowers 
  map <- leaflet(data = mapCountry) %>%
         addTiles() %>%
         addMarkers(data$lon, data$lat,  clusterOptions = markerClusterOptions()) 
   })  

# Text output 
output$text <- renderText({
 
# Get input from button   
 if (input$go == 0)
    return()
  
# Only display text if button is pressed
 isolate({

# Check if logitude and latitude is in range      
   if (input$lon < -180 | input$lon > 180 | input$lat < -90 | input$lat > 90)
   {"Please enter longitude between -180 and 180 and
           latitude between -90 and 90"}  
   else{
# Read data of celltower locations  
    data <- read.csv(paste0("Data/cell_towers_",toString(countryInput()),
                           ".csv"),header = TRUE)   
   
# Check if choosen point is in range of a cell tower 
    inRange <- nearTower(data,input$lon,input$lat)   

# Check if choosen point is in country with margin of 50 km  
   insideCountry <- inCountry(toString(countryInput()),input$lon,input$lat)     

# Print text if point is in country and in range of cell tower    
    if  (insideCountry == TRUE & inRange == TRUE){
     paste0("The choosen point is in ",toString(countryInput())," and 
             is covered by the cellular network.")
  }
  
# Print text if point is in country and not in range of cell tower   
    else if (insideCountry == TRUE & inRange == FALSE){
     paste0("The choosen point is in ",toString(countryInput())," and 
             is not covered by the cellular network.")
  }
  
# Print text if point is in not country and in range of cell tower   
    else if (insideCountry == FALSE & inRange == TRUE){
     paste0("The choosen point is not in ",toString(countryInput())," and 
             is covered by the cellular network.")
  }
  
# Print text if point is in not country and not in range of cell tower   
    else{
      paste0("The choosen point is not in ",toString(countryInput())," and 
             not covered by the cellular network.")
    }
   }
  })
})
}) 
