#' Create a probability matrix with counts record
#'
#' @param ... Named `prob` vectors or vectors coercible to `prob`
#' @param count A positive integer vector indicating the number of cases.
#'   Defaults to 1L recycled to the length of the probability vectors.
#' @param x A `cnt_prob_mat` for validation
#'
#' @returns a `cnt_prob_mat` vector
#'
#' @export
#' @examples
#' p1 <- prob(c(0.4, 2 / 3, NA_real_, 1L))
#' p2 <- 1 - p1
#' cnt_prob_mat(pr_one = p1, pr_two = p2, count = c(10L, 20L, 5L, 15L))
#' cnt_prob_mat(pr_one = p1, pr_two = p2) # count defaults to 1L
cnt_prob_mat <- function(..., count = NULL) {
  x <- rlang::list2(...)
  x <- lapply(x, as_prob)

  # vctrs will throw an error shortly if lengths(x) are not all the same
  if (length(x) > 0) {
    n <- length(x[[1]])
  } else {
    n <- 0
  }

  # Default count to 1L
  if (is.null(count)) {
    count <- vec_recycle(1L, n)
  } else {
    count <- vec_cast(count, integer())
  }

  # Add count field as first element
  x <- c(list(count = count), x)

  out <- new_rcrd(
    fields = x,
    class = 'cnt_prob_mat'
  )
  validate_cnt_prob_mat(out)
  out
}

#' @export
#' @rdname cnt_prob_mat
validate_cnt_prob_mat <- function(x) {
  x_data <- vec_data(x)

  # Get count field
  count_field <- x_data$count

  # Count must be positive integers (or NA)
  stopifnot(all(is.na(count_field) | (count_field > 0 & count_field == floor(count_field))))

  # Probabilities must pass the usual checks
  prob_fields <- x_data[names(x_data) != 'count']
  stopifnot(all(is.na(prob_fields) | (prob_fields >= 0 & prob_fields <= 1)))

  # Row sums must equal 1
  rs <- rowSums(as.data.frame(prob_fields))
  stopifnot(all(is.na(rs) | rs == 1L))

  invisible(x)
}
