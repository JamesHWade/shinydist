#' Build Distribution Table
#'
#' @param distribution (string)
#' @param n_obs (numeric)
#' @param mu (numeric)
#' @param sigma (numeric)
#' @param shape (numeric)
#' @param scale (numeric)
#' @param meanlog (numeric)
#' @param sdlog (numeric)
#'
#' @return
#' @export
build_dist_tbl <- function(distribution, n_obs,
                           mu = NULL, sigma = NULL,
                           shape = NULL, scale = NULL,
                           meanlog = NULL, sdlog = NULL) {
  values <- switch(distribution,
    "normal" = stats::rnorm(n = n_obs, mean = mu, sd = sigma),
    "gamma"  = stats::rgamma(n = n_obs, shape = shape, scale = scale),
    "lognormal" = stats::rlnorm(n = n_obs, meanlog = meanlog, sdlog = sdlog)
  )
  
  tibble::tibble(
    obs          = seq_along(n_obs),
    value        = values,
    distribution = distribution
  )
}

#' Inputs for Gamma Distribution
#'
#' @param session (session object)
#'
use_gamma_ui <- function(session) {
  ns <- session$ns
  list(
    numericInput(ns("shape"), "Shape (a)", value = 1),
    numericInput(ns("scale"), "Scale (s)", value = 2)
  )
}

#' Inputs for Normal Distribution
#'
#' @param session (session object)
#'
use_norm_ui <- function(session) {
  ns <- session$ns
  list(
    numericInput(ns("mu"), "Mean (\u03BC)", value = 0),
    numericInput(ns("sigma"), "Standard Deviation (\u03C3)", value = 1)
  )
}

#' Inputs for Log Normal Distribution
#'
#' @param session (session object)
#'
use_lnorm_ui <- function(session) {
  ns <- session$ns
  list(
    numericInput(ns("meanlog"), "Mean Log", value = 0),
    numericInput(ns("sdlog"), "SD Log", value = 1)
  )
}