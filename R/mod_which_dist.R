#' which_dist UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_which_dist_ui <- function(id){
  ns <- NS(id)
  tagList(
 selectInput(ns("dist"), label = "Select Distribution",
             choices = c("normal", "gamma", "lognormal"))
  )
}
    
#' which_dist Server Functions
#'
#' @noRd 
mod_which_dist_server <- function(id, r){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    observe(r$dist <- input$dist)
  })
}
    
## To be copied in the UI
# mod_which_dist_ui("which_dist_ui_1")
    
## To be copied in the server
# mod_which_dist_server("which_dist_ui_1", r = r)
