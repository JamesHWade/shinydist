#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  r <- reactiveValues()
  # Your application server logic 
  mod_distributions_server("normal_ui_1", r = r)
  mod_which_dist_server("which_dist_ui_1", r = r)
}
