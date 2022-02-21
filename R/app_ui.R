#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    navbarPage(
      title = "Distributions",
      theme = bslib::bs_theme(version = 5, bootswatch = "minty"),
      tabPanel(
        title = "Explore Distributions", 
        mod_which_dist_ui("which_dist_ui_1"),
        hr(),
        mod_distributions_ui("normal_ui_1")
      )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
  
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'shinydist'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

