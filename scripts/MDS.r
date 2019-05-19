library(vegan)

song.names<-c('African','Gamelan','Javanese','Korean','Flamenco','Gagaku','Bata','Xorasani' ,'Arapaho','Djanba','Samba','Jazz','Ballad','Horo','Varnam','Huju','Concerto','Chamber','Alap','Timbre')

# Load rater 1
rater_1 <- read.csv('/Users/hideodaikoku/Documents/Comp Music/cross-cultural-aesthetics/perceptual-ratings/similarity/rater_1.csv',sep=",", header=FALSE)
rater_1 <- 100 -rater_1 # similarity to distance

# Plot MDS
fit <- cmdscale(rater_1,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'Individual Similarity Rating', sub = 'Rater 1', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF
#  0.2961205 0.4124755

# Load rater 2
rater_2 <- read.csv('/Users/hideodaikoku/Documents/Comp Music/cross-cultural-aesthetics/perceptual-ratings/similarity/rater_2.csv',sep=",", header=FALSE)
rater_2 <- 100 - rater_2 # similarity to distance

# Plot MDS
fit <- cmdscale(rater_2,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'Individual Similarity Rating', sub = 'Rater 2', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF
#0.2309549 0.3282796

# Load rater 3
rater_3 <- read.csv('/Users/hideodaikoku/Documents/Comp Music/cross-cultural-aesthetics/perceptual-ratings/similarity/rater_3.csv',sep=",", header=FALSE)
rater_3 <- 100 - rater_3 # similarity to distance

# Plot MDS
fit <- cmdscale(rater_3,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'Individual Similarity Rating', sub = 'Rater 3', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF
#  0.2989685 0.4111484

# Load rater 4
rater_4 <- read.csv('/Users/hideodaikoku/Documents/Comp Music/cross-cultural-aesthetics/perceptual-ratings/similarity/rater_4.csv',sep=",", header=FALSE)
rater_4 <- 100 -rater_4 # similarity to distance

# Plot MDS
fit <- cmdscale(rater_4,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'Individual Similarity Rating', sub = 'Rater 4', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF

# Load rater 5
rater_5 <- read.csv('/Users/hideodaikoku/Documents/Comp Music/cross-cultural-aesthetics/perceptual-ratings/similarity/rater_5.csv',sep=",", header=FALSE)
rater_5 <- 100 -rater_5 # similarity to distance

# Plot MDS
fit <- cmdscale(rater_5,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'Individual Similarity Rating', sub = 'Rater 5', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF

# Average MDS
average <- (rater_1 + rater_2 + rater_3 + rater_4 + rater_5 )/5
fit <- cmdscale(average,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'Average Similarity Rating', sub = 'All Raters', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF
# 0.2597179 0.3002951

# Load Musly
musly <- read.csv('/Users/hideodaikoku/Documents/Comp Music/cross-cultural-aesthetics/output/musly.csv',sep=",", header=FALSE)
fit <- cmdscale(musly,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'Automated Analysis', sub = 'Musly', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF
#  0.2944067 0.2944067

# Load Pohle
pohle <- read.csv('/Users/hideodaikoku/Documents/Comp Music/cross-cultural-aesthetics/output/pohle.csv',sep=",", header=FALSE)
fit <- cmdscale(pohle,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'Automated Analysis', sub = 'Musly', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF

# panteli algorithm implementation
panteli <- read.csv('/Users/hideodaikoku/Documents/Comp Music/cross-cultural-aesthetics/output/result.csv',sep=",", header=FALSE)
fit <- cmdscale(panteli,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'Automated Analysis', sub = 'Panteli', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF

#scale from 0 to 1
musly <- data.frame(lapply(musly, function(x) scale(x, center = FALSE, scale = max(x, na.rm = TRUE)/1)))
pohle <- data.frame(lapply(pohle, function(x) scale(x, center = FALSE, scale = max(x, na.rm = TRUE)/1)))
panteli <- data.frame(lapply(panteli, function(x) scale(x, center = FALSE, scale = max(x, na.rm = TRUE)/1)))
#-------------------------------------------------

# Average Algorithmic
average_algorithmic <- (pohle + musly+ panteli)/3
fit <- cmdscale(average_algorithmic,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'Average Automated Analysis', sub = 'Pohle, Musly and Panteli', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF

#-------------------------------------------------

#convert all to distance matrices
rater_1 <- as.dist(rater_1)
rater_2 <- as.dist(rater_2)
rater_3 <- as.dist(rater_3)
rater_4 <- as.dist(rater_4)
rater_5 <- as.dist(rater_5)
average <- as.dist(average)
musly <- as.dist(musly)
pohle <- as.dist(pohle)
panteli <- as.dist(panteli)
average_algorithmic <- as.dist(average_algorithmic)


# ----------------------------------------------------------- 

# Inter Rater Correlation Values
mantel(rater_1,rater_2,permutations=10000,method="spearman")
plot(rater_1,rater_2, xlab='Rater 1', ylab='Rater 2', pch=19, col='#1ABCBD')
abline(lm(rater_1~rater_2), col="red")
title(main='Inter Rater Correlation')

#Mantel statistic r: 0.0505 
#       Significance: 0.25187 
# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.101 0.130 0.154 0.188 
# Permutation: free
# Number of permutations: 10000

# Inter Rater Correlation Values
mantel(rater_1,rater_3,permutations=10000,method="spearman")
plot(rater_1,rater_3, xlab='Rater 1', ylab='Rater 3', pch=19, col='#1ABCBD')
abline(lm(rater_1~rater_3), col="red")
title(main='Inter Rater Correlation')

# Mantel statistic r: 0.08847 
#       Significance: 0.13969 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.105 0.137 0.162 0.189 
# Permutation: free
# Number of permutations: 10000


# Inter Rater Correlation Values
mantel(rater_1,rater_4,permutations=10000,method="spearman")
plot(rater_1,rater_4, xlab='Rater 1', ylab='Rater 4', pch=19, col='#1ABCBD')
abline(lm(rater_1~rater_4), col="red")
title(main='Inter Rater Correlation')

# Mantel statistic r: 0.05699 
#       Significance: 0.23348 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.102 0.132 0.157 0.183 
# Permutation: free
# Number of permutations: 10000

# Inter Rater Correlation Values
mantel(rater_1,rater_5,permutations=10000,method="spearman")
plot(rater_1,rater_5, xlab='Rater 1', ylab='Rater 5', pch=19, col='#1ABCBD')
abline(lm(rater_1~rater_5), col="red")
title(main='Inter Rater Correlation')

# Mantel statistic r: -0.02246 
#       Significance: 0.61974 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0916 0.1174 0.1373 0.1662 
# Permutation: free
# Number of permutations: 10000

# Rater - Average Correlation Values
mantel(rater_1,average,permutations=10000,method="spearman")
plot(rater_1,average, xlab='Rater 1', ylab='Annotation Average', pch=19, col='#1ABCBD')
abline(lm(rater_1~average), col="red")
title(main='Inter Rater Correlation')
# Mantel statistic r: 0.4896 
#       Significance: 9.999e-05 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.106 0.143 0.177 0.218 
# Permutation: free
# Number of permutations: 10000


# Rater - Algorithm Correlation Values
mantel(rater_1,pohle,permutations=10000,method="spearman")
plot(rater_1,pohle, xlab='Rater 1', ylab='Pohle', pch=19, col='#1ABCBD')
abline(lm(rater_1~pohle), col="red")
title(main='Rater Algorithm Correlation')
# Mantel statistic r: 0.1647 
#       Significance: 0.036496 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.121 0.151 0.180 0.215 
# Permutation: free
# Number of permutations: 10000

# Rater - Algorithm Correlation Values
mantel(rater_1,musly,permutations=10000,method="spearman")
plot(rater_1,musly, xlab='Rater 1', ylab='Musly', pch=19, col='#1ABCBD')
abline(lm(rater_1~musly), col="red")
title(main='Rater Algorithm Correlation')
# Mantel statistic r: 0.1696 
#       Significance: 0.021098 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.105 0.136 0.164 0.193 
# Permutation: free
# Number of permutations: 10000

mantel(rater_1,average_algorithmic,permutations=10000,method="spearman")
plot(rater_1,average_algorithmic, xlab='Rater 1', ylab='Algorithm Average', pch=19, col='#1ABCBD')
abline(lm(rater_1~average_algorithmic), col="red")
title(main='Rater Algorithm Correlation')
# Mantel statistic r: 0.1238 
#       Significance: 0.10429 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.126 0.159 0.186 0.216 
# Permutation: free
# Number of permutations: 10000



mantel(rater_1,panteli,permutations=10000,method="spearman")
plot(rater_1,panteli, xlab='Rater 1', ylab='Panteli', pch=19, col='#1ABCBD')
abline(lm(rater_1~panteli), col="red")
title(main='Rater Algorithm Correlation')

# Mantel statistic r: -0.06728 
#       Significance: 0.77012 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.120 0.154 0.181 0.212 
# Permutation: free
# Number of permutations: 10000


# ----------------------------------------------------------- 

mantel(rater_2,rater_3,permutations=10000,method="spearman")
plot(rater_2,rater_3, xlab='Rater 2', ylab='Rater 3', pch=19, col='#1ABCBD')
abline(lm(rater_2~rater_3), col="red")
title(main='Inter Rater Correlation')
# Mantel statistic r: 0.1814 
#       Significance: 0.0093991 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0965 0.1262 0.1494 0.1787 
# Permutation: free
# Number of permutations: 10000

# Inter Rater Correlation Values
mantel(rater_2,rater_4,permutations=10000,method="spearman")
plot(rater_2,rater_4, xlab='Rater 2', ylab='Rater 4', pch=19, col='#1ABCBD')
abline(lm(rater_2~rater_4), col="red")
title(main='Inter Rater Correlation')
# Mantel statistic r: 0.004377 
#       Significance: 0.47505 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0952 0.1224 0.1471 0.1793 
# Permutation: free
# Number of permutations: 10000


# Inter Rater Correlation Values
mantel(rater_2,rater_5,permutations=10000,method="spearman")
plot(rater_2,rater_5, xlab='Rater 2', ylab='Rater 5', pch=19, col='#1ABCBD')
abline(lm(rater_2~rater_5), col="red")
title(main='Inter Rater Correlation')
# Mantel statistic r: 0.01257 
#       Significance: 0.42606 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0919 0.1175 0.1416 0.1685 
# Permutation: free
# Number of permutations: 10000

# Rater - Average Correlation Values
mantel(rater_2,average,permutations=10000,method="spearman")
plot(rater_2,average, xlab='Rater 2', ylab='Annotation Average', pch=19, col='#1ABCBD')
abline(lm(rater_1~average), col="red")
title(main='Inter Rater Correlation')
# Mantel statistic r: 0.3473 
#       Significance: 9.999e-05 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0966 0.1223 0.1482 0.1781 
# Permutation: free
# Number of permutations: 10000


# Rater - Algorithm Correlation Values
mantel(rater_2,pohle,permutations=10000,method="spearman")
plot(rater_2,pohle, xlab='Rater 2', ylab='Pohle', pch=19, col='#1ABCBD')
abline(lm(rater_2~pohle), col="red")
title(main='Rater Algorithm Correlation')
# Mantel statistic r: 0.05921 
#       Significance: 0.22668 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.101 0.129 0.152 0.177 
# Permutation: free
# Number of permutations: 10000



# Rater - Algorithm Correlation Values
mantel(rater_2,musly,permutations=10000,method="spearman")
plot(rater_2,musly, xlab='Rater 2', ylab='Musly', pch=19, col='#1ABCBD')
abline(lm(rater_2~musly), col="red")
title(main='Rater Algorithm Correlation')
# Mantel statistic r: -0.05487 
#       Significance: 0.76562 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0971 0.1232 0.1491 0.1755 
# Permutation: free
# Number of permutations: 10000

# ----------------------------------------------------------- 

mantel(rater_2,panteli,permutations=10000,method="spearman")
plot(rater_2,panteli, xlab='Rater 2', ylab='Panteli', pch=19, col='#1ABCBD')
abline(lm(rater_2~panteli), col="red")
title(main='Rater Algorithm Correlation')

# Mantel statistic r: 0.005348 
#       Significance: 0.48085 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0987 0.1260 0.1511 0.1865 
# Permutation: free
# Number of permutations: 10000

mantel(rater_2,average_algorithmic,permutations=10000,method="spearman")
plot(rater_2,average_algorithmic, xlab='Rater 2', ylab='Algorithm Average', pch=19, col='#1ABCBD')
abline(lm(rater_2~average_algorithmic), col="red")
title(main='Rater Algorithm Correlation')

# Mantel statistic r: 0.01113 
#       Significance: 0.44356 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.103 0.130 0.153 0.182 
# Permutation: free
# Number of permutations: 10000


# ----------------------------------------------------------- 

# Inter Rater Correlation Values
mantel(rater_3,rater_4,permutations=10000,method="spearman")
plot(rater_3,rater_4, xlab='Rater 3', ylab='Rater 4', pch=19, col='#1ABCBD')
abline(lm(rater_3~rater_4), col="red")
title(main='Inter Rater Correlation')
# Mantel statistic r: -0.04555 
#       Significance: 0.71793 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0944 0.1225 0.1472 0.1742 
# Permutation: free
# Number of permutations: 10000

# Inter Rater Correlation Values
mantel(rater_3,rater_5,permutations=10000,method="spearman")
plot(rater_3,rater_5, xlab='Rater 3', ylab='Rater 5', pch=19, col='#1ABCBD')
abline(lm(rater_3~rater_5), col="red")
title(main='Inter Rater Correlation')
# Mantel statistic r: -0.0789 
#       Significance: 0.85781 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0934 0.1178 0.1408 0.1642 
# Permutation: free
# Number of permutations: 10000

# Inter Rater Correlation Values


# Rater - Average Correlation Values
mantel(rater_3,average,permutations=10000,method="spearman")
plot(rater_3,average, xlab='Rater 3', ylab='Annotation Average', pch=19, col='#1ABCBD')
abline(lm(rater_3~average), col="red")
title(main='Inter Rater Correlation')
# Mantel statistic r: 0.3547 
#       Significance: 9.999e-05 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0998 0.1301 0.1534 0.1869 
# Permutation: free
# Number of permutations: 10000

# Rater - Algorithm Correlation Values
mantel(rater_3,pohle,permutations=10000,method="spearman")
plot(rater_3,pohle, xlab='Rater 3', ylab='Pohle', pch=19, col='#1ABCBD')
abline(lm(rater_3~pohle), col="red")
title(main='Rater Algorithm Correlation')
# Mantel statistic r: 0.2223 
#       Significance: 0.0066993 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.110 0.142 0.170 0.203 
# Permutation: free
# Number of permutations: 10000

# Rater - Algorithm Correlation Values
mantel(rater_3,musly,permutations=10000,method="spearman")
plot(rater_3,musly, xlab='Rater 3', ylab='Musly', pch=19, col='#1ABCBD')
abline(lm(rater_3~musly), col="red")
title(main='Rater Algorithm Correlation')
# Mantel statistic r: -0.07322 
#       Significance: 0.83392 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.100 0.128 0.157 0.192 
# Permutation: free
# Number of permutations: 10000

# ----------------------------------------------------------- 

mantel(rater_3,panteli,permutations=10000,method="spearman")
plot(rater_3,panteli, xlab='Rater 3', ylab='Panteli', pch=19, col='#1ABCBD')
abline(lm(rater_3~panteli), col="red")
title(main='Rater Algorithm Correlation')

# Mantel statistic r: 0.04887 
#       Significance: 0.28017 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.109 0.141 0.171 0.202 
# Permutation: free
# Number of permutations: 10000

mantel(rater_3,average_algorithmic,permutations=10000,method="spearman")
plot(rater_3,average_algorithmic, xlab='Rater 3', ylab='Algorithm Average', pch=19, col='#1ABCBD')
abline(lm(rater_3~average_algorithmic), col="red")
title(main='Rater Algorithm Correlation')

# Mantel statistic r: 0.149 
#       Significance: 0.044696 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.114 0.145 0.173 0.208 
# Permutation: free
# Number of permutations: 10000


# ----------------------------------------------------------- 
mantel(rater_4,rater_5,permutations=10000,method="spearman")
plot(rater_4,rater_5, xlab='Rater 4', ylab='Rater 5', pch=19, col='#1ABCBD')
abline(lm(rater_4~rater_5), col="red")
title(main='Inter Rater Correlation')

# Mantel statistic r: 0.06488 
#       Significance: 0.19028 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0944 0.1210 0.1448 0.1695 
# Permutation: free
# Number of permutations: 10000

# Rater - Average Correlation Values
mantel(rater_4,average,permutations=10000,method="spearman")
plot(rater_4,average, xlab='Rater 4', ylab='Annotation Average', pch=19, col='#1ABCBD')
abline(lm(rater_4~average), col="red")
title(main='Inter Rater Correlation')
# Mantel statistic r: 0.5887 
#       Significance: 9.999e-05 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0966 0.1218 0.1481 0.1730 
# Permutation: free
# Number of permutations: 10000


# Rater - Algorithm Correlation Values
mantel(rater_4,pohle,permutations=10000,method="spearman")
plot(rater_4,pohle, xlab='Rater 4', ylab='Pohle', pch=19, col='#1ABCBD')
abline(lm(rater_4~pohle), col="red")
title(main='Rater Algorithm Correlation')
# Mantel statistic r: 0.09232 
#       Significance: 0.12069 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.101 0.131 0.159 0.190 
# Permutation: free
# Number of permutations: 10000


# Rater - Algorithm Correlation Values
mantel(rater_4,musly,permutations=10000,method="spearman")
plot(rater_4,musly, xlab='Rater 4', ylab='Musly', pch=19, col='#1ABCBD')
abline(lm(rater_4~musly), col="red")
title(main='Rater Algorithm Correlation')
# Mantel statistic r: 0.01553 
#       Significance: 0.42206 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.096 0.124 0.147 0.173 
# Permutation: free
# Number of permutations: 10000

# ----------------------------------------------------------- 

mantel(rater_4,panteli,permutations=10000,method="spearman")
plot(rater_4,panteli, xlab='Rater 4', ylab='Panteli', pch=19, col='#1ABCBD')
abline(lm(rater_4~panteli), col="red")
title(main='Rater Algorithm Correlation')

# Mantel statistic r: 0.06788 
#       Significance: 0.18768 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.101 0.129 0.152 0.179 
# Permutation: free
# Number of permutations: 10000

mantel(rater_4,average_algorithmic,permutations=10000,method="spearman")
plot(rater_4,average_algorithmic, xlab='Rater 4', ylab='Algorithm Average', pch=19, col='#1ABCBD')
abline(lm(rater_4~average_algorithmic), col="red")
title(main='Rater Algorithm Correlation')

# Mantel statistic r: 0.1013 
#       Significance: 0.10319 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.103 0.132 0.156 0.180 
# Permutation: free
# Number of permutations: 10000


# ----------------------------------------------------------- 

# Rater - Average Correlation Values
mantel(rater_5,average,permutations=10000,method="spearman")
plot(rater_5,average, xlab='Rater 5', ylab='Annotation Average', pch=19, col='#1ABCBD')
abline(lm(rater_5~average), col="red")
title(main='Inter Rater Correlation')
# Mantel statistic r: 0.326 
#       Significance: 9.999e-05 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0913 0.1163 0.1406 0.1646 
# Permutation: free
# Number of permutations: 10000

# Rater - Algorithm Correlation Values
mantel(rater_5,pohle,permutations=10000,method="spearman")
plot(rater_5,pohle, xlab='Rater 5', ylab='Pohle', pch=19, col='#1ABCBD')
abline(lm(rater_5~pohle), col="red")
title(main='Rater Algorithm Correlation')
# Mantel statistic r: -0.03734 
#       Significance: 0.70353 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0915 0.1161 0.1361 0.1598 
# Permutation: free
# Number of permutations: 10000

# Rater - Algorithm Correlation Values
mantel(rater_5,musly,permutations=10000,method="spearman")
plot(rater_5,musly, xlab='Rater 5', ylab='Musly', pch=19, col='#1ABCBD')
abline(lm(rater_5~musly), col="red")
title(main='Rater Algorithm Correlation')
# Mantel statistic r: 0.08641 
#       Significance: 0.11549 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.093 0.120 0.141 0.166 
# Permutation: free
# Number of permutations: 10000


# ----------------------------------------------------------- 

mantel(rater_5,panteli,permutations=10000,method="spearman")
plot(rater_5,panteli, xlab='Rater 5', ylab='Panteli', pch=19, col='#1ABCBD')
abline(lm(rater_5~panteli), col="red")
title(main='Rater Algorithm Correlation')

# Mantel statistic r: -0.1103 
#       Significance: 0.94101 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0925 0.1188 0.1401 0.1663 
# Permutation: free
# Number of permutations: 10000

mantel(rater_5,average_algorithmic,permutations=10000,method="spearman")
plot(rater_5,average_algorithmic, xlab='Rater 5', ylab='Algorithm Average', pch=19, col='#1ABCBD')
abline(lm(rater_5~average_algorithmic), col="red")
title(main='Rater Algorithm Correlation')

# Mantel statistic r: -0.001574 
#       Significance: 0.50735 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0891 0.1150 0.1376 0.1639 
# Permutation: free
# Number of permutations: 10000

# ----------------------------------------------------------- 

# Inter - Algorithm Correlations
mantel(musly,pohle,permutations=10000,method="spearman")
plot(musly,pohle, xlab='Musly', ylab='Pohle', pch=19, col='#1ABCBD')
abline(lm(musly~pohle), col="red")
title(main='Inter Algorithm Correlation')

# Mantel statistic r: 0.1056 
#       Significance: 0.10629 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.110 0.142 0.170 0.206 
# Permutation: free
# Number of permutations: 10000

# ----------------------------------------------------------- 

mantel(musly,panteli,permutations=10000,method="spearman")
# Mantel statistic r: -0.0718 
#       Significance: 0.80662 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.109 0.144 0.174 0.203 
# Permutation: free
# Number of permutations: 10000

mantel(pohle,panteli,permutations=10000,method="spearman")

# Mantel statistic r: -0.06842 
#       Significance: 0.75992 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.125 0.162 0.193 0.235 
# Permutation: free
# Number of permutations: 10000

mantel(panteli,average,permutations=10000,method="spearman")

# Mantel statistic r: 0.05396 
#       Significance: 0.25237 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.107 0.138 0.163 0.193 
# Permutation: free
# Number of permutations: 10000
# ----------------------------------------------------------- 

mantel(pohle,average,permutations=10000,method="spearman")
# Mantel statistic r: 0.1704 
#       Significance: 0.019098 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.105 0.134 0.159 0.189 
# Permutation: free
# Number of permutations: 10000


mantel(musly,average,permutations=10000,method="spearman")
# Mantel statistic r: -0.07954 
#       Significance: 0.84702 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0962 0.1246 0.1461 0.1732 
# Permutation: free
# Number of permutations: 10000
# ----------------------------------------------------------- 
mantel(pohle,average_algorithmic,permutations=10000,method="spearman")
# Mantel statistic r: 0.5517 
#       Significance: 9.999e-05 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.133 0.168 0.197 0.234 
# Permutation: free
# Number of permutations: 10000

mantel(musly,average_algorithmic,permutations=10000,method="spearman")
# Mantel statistic r: 0.4184 
#       Significance: 9.999e-05 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.109 0.140 0.169 0.197 
# Permutation: free
# Number of permutations: 10000



mantel(panteli,average_algorithmic,permutations=10000,method="spearman")
# Mantel statistic r: 0.6205 
#       Significance: 9.999e-05 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.126 0.161 0.190 0.224 
# Permutation: free
# Number of permutations: 10000

# Algorithm-Human Correlations
mantel(average,average_algorithmic,permutations=10000,method="spearman")
plot(average,average_algorithmic, xlab='Human', ylab='Algorithm', pch=19, col='#1ABCBD')
abline(lm(average~average_algorithmic), col="red")
title(main='Human vs. Algorithm Correlation')

# Mantel statistic r: 0.1707 
#       Significance: 0.027297 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.115 0.146 0.174 0.203 
# Permutation: free
# Number of permutations: 10000

# ----------------------------------------------------------- 
library('MASS')

fit <- isoMDS(average, y = cmdscale(average, 2), k = 2, maxit = 50, trace = TRUE,tol = 1e-3, p = 2)
# initial  value 34.580332 
# final  value 31.465088 
# converged
x <- fit$points[,1]
y <- fit$points[,2]
plot(x, y, xlab="x", ylab="y",main="Annotation Average", pch=19,col='#1ABCBD')
text(x, y, pos=1, labels = song.names, cex=.7) 

fit <- isoMDS(average_algorithmic, y = cmdscale(average_algorithmic, 2), k = 2, maxit = 50, trace = TRUE,tol = 1e-3, p = 2)
# initial  value 29.659587 
# iter   5 value 24.169760
# final  value 23.517682 
# converged
x <- fit$points[,1]
y <- fit$points[,2]
plot(x, y, xlab="x", ylab="y",main="Algorithm Average", pch=19,col='#1ABCBD')
text(x, y, pos=1, labels = song.names, cex=.7) 