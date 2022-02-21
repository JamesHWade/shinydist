#' Build Distribution Table
#'
#' @param distribution 
#' @param n_obs 
#' @param mu 
#' @param sigma 
#' @param shape 
#' @param scale 
#' @param meanlog 
#' @param sdlog 
#'
#' @return
#' @export
#'
#' @examples
build_dist_tbl <- function(distribution, n_obs,
                           mu = NULL, sigma = NULL,
                           shape = NULL, scale = NULL,
                           meanlog = NULL, sdlog = NULL) {
  values <- switch(distribution,
    "normal" = rnorm(n = n_obs, mean = mu, sd = sigma),
    "gamma"  = rgamma(n = n_obs, shape = shape, scale = scale),
    "lognormal" = rlnorm(n = n_obs, meanlog = meanlog, sdlog = sdlog)
  )
  
  tibble::tibble(
    obs          = seq_along(n_obs),
    value        = values,
    distribution = distribution
  )
}

#' Inputs for Gamma Distribution
#'
#' @param session 
#'
#' @return
use_gamma_ui <- function(session) {
  ns <- session$ns
  list(
    numericInput(ns("shape"), "Shape (a)", value = 1),
    numericInput(ns("scale"), "Scale (s)", value = 2)
  )
}

#' Inputs for Normal Distribution
#'
#' @param session 
#'
#' @return
use_norm_ui <- function(session) {
  ns <- session$ns
  list(
    numericInput(ns("mu"), "Mean (µ)", value = 0),
    numericInput(ns("sigma"), "Standard Deviation (σ)", value = 1)
  )
}

#' Inputs for Log Normal Distribution
#'
#' @param session 
#'
#' @return
use_lnorm_ui <- function(session) {
  ns <- session$ns
  list(
    numericInput(ns("meanlog"), "Mean Log", value = 0),
    numericInput(ns("sdlog"), "SD Log", value = 1)
  )
}