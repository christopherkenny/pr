
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pr <img src="man/figures/logo.png" align="right" height="138" alt="" />

<!-- badges: start -->

<!-- badges: end -->

`pr` provides a set of probability classes built on `vctrs` and its
`rcrd`s class. The primary offerings include:

- `prob`: A probability vector class
- `prob_mat`: A `rcrd` which describes a matrix of probabilities
- `prob_mat_cnt`: A `rcrd` which describes a matrix of probabilities
  with counts

It is designed to be lightweight so that it can be included as a
dependency for other packages. Its only direct dependency is `vctrs`.

## Installation

You can install the development version of pr from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("christopherkenny/pr")
```

## Example

The primary component of the package is the `prob` class. This
represents a vector of probabilities.

``` r
library(pr)
prob(x = c(1 / 2, 0.4, NA, 0.875))
#> <probability[4]>
#> [1] 0.500 0.400 <NA>  0.875
```

It supports creating record classes for sets of probabilities which sum
to 1 rowwise. This is implemented via `vctrs`’s `rcrd` type, which is a
collection of same-length vectors.
