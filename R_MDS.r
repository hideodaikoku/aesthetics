
R version 3.5.2 (2018-12-20) -- "Eggshell Igloo"
Copyright (C) 2018 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin15.6.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

During startup - Warning messages:
1: Setting LC_CTYPE failed, using "C" 
2: Setting LC_COLLATE failed, using "C" 
3: Setting LC_TIME failed, using "C" 
4: Setting LC_MESSAGES failed, using "C" 
5: Setting LC_MONETARY failed, using "C" 
[R.app GUI 1.70 (7612) x86_64-apple-darwin15.6.0]

WARNING: You're using a non-UTF8 locale, therefore only ASCII characters will work.
Please read R for Mac OS X FAQ (see Help) section 9 and adjust your system preferences accordingly.
> install.packages('cmdscale')
--- Please select a CRAN mirror for use in this session ---
Warning message:
package 'cmdscale' is not available (for R version 3.5.2)
> setwd('/Users/hideodaikoku/Documents/Comp Music/Experiment/cross-cultural-aesthetics')
> df <- read.csv('output/similarity.csv',header=FALSE,sep=',')
> fit <- cmdscale(df, k=2, eig=FALSE, add=FALSE,x.ret =FALSE)
> x <- fit[,1]
> y <- fit[,2]
plot(x,y,pch=19,col='blue')
> text(x,y, pos=4, labels=song.names, offset=0.5)
> title(main = 'Average Similarity Rating', sub = NULL, xlab = NULL, ylab = NULL,
+       line = NA, outer = FALSE)

