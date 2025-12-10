#' @export
vec_ptype_abbr.cnt_prob_mat <- function(x, ...) {
  'cnt_prob_mat'
}

#' @export
vec_ptype_full.cnt_prob_mat <- function(x, ...) {
  'count probability matrix'
}

#' @export
format.cnt_prob_mat <- function(x, ...) {
  if (length(x) == 0) {
    return(double())
  }

  f <- fields(x)

  # Format count as integer
  count_fmt <- format(
    as.integer(field(x, 'count')),
    justify = 'right',
    width = 5 # set min width = nchar('count')
  )

  # Format remaining probability fields
  prob_fields <- setdiff(f, 'count')
  prob_fmt <- lapply(prob_fields, function(y) {
    format(field(x, y))
  })

  fmt <- c(list(count_fmt), prob_fmt)

  do.call(cbind, fmt) |>
    `colnames<-`(c('count', prob_fields))
}
