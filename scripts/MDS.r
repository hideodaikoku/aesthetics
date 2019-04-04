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

# Average MDS
average <- (rater_1 + rater_2 + rater_3 )/3
fit <- cmdscale(average,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'Average Similarity Rating', sub = 'All Raters', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF
# 0.2925181 0.3550856

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

#scale from 0 to 1
musly <- data.frame(lapply(musly, function(x) scale(x, center = FALSE, scale = max(x, na.rm = TRUE)/1)))
pohle <- data.frame(lapply(pohle, function(x) scale(x, center = FALSE, scale = max(x, na.rm = TRUE)/1)))

# Average Algorithmic
average_algorithmic <- (pohle + musly)/2
fit <- cmdscale(average_algorithmic,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'Average Automated Analysis', sub = 'Pohle and Musly', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF

#convert all to distance matrices
rater_1 <- as.dist(rater_1)
rater_2 <- as.dist(rater_2)
rater_3 <- as.dist(rater_3)
average <- as.dist(average)
musly <- as.dist(musly)
pohle <- as.dist(pohle)
average_algorithmic <- as.dist(average_algorithmic)

# Inter Rater Correlation Values
mantel(rater_1,rater_2,permutations=10000,method="spearman")
plot(rater_1,rater_2, xlab='Rater 1', ylab='Rater 2', pch=19, col='#1ABCBD')
abline(lm(rater_1~rater_2), col="red")
title(main='Inter Rater Correlation')
# Mantel statistic r: 0.03844 
#       Significance: 0.30577 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.100 0.128 0.154 0.183 
# Permutation: free
# Number of permutations: 10000

mantel(rater_3,rater_2,permutations=10000,method="spearman")
plot(rater_3,rater_2, xlab='Rater 3', ylab='Rater 2', pch=19, col='#1ABCBD')
abline(lm(rater_3~rater_2), col="red")
title(main='Inter Rater Correlation')
# Mantel statistic r: 0.1814 
#       Significance: 0.0077992 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0978 0.1260 0.1465 0.1729 
# Permutation: free
# Number of permutations: 10000

mantel(rater_1,rater_3,permutations=10000,method="spearman")
plot(rater_1,rater_3, xlab='Rater 1', ylab='Rater 3', pch=19, col='#1ABCBD')
abline(lm(rater_1~rater_3), col="red")
title(main='Inter Rater Correlation')
# Mantel statistic r: 0.1152 
#       Significance: 0.087191 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.108 0.140 0.168 0.202 
# Permutation: free
# Number of permutations: 10000


# Inter - Algorithm Correlations
mantel(musly,pohle,permutations=10000,method="spearman")
plot(musly,pohle, xlab='Musly 1', ylab='Pohle', pch=19, col='#1ABCBD')
abline(lm(musly~pohle), col="red")
title(main='Inter Algorithm Correlation')

# Mantel statistic r: 0.1056 
#       Significance: 0.10629 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.110 0.142 0.170 0.206 
# Permutation: free
# Number of permutations: 10000


# Algorithm-Human Correlations
mantel(average,average_algorithmic,permutations=10000,method="spearman")
plot(average,average_algorithmic, xlab='Human', ylab='Algorithm', pch=19, col='#1ABCBD')
abline(lm(average~average_algorithmic), col="red")
title(main='Human vs. Algorithm Correlation')

# Mantel statistic r: 0.03652 
#       Significance: 0.31777 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.104 0.132 0.158 0.189 
# Permutation: free
# Number of permutations: 10000
