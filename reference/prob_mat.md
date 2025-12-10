# Create a probability matrix record

A collection of `prob` vectors which sum to 1 row-wise.

## Usage

``` r
prob_mat(...)

validate_prob_mat(x)
```

## Arguments

- ...:

  Named `prob` vectors or vectors coercible to `prob`

- x:

  A `prob_mat` for validation

## Value

a `prob` vector

## Examples

``` r
p1 <- prob(c(0.4, 2 / 3, NA_real_, 1L))
p2 <- 1 - p1
prob_mat(pr_one = p1, pr_two = p2)
#> <probability matrix[4]>
#>      pr_one pr_two
#> [1,] 0.400  0.600 
#> [2,] 0.667  0.333 
#> [3,] <NA>   <NA>  
#> [4,] 1.000  0.000 
```
