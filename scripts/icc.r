df1 <- read.csv("../perceptual-ratings/songwise/akira_SongWise.csv", header=FALSE, sep=",")
df2 <- read.csv("../perceptual-ratings/songwise/okazaki_SongWise.csv", header=FALSE, sep=",")
df3 <- read.csv("../perceptual-ratings/songwise/satoru_SongWise.csv", header=FALSE, sep=",")

df <- cbind(df1,df2,df3)
cols <- paste("V",1:39,sep="")
colnames(df)<- cols


#change the names of the columns to find out the ICC for each feature respectively
sound_quality<- df[,c("V26","V39")]
sound_quality<-sound_quality[-c(1),]
sound_quality<-data.matrix(sound_quality)
(setattr(sound_quality,"row.names",rows))
icc(sound_quality,model="twoway",type="agreement")
 
focus <- df[,c("V1","V1")]
focus<-data.matrix(focus) icc(focus,model="twoway",type="agreement")

