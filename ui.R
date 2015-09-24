library(shiny)

# http://www.stat.go.jp/english/info/news/1949.htm

shinyUI(pageWithSidebar (
    headerPanel("Sleep Predictor by Age"),
    sidebarPanel( 
        numericInput('ageId', 'Enter your age:', 25, min=10, max=85, step=5),
        style = "background-color:#e8ebf1; padding:20px; width: 280px;"
    ),
    mainPanel(
        p('This Shiny application predicts the average number of hours you sleep each night. To use this application, simply enter your age in the text input box, and view the results below.'),
        p('You entered'),
        verbatimTextOutput("enteredAgeId"), 
        p('years old. Therefore, we predict that you sleep an average of'),
        verbatimTextOutput("predictedHoursSleep"),
        p('hours each night.'),
        plotOutput('sleepPlot'),
        p('Data source:', style="padding-top:20px; font-size:12px;"),
        a("http://www.stat.go.jp/english/info/news/1949.htm", 
          href='http://www.stat.go.jp/english/info/news/1949.htm',
          target="_blank", style="font-size:12px;"),
        style = "background-color:#e5eeef; padding:20px;"
    )
    
))