library(vegan)

drops <- c('X') # Drop first column
song.names<-c('African','Gamelan','Javanese','Korean','Flamenco','Gagaku','Bata','Xorasani' ,'Arapaho','Djanba','Samba','Jazz','Ballad','Horo','Varnam','Huju','Concerto','Chamber','Alap','Timbre')

# Load rater 1
okazaki <- read.csv('../perceptual-ratings/similarity/okazaki_SongComparison_1220.csv',sep=",", header=TRUE)
okazaki <- okazaki[ , !(names(okazaki) %in% drops)]
okazaki <- 100 -okazaki # similarity to distance

# Plot MDS
fit <- cmdscale(okazaki,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'Individual Similarity Rating', sub = 'Rater 1', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF

# Load rater 2
satoru <- read.csv('../perceptual-ratings/similarity/satoru_SongComparison_1219.csv',sep=",", header=TRUE)
satoru <- satoru[ , !(names(satoru) %in% drops)]
satoru <- 100 - satoru # similarity to distance

# Plot MDS
fit <- cmdscale(satoru,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'Individual Similarity Rating', sub = 'Rater 2', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF

# Load rater 3
akira <- read.csv('..s/perceptual-ratings/similarity/akira_SongComparison_1223.csv',sep=",", header=TRUE)
akira <- akira[ , !(names(akira) %in% drops)]
akira <- 100 - akira # similarity to distance

# Plot MDS
fit <- cmdscale(akira,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'Individual Similarity Rating', sub = 'Rater 3', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF

# Average MDS
average <- (okazaki + satoru + akira )/3
fit <- cmdscale(average,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'AveragenSimilarity Rating', sub = 'All Raters', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF

# Load Musly
musly <- read.csv('../output/musly.csv',sep=",", header=FALSE)
fit <- cmdscale(musly,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'Automated Analysis', sub = 'Musly', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF

# Load Pohle
pohle <- read.csv('../output/pohle.csv',sep=",", header=FALSE)
fit <- cmdscale(pohle,k=2, eig=TRUE, add=FALSE,x.ret =FALSE)
x <- fit$points[,1]
y <- fit$points[,2]
plot(x,y,pch=19,col='#1ABCBD')
text(x,y, pos=1, labels=song.names, offset=0.5)
title(main = 'Automated Analysis', sub = 'Musly', xlab = NULL, ylab = NULL,line = NA, outer = FALSE)
fit$GOF

#scale from 0 to 1
musly <- data.frame(lapply(musly, function(x) scale(x, center = FALSE, scale = max(x, na.rm = TRUE)/1)))
pohle <- data.frame(lapply(pohlee, function(x) scale(x, center = FALSE, scale = max(x, na.rm = TRUE)/1)))

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
okazaki <- as.dist(okazaki)
satoru <- as.dist(satoru)
akira <- as.dist(akira)
average <- as.dist(average)
musly <- as.dist(musly)
pohle <- as.dist(pohle)
average_algorithmic <- as.dist(average_algorithmic)

# Inter Rater Correlation Values
mantel(okazaki,satoru,permutations=10000,method="spearman")
plot(okazaki,satoru, xlab='Rater 1', ylab='Rater 2', pch=19, col='#1ABCBD')
abline(lm(okazaki~satoru), col="red")
title(main='Inter Rater Correlation')
# Mantel statistic r: 0.1731 
#       Significance: 0.014699 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.100 0.129 0.155 0.183 
# Permutation: free
# Number of permutations: 10000

mantel(akira,satoru,permutations=10000,method="spearman")
plot(akira,satoru, xlab='Rater 3', ylab='Rater 2', pch=19, col='#1ABCBD')
abline(lm(akira~satoru), col="red")
title(main='Inter Rater Correlation')
# mantel(xdis = akira, ydis = satoru, method = "spearman", permutations = 10000) 

# Mantel statistic r: 0.3339 
#       Significance: 9.999e-05 

# Upper quantiles of permutations (null model):
#    90%    95%  97.5%    99% 
# 0.0965 0.1238 0.1503 0.1769 
# Permutation: free
# Number of permutations: 10000

mantel(okazaki,akira,permutations=10000,method="spearman")
plot(okazaki,akira, xlab='Rater 1', ylab='Rater 3', pch=19, col='#1ABCBD')
abline(lm(okazaki~akira), col="red")
title(main='Inter Rater Correlation')
# Mantel statistic r: 0.1369 
#       Significance: 0.042196 

# Upper quantiles of permutations (null model):
#   90%   95% 97.5%   99% 
# 0.101 0.131 0.155 0.181 
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


# Inter - Algorithm Correlations
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
