focus <- df[,c("V20","V40")]
focus<-data.matrix(focus)
icc(focus,model="twoway",type="agreement")

focus <- df[,c("V40","V60")]
focus<-data.matrix(focus)
icc(focus,model="twoway",type="agreement")

focus <- df[,c("V60","V20")]
focus<-data.matrix(focus)
icc(focus,model="twoway",type="agreement")