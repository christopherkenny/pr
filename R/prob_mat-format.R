#' @export
vec_ptype_abbr.prob_mat <- function(x, ...) {
  'prob_mat'
}

#' @export
vec_ptype_full.prob_mat <- function(x, ...) {
  'probability matrix'
}

#' @export
format.prob_mat <- function(x, ...) {
  if (length(x) == 0) {
    return(double())
  }
  f <- fields(x)
  fmt <- lapply(f, function(y) {
    format(field(x, y))
  })

  do.call(cbind, fmt) |>
    `colnames<-`(fields(x))
}
