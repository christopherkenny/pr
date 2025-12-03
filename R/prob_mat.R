#' Create a probability matrix record
#'
#' A collection of `prob` vectors which sum to 1 rowwise.
#'
#' @param ... Named `prob` vectors or vectors coercible to `prob`
#'
#' @returns a `prob` vector
#'
#' @export
#' @examples
#' p1 <- prob(c(0.4, 2 / 3, NA_real_, 1L))
#' p2 <- 1 - p1
#' prob_mat(pr_one = p1, pr_two = p2)
prob_mat <- function(...) {
  x <- rlang::list2(...)
  x <- lapply(x, as_prob)
  out <- new_rcrd(
    fields = x,
    class = 'prob_mat'
  )
  validate_prob_mat(out)
  out
}

#' @export
#' @rdname prob_mat
validate_prob_mat <- function(x) {
  x <- vec_data(x)
  stopifnot(all(is.na(x) | (x >= 0 & x <= 1)))

  rs <- rowSums(x)
  stopifnot(all(is.na(rs) | rs == 1L))

  invisible(x)
}
