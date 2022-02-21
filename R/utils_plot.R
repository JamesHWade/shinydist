#' Plot Distribution as Histogram
#'
#' @param data (dataframe)
#' @param x (var) column from `data` to use as x-value
#' @param color (var) column from `color` to specify histogram color
#'
#' @return
#' @export
plot_dist <- function(data, x = value, color = distribution, n_obs) {
  ggplot2::ggplot(data) +
    ggplot2::aes(x = {{x}},
                 color = {{color}},
                 fill = ggplot2::after_scale(ggplot2::alpha(color, 0.6))) +
    ggplot2::geom_histogram(bins = min(n_obs / 10, 100)) +
    cowplot::theme_cowplot()
}