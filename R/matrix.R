#' Convert matrix into prob_mat
#'
#' @param x A prob_mat or matrix
#' @param ... Ignored.
#'
#' @returns `prob_mat_from_matrix()` returns a `prob_mat` and `as.matrix()` returns a matrix
#'
#' @export
#' @examples
#' p1 <- prob(c(0.4, 2 / 3, NA_real_, 1L))
#' p2 <- 1 - p1
#' pm <- prob_mat(pr_one = p1, pr_two = p2)
#' m <- as.matrix(pm)
#' m
#' prob_mat_from_matrix(m)
prob_mat_from_matrix <- function(x, ...) {
  if (!is.matrix(x)) {
    cli::cli_abort('{.arg x} must be a matrix.')
  }
  rlang::check_dots_empty()

  noms <- colnames(x)
  x <- lapply(seq_len(ncol(x)), function(i) x[, i])
  names(x) <- noms

  new_prob_mat(x)
}

#' @rdname prob_mat_from_matrix
#' @export
as.matrix.prob_mat <- function(x, ...) {
  as.matrix(vec_data(x))
}
