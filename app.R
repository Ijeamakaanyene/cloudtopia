library(shiny)



ui = fluidPage(
  title = "cloudtopia",

  # Loading in CSS file
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
  ),

  # Video - which is autoplay so much fun
  # Note setting attributes to blank, is the boolean for TRUE in HTML
  tags$video(autoplay = "",
             loop = "",
             playsinline = "",
             muted = "",
             id = "cloud-video",
             type = "video/mp4",
             src = "CLOUD_ANIMATION_2.mp4"),

  # Introductory text
  tags$header(
    class = "viewport-header",
      h1(textOutput("output_text"))
  ),

  # Footer of slide
  tags$div(
    class = "credits",
    h5("Made by ",
       a(href = "https://ijeamaka-anyene.netlify.app/",
         "Ijeamaka Anyene"),
       img(src = "cloud.png", width = "15px"),
       "Site enabled by Shiny and special thanks to ",
       a(href = "https://css-tricks.com/full-page-background-video-styles/",
         "CSS Tricks")
    )
  )

  )



server = function(input, output, session){

  # Saving various time in the future
  t1 = reactiveValues(timer = Sys.time() + 3)
  t2 = reactiveValues(timer = Sys.time() + 6)
  t3 = reactiveValues(timer = Sys.time() + 10)
  t4 = reactiveValues(timer = Sys.time() + 14)

  text1 = "HELLO!"
  text2 = "WELCOME TO CLOUDTOPIA"
  text3 = "I HOPE YOU FIND YOUR TIME HERE PEACEFUL"

  # Updates h value every 1 second
  h = reactiveTimer(1000)

  # Updates textoutput at time points above
  observe({
    if(h() < t1$timer){

      output$output_text = renderText({paste("")})

    } else if(h() >= t1$timer &
              h() < t2$timer){

      output$output_text = renderText({paste(text1)})

    } else if(h() >= t2$timer &
              h() < t3$timer){

      output$output_text = renderText({paste(text2)})

    } else if(h() >= t3$timer &
              h() < t4$timer) {

      output$output_text = renderText({paste(text3)})

    } else {

      output$output_text = renderText({paste("")})

    }
  })
}

shinyApp(ui, server)
