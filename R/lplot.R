#' Creates plot of lift curve
#'
#' @param data the dataset
#' @param predictions the predicted values
#' @param actuals the actual values
#' @param numbins the number of bins for the lift curve
#' @return a plot
#' @examples
#' mock_data <- data.frame(preds = rep(1:4,10),target=rep(1:5,8),weights=rep(1:2,20))
#' lplot(mock_data,"preds","target",3)
#'

lplot<-function(data,predictions,actuals,numbins){
  lifttab<-ltable(data,predictions,actuals,numbins)

  plot_ly(data = lifttab) %>%
    add_trace(x=~bin,y=~pred,yaxis="y2",type='scatter',mode='lines+markers',name='Prediction') %>%
    add_trace(x=~bin,y=~act,yaxis="y2",type='scatter',mode='lines+markers',name='Actual') %>%
    layout(yaxis2 = list(overlaying = "y", side = "right"))
}
