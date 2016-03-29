# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
# Application title
  headerPanel("Visualization of cell tower"),
  
# Sidebar with controls to select a country 
  sidebarPanel(
    helpText("Choose country for visualization"),
    
# Input of country name    
    selectInput("country", label = h4("Country:"), 
                choices = c("Egypt", "Iceland")),
    br(),
    helpText("Choose longitude and latitude to check if the point is inside the country 
           and if the point is covered by the cellular network "),     

# Input of lon and lat 
    numericInput("lon", label = h4("Longitude:"),value = 0,step = 0.1
                 ,min = -180,max = 180),
    numericInput("lat", label = h4("Latitude:"), value = 0,step = 0.1
                 , min = -90, max = 90),
    br(),
    actionButton("go", "Check")

  ),

# Main panel with map and text if choosen point is in country and in 
# range of a cell tower
  mainPanel(
    leafletOutput("map"),
    br(),
    h4(textOutput("text"))
    )
))