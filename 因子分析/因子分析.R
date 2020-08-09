#csv読み込み
csv<-read.csv(file="C:/Users/diddy/Google ドライブ/多変量解析/ペアワーク/因子分析/boston.csv",header=T, fileEncoding="utf8",row.names=1)
#相関係数行列
cor_test<-cor(csv); cor_test
#行列の固有値と固有ベクトル
eigen_test<-eigen(cor_test)$values; eigen_test;
#共通因子のあたりをつける(スクリープロット)
plot(eigen_test,type="b",main="Scree Plot", xlab="NUM", ylab="VALUE")
#因子分析
#factorial()を使う.factorsは共通因子の数
#バリマックス回転
#因子負荷量は最尤法
#回帰方程式がBartlett
result<-factanal(x=csv,factors=2,rotation="varimax",scores="Bartlett");
#出力(cutoff=0で全ての因子負荷量を表示)
print(result)
#因子得点
result$scores
#因子負荷量
unclass(result$loadings)
#共通因子1と2の因子負荷量のヒストグラム
# グラフを横に2つ並べるなら(c(1,2))
par(mfrow = c(1, 1))   
barplot(result$loadings[,1], main="Factor1", ylim=c(-1,1), las=2)
barplot(result$loadings[,2], main="Factor2", ylim=c(-1,1), las=2)

#因子負荷量の描画
plot(result$loadings[,1:2], type="n", xlim=c(-1,1), ylim=c(-1,1))
text(result$loadings[,1:2], colnames(csv))
abline(v=0, lty=3) #0で縦に線を引き，破線（lty=3）を引く
abline(h=0, lty=3) #0で横に線を引き，破線（lty=3）を引く


write.csv(cor_test, "C:/Users/diddy/Google ドライブ/多変量解析/ペアワーク/因子分析/相関係数行列.csv")
write.csv(cor_test, "C:/Users/diddy/Google ドライブ/多変量解析/ペアワーク/因子分析/固有値固有ベクトル.csv")
write.csv(result$scores, "C:/Users/diddy/Google ドライブ/多変量解析/ペアワーク/因子分析/score.csv")
