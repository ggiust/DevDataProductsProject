library(shiny)

x=c(10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85)
y=c(8.5,7.65,7.9,7.75,7.65,7.4,7.2,7.1,7.1,7.3,7.5,7.7,8,8.3,8.75,9.7)

sleepHours <- function(yearsOld) {
    fit<-lm(y ~ x + I(x^2))
    cc<-coef(fit)
    cc[1]+cc[2]*yearsOld+cc[3]*yearsOld^2
}

shinyServer(
    
    function(input, output) {
        output$enteredAgeId <- renderPrint({input$ageId})
        output$predictedHoursSleep <- renderPrint({sleepHours(input$ageId)})
        output$sleepPlot <- renderPlot({
            plot(x,y, col='gray', type='p',lwd=4, pch=19,
                 xlab="Age (years)",ylab="Sleep (hours)",
                 main="Average Daily Hours of Sleep by Age")
            abline(v=input$ageId, col='purple',lwd='3' )
            fit<-lm(y ~ x + I(x^2))
            pred_y<-predict(fit)
            lines(x,pred_y,col='red',type='l',lwd=4)
        })
    }
    

)