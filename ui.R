library(shiny)
shinyUI(pageWithSidebar(
        
        headerPanel("BMI Calculator"),
        
        sidebarPanel(h2("Enter your height here"),
                     radioButtons("rb1","choose your metric",c("feet&inch"="fi","cm"="cms")),
                numericInput('cm',"",1),
                h2("Enter your weight here"),
                radioButtons("rb2","choose your metric",c("kg"="kg","pound"="pd")),
                numericInput('kg',"",1),
                submitButton('Submit')
                )
        ,
        
        mainPanel(h3('Your BMI is'),
                     verbatimTextOutput("bmi"),
                     plotOutput("newplot")
           
               )

        ))







