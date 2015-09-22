library(shiny)

x=c(10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85)
y=c(8.5,7.65,7.9,7.75,7.65,7.4,7.2,7.1,7.1,7.3,7.5,7.7,8,8.3,8.75,9.7)

sleepHours <- function(yearsOld) {
    approx(x,y,yearsOld)$y
}

shinyServer(
    
    function(input, output) {
        output$enteredAgeId <- renderPrint({input$ageId})
        output$predictedHoursSleep <- renderPrint({sleepHours(input$ageId)})
        output$sleepPlot <- renderPlot({
            plot(x,y, col='gray', type='l',lwd=4,
                 xlab="Age (years)",ylab="Sleep (hours)",
                 main="Average Daily Hours of Sleep by Age")
            abline(v=input$ageId, col='purple',lwd='3' )
            
        })
    }
    

)