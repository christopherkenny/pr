#' Create a probability vector
#'
#' A probability vector here is used as a vector where all entries are between
#' 0 and 1 or are missing.
#'
#' @param x A double vector of probabilities
#'
#' @returns a `prob` vector
#'
#' @export
#' @examples
#' prob(c(0.4, 2 / 3, NA_real_, 1L))
prob <- function(x = double()) {
  x <- vec_cast(x, double())
  new_prob(x)
}

new_prob <- function(x = double()) {
  validate_prob(x)
  new_vctr(x, class = 'prob')
}

#' @export
#' @rdname prob
validate_prob <- function(x) {
  stopifnot(all(is.na(x) | x >= 0 | x <= 1))

  invisible(x)
}

#' @export
#' @rdname prob
is_prob <- function(x) {
  inherits(x, 'prob')
}

#' @export
#' @rdname prob
as_prob <- function(x) {
  if (inherits(x, 'double')) {
    x <- as.double(x)
  }
  vec_cast(x, to = new_prob())
}
