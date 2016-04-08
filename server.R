
library(ggplot2)
bmical<-function(hi,w,radio1,radio2){
        nh<-numeric()
        if(radio1=="fi")
        {
        hi=2.54*hi*12        
        }
      
        if(radio2=="pd")
        {
                w=w*0.453592
        }
        
        hi=hi/100
        nh<-w/hi^2
        nh
}



shinyServer(
        function(input, output) {
                
                output$opounds <- renderPrint({input$pounds})
                output$bmi<-renderPrint({bmical(input$cm,input$kg,input$rb1,input$rb2)})
                output$cmi<-renderPrint({input$fc})
                output$newplot<-renderPlot({
                        
                        a=data.frame(obs=1:40,bmi=1:40)
                        x<-ggplot(a,aes(obs,bmi))+geom_line(lwd=1,col="BLUE")+geom_hline(yintercept = 18.5,lwd=1,col="GREEN")
                        y<-x+geom_hline(yintercept = 24.9,lwd=1,col="YELLOW")+geom_hline(yintercept = 29.9,lwd=1,col="RED")
                        z<-y+annotate("text",x=5,y=34,label="Obese",size=20,col="RED")
                        l<-z+annotate("text",x=5,y=27,label="Overweight",size=15,col="YELLOW")
                        q<-l+annotate("text",x=5,y=22,label="Normal",size=10,col="GREEN")+annotate("text",x=5,y=15,label="Underweight",size=5,col="BLACK")
                        q+geom_point(x=bmical(input$cm,input$kg,input$rb1,input$rb2),y=bmical(input$cm,input$kg,input$rb1,input$rb2),pch=19,size=5)+annotate("text",x=bmical(input$cm,input$kg,input$rb1,input$rb2)-4,y=bmical(input$cm,input$kg,input$rb1,input$rb2),label="your bmi lies here")
                        
                        
                })
                
                
        }
)



