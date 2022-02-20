#' normal UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_normal_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' normal Server Functions
#'
#' @noRd 
mod_normal_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_normal_ui("normal_ui_1")
    
## To be copied in the server
# mod_normal_server("normal_ui_1")
