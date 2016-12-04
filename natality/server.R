shinyServer(function(input, output, session) {
    
    output$birthPlot <- renderPlotly({
        
        # default input$data == "br_by_age"
        d <- natByAge
        c <- "~Birth.Rate"
        s <- "~Age.Group"
        t <- "Birth Rates, by Age of Mother: US, 1940-2013"
        ylabel <- "Rate per 1,000 women in speified group"
        
        if (input$data == "br_by_race") {
            d <- natality
            s <- "~Race"
            t <- "Birth Rates by Race of Mother: US, 1960-2013"
            
        } else if (input$data == "lb_by_race") {
            d <- natality
            c <- "~Live.Births"
            s <- "~Race"
            t <- "Births by Race of Mother: US, 1960-2013"
            ylabel <- "Births"
            
        } else if (input$data == "fr_by_race") {
            d <- natality
            c <- "~Fertility.Rate"
            s <- "~Race"
            t <- "Fertility Rates by Race of Mother: US, 1960-2013"
        }
        
        plot_ly(
            d, x = ~Year, y = eval(parse(text=c)),
            type = 'scatter', mode = 'lines', split = eval(parse(text=s))) %>%
            
            layout(
                title = t,
                yaxis = list(title = ylabel)
            )
        
    })
  
})
