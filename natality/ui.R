shinyUI(fluidPage(
    titlePanel(""),
    
    sidebarLayout(
        
        sidebarPanel(
            radioButtons(
                "data",
                label="Show:",
                choices = list("Birth Rate by Age" = "br_by_age",
                            "Birth Rate by Race" = "br_by_race",
                            "Live Births by Race" = "lb_by_race",
                            "Fertility Rate by Race" = "fr_by_race"),
                selected = "br_by_age"
            ),
            
            hr(),
            h5("Sources:"),
            tags$ul(
                tags$li(
                    a("NCHS - Birth Rates, by Age of Mother: United States, 1940-2013",
                      href = "https://catalog.data.gov/dataset/birth-rates-by-age-of-mother-united-states-1940-2013")
                ),
                tags$li(
                    a("NCHS - Births, Birth Rates, and Fertility Rates, by Race of Mother: United States, 1960-2013",
                      href = "https://catalog.data.gov/dataset/births-birth-rates-and-fertility-rates-by-race-of-mother-united-states-1960-2013")
                )
            )
        ),
        
        mainPanel(
            plotlyOutput("birthPlot"),
            hr(),
            h5(
                em(
                    tags$ul(
                        tags$li("Click on groups in the legend to toggle displaying their graphs."),
                        tags$li("Drag select a rectangular area to zoom in on the data within the selection.")
                    )
                )
            )
        )
    )
    
))
