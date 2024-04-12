#' Creates table for unweighted lift curve
#'
#' @param data the dataset
#' @param predictions the predicted values
#' @param actuals the actual values
#' @param numbins the number of bins for the lift curve
#' @return a table
#' @examples
#' mock_data <- data.frame(preds = rep(1:4,10),target=rep(1:5,8),weights=rep(1:2,20))
#' ltable(data=mock_data,predictions="preds",actuals="target",numbins=3)
#'

ltable<-function(data,predictions,actuals,numbins){
  #Step 0: get column numbers of fields
  prednum<-which(colnames(data) == predictions)
  actnum<-which(colnames(data) == actuals)

  #Step 1: order by predictions
  data<-data %>% arrange(data[,prednum])

  orderpreds<-data[,prednum]
  orderacts<-data[,actnum]

  #Step 2: Bin data
  nrows<-dim(data)[1]

  inc<-nrows/numbins

  data <-data %>%
    mutate(rownum = row_number())

  data$bin<-1

  for (i in 1:nrows){
    bin <-1
    for (j in 1:numbins){
      bin<-ifelse(data$rownum[i]>j*inc,j+1,bin)
    }
    data$bin[i]<-bin
  }

  #Step 3: calculate avg pred and actual for each bin
  binpred<-aggregate(orderpreds, list(bin = data$bin),mean)

  binact<-aggregate(orderacts, list(bin = data$bin),mean)

  binpred$pred<-binpred$x

  binpred$act<-binact$x

  binpred<-binpred[,-2]

  binpred
}
