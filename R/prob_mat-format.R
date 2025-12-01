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
    format(as_prob(field(x, y)))
  })

  out <- vector('character', length = length(fmt[[1]]))

  for (i in seq_along(fmt[[1]])) {
    out[i] <- paste0(
      '[',
      paste0(vapply(fmt, `[`, character(1), i), collapse = ','),
      ']'
    )
  }
  #out[1] <- paste0('[', paste0(f, collapse = ','), ']')
  out
}
