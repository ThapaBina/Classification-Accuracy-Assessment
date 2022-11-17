# Classification-Efficacy
### source: https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=9551959
##### 

###### Example 1:
Yref = c("maple","maple","maple","oak","oak","pine","pine","pine","ash","ash","ash")
Ypred = c("maple","maple","maple","oak","oak","pine","pine","pine","ash","ash","maple")

EfficacyCalc(Yref = Yref, Ypred = Ypred)

######  Example 2: 
Yref = c(0, 1, 1, 0, 1, 0, 0, 0)
Ypred = c(0, 1, 1, 0, 1, 0, 0, 1)
EfficacyCalc(Yref = Yref, Ypred = Ypred, labels = c("maple","ash"))
