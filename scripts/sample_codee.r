library(ade4)
library(vegan)
#First, check spreadsheet for errors, save as .csv spreadsheet with first row=CantoCoreID and rows 2-44= CC1-26+CMPerformance+2 Instrumental
#open R, change workspace to correct folder (“Taiwan Music Gene Correlation”)

#import spreadsheet
taiwan<-as.matrix(read.csv("Taiwan259SongFinalSampleCCCMInstHemitonicityNominal.csv",row.names=1,header=TRUE))

#add distance matrix algorithm
ordinal.fn<-function (x,y) {
if(is.na(x)|is.na(y))"NA" else
abs(x-y)}


weightedv6.dist<-function(d,ord,nom) {

d[d==""]<-NA

nominal<-cbind(d[,nom])

nominal.fields<-vector("list",length=length(nominal[1,]))

for (i in 1:length(nominal[1,])) {nominal.fields[[i]]<-matrix(nrow=length(nominal[,1]),ncol=13)}

for (i in 1:length(nominal[1,])) {rownames(nominal.fields[[i]])<-rownames(nominal)}

for (i in 1:length(nominal[1,])) {colnames(nominal.fields[[i]])<-c("a","b","c","d","e","f","g","h","i","j","k","l","m")}

for (j in 1:13){
for (k in 1:length(nominal[,1])){
for (i in 1:length(nominal[1,])){nominal.fields[[i]][k,j]<-(if(is.na(nominal[k,i]))"NA" else if(substr(nominal[k,i],1,1)==colnames(nominal.fields[[i]])[j] | substr(nominal[k,i],2,2)==colnames(nominal.fields[[i]])[j] |substr(nominal[k,i],3,3)==colnames(nominal.fields[[i]])[j] |substr(nominal[k,i],4,4)==colnames(nominal.fields[[i]])[j] |substr(nominal[k,i],5,5)==colnames(nominal.fields[[i]])[j] |substr(nominal[k,i],6,6)==colnames(nominal.fields[[i]])[j] |substr(nominal[k,i],7,7)==colnames(nominal.fields[[i]])[j] |substr(nominal[k,i],8,8)==colnames(nominal.fields[[i]])[j] |substr(nominal[k,i],9,9)==colnames(nominal.fields[[i]])[j] |substr(nominal[k,i],10,10)==colnames(nominal.fields[[i]])[j] |substr(nominal[k,i],11,11)==colnames(nominal.fields[[i]])[j] |substr(nominal[k,i],12,12)==colnames(nominal.fields[[i]])[j] |substr(nominal[k,i],13,13)==colnames(nominal.fields[[i]])[j])1 else 0) }}}

suppressWarnings(for (i in 1:length(nominal[1,])){storage.mode(nominal.fields[[i]])<-"numeric"})

nominal.dist<-vector("list",length=length(nominal[1,]))

for (i in 1:length(nominal[1,])) {nominal.dist[[i]]<-matrix(nrow=length(nominal[,1]),ncol=length(nominal[,1]))}

nominal.result<-matrix(nrow=length(d[,1]),ncol=length(d[,1]),c(rep(0,(length(d[,1])*length(d[,1])))))

ordinal<-cbind(d[,ord])
suppressWarnings(storage.mode(ordinal)<-"numeric")

ordinal.dist<-vector("list",length=length(ordinal[1,]))

for (i in 1:length(ordinal[1,])) {ordinal.dist[[i]]<-matrix(nrow=length(ordinal[,1]),ncol=length(ordinal[,1]))}

ordinal.result<-matrix(nrow=length(d[,1]),ncol=length(d[,1]),c(rep(0,(length(d[,1])*length(d[,1])))))

result<-matrix(nrow=length(d[,1]),ncol=length(d[,1]))



for (k in 1:length(nominal[,1])){
for (j in 1:length(nominal[,1])){
for (i in 1:length(nominal[1,])){nominal.dist[[i]][k,j]<-if(is.na(nominal.fields[[i]][k,1])|is.na(nominal.fields[[i]][j,1]))"NA" else ((if(nominal.fields[[i]][k,1]==nominal.fields[[i]][j,1])0 else 1)+(if(nominal.fields[[i]][k,2]==nominal.fields[[i]][j,2])0 else 1)+(if(nominal.fields[[i]][k,3]==nominal.fields[[i]][j,3])0 else 1)+(if(nominal.fields[[i]][k,4]==nominal.fields[[i]][j,4])0 else 1)+(if(nominal.fields[[i]][k,5]==nominal.fields[[i]][j,5])0 else 1)+(if(nominal.fields[[i]][k,6]==nominal.fields[[i]][j,6])0 else 1)+(if(nominal.fields[[i]][k,7]==nominal.fields[[i]][j,7])0 else 1)+(if(nominal.fields[[i]][k,8]==nominal.fields[[i]][j,8])0 else 1)+(if(nominal.fields[[i]][k,9]==nominal.fields[[i]][j,9])0 else 1)+(if(nominal.fields[[i]][k,10]==nominal.fields[[i]][j,10])0 else 1)+(if(nominal.fields[[i]][k,11]==nominal.fields[[i]][j,11])0 else 1)+(if(nominal.fields[[i]][k,12]==nominal.fields[[i]][j,12])0 else 1))/((if(nominal.fields[[i]][k,1]==1 | nominal.fields[[i]][[j,1]]==1)1 else 0)+(if(nominal.fields[[i]][k,2]==1 | nominal.fields[[i]][[j,2]]==1)1 else 0)+(if(nominal.fields[[i]][k,3]==1 | nominal.fields[[i]][[j,3]]==1)1 else 0)+(if(nominal.fields[[i]][k,4]==1 | nominal.fields[[i]][[j,4]]==1)1 else 0)+(if(nominal.fields[[i]][k,5]==1 | nominal.fields[[i]][[j,5]]==1)1 else 0)+(if(nominal.fields[[i]][k,6]==1 | nominal.fields[[i]][[j,6]]==1)1 else 0)+(if(nominal.fields[[i]][k,7]==1 | nominal.fields[[i]][[j,7]]==1)1 else 0)+(if(nominal.fields[[i]][k,8]==1 | nominal.fields[[i]][[j,8]]==1)1 else 0)+(if(nominal.fields[[i]][k,9]==1 | nominal.fields[[i]][[j,9]]==1)1 else 0)+(if(nominal.fields[[i]][k,10]==1 | nominal.fields[[i]][[j,10]]==1)1 else 0)+(if(nominal.fields[[i]][k,11]==1 | nominal.fields[[i]][[j,11]]==1)1 else 0)+(if(nominal.fields[[i]][k,12]==1 | nominal.fields[[i]][[j,12]]==1)1 else 0))}}}
suppressWarnings(for (i in 1:length(nominal[1,])){storage.mode(nominal.dist[[i]])<-"numeric"})

vnom<-vector(mode="numeric",length=length(nominal[1,]))
for (k in 1:length(nominal[,1])){
for (j in 1:length(nominal[,1])){
for (i in 1:length(nominal[1,])){
  vnom[i]<-nominal.dist[[i]][k,j]
  }
  nominal.result[k,j]<-mean(suppressWarnings(as.numeric(vnom)),na.rm=TRUE)
  }}

for (k in 1:length(ordinal[,1])){
for (j in 1:length(ordinal[,1])){
for (i in 1:length(ordinal[1,])){ordinal.dist[[i]][k,j]<-ordinal.fn(x=ordinal[k,i],y=ordinal[j,i]) }}}
suppressWarnings(for (i in 1:length(ordinal[1,])){storage.mode(ordinal.dist[[i]])<-"numeric"})

vord<-vector(mode="numeric",length=length(ordinal[1,]))
for (k in 1:length(ordinal[,1])){
for (j in 1:length(ordinal[,1])){
for (i in 1:length(ordinal[1,])){
  vord[i]<-ordinal.dist[[i]][k,j]
  }
  ordinal.result[k,j]<-mean(suppressWarnings(as.numeric(vord)),na.rm=TRUE)
  }}


for (k in 1:length(nominal[,1])){
for (j in 1:length(nominal[,1])){
result[k,j]<-if(is.na(nominal.result[k,j]))ordinal.result[k,j] else if(is.na(ordinal.result[k,j])) nominal.result[k,j] else (ordinal.result[k,j]*length(ord) + nominal.result[k,j]*length(nom))/(length(ord)+length(nom))
}}

row.names(result)<-row.names(d)
colnames(result)<-row.names(d)
as.dist(result)
}

#TAIWAN 259-SONG REANALYSIS
#w/ instruments
taiwan.dist<-weightedv6.dist(taiwan,c(5:7,10,12:13,15:17,19,21:23,26:41),c(1:4,8:9,11,14,18,20,24:25,42:43))
#NB: This treats hemitonicity as nominal, not ordinal, because that’s how it used to be coded
taiwan.euc.dist<-lingoes(taiwan.dist)
taiwan.sq.euc.dist<-(taiwan.euc.dist)^2
taiwan.sq.euc.frame<-as.data.frame(as.matrix(taiwan.sq.euc.dist))
taiwan.sq.euc.frame[upper.tri(taiwan.sq.euc.frame)] <- NA 
write.table(taiwan.sq.euc.frame,"TaiwanCCEucDist.txt",na="", row.names=FALSE)
#COPY THIS DISTANCE MATRIX INTO THE DISTNACE MATRIX SECTION OF THE ARLEQUIN .ARP FILE AND RUN AMOVA USING PROVIDED DISTANCE MATRIX, THEN COPY RESULTING FST TABLES AND SAVE AS FOLLOWING .CSV FILES
#w/out instruments
taiwan.dist<-weightedv6.dist(taiwan,c(5:7,10,12:13,15:17,19,21:23,26:41),c(1:4,8:9,11,14,18,20,24:25))
#NB: This treats hemitonicity as nominal, not ordinal, because that’s how it used to be coded
taiwan.euc.dist<-lingoes(taiwan.dist)
taiwan.sq.euc.dist<-(taiwan.euc.dist)^2
taiwan.sq.euc.frame<-as.data.frame(as.matrix(taiwan.sq.euc.dist))
taiwan.sq.euc.frame[upper.tri(taiwan.sq.euc.frame)] <- NA 
write.table(taiwan.sq.euc.frame,"TaiwanCCEucDist.txt",na="", row.names=FALSE)
#COPY THIS DISTANCE MATRIX INTO THE DISTNACE MATRIX SECTION OF THE ARLEQUIN .ARP FILE AND RUN AMOVA USING PROVIDED DISTANCE MATRIX
#After saving this .arp (or other files, e.g., .txt) MAKE SURE TO OPEN IT ONCE WITH EXCEL IN WINDOWS AND RE-SAVE IT AS .TXT, OTHERWISE THE FORMATTING GETS ALL MESSED UP!!!
# THEN COPY RESULTING FST TABLES AND SAVE AS FOLLOWING .CSV FILES
#CM Performance only (double-check)
taiwan<-as.matrix(read.csv("Taiwan259SongFinalSampleCCCMPerf17HemitonicityNominal.csv",row.names=1,header=TRUE))
taiwan.dist<-weightedv6.dist(taiwan,c(27:43),c(44))
taiwan.euc.dist<-lingoes(taiwan.dist)
taiwan.sq.euc.dist<-(taiwan.euc.dist)^2
taiwan.sq.euc.frame<-as.data.frame(as.matrix(taiwan.sq.euc.dist))
taiwan.sq.euc.frame[upper.tri(taiwan.sq.euc.frame)] <- NA 
write.table(taiwan.sq.euc.frame,"TaiwanCCEucDist.txt",na="", row.names=FALSE)



taiwan259CCFst.dist<-as.dist(read.csv("Taiwan259CCMusicFstSqEuc9Tribe.csv",header=TRUE,row.names=1))
taiwanjeanFst.dist<-as.dist(read.csv("Taiwan9DistJean.csv",header=TRUE,row.names=1))
mantel(taiwan259CCFst.dist,taiwanjeanFst.dist,permutations=10000,method="spearman")

Mantel statistic r: 0.3048 
      Significance: 0.054395 
taiwanalbertoldFst.dist<-as.dist(read.csv("Taiwan9DistAlbertOld.csv",header=TRUE,row.names=1))
mantel(taiwan259CCFst.dist,taiwanalbertoldFst.dist,permutations=10000,method="spearman")

Mantel statistic r: 0.2019 
      Significance: 0.18168




taiwan259CCFst.dist<-as.dist(read.csv("RzeszutekEtAlCantometricsFstTaiwan9Tribes(ScienceSupplementaryFigures).csv",header=TRUE,row.names=1))


FULL CANTOMETRICS
taiwanfullcm<-as.matrix(read.csv("Taiwan259SongFinalSampleCantometrics.csv",row.names=1,header=TRUE))
taiwanfullcm.dist<-weightedv6.dist(taiwanfullcm,c(5:6,9,10,17,19:21,23:37),c(1:4,7,11:16,18,22))

taiwanfullcm.euc.dist<-lingoes(taiwanfullcm.dist)
taiwanfullcm.sq.euc.dist<-(taiwanfullcm.euc.dist)^2
taiwanfullcm.sq.euc.frame<-as.data.frame(as.matrix(taiwanfullcm.sq.euc.dist))
taiwanfullcm.sq.euc.frame[upper.tri(taiwanfullcm.sq.euc.frame)] <- NA 
write.table(taiwanfullcm.sq.euc.frame,"TaiwanFullCMEucDist.txt",na="", row.names=FALSE)

#COPY THIS DISTANCE MATRIX INTO THE DISTNACE MATRIX SECTION OF THE ARLEQUIN .ARP FILE AND RUN AMOVA USING PROVIDED DISTANCE MATRIX, THEN COPY RESULTING FST TABLES AND SAVE AS FOLLOWING .CSV FILES
taiwan259CMFst.dist<-as.dist(read.csv("Taiwan259CMMusicFstSqEuc9Tribe.csv",header=TRUE,row.names=1))
taiwanjeanFst.dist<-as.dist(read.csv("Taiwan9DistJean.csv",header=TRUE,row.names=1))
mantel(taiwan259CMFst.dist,taiwanjeanFst.dist,permutations=10000,method="spearman")
cm.jean.lm<-lm(taiwanjeanFst.dist~taiwan259CMFst.dist)
plot(taiwan259CMFst.dist, taiwanjeanFst.dist)
Mantel statistic r: 0.3035 
      Significance: 0.069493 



taiwanalbertoldFst.dist<-as.dist(read.csv("Taiwan9DistAlbertOld.csv",header=TRUE,row.names=1))
mantel(taiwan259CMFst.dist,taiwanalbertoldFst.dist,permutations=10000,method="spearman")
cm.albertold.lm<-lm(taiwanalbertoldFst.dist~taiwan259CMFst.dist)
plot(taiwan259CMFst.dist, taiwanalbertoldFst.dist)
Mantel statistic r: 0.2892 
      Significance: 0.10719


CANTOMETRICS-STRUCTURE
taiwanfullcm<-as.matrix(read.csv("Taiwan259SongFinalSampleCantometrics.csv",row.names=1,header=TRUE))
taiwanstruccm.dist<-weightedv6.dist(taiwanfullcm,c(10,17,19:21),c(1,4,7,11,12,15:16,18,22))

taiwanstruccm.euc.dist<-lingoes(taiwanstruccm.dist)
taiwanstruccm.sq.euc.dist<-(taiwanstruccm.euc.dist)^2
taiwanstruccm.sq.euc.frame<-as.data.frame(as.matrix(taiwanstruccm.sq.euc.dist))
taiwanstruccm.sq.euc.frame[upper.tri(taiwanstruccm.sq.euc.frame)] <- NA 
write.table(taiwanstruccm.sq.euc.frame,"TaiwanStrucCMEucDist.txt",na="", row.names=FALSE)
#COPY THIS DISTANCE MATRIX INTO THE DISTNACE MATRIX SECTION OF THE ARLEQUIN .ARP FILE AND RUN AMOVA USING PROVIDED DISTANCE MATRIX, THEN COPY RESULTING FST TABLES AND SAVE AS FOLLOWING .CSV FILES
taiwan259CMSTRUCFst.dist<-as.dist(read.csv("Taiwan259CMSTRUCMusicFstSqEuc9Tribe.csv",header=TRUE,row.names=1))
taiwanjeanFst.dist<-as.dist(read.csv("Taiwan9DistJean.csv",header=TRUE,row.names=1))
mantel(taiwan259CMSTRUCFst.dist,taiwanjeanFst.dist,permutations=10000,method="spearman")
cmstruc.jean.lm<-lm(taiwanjeanFst.dist~taiwan259CMSTRUCFst.dist)
plot(taiwan259CMSTRUCFst.dist, taiwanjeanFst.dist)
Mantel statistic r: 0.358 
      Significance: 0.030197


taiwanalbertoldFst.dist<-as.dist(read.csv("Taiwan9DistAlbertOld.csv",header=TRUE,row.names=1))
mantel(taiwan259CMSTRUCFst.dist,taiwanalbertoldFst.dist,permutations=10000,method="spearman")
cmstruc.albertold.lm<-lm(taiwanalbertoldFst.dist~taiwan259CMSTRUCFst.dist)
plot(taiwan259CMSTRUCFst.dist, taiwanalbertoldFst.dist)
Mantel statistic r: 0.2891 
      Significance: 0.10049


CANTOMETRICS-PERFORMANCE
taiwanfullcm<-as.matrix(read.csv("Taiwan259SongFinalSampleCantometrics.csv",row.names=1,header=TRUE))
taiwanperfcm.dist<-weightedv6.dist(taiwanfullcm,c(5:6,23:37),8)

taiwanperfcm.euc.dist<-lingoes(taiwanperfcm.dist)
taiwanperfcm.sq.euc.dist<-(taiwanperfcm.euc.dist)^2
taiwanperfcm.sq.euc.frame<-as.data.frame(as.matrix(taiwanperfcm.sq.euc.dist))
write.csv(taiwanperfcm.sq.euc.frame,"TaiwanPerfCMEucDist.csv")
taiwanperfcm.sq.euc.frame[upper.tri(taiwanperfcm.sq.euc.frame)] <- NA 
write.table(taiwanperfcm.sq.euc.frame,"TaiwanPerfCMEucDist.txt",na="", row.names=FALSE)
#COPY THIS DISTANCE MATRIX INTO THE DISTNACE MATRIX SECTION OF THE ARLEQUIN .ARP FILE AND RUN AMOVA USING PROVIDED DISTANCE MATRIX, THEN COPY RESULTING FST TABLES AND SAVE AS FOLLOWING .CSV FILES

taiwan259CMPERFFst.dist<-as.dist(read.csv("Taiwan259CMPERFMusicFstSqEuc9Tribe.csv",header=TRUE,row.names=1))
taiwanjeanFst.dist<-as.dist(read.csv("Taiwan9DistJean.csv",header=TRUE,row.names=1))
mantel(taiwan259CMPERFFst.dist,taiwanjeanFst.dist,permutations=10000,method="spearman")
cmperf.jean.lm<-lm(taiwanjeanFst.dist~taiwan259CMPERFFst.dist)
plot(taiwan259CMPERFFst.dist, taiwanjeanFst.dist)
Mantel statistic r: 0.2353 
      Significance: 0.12649
taiwanalbertoldFst.dist<-as.dist(read.csv("Taiwan9DistAlbertOld.csv",header=TRUE,row.names=1))
mantel(taiwan259CMPERFFst.dist,taiwanalbertoldFst.dist,permutations=10000,method="spearman")
cmperf.albertold.lm<-lm(taiwanalbertoldFst.dist~taiwan259CMPERFFst.dist)
plot(taiwan259CMPERFFst.dist, taiwanalbertoldFst.dist)
Mantel statistic r: 0.2059 
      Significance: 0.20178
Correlations with new distance matrices from Albert:
CantoCore-New Trejaut data:
taiwan259CCFst.dist<-as.dist(read.csv("Taiwan259CCMusicFstSqEuc9Tribe.csv",header=TRUE,row.names=1))
taiwan259CMFst.dist<-as.dist(read.csv("Taiwan259CMMusicFstSqEuc9Tribe.csv",header=TRUE,row.names=1))

taiwanFst.dist<-as.dist(read.csv("Taiwan9DistJeanNew.csv",header=TRUE,row.names=1))
mantel(taiwan259CCFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.3773 
      Significance: 0.021198
plot(taiwan259CCFst.dist, taiwanFst.dist)

CantoCore-New Albert data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistAlbertNew.csv",header=TRUE,row.names=1))
mantel(taiwan259CCFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.087 
      Significance: 0.34657
plot(taiwan259CCFst.dist, taiwanFst.dist)

Cantometrics-New Trejaut data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistJeanNew.csv",header=TRUE,row.names=1))
mantel(taiwan259CMFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.4216 
      Significance: 0.020598
plot(taiwan259CMFst.dist, taiwanFst.dist)

Cantometrics-New Albert data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistAlbertNew.csv",header=TRUE,row.names=1))
mantel(taiwan259CMFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.3212 
      Significance: 0.072093
plot(taiwan259CMFst.dist, taiwanFst.dist)


CantoCore-modified data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistModified.csv",header=TRUE,row.names=1))
mantel(taiwan259CCFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.2673 
      Significance: 0.11139

Cantometrics-modified data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistModified.csv",header=TRUE,row.names=1))
mantel(taiwan259CMFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.3704 
      Significance: 0.047595
CantoCore-New combined data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistNewJeanAlbertCombined.csv",header=TRUE,row.names=1))
mantel(taiwan259CCFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.3219 
      Significance: 0.053895
plot(taiwan259CCFst.dist, taiwanFst.dist)

Cantometrics-New combined data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistNewJeanAlbertCombined.csv",header=TRUE,row.names=1))
mantel(taiwan259CMFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.4787 
      Significance: 0.0043996
plot(taiwan259CMFst.dist, taiwanFst.dist)


Cantometrics Structure-New Trejaut data:
taiwan259CMSTRUCFst.dist<-as.dist(read.csv("Taiwan259CMSTRUCMusicFstSqEuc9Tribe.csv",header=TRUE,row.names=1))
taiwan259CMPERFFst.dist<-as.dist(read.csv("Taiwan259CMPERFMusicFstSqEuc9Tribe.csv",header=TRUE,row.names=1))

taiwanFst.dist<-as.dist(read.csv("Taiwan9DistJeanNew.csv",header=TRUE,row.names=1))
mantel(taiwan259CMSTRUCFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.4535 
      Significance: 0.0051995
Cantometrics Structure-New Albert data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistAlbertNew.csv",header=TRUE,row.names=1))
mantel(taiwan259CMSTRUCFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.3624 
      Significance: 0.041996 
Cantometrics Performance-New Trejaut data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistJeanNew.csv",header=TRUE,row.names=1))
mantel(taiwan259CMPERFFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.3236 
      Significance: 0.071393 
Cantometrics Performance-New Albert data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistAlbertNew.csv",header=TRUE,row.names=1))
mantel(taiwan259CMPERFFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.1704 
      Significance: 0.25417
Cantometrics Structure-modified data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistModified.csv",header=TRUE,row.names=1))
mantel(taiwan259CMSTRUCFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.3669 
      Significance: 0.041796
Cantometrics Performance-modified data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistModified.csv",header=TRUE,row.names=1))
mantel(taiwan259CMPERFFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.2908 
      Significance: 0.10619 
Cantometrics Structure-New combined data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistNewJeanAlbertCombined.csv",header=TRUE,row.names=1))
mantel(taiwan259CMSTRUCFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.4845 
      Significance: 0.0054995 
Cantometrics Performance-New combined data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistNewJeanAlbertCombined.csv",header=TRUE,row.names=1))
mantel(taiwan259CMPERFFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.4148 
      Significance: 0.011299

Correlations with CantoCore +Cantometrics averaged distance matrices:
CCCM-New Trejaut data:
taiwan259CCCMFst.dist<-as.dist(read.csv("Taiwan9DistCCCMCombined.csv",header=TRUE,row.names=1))

taiwanFst.dist<-as.dist(read.csv("Taiwan9DistJeanNew.csv",header=TRUE,row.names=1))
mantel(taiwan259CCCMFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.4211
      Significance: 0.015598
plot(taiwan259CCCMFst.dist, taiwanFst.dist)
CCCM-New Albert data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistAlbertNew.csv",header=TRUE,row.names=1))
mantel(taiwan259CCCMFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.2422 
      Significance: 0.14629 
plot(taiwan259CCCMFst.dist, taiwanFst.dist)

CCCM-New combined data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistNewJeanAlbertCombined.csv",header=TRUE,row.names=1))
mantel(taiwan259CCCMFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.4729 
      Significance: 0.0072993
cccm.combined.lm<-lm(taiwanFst.dist~taiwan259CCCMFst.dist)
plot(taiwan259CCCMFst.dist, taiwanFst.dist)






Correlations with CantoCore +Cantometrics STRUCTURE ONLY averaged distance matrices:
library(vegan)
CCCM-New Trejaut data:
taiwan259CMSTRUCFst.dist<-as.dist(read.csv("Taiwan259CMSTRUCMusicFstSqEuc9Tribe.csv",header=TRUE,row.names=1))
taiwan259CCFst.dist<-as.dist(read.csv("Taiwan259CCMusicFstSqEuc9Tribe.csv",header=TRUE,row.names=1))
taiwan259CCCMStrucCombinedFst.dist<-(taiwan259CMSTRUCFst.dist+taiwan259CCFst.dist)/2

taiwanFst.dist<-as.dist(read.csv("Taiwan9DistJeanNew.csv",header=TRUE,row.names=1))
mantel(taiwan259CCCMStrucCombinedFst.dist,taiwanFst.dist,permutations=10000,method="spearman") 
Mantel statistic r: 0.4003 
      Significance: 0.013899 
plot(taiwan259CCCMStrucCombinedFst.dist, taiwanFst.dist)
CCCM-New Albert data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistAlbertNew.csv",header=TRUE,row.names=1))
mantel(taiwan259CCCMStrucCombinedFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.2322 
      Significance: 0.14509 
plot(taiwan259CCCMStrucCombinedFst.dist, taiwanFst.dist)

CCCM-New combined data:
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistNewJeanAlbertCombined.csv",header=TRUE,row.names=1))
mantel(taiwan259CCCMStrucCombinedFst.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.4103 
      Significance: 0.024998 
cccm.combined.lm<-lm(taiwanFst.dist~ taiwan259CCCMStrucCombinedFst.dist)
plot(taiwan259CCCMStrucCombinedFst.dist, taiwanFst.dist)
CORRELATIONS W/ GEOGRAPHY
taiwangeo.dist<-as.dist(read.table("9_geo_dist_converted_km.txt",row.names=1,header=TRUE))
mantel(taiwangeo.dist,taiwanFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.3899 
      Significance: 0.014899 
mantel(taiwangeo.dist,taiwan259CCFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.1799 
      Significance: 0.20938 
mantel(taiwangeo.dist,taiwan259CMFst.dist,permutations=10000,method="spearman")
Mantel statistic r: 0.3107 
      Significance: 0.10409


CORRELATIONS W/ LANGUAGE (Hamming)
taiwan259CMFst.dist<-as.dist(read.csv("Taiwan259CMMusicFstSqEuc9Tribe.csv",header=TRUE,row.names=1))
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistNewJeanAlbertCombined.csv",header=TRUE,row.names=1))
taiwan259CCFst.dist<-as.dist(read.csv("Taiwan259CCMusicFstSqEuc9Tribe.csv",header=TRUE,row.names=1))
taiwan.ling.dist<- as.dist(read.csv("a400_distances_12Tribe.csv",header=TRUE,row.names=1))
taiwan259CMFst12.dist<-as.dist(read.csv("Taiwan259CMMusicFstSqEuc.csv",header=TRUE,row.names=1))
taiwan259CCFst12.dist<-as.dist(read.csv("Taiwan259CCMusicFstSqEuc.csv",header=TRUE,row.names=1))
#Lang-CM (12-tribe) non-sig
mantel(taiwan.ling.dist,taiwan259CMFst12.dist,permutations=10000,method="spearman")
#Mantel statistic r: 0.2885 
#      Significance: 0.14459 
Lang-CC (12-tribe) non-sig
taiwan259CCFst12.dist<-as.dist(read.csv("Taiwan259CCMusicFstSqEuc.csv",header=TRUE,row.names=1))
mantel(taiwan.ling.dist,taiwan259CCFst12.dist,permutations=10000,method="spearman")
#Mantel statistic r: 0.003444 
 #     Significance: 0.49385 
#Lang-CC (9-tribe) non-sig
taiwan.ling9.dist<- as.dist(as.matrix(taiwan.ling.dist)[1:9,1:9])
mantel(taiwan.ling9.dist,taiwan259CCFst.dist,permutations=10000,method="spearman")
#Mantel statistic r: 0.3812 
#      Significance: 0.081292 
#Lang-CM (9-tribe) non-sig
mantel(taiwan.ling9.dist,taiwan259CMFst.dist,permutations=10000,method="spearman")
#Mantel statistic r: 0.2808 
      Significance: 0.18328 
#Lang-gene is SIGNIFICANT
mantel(taiwan.ling9.dist,taiwanFst.dist,permutations=10000,method="spearman")
#Mantel statistic r: 0.4354 
#      Significance: 0.023498 
#Lang-geo is non-sig
taiwangeo.dist<-as.dist(read.table("9_geo_dist_converted_km.txt",row.names=1,header=TRUE))
mantel(taiwan.ling9.dist,taiwangeo.dist,permutations=10000,method="spearman")
#Mantel statistic r: 0.2528 
#   Significance: 0.14609
CORRELATIONS W/ LANGUAGE (Patristic)
taiwan259CMFst.dist<-as.dist(read.csv("Taiwan259CMMusicFstSqEuc9Tribe.csv",header=TRUE,row.names=1))
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistNewJeanAlbertCombined.csv",header=TRUE,row.names=1))
taiwan259CCFst.dist<-as.dist(read.csv("Taiwan259CCMusicFstSqEuc9Tribe.csv",header=TRUE,row.names=1))
taiwan.ling.dist<- as.dist(read.csv("a400patristic9.csv",header=TRUE,row.names=1))
#Lang-CC (9-tribe) non-sig 
taiwan.ling9.dist<- as.dist(as.matrix(taiwan.ling.dist)[1:9,1:9])
mantel(taiwan.ling9.dist,taiwan259CCFst.dist,permutations=10000,method="spearman")
#Mantel statistic r: 0.1444 
#      Significance: 0.30557 
#Lang-CM (9-tribe) non-sig (BUT STRONG)
mantel(taiwan.ling9.dist,taiwan259CMFst.dist,permutations=10000,method="spearman")
#Mantel statistic r: 0.4553 
#      Significance: 0.072693 
#Lang-gene is SIGNIFICANT
mantel(taiwan.ling.dist,taiwanFst.dist,permutations=10000)	
#Mantel statistic r: 0.5059 
  #    Significance: 0.0034997
#Lang-geo is SIGNIFICANT
taiwangeo.dist<-as.dist(read.table("9_geo_dist_converted_km.txt",row.names=1,header=TRUE))
mantel(taiwan.ling.dist,taiwangeo.dist,permutations=10000)
#Mantel statistic r: 0.5713 
  #    Significance: 0.010899

#PARTIAL CORRELATIONS
taiwan259CMFst.dist<-as.dist(read.csv("Taiwan259CMMusicFstSqEuc9Tribe.csv",header=TRUE,row.names=1))
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistNewJeanAlbertCombined.csv",header=TRUE,row.names=1))
taiwan259CCFst.dist<-as.dist(read.csv("Taiwan259CCMusicFstSqEuc9Tribe.csv",header=TRUE,row.names=1))
taiwan.ling.dist<- as.dist(read.csv("a400_distances_12Tribe.csv",header=TRUE,row.names=1))
taiwan.ling9.dist<- as.dist(as.matrix(taiwan.ling.dist)[1:9,1:9])
mantel(taiwan.ling9.dist,taiwan259CCFst.dist,permutations=10000,method="spearman")
taiwangeo.dist<-as.dist(read.table("9_geo_dist_converted_km.txt",row.names=1,header=TRUE))


mantel.partial(taiwan259CCFst.dist,taiwanFst.dist, taiwan.ling9.dist,permutations=10000)
#Mantel statistic r: 0.1847 
 #     Significance: 0.17238 
mantel.partial(taiwan259CCFst.dist,taiwanFst.dist, taiwangeo.dist,permutations=10000)
#Mantel statistic r: 0.3202 
  #    Significance: 0.066493 
mantel.partial(taiwan259CMFst.dist,taiwanFst.dist, taiwan.ling9.dist,permutations=10000)
#Mantel statistic r: 0.1847 
 #     Significance: 0.17238 
mantel.partial(taiwan259CMFst.dist,taiwanFst.dist, taiwangeo.dist,permutations=10000)
#Mantel statistic r: 0.4249 
  #    Significance: 0.018098
mantel.partial(taiwan259CCFst.dist,taiwan.ling9.dist,taiwangeo.dist,permutations=10000)
#Mantel statistic r: 0.3716 
#      Significance: 0.09719
mantel.partial(taiwan259CMFst.dist,taiwan.ling9.dist,taiwangeo.dist,permutations=10000)
#Mantel statistic r: 0.2757 
  #    Significance: 0.21998 
mantel.partial(taiwanFst.dist,taiwan.ling9.dist,taiwangeo.dist,permutations=10000)
#Mantel statistic r: 0.3685 
  #    Significance: 0.051095

mantel.partial(taiwanFst.dist,taiwan.ling9.dist, taiwan259CCFst.dist,permutations=10000)
#Mantel statistic r: 0.3718 
 #     Significance: 0.050495 

mantel.partial(taiwanFst.dist,taiwan.ling9.dist, taiwan259CMFst.dist,permutations=10000)
#Mantel statistic r: 0.3439 
  #    Significance: 0.065693 
¬
#Correlations with CantoCore +Cantometrics averaged distance matrices (PEARSON r)
#w/out instruments:
taiwan.ling9.dist<- as.dist(read.csv("a400patristic9.csv",header=TRUE,row.names=1))
taiwangeo.dist<-as.dist(read.table("9_geo_dist_converted_km.txt",row.names=1,header=TRUE))
taiwan259CCCMFst.dist<-as.dist(read.csv("Taiwan9DistCCCMCombined.csv",header=TRUE,row.names=1))
taiwanFst.dist<-as.dist(read.csv("Taiwan9DistNewJeanAlbertCombined.csv",header=TRUE,row.names=1))

mantel(taiwan.ling9.dist,taiwan259CCCMFst.dist,permutations=10000)
#Mantel statistic r: 0.3411 
#      Significance: 0.12909
mantel(taiwanFst.dist,taiwan259CCCMFst.dist,permutations=10000)
#Mantel statistic r: 0.4169 
 #     Significance: 0.014899
 mantel(taiwangeo.dist,taiwan259CCCMFst.dist,permutations=10000)
#Mantel statistic r: 0.1742 
#      Significance: 0.23398 

mantel.partial(taiwan259CCCMFst.dist,taiwanFst.dist, taiwan.ling9.dist,permutations=10000)
#Mantel statistic r: 0.3013 
 #     Significance: 0.046095

mantel.partial(taiwan259CCCMFst.dist,taiwanFst.dist, taiwangeo.dist,permutations=10000)
#Mantel statistic r: 0.3854 
#      Significance: 0.031597 
mantel.partial(taiwan259CCCMFst.dist,taiwan.ling9.dist,taiwangeo.dist,permutations=10000)
#Mantel statistic r: 0.2989 
 #     Significance: 0.14879 

mantel.partial(taiwanFst.dist,taiwan.ling9.dist, taiwan259CCCMFst.dist,permutations=10000)
#Mantel statistic r: 0.4257 
 #     Significance: 0.016998 

mantel.partial(taiwanFst.dist,taiwan.ling9.dist, taiwangeo.dist,permutations=10000)

# Mantel statistic r: 0.3289 
#      Significance: 0.057194


Y-STR
taiwanFst.dist<-as.dist(read.csv("Y-STR_fst_Taiwan9.csv",header=TRUE,row.names=1))
mantel(taiwanFst.dist,taiwan259CCCMFst.dist,permutations=10000,method="spearman")
#Mantel statistic r: -0.061 
  #    Significance: 0.55064 

mantel(taiwangeo.dist,taiwan259CCCMFst.dist,permutations=10000,method="spearman")
mantel(taiwanFst.dist,taiwan259CCFst.dist,permutations=10000,method="spearman")
#Mantel statistic r: -0.1534 
  #    Significance: 0.74943 
mantel(taiwanFst.dist,taiwan259CMFst.dist,permutations=10000,method="spearman")
#Mantel statistic r: -0.03012 
 #     Significance: 0.48785 
mantel(taiwan.ling9.dist,taiwanFst.dist,permutations=10000,method="spearman")
#Mantel statistic r: -0.04015 
 #     Significance: 0.58144 
taiwanFstmtDNA.dist<-as.dist(read.csv("Taiwan9DistNewJeanAlbertCombined.csv",header=TRUE,row.names=1))
mantel(taiwanFstmtDNA.dist,taiwanFst.dist,permutations=10000,method="spearman")
#Mantel statistic r: 0.2227 
 #     Significance: 0.13849 
mantel(taiwangeo.dist,taiwanFst.dist,permutations=10000,method="spearman")
#Mantel statistic r: 0.07439 
#      Significance: 0.29087

#BOOTSTRAPPING
#MUSIC

mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:8),c(1:8)]),as.dist(as.matrix(taiwan259CCCMFst.dist)[c(1:8),c(1:8)]),permutations=10000,method="spearman")

mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:7,9),c(1:7,9)]),as.dist(as.matrix(taiwan259CCCMFst.dist)[c(1:7,9),c(1:7,9)]),permutations=10000,method="spearman")

mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:6,8:9),c(1:6,8:9)]),as.dist(as.matrix(taiwan259CCCMFst.dist)[c(1:6,8:9),c(1:6,8:9)]),permutations=10000,method="spearman")
mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:5,7:9),c(1:5,7:9)]),as.dist(as.matrix(taiwan259CCCMFst.dist)[c(1:5,7:9),c(1:5,7:9)]),permutations=10000,method="spearman")
mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:4,6:9),c(1:4,6:9)]),as.dist(as.matrix(taiwan259CCCMFst.dist)[c(1:4,6:9),c(1:4,6:9)]),permutations=10000,method="spearman")

mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:3,5:9),c(1:3,5:9)]),as.dist(as.matrix(taiwan259CCCMFst.dist)[c(1:3,5:9),c(1:3,5:9)]),permutations=10000,method="spearman")
mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:2,4:9),c(1:2,4:9)]),as.dist(as.matrix(taiwan259CCCMFst.dist)[c(1:2,4:9),c(1:2,4:9)]),permutations=10000,method="spearman")
mantel(as.dist(as.matrix(taiwanFst.dist)[c(1,3:9),c(1,3:9)]),as.dist(as.matrix(taiwan259CCCMFst.dist)[c(1,3:9),c(1,3:9)]),permutations=10000,method="spearman")
mantel(as.dist(as.matrix(taiwanFst.dist)[c(2:9),c(2:9)]),as.dist(as.matrix(taiwan259CCCMFst.dist)[c(2:9),c(2:9)]),permutations=10000,method="spearman")

#LANGUAGE

mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:8),c(1:8)]),as.dist(as.matrix(taiwan.ling9.dist)[c(1:8),c(1:8)]),permutations=10000,method="spearman")
mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:7,9),c(1:7,9)]),as.dist(as.matrix(taiwan.ling9.dist)[c(1:7,9),c(1:7,9)]),permutations=10000,method="spearman")
mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:6,8:9),c(1:6,8:9)]),as.dist(as.matrix(taiwan.ling9.dist)[c(1:6,8:9),c(1:6,8:9)]),permutations=10000,method="spearman")
mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:5,7:9),c(1:5,7:9)]),as.dist(as.matrix(taiwan.ling9.dist)[c(1:5,7:9),c(1:5,7:9)]),permutations=10000,method="spearman")
mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:4,6:9),c(1:4,6:9)]),as.dist(as.matrix(taiwan.ling9.dist)[c(1:4,6:9),c(1:4,6:9)]),permutations=10000,method="spearman")

mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:3,5:9),c(1:3,5:9)]),as.dist(as.matrix(taiwan.ling9.dist)[c(1:3,5:9),c(1:3,5:9)]),permutations=10000,method="spearman")
mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:2,4:9),c(1:2,4:9)]),as.dist(as.matrix(taiwan.ling9.dist)[c(1:2,4:9),c(1:2,4:9)]),permutations=10000,method="spearman")
mantel(as.dist(as.matrix(taiwanFst.dist)[c(1,3:9),c(1,3:9)]),as.dist(as.matrix(taiwan.ling9.dist)[c(1,3:9),c(1,3:9)]),permutations=10000,method="spearman")
mantel(as.dist(as.matrix(taiwanFst.dist)[c(2:9),c(2:9)]),as.dist(as.matrix(taiwan.ling9.dist)[c(2:9),c(2:9)]),permutations=10000,method="spearman")

#GEOGRAPHY

mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:8),c(1:8)]),as.dist(as.matrix(taiwangeo.dist)[c(1:8),c(1:8)]),permutations=10000,method="spearman")

mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:7,9),c(1:7,9)]),as.dist(as.matrix(taiwangeo.dist)[c(1:7,9),c(1:7,9)]),permutations=10000,method="spearman")

mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:6,8:9),c(1:6,8:9)]),as.dist(as.matrix(taiwangeo.dist)[c(1:6,8:9),c(1:6,8:9)]),permutations=10000,method="spearman")
mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:5,7:9),c(1:5,7:9)]),as.dist(as.matrix(taiwangeo.dist)[c(1:5,7:9),c(1:5,7:9)]),permutations=10000,method="spearman")
mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:4,6:9),c(1:4,6:9)]),as.dist(as.matrix(taiwangeo.dist)[c(1:4,6:9),c(1:4,6:9)]),permutations=10000,method="spearman")

mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:3,5:9),c(1:3,5:9)]),as.dist(as.matrix(taiwangeo.dist)[c(1:3,5:9),c(1:3,5:9)]),permutations=10000,method="spearman")
mantel(as.dist(as.matrix(taiwanFst.dist)[c(1:2,4:9),c(1:2,4:9)]),as.dist(as.matrix(taiwangeo.dist)[c(1:2,4:9),c(1:2,4:9)]),permutations=10000,method="spearman")
mantel(as.dist(as.matrix(taiwanFst.dist)[c(1,3:9),c(1,3:9)]),as.dist(as.matrix(taiwangeo.dist)[c(1,3:9),c(1,3:9)]),permutations=10000,method="spearman")
mantel(as.dist(as.matrix(taiwanFst.dist)[c(2:9),c(2:9)]),as.dist(as.matrix(taiwangeo.dist)[c(2:9),c(2:9)]),permutations=10000,method="spearman")

Export normalized distances to .nex file for SplitsTree
taiwan.sq.euc.frame<-as.data.frame(as.matrix(taiwan.sq.euc.dist))
taiwan.sq.euc.frame[upper.tri(taiwan.sq.euc.frame)] <- NA 
write.table(taiwan.sq.euc.frame,"TaiwanCCEucDist.txt",na="", row.names=FALSE)



#Music-gene-language regressions:
plot(taiwan259CCCMFst.dist,taiwanFst.dist,pch=19,xlim=c(0,0.12),ylim=c(0,0.2),cex.axis=2,cex=2)
music.gene.lm<-lm(taiwanFst.dist~taiwan259CCCMFst.dist)
abline(music.gene.lm)
plot(taiwan259CCCMFst.dist,taiwan.ling9.dist,pch=19,xlim=c(0,0.12),ylim=c(0,0.1), cex.axis=2,cex=2)
music.lang.lm<-lm(taiwan.ling9.dist~taiwan259CCCMFst.dist)
abline(music.lang.lm)
plot(taiwanFst.dist,taiwan.ling9.dist,pch=19,xlim=c(0,0.2),ylim=c(0,0.1), cex.axis=2,cex=2)
gene.lang.lm<-lm(taiwan.ling9.dist~taiwanFst.dist)
abline(gene.lang.lm)

#2-tailed Mantel tests:
library(ecodist)
taiwan.ling9.dist<- as.dist(read.csv("BrownEtAlTaiwan9Linguistic.csv",header=TRUE,row.names=1))
taiwangeo.dist<-as.dist(read.csv("BrownEtAlTaiwan9Geographic.csv",row.names=1,header=TRUE))
taiwan259CCCMFst.dist<-as.dist(read.csv("BrownEtAlTaiwan9Musical.csv",header=TRUE,row.names=1))
taiwanFst.dist<-as.dist(read.csv("BrownEtAlTaiwan9Genetic.csv",header=TRUE,row.names=1))
mantel(taiwanFst.dist~taiwan.ling9.dist+taiwangeo.dist,nperm=10000)
mantel(taiwanFst.dist~taiwan.ling9.dist+taiwan259CCCMFst.dist,nperm=10000)



#Inter-rater reliability:
library(irr)
cc.pat<-read.csv("CantoCoreInterRaterReliability11TribeCohenPat.csv",header=TRUE,row.names=1)
cc.emily<-read.csv("CantoCoreInterRaterReliability11TribeCohenEmily.csv",header=TRUE,row.names=1)
cc.ep<-cbind(cc.emily,cc.pat)
cc.ep.mat<-as.matrix(cc.ep)
cc.ep.mat<-as.matrix(read.csv("ConsensusTapeCantoCoreEmilyPat.csv",header=TRUE,row.names=1))
kappa2(cc.ep.mat[,c(1,27)])
kappa2(cc.ep.mat[,c(2,28)],weight="squared")
kappa2(cc.ep.mat[,c(3,29)])
kappa2(cc.ep.mat[,c(4,30)],weight="squared")
kappa2(cc.ep.mat[,c(5,31)],weight="squared")
kappa2(cc.ep.mat[,c(6,32)],weight="squared")
kappa2(cc.ep.mat[,c(7,33)],weight="squared")
kappa2(cc.ep.mat[,c(8,34)])
kappa2(cc.ep.mat[,c(9,35)])
kappa2(cc.ep.mat[,c(10,36)],weight="squared")
kappa2(cc.ep.mat[,c(11,37)])
kappa2(cc.ep.mat[,c(12,38)],weight="squared")
kappa2(cc.ep.mat[,c(13,39)],weight="squared")
kappa2(cc.ep.mat[,c(14,40)])
kappa2(cc.ep.mat[,c(15,41)],weight="squared")
kappa2(cc.ep.mat[,c(16,42)],weight="squared")
kappa2(cc.ep.mat[,c(17,43)],weight="squared")
kappa2(cc.ep.mat[,c(18,44)])
kappa2(cc.ep.mat[,c(19,45)],weight="squared")
kappa2(cc.ep.mat[,c(20,46)])
kappa2(cc.ep.mat[,c(21,47)],weight="squared")
kappa2(cc.ep.mat[,c(22,48)],weight="squared")
kappa2(cc.ep.mat[,c(23,49)],weight="squared")
kappa2(cc.ep.mat[,c(24,50)])
kappa2(cc.ep.mat[,c(25,51)])
kappa2(cc.ep.mat[,c(26,52)],weight="squared")
agree(cc.ep.mat[,c(1,27)])
agree(cc.ep.mat[,c(2,28)]) 
agree(cc.ep.mat[,c(3,29)])
agree(cc.ep.mat[,c(4,30)])
agree(cc.ep.mat[,c(5,31)])
agree(cc.ep.mat[,c(6,32)])
agree(cc.ep.mat[,c(7,33)]) 
agree(cc.ep.mat[,c(8,34)])
agree(cc.ep.mat[,c(9,35)]) 
agree(cc.ep.mat[,c(10,36)]) 
agree(cc.ep.mat[,c(11,37)]) 
agree(cc.ep.mat[,c(12,38)])
agree(cc.ep.mat[,c(13,39)]) 
agree(cc.ep.mat[,c(14,40)]) 
agree(cc.ep.mat[,c(15,41)])
agree(cc.ep.mat[,c(16,42)])
agree(cc.ep.mat[,c(17,43)]) 
agree(cc.ep.mat[,c(18,44)])
agree(cc.ep.mat[,c(19,45)]) 
agree(cc.ep.mat[,c(20,46)]) 
agree(cc.ep.mat[,c(21,47)])
agree(cc.ep.mat[,c(22,48)])
agree(cc.ep.mat[,c(23,49)]) 
agree(cc.ep.mat[,c(24,50)])
agree(cc.ep.mat[,c(25,51)]) 
agree(cc.ep.mat[,c(26,52)])
icc(cc.ep.mat[,c(5,31)])
icc(cc.ep.mat[,c(6,32)])
icc(cc.ep.mat[,c(7,33)]) 
icc(cc.ep.mat[,c(10,36)]) 
icc(cc.ep.mat[,c(12,38)])
icc(cc.ep.mat[,c(13,39)]) 
icc(cc.ep.mat[,c(15,41)])
icc(cc.ep.mat[,c(16,42)])
icc(cc.ep.mat[,c(17,43)]) 
icc(cc.ep.mat[,c(21,47)])
icc(cc.ep.mat[,c(22,48)])
icc(cc.ep.mat[,c(23,49)]) 
 
cc.ep.mat<-as.matrix(read.csv("ConsensusTapeCantometricsEmilyLomax.csv",header=TRUE,row.names=1))
kappa2(cc.ep.mat[,c(1,38)])
kappa2(cc.ep.mat[,c(2,39)])
kappa2(cc.ep.mat[,c(3,40)])
kappa2(cc.ep.mat[,c(4,41)])
kappa2(cc.ep.mat[,c(5,42)],weight="squared")
kappa2(cc.ep.mat[,c(6,43)],weight="squared")
kappa2(cc.ep.mat[,c(7,44)])
kappa2(cc.ep.mat[,c(9,46)],weight="squared")
kappa2(cc.ep.mat[,c(10,47)],weight="squared")
kappa2(cc.ep.mat[,c(11,48)])
kappa2(cc.ep.mat[,c(12,49)])
kappa2(cc.ep.mat[,c(13,50)])
kappa2(cc.ep.mat[,c(14,51)])
kappa2(cc.ep.mat[,c(15,52)])
kappa2(cc.ep.mat[,c(16,53)])
kappa2(cc.ep.mat[,c(17,54)],weight="squared")
kappa2(cc.ep.mat[,c(18,55)])
kappa2(cc.ep.mat[,c(19,56)],weight="squared")
kappa2(cc.ep.mat[,c(20,57)],weight="squared")
kappa2(cc.ep.mat[,c(21,58)],weight="squared")
kappa2(cc.ep.mat[,c(22,59)])
kappa2(cc.ep.mat[,c(23,60)],weight="squared")
kappa2(cc.ep.mat[,c(24,61)],weight="squared")
kappa2(cc.ep.mat[,c(25,62)],weight="squared")
kappa2(cc.ep.mat[,c(26,63)],weight="squared")
kappa2(cc.ep.mat[,c(27,64)],weight="squared")
kappa2(cc.ep.mat[,c(28,65)],weight="squared")
kappa2(cc.ep.mat[,c(29,66)],weight="squared")
kappa2(cc.ep.mat[,c(30,67)],weight="squared")
kappa2(cc.ep.mat[,c(31,68)],weight="squared")
kappa2(cc.ep.mat[,c(32,69)],weight="squared")
kappa2(cc.ep.mat[,c(33,70)],weight="squared")
kappa2(cc.ep.mat[,c(34,71)],weight="squared")
kappa2(cc.ep.mat[,c(35,72)],weight="squared")
kappa2(cc.ep.mat[,c(36,73)],weight="squared")
kappa2(cc.ep.mat[,c(37,74)],weight="squared")
agree(cc.ep.mat[,c(1,38)])
agree(cc.ep.mat[,c(2,39)])
agree(cc.ep.mat[,c(3,40)])
agree(cc.ep.mat[,c(4,41)])
agree(cc.ep.mat[,c(5,42)])
agree(cc.ep.mat[,c(6,43)])
agree(cc.ep.mat[,c(7,44)])
agree(cc.ep.mat[,c(9,46)])
agree(cc.ep.mat[,c(10,47)])
agree(cc.ep.mat[,c(11,48)])
agree(cc.ep.mat[,c(12,49)])
agree(cc.ep.mat[,c(13,50)])
agree(cc.ep.mat[,c(14,51)])
agree(cc.ep.mat[,c(15,52)])
agree(cc.ep.mat[,c(16,53)])
agree(cc.ep.mat[,c(17,54)])
agree(cc.ep.mat[,c(18,55)])
agree(cc.ep.mat[,c(19,56)])
agree(cc.ep.mat[,c(20,57)])
agree(cc.ep.mat[,c(21,58)])
agree(cc.ep.mat[,c(22,59)])
agree(cc.ep.mat[,c(23,60)])
agree(cc.ep.mat[,c(24,61)])
agree(cc.ep.mat[,c(25,62)])
agree(cc.ep.mat[,c(26,63)])
agree(cc.ep.mat[,c(27,64)])
agree(cc.ep.mat[,c(28,65)])
agree(cc.ep.mat[,c(29,66)])
agree(cc.ep.mat[,c(30,67)])
agree(cc.ep.mat[,c(31,68)])
agree(cc.ep.mat[,c(32,69)])
agree(cc.ep.mat[,c(33,70)])
agree(cc.ep.mat[,c(34,71)])
agree(cc.ep.mat[,c(35,72)])
agree(cc.ep.mat[,c(36,73)])
agree(cc.ep.mat[,c(37,74)])

agree(cc.ep.mat[,c(1,38)])
agree(cc.ep.mat[,c(2,39)])
agree(cc.ep.mat[,c(3,40)])
agree(cc.ep.mat[,c(4,41)])
agree(cc.ep.mat[,c(5,42)])
agree(cc.ep.mat[,c(6,43)])
agree(cc.ep.mat[,c(7,44)])
agree(cc.ep.mat[,c(9,46)])
agree(cc.ep.mat[,c(10,47)])
agree(cc.ep.mat[,c(11,48)])
agree(cc.ep.mat[,c(12,49)])
agree(cc.ep.mat[,c(13,50)])
agree(cc.ep.mat[,c(14,51)])
agree(cc.ep.mat[,c(15,52)])
agree(cc.ep.mat[,c(16,53)])
agree(cc.ep.mat[,c(17,54)])
agree(cc.ep.mat[,c(18,55)])
agree(cc.ep.mat[,c(19,56)])
agree(cc.ep.mat[,c(20,57)])
agree(cc.ep.mat[,c(21,58)])
agree(cc.ep.mat[,c(22,59)])
agree(cc.ep.mat[,c(23,60)])
agree(cc.ep.mat[,c(24,61)])
agree(cc.ep.mat[,c(25,62)])
agree(cc.ep.mat[,c(26,63)])
agree(cc.ep.mat[,c(27,64)])
agree(cc.ep.mat[,c(28,65)])
agree(cc.ep.mat[,c(29,66)])
agree(cc.ep.mat[,c(30,67)])
agree(cc.ep.mat[,c(31,68)])
agree(cc.ep.mat[,c(32,69)])
agree(cc.ep.mat[,c(33,70)])
agree(cc.ep.mat[,c(34,71)])
agree(cc.ep.mat[,c(35,72)])
agree(cc.ep.mat[,c(36,73)])
agree(cc.ep.mat[,c(37,74)])



#New, cleaner IRR code:
#Inter-rater reliability: New w Sakai Yamashita Shimozaki
library(irr)
cc.ep.mat<-as.matrix(read.csv("ConsensusTapeCantoCoreCantometricsEmilyPat41.csv",header=TRUE,row.names=1))
#(manually edit out R code pertaining to empty columns for the Lomax comparisons)
#Kappa (ignoring NAs)
cc.sakai.savage.kappa<-cbind(kappa2(cc.ep.mat[,c(1,49)]), kappa2(cc.ep.mat[,c(2,50)],weight="squared"),kappa2(cc.ep.mat[,c(3,51)]),
kappa2(cc.ep.mat[,c(4,52)],weight="squared"),
kappa2(cc.ep.mat[,c(5,53)],weight="squared"),
kappa2(cc.ep.mat[,c(6,54)],weight="squared"),
kappa2(cc.ep.mat[,c(7,55)],weight="squared"),
kappa2(cc.ep.mat[,c(8,56)]),
kappa2(cc.ep.mat[,c(9,57)]),
kappa2(cc.ep.mat[,c(10,58)],weight="squared"),
kappa2(cc.ep.mat[,c(11,59)]),
kappa2(cc.ep.mat[,c(12,60)],weight="squared"),
kappa2(cc.ep.mat[,c(13,61)],weight="squared"),
kappa2(cc.ep.mat[,c(14,62)]),
kappa2(cc.ep.mat[,c(15,63)],weight="squared"),
kappa2(cc.ep.mat[,c(16,64)],weight="squared"),
kappa2(cc.ep.mat[,c(17,65)],weight="squared"),
kappa2(cc.ep.mat[,c(18,66)]),
kappa2(cc.ep.mat[,c(19,67)],weight="squared"),
kappa2(cc.ep.mat[,c(20,68)]),
kappa2(cc.ep.mat[,c(21,69)],weight="squared"),
kappa2(cc.ep.mat[,c(22,70)],weight="squared"),
kappa2(cc.ep.mat[,c(23,71)],weight="squared"),
kappa2(cc.ep.mat[,c(24,72)]),
kappa2(cc.ep.mat[,c(25,73)]),
kappa2(cc.ep.mat[,c(26,74)],weight="squared"),
kappa2(cc.ep.mat[,c(27,75)],weight="squared"),
kappa2(cc.ep.mat[,c(28,76)],weight="squared"),
kappa2(cc.ep.mat[,c(29,77)],weight="squared"),
kappa2(cc.ep.mat[,c(30,78)],weight="squared"),
kappa2(cc.ep.mat[,c(31,79)],weight="squared"),
kappa2(cc.ep.mat[,c(32,80)],weight="squared"),
kappa2(cc.ep.mat[,c(33,81)],weight="squared"),
kappa2(cc.ep.mat[,c(34,82)],weight="squared"),
kappa2(cc.ep.mat[,c(35,83)],weight="squared"),
kappa2(cc.ep.mat[,c(36,84)],weight="squared"),
kappa2(cc.ep.mat[,c(37,85)],weight="squared"),
kappa2(cc.ep.mat[,c(38,86)],weight="squared"),
kappa2(cc.ep.mat[,c(39,87)],weight="squared"),
kappa2(cc.ep.mat[,c(40,88)],weight="squared"),
kappa2(cc.ep.mat[,c(41,89)],weight="squared"))

write.csv(cc.sakai.savage.kappa,"cc.sakai.savage.kappa.csv")

#%Agreement (including NAs)

#First, replace NAs with 0
cc.ep.mat[is.na(cc.ep.mat)] <- 0

#Then check % agreement

cc.sakai.savage.kappa<-cbind(agree(cc.ep.mat[,c(1,49)]), agree(cc.ep.mat[,c(2,50)]),agree(cc.ep.mat[,c(3,51)]),
agree(cc.ep.mat[,c(4,52)]),
agree(cc.ep.mat[,c(5,53)]),
agree(cc.ep.mat[,c(6,54)]),
agree(cc.ep.mat[,c(7,55)]),
agree(cc.ep.mat[,c(8,56)]),
agree(cc.ep.mat[,c(9,57)]),
agree(cc.ep.mat[,c(10,58)]),
agree(cc.ep.mat[,c(11,59)]),
agree(cc.ep.mat[,c(12,60)]),
agree(cc.ep.mat[,c(13,61)]),
agree(cc.ep.mat[,c(14,62)]),
agree(cc.ep.mat[,c(15,63)]),
agree(cc.ep.mat[,c(16,64)]),
agree(cc.ep.mat[,c(17,65)]),
agree(cc.ep.mat[,c(18,66)]),
agree(cc.ep.mat[,c(19,67)]),
agree(cc.ep.mat[,c(20,68)]),
agree(cc.ep.mat[,c(21,69)]),
agree(cc.ep.mat[,c(22,70)]),
agree(cc.ep.mat[,c(23,71)]),
agree(cc.ep.mat[,c(24,72)]),
agree(cc.ep.mat[,c(25,73)]),
agree(cc.ep.mat[,c(26,74)]),
agree(cc.ep.mat[,c(27,75)]),
agree(cc.ep.mat[,c(28,76)]),
agree(cc.ep.mat[,c(29,77)]),
agree(cc.ep.mat[,c(30,78)]),
agree(cc.ep.mat[,c(31,79)]),
agree(cc.ep.mat[,c(32,80)]),
agree(cc.ep.mat[,c(33,81)]),
agree(cc.ep.mat[,c(34,82)]),
agree(cc.ep.mat[,c(35,83)]),
agree(cc.ep.mat[,c(36,84)]),
agree(cc.ep.mat[,c(37,85)]),
agree(cc.ep.mat[,c(38,86)]),
agree(cc.ep.mat[,c(39,87)]),
agree(cc.ep.mat[,c(40,88)]),
agree(cc.ep.mat[,c(41,89)]))

write.csv(cc.sakai.savage.kappa,"cc.sakai.savage.kappa.csv")


