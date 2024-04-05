#' Creates table for weighted lift curve
#'
#' @param data the dataset
#' @param predictions the predicted values
#' @param actuals the actual values
#' @param weights the weights for the values
#' @param numbuckets the number of buckets for the lift curve
#' @return a table
#' @examples
#' mock_data <- data.frame(preds = rep(1:4,10),target=rep(1:5,8),weights=rep(1:2,20))
#' wltable(mock_data,"preds","target","weights",3)
#'

wltable<-function(data,predictions,actuals,weights,numbuckets){
  #Step 0: get column numbers of fields
  prednum<-which(colnames(data) == predictions)
  actnum<-which(colnames(data) == actuals)
  wnum<-which(colnames(data) == weights)

  #Step 1: order by predictions
  data<-data %>% arrange(data[,prednum])

  orderpreds<-data[,prednum]
  orderacts<-data[,actnum]
  orderweights<-data[,wnum]

  #Step 2: Bucket data
  totwt<-sum(orderweights)

  inc<-totwt/numbuckets

  data<-data %>%
    mutate(csum = cumsum(orderweights))

  data$bucket<-1

  for (i in 1:nrow(data)){
    bucket <-1
    for (j in 1:numbuckets){
      bucket<-ifelse(data$csum[i]>j*inc,j+1,bucket)
    }
    data$bucket[i]<-bucket
  }

  #Step 3: calculate weighted avg pred and actual for each bucket
  bucketcred<-aggregate(orderweights, list(Bucket = data$bucket),sum)

  data$wpred<-orderpreds*orderweights

  bucketpred<-aggregate(data$wpred, list(Bucket = data$bucket),sum)

  bucketpred$cred<-bucketcred$x

  bucketpred$wpred<-bucketpred$x/bucketpred$cred

  data$wtarg <- orderacts*orderweights

  bucketact<-aggregate(data$wtarg, list(Bucket = data$bucket),sum)

  bucketpred$wtarg<-bucketact$x/bucketpred$cred

  bucketpred<-bucketpred[,-2]

  bucketpred
}
