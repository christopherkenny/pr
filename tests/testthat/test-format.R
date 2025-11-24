test_that('formatting works', {
  verify_output(
    path = 'output-print.txt',
    print(prob(c(1 / 2, 0.35, NA)))
  )
})
