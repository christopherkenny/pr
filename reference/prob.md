# Create a probability vector

A probability vector here is used as a vector where all entries are
between 0 and 1 or are missing.

## Usage

``` r
prob(x = double())

validate_prob(x)

is_prob(x)

as_prob(x)
```

## Arguments

- x:

  A double vector of probabilities

## Value

a `prob` vector

## Examples

``` r
prob(c(0.4, 2 / 3, NA_real_, 1L))
#> <probability[4]>
#> [1] 0.400 0.667 <NA>  1.000
```
