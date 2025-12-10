#' @export
#' @method vec_arith prob
vec_arith.prob <- function(op, x, y, ...) {
  UseMethod('vec_arith.prob', y)
}

#' @export
#' @method vec_arith.prob prob
vec_arith.prob.prob <- function(op, x, y, ...) {
  vec_arith_base(op, x, y)
}

#' @export
#' @method vec_arith.prob double
vec_arith.prob.double <- function(op, x, y, ...) {
  vec_arith_base(op, x, y)
}

#' @export
#' @method vec_arith.numeric prob
vec_arith.numeric.prob <- function(op, x, y, ...) {
  vec_arith_base(op, x, y)
}

#' @export
vec_math.prob <- function(.fn, .x, ...) {
  switch(.fn,
    'mean' = new_prob(mean(as.double(.x), ...)),
    'abs' = new_prob(abs(as.double(.x), ...)),
    as.double(vec_math_base(.fn, .x, ...))
  )
}
