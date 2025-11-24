test_that('basic `prob()` actions work', {
  # correct class is returned
  expect_type(prob(1 / 2), 'double')
  expect_s3_class(prob(1 / 3), 'prob')

  # conversion and creation are identical
  expect_identical(as_prob(NA), prob(NA))
  expect_identical(as_prob(NA_real_), prob(NA_real_))

  # breaks on unknown conversion
  test_vec <- structure(c('maybe', 'could be'), class = 'qual_assessments')
  expect_error(as_prob(test_vec))

  # no conversion on NULL
  expect_null(as_prob(NULL))

  # breaks on negative
  expect_error(as_prob(-1))

  # breaks outside range
  expect_error(as_prob(1.000001))
})
