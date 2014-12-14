---
title: "Markdown Grammar_Chunk options"
author: "Yan Zhizhi"
date: "Wednesday, December 10, 2014"
output: html_document
---

#2.R code chunks   
##2.1关于文字显示的参�<b0>   
### 参数：仅{r}   

```r
library(ggplot2)
summary(cars)
```

```
##      speed           dist       
##  Min.   : 4.0   Min.   :  2.00  
##  1st Qu.:12.0   1st Qu.: 26.00  
##  Median :15.0   Median : 36.00  
##  Mean   :15.4   Mean   : 42.98  
##  3rd Qu.:19.0   3rd Qu.: 56.00  
##  Max.   :25.0   Max.   :120.00
```

### 参数：{r, eval = FALSE}
display r code without evaluating it    
即，�<aa>**显示**，不**执行**代码

```r
summary(cars)
```

### 参数：{r,include = TRUE} 
�<aa>**执行**，不**显示**结果


### 参数：{r, echo = FALSE}
echo = FALSE意味着�<aa>**显示**结果而不显示代码    
当echo = 1时，意味着**除第一行代码之�<96>**的code都只显示结果

```
##      speed           dist       
##  Min.   : 4.0   Min.   :  2.00  
##  1st Qu.:12.0   1st Qu.: 26.00  
##  Median :15.0   Median : 36.00  
##  Mean   :15.4   Mean   : 42.98  
##  3rd Qu.:19.0   3rd Qu.: 56.00  
##  Max.   :25.0   Max.   :120.00
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4-1.png) 


```r
summary(cars)
```

```
##      speed           dist       
##  Min.   : 4.0   Min.   :  2.00  
##  1st Qu.:12.0   1st Qu.: 26.00  
##  Median :15.0   Median : 36.00  
##  Mean   :15.4   Mean   : 42.98  
##  3rd Qu.:19.0   3rd Qu.: 56.00  
##  Max.   :25.0   Max.   :120.00
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-1.png) 


### 参数：{r, results = ...}
##### results = 'asis'
这个参数可以使数据以表格的形式输出�<82>   
> Note the use of the results='asis' chunk option.
> This is required to ensure that the raw table output isn’t processed furthur by knitr. The kable function includes several options to control the maximum number of digits for numeric columns, alignment, etc (refer to the knitr package documentation for additional details).   



```r
#这个是使数据按表格显示的方式
knitr::kable(head(mtcars))
```



|                  |  mpg| cyl| disp|  hp| drat|    wt|  qsec| vs| am| gear| carb|
|:-----------------|----:|---:|----:|---:|----:|-----:|-----:|--:|--:|----:|----:|
|Mazda RX4         | 21.0|   6|  160| 110| 3.90| 2.620| 16.46|  0|  1|    4|    4|
|Mazda RX4 Wag     | 21.0|   6|  160| 110| 3.90| 2.875| 17.02|  0|  1|    4|    4|
|Datsun 710        | 22.8|   4|  108|  93| 3.85| 2.320| 18.61|  1|  1|    4|    1|
|Hornet 4 Drive    | 21.4|   6|  258| 110| 3.08| 3.215| 19.44|  1|  0|    3|    1|
|Hornet Sportabout | 18.7|   8|  360| 175| 3.15| 3.440| 17.02|  0|  0|    3|    2|
|Valiant           | 18.1|   6|  225| 105| 2.76| 3.460| 20.22|  1|  0|    3|    1|

```r
#看一下直接显示的结果
head(mtcars)
```

                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

##### results = 'hold'
这个参数用于让该chunk里的所有结果被放到chunk的末尾显示�<82>
其实是这样的，本来是一句代码就出一个结果；但是这个参数就会使代码显示完了后结果一起出�<a5>
**图片还是会一个一个出�<82>**

```r
nrow(cars)
cor(cars)
summary(cars)
```

```
## [1] 50
##           speed      dist
## speed 1.0000000 0.8068949
## dist  0.8068949 1.0000000
##      speed           dist       
##  Min.   : 4.0   Min.   :  2.00  
##  1st Qu.:12.0   1st Qu.: 26.00  
##  Median :15.0   Median : 36.00  
##  Mean   :15.4   Mean   : 42.98  
##  3rd Qu.:19.0   3rd Qu.: 56.00  
##  Max.   :25.0   Max.   :120.00
```

##### results = 'hide'
这个参数表示，执行代码，但隐藏结�<9c>
——只针对正常的R语句产生的输出结果，不针对warning、message和errors

```r
lm1 <- lm(dist ~ speed, data = cars);lm1
```
经过尝试，如果上面一段的chunk的参数是eval = FALSE，那么html就无法生成，下面的chunk会报�<99>   
而当参数�<af> results = 'hide'的时候，html就可以顺利生�<90>     

```r
summary(lm1)
```

```
## 
## Call:
## lm(formula = dist ~ speed, data = cars)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -29.069  -9.525  -2.272   9.215  43.201 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -17.5791     6.7584  -2.601   0.0123 *  
## speed         3.9324     0.4155   9.464 1.49e-12 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 15.38 on 48 degrees of freedom
## Multiple R-squared:  0.6511,	Adjusted R-squared:  0.6438 
## F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12
```

##### results = 'markup'
这个没看懂。。也没试出啥差异，看原文介绍的话感觉这个参数目前不太会用�<b0>    
- markup: mark up the results using the output hook, e.g. put results in a special LaTeX environment

### 参数：{r,collapse = TRUE}  
-  collapse: (FALSE; logical; applies to Markdown output only) whether to, if possible, collapse all the source and output blocks from one code chunk into a single block (by default, they are written to separate <pre></pre> blocks)


###系列参数
{r, warning = TRUE/FALSE}   
{r, error = TURE/FALSE}   
{r, message = TRUE/FALSE} 

```r
library(UsingR)
```

### Inline R code    
I counted 2 red trucks on the highway

```r
NANANA
```

```
## [1] NA
```

##2.2关于图形显示的参�<b0>

### 参数：fig.width, fig.height, fig.path
前两个参数用于规定输出图形的宽和�<98>
fig.path用于指定图片存储的路径（这样就可以自己额外存储了�<89>
dev用于指定存储图片的格�<8f>

```r
qplot(speed, dist, data = cars)+ geom_smooth()
```

![plot of chunk unnamed-chunk-12](E:\R_data\markdown\figureunnamed-chunk-12-1.pdf) 

### 参数：fig.keep
fig.keep�<89>5个取值：   
##### fig.keep = 'high' 
这个是默认�<bc>
只保留高水平作图  经实践，意味一个经过多步叠加的图只显示最终成�<81>

```r
plot(cars$speed, cars$dist, type = 'n')
points(cars$speed, cars$dist)
lines(cars)
```

![plot of chunk unnamed-chunk-13](figure/unnamed-chunk-13-1.png) 

##### fig.keep = 'all' 
保留低水平作�<be>   

```r
plot(cars$speed, cars$dist, type = 'n')
```

![plot of chunk unnamed-chunk-14](figure/unnamed-chunk-14-1.png) 

```r
points(cars$speed, cars$dist)
```

![plot of chunk unnamed-chunk-14](figure/unnamed-chunk-14-2.png) 

```r
lines(cars)
```

![plot of chunk unnamed-chunk-14](figure/unnamed-chunk-14-3.png) 
 
##### fig.keep = 'none'  
什么图都不显示

```r
plot(cars$speed, cars$dist, type = 'n')
points(cars$speed, cars$dist)
lines(cars)
```

##### fig.keep = 'first'/'last'   
显示第一个图或最后一个图

```r
plot(cars)
qplot(speed, dist, data = cars)+ geom_smooth()
```

```
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
```

![plot of chunk unnamed-chunk-16](figure/unnamed-chunk-16-1.png) 


###参数：fig.show
##### fig.show = 'asis'
这个是默认状态。。意味着该怎么显示就怎么显示

```r
plot(cars)
```

![plot of chunk unnamed-chunk-17](figure/unnamed-chunk-17-1.png) 

```r
qplot(speed, dist, data = cars)+ geom_smooth()
```

```
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
```

![plot of chunk unnamed-chunk-17](figure/unnamed-chunk-17-2.png) 

##### fig.show = 'hold'
等代码跑完了之后一次性显示所有的�<be>

```r
plot(cars)
qplot(speed, dist, data = cars)+ geom_smooth()
```

```
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
```

![plot of chunk unnamed-chunk-18](figure/unnamed-chunk-18-1.png) ![plot of chunk unnamed-chunk-18](figure/unnamed-chunk-18-2.png) 

##### fig.show = 'hide'
生成图文件，但不在输出文档中显示

```r
plot(cars)
```

```r
qplot(speed, dist, data = cars)+ geom_smooth()
```

```
## geom_smooth: method="auto" and size of largest group is <1000, so using loess. Use 'method = x' to change the smoothing method.
```

##### fig.show = 'animate'
wrap all plots into an animation if there are mutiple plots in a chunk
用这个参数写代码不知道为什么会报错。。。生成不了html
