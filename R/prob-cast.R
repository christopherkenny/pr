#' `prob` Casting
#'
#' Dispatch methods for [vctrs::vec_cast()]
#'
#' @inheritParams vctrs::vec_cast
#'
#' @return a vector of the same length, as class `prob` if convertible,
#' otherwise `double`
#'
#' @keywords internal
#' @method vec_cast prob
#' @export
#' @export vec_cast.prob
vec_cast.prob <- function(x, to, ...) {
  UseMethod('vec_cast.prob')
}

#' @method vec_cast.prob default
#' @export
vec_cast.prob.default <- function(x, to, ...) {
  vec_default_cast(vec_data(x), to, ...)
}

#' @method vec_cast.prob double
#' @export
vec_cast.prob.double <- function(x, to, ...) prob(x)

#' @method vec_cast.double prob
#' @export
vec_cast.double.prob <- function(x, to, ...) vec_data(x)
