library(shiny)
library(shinyFiles)
shinyApp(
  
  shinyUI(bootstrapPage(
    shinyDirButton('folder', 'Select a folder', 'Please select a folder', FALSE),
    verbatimTextOutput('dir')
    )),
  
  
  shinyServer(function(input, output) {
    roots <- getVolumes()()
    shinyDirChoose(input, 'folder', roots=roots)
    folder <- reactive({input$folder})

    output$dir <- renderPrint({
      req(folder())
      file.path(
        # 注意列表的索引方式
        unlist(folder()[2]),  # unlist()的括号内是子列表
        paste(unlist(folder()[1])[-1], collapse = .Platform$file.sep), 
        fsep = .Platform$file.sep)
      })
  })
)