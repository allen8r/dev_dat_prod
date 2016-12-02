shinyServer(function(input, output, session) {
    
    plotDataType <- reactive({
        input$data
    })
    
    ratePerGroupLabel <- "Rate per 1,000 women in speified group"
    
    output$birthPlot <- renderPlotly({
        if (plotDataType() == "nat_by_age")
            
            plot_ly(natByAge, x = ~Year, y = ~Birth.Rate,
                    type = 'scatter', mode = 'lines', split = ~Age.Group) %>%
                layout(
                    title = 'Birth Rates, by Age of Mother: US, 1940-2013',
                    yaxis = list(title = ratePerGroupLabel)
                )
        
        else if (plotDataType() == "br_by_race")
            
            plot_ly(natality, x = ~Year, y = ~Birth.Rate,
                    type = 'scatter', mode = 'lines', split = ~Race) %>%
                layout(
                    title = 'Birth Rates by Race of Mother: US, 1960-2013',
                    yaxis = list(title = ratePerGroupLabel)
                )
        else if (plotDataType() == "lb_by_race")
            
            plot_ly(natality, x = ~Year, y = ~Live.Births,
                    type = 'scatter', mode = 'lines+markers', split = ~Race) %>%
                layout(
                    title = 'Births by Race of Mother: US, 1960-2013',
                    yaxis = list(title = 'Births')
                )
        
        else if (plotDataType() == "fr_by_race")
            
            plot_ly(natality, x = ~Year, y = ~Fertility.Rate,
                    type = 'scatter', mode = 'lines', split = ~Race) %>%
                layout(
                    title = 'Fertility Rates by Race of Mother: US, 1960-2013',
                    yaxis = list(title = ratePerGroupLabel)
                )
    })
  
})
