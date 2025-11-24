#' @export
vec_ptype_abbr.prob <- function(x, ...) {
  'prob'
}

#' @export
vec_ptype_full.prob <- function(x, ...) {
  'probability'
}

#' @export
format.prob <- function(x, ...) {
  if (length(x) == 0) {
    return(double())
  }

  out <- formatC(vec_data(x), format = 'f', digits = 3)
  out[is.na(x)] <- NA
  out
}
