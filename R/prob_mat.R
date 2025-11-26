#' Create a probability matrix record
#'
#' A collection of `prob` vectors which sum to 1 rowwise.
#'
#' @param x A double vector of probabilities
#'
#' @returns a `prob` vector
#'
#' @export
#' @examples
#' p1 <- prob(c(0.4, 2 / 3, NA_real_, 1L))
#' p2 <- 1 - p1
#' prob_mat(p1, p2)
prob_mat <- function(...) {
  x <- rlang::list2(...)
  x <- lapply(x, prob)
  new_rcrd(
    fields = x,
    class = 'prob_mat'
  )
}
