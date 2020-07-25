#因子負荷量散布図

hplot<-function(i,j){		#関数読み込み
  png(paste("pca-", as.character(i), "-", as.character(j), ".png"))
  xl<-paste("第",i,"主成分")
  
  yl<-paste("第",j,"主成分")
  
  plot(r[i,],r[j,],type="n",xlab=xl,ylab=yl)
  
  text(r[i,],r[j,],colnames(x))
  dev.off() 
}



#実行コマンド。１，２となっているところを散布図を描きたい主成分に変更して使用する

#例の場合、第１主成分と第２主成分の因子負荷量の散布図が作成される

hplot(1,3)



#主成分得点散布図

splot<-function(i,j){
  png(paste("pcadis-", as.character(i), "-", as.character(j), ".png"))
  xl<-paste("第",i,"主成分")
  
  yl<-paste("第",j,"主成分")
  
  plot(Z[,i],Z[,j],xlab=xl,ylab=yl)
  
  #text(Z[19,i],Z[19,j],"●")
  dev.off()
}



#実行コマンド。１，２となっているところを散布図を描きたい主成分に変更して使用する

#例の場合、第１主成分と第２主成分の主成分得点の散布図が作成される

splot(1,3)

