# data読み込み
input <- read.csv("boston.csv")
head(input)

# モデル定義を作る(データによって異なる)
createModel <- function() {
  # 変数名 ??? 依存変数
  # + 依存変数の合成
  return ("
    value1 =~ CHAS + NOX
    value2 =~ PTRATIO + LSTAT + CRIM
    value3 =~ DIS + RAD
    PRICE ~ value1 + value2 + value3
  ")
}

# lavaanでSEM
library(lavaan)
library(semPlot)

model <- createModel()
res_sem <- cfa(model, data= input)

summary(res_sem, standardized = TRUE)

fitMeasures(res_sem)
semPaths(res_sem, "model", "est", intercepts = FALSE)

