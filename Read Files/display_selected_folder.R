library(shiny)
library(shinyFiles)
shinyApp(
  shinyUI(bootstrapPage(
    shinyDirButton('folder', 
                   'Select a folder', 
                   'Please select a folder', FALSE),
    
    verbatimTextOutput('dir')
    )),
  
  
  shinyServer(function(input, output) {
    roots <- getVolumes()()
    shinyDirChoose(input, 'folder', roots=roots)
    folder <- reactive(input$folder)
    home <- "~"
    
    dir <- reactive(file.path(home, paste(unlist(folder()$path[-1]), collapse = .Platform$file.sep))
    )
    
    output$dir <- renderText(dir())
    
  })
)