library(shiny)
library(shinythemes)
source("plot_results.R")
# Define UI ----
ui <- fluidPage(theme = shinytheme("lumen"),
  titlePanel("Results Analysis"),
  h4("Model esitimation for all 14 nodes of the UK National Grid"),
  sidebarLayout(
    sidebarPanel(
      helpText("Select the covariance of your interest interest 
               and the number of unconstrained parameters to use for the
               model estimation covariance."),
      fluidPage(
        selectInput("i_nup", h4("Select the number of unconstrained parameters "), 
                    choices = list("0 unconstrained parameters" = 0, "20 unconstrained parameters" = 20,
                                   "40 unconstrained parameters" = 40, "80 unconstrained parameters" = 80,
                                   "105 unconstrained parameters"=105), selected = 20),
        
        
        sliderInput("c", h4("Select the neighborhood covariance of interest"),
                    min = 1, max = 39, value = 12)
      )
    ),
    mainPanel(
      p("This is a simple application built in order to show the results coming 
        from the model estimation."),
      textOutput("selected_nup"),
      textOutput("selected_c"),
      p("Next, a plot showing the results for the provived information is available"),
      plotOutput("plot")
    )
  )
)

# Define server logic ----
server <- function(input, output) {
  output$selected_nup <- renderText({ 
    paste(paste0("You have selected ",input$i_nup," unconstrained parameters"))
  })
  output$selected_c <- renderText({ 
    paste0("You have selected the ",input$c,"-th neighborhood covariance, that is, the covariance between ", 
    neig[nei_indeces$ii[input$c]]," and ",neig[nei_indeces$jj[input$c]])
    
  })
  output$plot <- renderPlot({
    plot_results(input$i_nup,input$c)
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)