#===========kaggle Regression Error Measurement========

#Mean absolute error 平均绝对误差
#适用于 数值预测误差的量特别重要的案例
MAE <- function(data){
  if (class(data[[1]])!= "numeric" || class(data[[2]])!= "numeric")
    return("warning: wrong input")
  else
    mae = (sum(abs(data[1] - data[2]))) / nrow(data)
    return(mae)
}

#Weighte mean absolute error加权平均绝对误差
WMAE <- function(data, weight){
  if (class(data[[1]])!= "numeric" || class(data[[2]])!= "numeric")
    return("error: wrong data input")
  else
  {
    if(nrow(data) != nrow(weight))
      return("error:data doesn's have the same length with weight")
    else
      return((1/sum(weight)) * sum(weight * abs(data[1] - data[2])))
  }   
}

#Root Mean Squared Error 平均平方根误差方式
#适用于 数值预测，能够放大大多数错误，并对这些错误更加严格对待
#均方根误差为了说明样本的离散程度
RMSE <- function(data){
  if (class(data[[1]])!= "numeric" || class(data[[2]])!= "numeric")
    return("warning: wrong input")
  else
    return(sqrt((1/nrow(data[1]) * sum((data[1] - data[2]) ^ 2))))
}

#root mean squared logarithmic error
#当一组测定值在取对数后符合正态分布。。。
RMSLE <- function(data){
  if (class(data[[1]])!= "numeric" || class(data[[2]])!= "numeric")
    return("warning: wrong input")
  else{
    logSquare <- (log(data[1] + 1) - log(data[2] + 1))^ 2
    rmsle <- sqrt((1 / nrow(data)) * sum(logSquare) )
    return(rmsle)
  }
}

#----MAPE: 绝对百分误差
#----MAPE值越大，说明预测值与原始值差别越大，也即预测效果越差。
#  calculated as sum(|t_i - p_i|)/N
MAPE <- function(data){
  if (class(data[[1]])!= "numeric" || class(data[[2]])!= "numeric")
    return("warning: wrong input")
  else{
    mape <- sum((abs(data[1] - data[2])) / data[1]) / nrow(data)
    return(mape)
  }
}

data(cars)
library(DMwR)
lm1 <- lm(dist ~ speed, data = cars)
summary(lm1)
pred <- predict(lm1, data = cars$speed)
results <- data.frame(cars$dist, pred)
weight <- data.frame(rep( 1 / nrow(results), each = nrow(results)))
MAE(results); WMAE(results,weight); RMSE(results); MAPE(results)
regr.eval(cars$dist, pred)
