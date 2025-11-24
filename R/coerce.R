#' `prob` Coercion
#'
#' Coercion methods for [vctrs::vec_ptype2()]
#'
#' @inheritParams vctrs::vec_ptype2
#'
#' @return a vector of the same length, as class `prob` if convertible,
#' otherwise `double`
#'
#' @keywords internal
#' @method vec_ptype2 prob
#' @export
#' @export vec_ptype2.prob
vec_ptype2.prob <- function(x, y, ...) {
  UseMethod('vec_ptype2.prob', y)
}

#' @method vec_ptype2.prob default
#' @export
vec_ptype2.prob.default <- function(x, y, ..., x_arg = '', y_arg = '') {
  vec_default_ptype2(x, y, ..., x_arg = x_arg, y_arg = y_arg)
}

#' @method vec_ptype2.prob prob
#' @export
vec_ptype2.prob.prob <- function(x, y, ...) {
  new_prob()
}

#' @method vec_ptype2.prob double
#' @export
vec_ptype2.prob.double <- function(x, y, ..., x_arg = '', y_arg = '') {
  new_prob()
}

#' @method vec_ptype2.double prob
#' @export
vec_ptype2.double.prob <- function(x, y, ..., x_arg = '', y_arg = '') {
  new_prob()
}
