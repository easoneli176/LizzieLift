
<!-- README.md is generated from README.Rmd. Please edit that file -->

# LizzieLift

<!-- badges: start -->
<!-- badges: end -->

The goal of LizzieLift is to make the creation of lift curves with
weighted and unweighted data simple. A lift curve compares the actual
values of some target of a model to the predicted values of the model by
ordering the data according to the predicted values, binning the data,
and then comparing the mean value of the predicted and actual values in
each bin. The ordering of the data ensures that the plot of the mean
predicted values will be monotonically increasing, and if the model is
good, the plot of the mean actual values should be as well. When a model
is built using weighted data, we prefer to weight each entry in the lift
curve as well. Lizzie was unable to find an easily download-able package
that performed this function well, so she built a package herself to
ensure the weighting was done according to her needs.

## Installation

You can install the development version of LizzieLift from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("easoneli176/LizzieLift")
```

## Example

This is a basic example of building lift curves with this package:

``` r
library(LizzieLift)
#> Loading required package: dplyr
#> Warning: package 'dplyr' was built under R version 4.2.3
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
#> Loading required package: plotly
#> Warning: package 'plotly' was built under R version 4.2.3
#> Loading required package: ggplot2
#> Warning: package 'ggplot2' was built under R version 4.2.3
#> 
#> Attaching package: 'plotly'
#> The following object is masked from 'package:ggplot2':
#> 
#>     last_plot
#> The following object is masked from 'package:stats':
#> 
#>     filter
#> The following object is masked from 'package:graphics':
#> 
#>     layout

mock_data <- data.frame(preds=rep(1:4,10), target=rep(1:5,8), weights=rep(1:2,20))

wltable(mock_data,"preds","target","weights",3)
#>   bin cred wpred wtarg
#> 1   1   20   1.5     3
#> 2   2   20   2.5     3
#> 3   3   20   4.0     3
weightedliftplot<-wlplot(mock_data,"preds","target","weights",3)
#wlcredplot(mock_data,"preds","target","weights",3)
ltable(mock_data,"preds","target",3)
#>   bin     pred      act
#> 1   1 1.230769 2.923077
#> 2   2 2.461538 3.076923
#> 3   3 3.714286 3.000000
#lplot(mock_data,"preds","target",3)
```

<iframe src="C:/Users/eason/Desktop/Blog/LizzieLift/index.html" width="100%" height="600" scrolling="no" seamless="seamless" frameBorder="0"></iframe>
