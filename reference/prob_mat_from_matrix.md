# Convert matrix into prob_mat

Convert matrix into prob_mat

## Usage

``` r
prob_mat_from_matrix(x, ...)

# S3 method for class 'prob_mat'
as.matrix(x, ...)
```

## Arguments

- x:

  A prob_mat or matrix

- ...:

  Ignored.

## Value

`prob_mat_from_matrix()` returns a `prob_mat` and
[`as.matrix()`](https://rdrr.io/r/base/matrix.html) returns a matrix

## Examples

``` r
p1 <- prob(c(0.4, 2 / 3, NA_real_, 1L))
p2 <- 1 - p1
pm <- prob_mat(pr_one = p1, pr_two = p2)
m <- as.matrix(pm)
m
#>         pr_one    pr_two
#> [1,] 0.4000000 0.6000000
#> [2,] 0.6666667 0.3333333
#> [3,]        NA        NA
#> [4,] 1.0000000 0.0000000
prob_mat_from_matrix(m)
#> <probability matrix[4]>
#>      pr_one    pr_two   
#> [1,] 0.4000000 0.6000000
#> [2,] 0.6666667 0.3333333
#> [3,]        NA        NA
#> [4,] 1.0000000 0.0000000
```
