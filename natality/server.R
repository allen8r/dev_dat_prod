shinyServer(function(input, output, session) {
    
    plotDataType <- reactive({
        input$data
    })
    
    
    output$birthPlot <- renderPlotly({
        if (plotDataType() == "nat_by_age")
            plot_ly(natByAge, x = ~Year, y = ~Birth.Rate,
                    type = 'scatter', mode = 'lines', split = ~Age.Group)
        else if (plotDataType() == "br_by_race")
            plot_ly(natality, x = ~Year, y = ~Birth.Rate,
                    type = 'scatter', mode = 'lines', split = ~Race)
        else if (plotDataType() == "lb_by_race")
            plot_ly(natality, x = ~Year, y = ~Live.Births,
                    type = 'scatter', mode = 'lines', split = ~Race)
        else if (plotDataType() == "fr_by_race")
            plot_ly(natality, x = ~Year, y = ~Fertility.Rate,
                    type = 'scatter', mode = 'lines', split = ~Race)
    })
  
})
