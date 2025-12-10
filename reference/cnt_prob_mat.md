# Create a probability matrix with counts record

Create a probability matrix with counts record

## Usage

``` r
cnt_prob_mat(..., count = NULL)

validate_cnt_prob_mat(x)
```

## Arguments

- ...:

  Named `prob` vectors or vectors coercible to `prob`

- count:

  A positive integer vector indicating the number of cases. Defaults to
  1L recycled to the length of the probability vectors.

- x:

  A `cnt_prob_mat` for validation

## Value

a `cnt_prob_mat` vector

## Examples

``` r
p1 <- prob(c(0.4, 2 / 3, NA_real_, 1L))
p2 <- 1 - p1
cnt_prob_mat(pr_one = p1, pr_two = p2, count = c(10L, 20L, 5L, 15L))
#> <count probability matrix[4]>
#>      count pr_one pr_two
#> [1,]    10 0.400  0.600 
#> [2,]    20 0.667  0.333 
#> [3,]     5 <NA>   <NA>  
#> [4,]    15 1.000  0.000 
cnt_prob_mat(pr_one = p1, pr_two = p2) # count defaults to 1L
#> <count probability matrix[4]>
#>      count pr_one pr_two
#> [1,]     1 0.400  0.600 
#> [2,]     1 0.667  0.333 
#> [3,]     1 <NA>   <NA>  
#> [4,]     1 1.000  0.000 
```
