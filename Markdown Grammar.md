---
title: "Grammar about Markdown"
author: "Yan Zhizhi"
date: "Sunday, December 07, 2014"
output:
  html_document: default
---

reference:  
http://rmarkdown.rstudio.com/     
http://yihui.name/knitr/options    

This is an R markdown file which aims at describing the basic grammar on how to write markdown files.
添加一个反斜杠('\')在那些有特殊意义的字符前面，那么字符将被理解为字面意义

生成文档的快捷键：(ctrl + shift + k)    
ps:开着搜狗拼音的时候好像这个快捷键就被占用了。。。  

#1.文档写作

##1.1 Images 插入图片
Markdown uses an image syntax that is intended to resemble the syntax for links, allowing for two styles: inline and reference.  

Inline image syntax looks like this:
```
![Alt text](e:\\R_data\\markdown\\3.jpg)
```
括号里还可以是网络上图片的链接
![Alt text](e:\\R_data\\markdown\\3.jpg)

##1.2 New line 换行
浏览器会根据可用空间自动换行。 
若需强迫换行，则可在行尾至少插入两个空格。
click space at least twice to insert a new line.

##1.3 Emphasize
```
*Italic*    
**Bold**      
***Italic & Bold***
```
###结果
*Italic*    
**Bold**      
***Italic & Bold***   

##1.4 headers
\#            This is an H1   
\#\#          This is an H2   
\#\#\#\#\#\#  This is an H6   

###另一种表示法：
```
This is an H1
===============
This is an H2
-------------
```
###显示结果：
This is an H1
===============
This is an H2
-------------

##1.5 创建列表
```
- Item 1
- Item 2
- Item 3
```
###显示结果：
- Item 1
- Item 2
- Item 3

##1.6 引用
```
> Blockquotes are offset   
```
> Blockquotes are offset 

###Embedding Equations 嵌入方程式  
```
- $equation$  for inline equations($与equation之间不可以有空格！)
- $$ equation $$ for display equations
The Arithmetic mean is equal to $frac{1}{n}\sum_{i = i}^{n} x_{i}$.
$$frac{1}{n}\sum_{i = i}^{n} x_{i}$$
```
The Arithmetic mean is equal to $frac{1}{n}\sum_{i = i}^{n} x_{i}$.
$$frac{1}{n}\sum_{i = i}^{n} x_{i}$$
**备注：四个$之间，还可以用于居中显示一些你认为重要的信息**

