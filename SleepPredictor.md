Sleep Predictor Web App
========================================================
author: ggiust
date: Sept 23, 2015
css: SleepPredictor.css
transition: rotate

![](./SleepPredictor-figure/sleepIcon2.png)<br><br>
Developing Data Products, course project<br>
for Johns Hopkins University<br>
Data Science Specialization


The importance of a good night's sleep
========================================================

![](./SleepPredictor-figure/sleepbenefit.png)
***

1. Sleepiness can cause accidents  
  * Exxon Valdez oil spill  
  * 1986 Chernobyl nuclear meltdown  
2. Sleepiness effects health  
  * Heart attack, stroke, etc. 
3. Lack of sleep ages your skin
4. Sleep loss impairs judgement
5. Sleepiness is depressing


Sleep data (by age)
========================================================

![plot of chunk unnamed-chunk-1](SleepPredictor-figure/unnamed-chunk-1-1.png) 
<small>
Source: http://www.stat.go.jp/english/info/news/1949.htm
</small>
***
<small>
Let's compute a person's average and median sleeping hours in R using:

```r
avgSleep<-format(mean(y),digits=2)
medianSleep<-format(median(y),digits=2)
```
which works out to be 7.8 and 7.7 hours, respectively.
</small>

Creating a model to predict sleep
========================================================

![plot of chunk unnamed-chunk-3](SleepPredictor-figure/unnamed-chunk-3-1.png) 
***
<small>
Now let's fit a 2nd order polynomial to the data as follows:

```r
fit<-lm(y ~ x + I(x^2))
pred_y<-predict(fit)
```
and plot it using a <span class="redfont">red line</span>. The computed coefficients are:

```r
fit$coefficients
```

```
(Intercept) poly(x, 2)1 poly(x, 2)2 
   7.843750    1.087364    2.330050 
```
</small>

How much do you sleep?
========================================================

Use the Sleep Predictor web app to find out. Here's how...
<br><br>
<small>
1. Visit: http://garyg.shinyapps.io/DevDataProductsProject<br>
2. Input your age.<br>
3. Read the predicted number of hours of sleep.<br><br>
</small>
![](./SleepPredictor-figure/sleeppred.png)

<!-- http://rstudio-pubs-static.s3.amazonaws.com/27777_55697c3a476640caa0ad2099fe914ae5.html#/6 -->
