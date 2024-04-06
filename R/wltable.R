#' Creates table for weighted lift curve
#'
#' @param data the dataset
#' @param predictions the predicted values
#' @param actuals the actual values
#' @param weights the weights for the values
#' @param numbins the number of bins for the lift curve
#' @return a table
#' @examples
#' mock_data <- data.frame(preds = rep(1:4,10),target=rep(1:5,8),weights=rep(1:2,20))
#' wltable(mock_data,"preds","target","weights",3)
#'

wltable<-function(data,predictions,actuals,weights,numbins){
  #Step 0: get column numbers of fields
  prednum<-which(colnames(data) == predictions)
  actnum<-which(colnames(data) == actuals)
  wnum<-which(colnames(data) == weights)

  #Step 1: order by predictions
  data<-data %>% arrange(data[,prednum])

  orderpreds<-data[,prednum]
  orderacts<-data[,actnum]
  orderweights<-data[,wnum]

  #Step 2: Bin data
  totwt<-sum(orderweights)

  inc<-totwt/numbins

  data<-data %>%
    mutate(csum = cumsum(orderweights))

  data$bin<-1

  for (i in 1:nrow(data)){
    bin <-1
    for (j in 1:numbins){
      bin<-ifelse(data$csum[i]>j*inc,j+1,bin)
    }
    data$bin[i]<-bin
  }

  #Step 3: calculate weighted avg pred and actual for each bin
  bincred<-aggregate(orderweights, list(bin = data$bin),sum)

  data$wpred<-orderpreds*orderweights

  binpred<-aggregate(data$wpred, list(bin = data$bin),sum)

  binpred$cred<-bincred$x

  binpred$wpred<-binpred$x/binpred$cred

  data$wtarg <- orderacts*orderweights

  binact<-aggregate(data$wtarg, list(bin = data$bin),sum)

  binpred$wtarg<-binact$x/binpred$cred

  binpred<-binpred[,-2]

  binpred
}
