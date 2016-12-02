shinyUI(fluidPage(
    titlePanel(""),
    
    sidebarLayout(
        
        sidebarPanel(
            radioButtons("data",
                         label="Show:",
                         choices = list("Birth Rate by Age" = "nat_by_age",
                                        "Birth Rate by Race" = "br_by_race",
                                        "Live Births by Race" = "lb_by_race",
                                        "Fertility Rate by Race" = "fr_by_race"),
                         selected = "nat_by_age"
                         ),
            
            hr(),
            h5("Source:"),
            a("data.gov",
              href="https://catalog.data.gov/dataset/birth-rates-by-age-of-mother-united-states-1940-2013")
        ),
        
        mainPanel(
            plotlyOutput("birthPlot")    
        )
    )
))
