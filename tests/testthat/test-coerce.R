test_that('coercion works', {
  expect_s3_class(vctrs::vec_c(prob(1 / 2), 1 / 4), 'prob')

  expect_s3_class(vctrs::vec_c(1 / 100, prob(0.1234)), 'prob')

  expect_error(vctrs::vec_c(20, prob(1)))
})
