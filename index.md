# pr

`pr` provides a set of probability classes built on `vctrs` and its
`rcrd`s class. The primary offerings include:

- `prob`: A probability vector class
- `prob_mat`: A `rcrd` which describes a matrix of probabilities
- `cnt_prob_mat`: A `rcrd` which describes a matrix of probabilities
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
to 1 row-wise. This is implemented via the `vctrs` `rcrd` type, which is
a collection of same-length vectors.

A corresponding probability matrix can be created as follows:

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

Finally, a count probability matrix is provided which adds a count field
to the probability matrix.

``` r
p1 <- prob(c(0.4, 2 / 3, NA_real_, 1L))
p2 <- 1 - p1
cnt_prob_mat(pr_one = p1, pr_two = p2, count = c(10, 20, 5, 15))
#> <count probability matrix[4]>
#>      count pr_one pr_two
#> [1,]    10 0.400  0.600 
#> [2,]    20 0.667  0.333 
#> [3,]     5 <NA>   <NA>  
#> [4,]    15 1.000  0.000
```

These can also be created without specifying the count, in which case it
defaults to 1L.

``` r
p1 <- prob(c(0.4, 2 / 3, NA_real_, 1L))
p2 <- 1 - p1
cnt_prob_mat(pr_one = p1, pr_two = p2)
#> <count probability matrix[4]>
#>      count pr_one pr_two
#> [1,]     1 0.400  0.600 
#> [2,]     1 0.667  0.333 
#> [3,]     1 <NA>   <NA>  
#> [4,]     1 1.000  0.000
```

For both matrix types, these are represented as `rcrd` classes which
require the columns to be named and each column to be a `prob` vector
(or coercible to one).
