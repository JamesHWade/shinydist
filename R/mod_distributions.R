#' normal UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_distributions_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(width = 4,
             numericInput(ns("n_obs"), "Number of Observations",
                          value = 5000),
             uiOutput(ns("distribution_ui")),
             actionButton(inputId = ns("save"),
                          label = "Save Distribution",
                          icon = icon("chart-area"))
      ),
      column(width = 8,
             plotOutput(ns("distribution_plot"))
      )
    ),
    verbatimTextOutput(ns("norm_code"))
  )
}

#' normal Server Functions
#'
#' @noRd 
mod_distributions_server <- function(id, r){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$distribution_ui <- renderUI({
      req(!is.null(r$dist))
      switch (r$dist,
              "normal" = use_norm_ui(session),
              "gamma"  = use_gamma_ui(session),
              "lognormal" = use_lnorm_ui(session)
      )
    })
    
    rnorm_tbl <- reactive({
      req(!is.null(r$dist))
      build_dist_tbl(distribution = r$dist,
                     n_obs        = input$n_obs,
                     mu           = input$mu,
                     sigma        = input$sigma,
                     shape        = input$shape,
                     scale        = input$scale,
                     meanlog      = input$meanlog,
                     sdlog        = input$sdlog)
    })
    
    output$distribution_plot <- renderPlot({
      req(nrow(rnorm_tbl()) == input$n_obs)
      plot_dist(data = rnorm_tbl(), n_obs = input$n_obs)
    })
    
    output$norm_code <- renderPrint(
      cat("rnorm(", input$n_obs, ", mean = ", input$mu, ", sd = ", input$sigma, ")", sep = "")
    )
    
  })
}

## To be copied in the UI
# mod_distributions_ui("normal_ui_1")

## To be copied in the server
# mod_distributions_server("normal_ui_1", r = r)
