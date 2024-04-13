---
output: 
  html_document:
    keep_md: true
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



# LizzieLift

<!-- badges: start -->
<!-- badges: end -->

The goal of LizzieLift is to make the creation of lift curves with weighted and unweighted data simple. A lift curve compares the actual values of some target of a model to the predicted values of the model by ordering the data according to the predicted values, binning the data, and then comparing the mean value of the predicted and actual values in each bin. The ordering of the data ensures that the plot of the mean predicted values will be monotonically increasing, and if the model is good, the plot of the mean actual values should be as well. When a model is built using weighted data, we prefer to weight each entry in the lift curve as well. Lizzie was unable to find an easily download-able package that performed this function well, so she built a package herself to ensure the weighting was done according to her needs.

## Installation

You can install the development version of LizzieLift from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("easoneli176/LizzieLift")
```

## Example

This is a basic example of building lift curves with this package:


```r
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
wlplot(mock_data,"preds","target","weights",3)
```


```{=html}
<div class="plotly html-widget html-fill-item" id="htmlwidget-4bf91b1b0e0ae9fcdef8" style="width:100%;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-4bf91b1b0e0ae9fcdef8">{"x":{"visdat":{"42a44d7f921":["function () ","plotlyVisDat"]},"cur_data":"42a44d7f921","attrs":{"42a44d7f921":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"yaxis":"y2","type":"scatter","mode":"lines+markers","name":"Prediction","inherit":true},"42a44d7f921.1":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"yaxis":"y2","type":"scatter","mode":"lines+markers","name":"Actual","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"yaxis2":{"overlaying":"y","side":"right"},"xaxis":{"domain":[0,1],"automargin":true,"title":"bin"},"yaxis":{"domain":[0,1],"automargin":true,"title":"wpred"},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[1,2,3],"y":[1.5,2.5,4],"yaxis":"y2","type":"scatter","mode":"lines+markers","name":"Prediction","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","frame":null},{"x":[1,2,3],"y":[3,3,3],"yaxis":"y2","type":"scatter","mode":"lines+markers","name":"Actual","marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"line":{"color":"rgba(255,127,14,1)"},"xaxis":"x","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
```


```r
wlcredplot(mock_data,"preds","target","weights",3)
```


```{=html}
<div class="plotly html-widget html-fill-item" id="htmlwidget-d082bca934327b89ff18" style="width:100%;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-d082bca934327b89ff18">{"x":{"visdat":{"42a434315708":["function () ","plotlyVisDat"]},"cur_data":"42a434315708","attrs":{"42a434315708":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"name":"Weight","type":"bar","inherit":true},"42a434315708.1":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"yaxis":"y2","type":"scatter","mode":"lines+markers","name":"Prediction","inherit":true},"42a434315708.2":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"yaxis":"y2","type":"scatter","mode":"lines+markers","name":"Actual","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"yaxis2":{"overlaying":"y","side":"right"},"xaxis":{"domain":[0,1],"automargin":true,"title":"bin"},"yaxis":{"domain":[0,1],"automargin":true,"title":"cred"},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[1,2,3],"y":[20,20,20],"name":"Weight","type":"bar","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null},{"x":[1,2,3],"y":[1.5,2.5,4],"yaxis":"y2","type":"scatter","mode":"lines+markers","name":"Prediction","marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"line":{"color":"rgba(255,127,14,1)"},"xaxis":"x","frame":null},{"x":[1,2,3],"y":[3,3,3],"yaxis":"y2","type":"scatter","mode":"lines+markers","name":"Actual","marker":{"color":"rgba(44,160,44,1)","line":{"color":"rgba(44,160,44,1)"}},"error_y":{"color":"rgba(44,160,44,1)"},"error_x":{"color":"rgba(44,160,44,1)"},"line":{"color":"rgba(44,160,44,1)"},"xaxis":"x","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
```


```r
ltable(mock_data,"preds","target",3)
#>   bin     pred      act
#> 1   1 1.230769 2.923077
#> 2   2 2.461538 3.076923
#> 3   3 3.714286 3.000000
lplot(mock_data,"preds","target",3)
```


```{=html}
<div class="plotly html-widget html-fill-item" id="htmlwidget-c519822fd232dd30381b" style="width:100%;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-c519822fd232dd30381b">{"x":{"visdat":{"42a4e327657":["function () ","plotlyVisDat"]},"cur_data":"42a4e327657","attrs":{"42a4e327657":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"yaxis":"y2","type":"scatter","mode":"lines+markers","name":"Prediction","inherit":true},"42a4e327657.1":{"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"x":{},"y":{},"yaxis":"y2","type":"scatter","mode":"lines+markers","name":"Actual","inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"yaxis2":{"overlaying":"y","side":"right"},"xaxis":{"domain":[0,1],"automargin":true,"title":"bin"},"yaxis":{"domain":[0,1],"automargin":true,"title":"pred"},"hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"data":[{"x":[1,2,3],"y":[1.2307692307692308,2.4615384615384617,3.7142857142857144],"yaxis":"y2","type":"scatter","mode":"lines+markers","name":"Prediction","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","frame":null},{"x":[1,2,3],"y":[2.9230769230769229,3.0769230769230771,3],"yaxis":"y2","type":"scatter","mode":"lines+markers","name":"Actual","marker":{"color":"rgba(255,127,14,1)","line":{"color":"rgba(255,127,14,1)"}},"error_y":{"color":"rgba(255,127,14,1)"},"error_x":{"color":"rgba(255,127,14,1)"},"line":{"color":"rgba(255,127,14,1)"},"xaxis":"x","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
```


