library(DMwR)
setwd("E://R_data/work2")
phone <- read.csv("cellphone.csv", header = TRUE, stringsAsFactors = FALSE)
class(phone[1]);class(phone[[1]])

attach(phone) #该函数允许我们直接访问数据框里的列
Comments[Comments >1000]
detach(phone)

#写一个基本的函数，用于计算标准误差
se <- function(x, more = F)#参数more的默认值是F
{
  v <- var(x)
  n <- length(x)
  answer = ""
  answer[1] <- as.character(sqrt(v/n))
  if(more)
  {
    answer[2] <- as.character(mean(x))   
  }
  return(answer)
}
data <- seq(1,10,by = 0.5)
data2 <- seq(1,10,length = 10)
se(data)
se(data,more= T)
