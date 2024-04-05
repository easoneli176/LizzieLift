#' Creates plot of weighted lift curve
#'
#' @param data the dataset
#' @param predictions the predicted values
#' @param actuals the actual values
#' @param weights the weights for the values
#' @param numbuckets the number of buckets for the lift curve
#' @return a plot
#' @examples
#' mock_data <- data.frame(preds = rep(1:4,10),target=rep(1:5,8),weights=rep(1:2,20))
#' wlplot(mock_data,"preds","target","weights",3)
#'

wlplot<-function(data,predictions,actuals,weights,numbuckets){
  lifttab<-wltable(data,predictions,actuals,weights,numbuckets)

  plot_ly(data = lifttab) %>%
    add_trace(x=~Bucket,y=~wpred,yaxis="y2",type='scatter',mode='lines+markers',name='Prediction') %>%
    add_trace(x=~Bucket,y=~wtarg,yaxis="y2",type='scatter',mode='lines+markers',name='Actual') %>%
    layout(yaxis2 = list(overlaying = "y", side = "right"))
}
