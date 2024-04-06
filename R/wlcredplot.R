#' Creates plot of weighted lift curve with credibility
#'
#' @param data the dataset
#' @param predictions the predicted values
#' @param actuals the actual values
#' @param weights the weights for the values
#' @param numbins the number of bins for the lift curve
#' @return a plot
#' @examples
#' mock_data <- data.frame(preds = rep(1:4,10),target=rep(1:5,8),weights=rep(1:2,20))
#' wlcredplot(mock_data,"preds","target","weights",3)
#'

wlcredplot<-function(data,predictions,actuals,weights,numbins){
  lifttab<-wltable(data,predictions,actuals,weights,numbins)

  plot_ly(data = lifttab) %>%
    add_trace(x=~bin, y=~cred, name = 'Weight', type='bar')%>%
    add_trace(x=~bin,y=~wpred,yaxis="y2",type='scatter',mode='lines+markers',name='Prediction') %>%
    add_trace(x=~bin,y=~wtarg,yaxis="y2",type='scatter',mode='lines+markers',name='Actual') %>%
    layout(yaxis2 = list(overlaying = "y", side = "right"))
}
