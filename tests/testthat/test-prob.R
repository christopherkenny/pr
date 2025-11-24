test_that('basic `prob()` actions work', {
  expect_s3_class(prob(1 / 3), 'prob')

  expect_true(is_prob(prob(1 / 5)))

  expect_s3_class(prob(500 / 501), 'prob')

  expect_true(prob(1 / 2) == 1 / 2)
})
