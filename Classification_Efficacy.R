## calculation of efficacy:
## source paper: https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=9551959

EfficacyCalc = function(Yref, Ypred, labels,...){
  
  # checking labels
  if(is.numeric(Yref) & missing(labels)) warning("Missing Labels")
  
  # check if input variables are numeric or class  
  if(is.numeric(Yref)){
    Yref = as.factor(Yref)
    if(missing(labels)){
      Yref = Yref
    }else
      levels(Yref) = labels
  }else Yref
  
  if(is.numeric(Ypred)){
    Ypred = as.factor(Ypred)
    if(missing(labels)){
      Ypred = Ypred
    }else
      levels(Ypred) = labels
  }else Ypred
  
  ## create a confusion matrix
  confMat = table(Ypred,Yref)
  
  # calculate traditional overall classification accuracy
  OvrAcc = sum(diag(confMat))/sum(colSums(confMat))
  
  # calculate weight based on sample size
  # A0 = sum((colSums(confMat)/sum(colSums(confMat)))^2)
  
  # adjusted overall classification accuracy
  MICE = (OvrAcc - (sum((colSums(confMat)/sum(colSums(confMat)))^2)))/(1- (sum((colSums(confMat)/sum(colSums(confMat)))^2)))
  
  ###########################################################
  # calculate class level accuracy:
  # True Positive (TP) along the diagonal of confusion matrix
  # class-level accuracy
  RA = diag(confMat)/colSums(confMat)
  
  # calculate weight for each class
  # A0_cl = colSums(confMat)/sum(colSums(confMat))
  
  # adjusted class accuracy:
  adjClAcc = (RA - (colSums(confMat)/sum(colSums(confMat))))/(1 - (colSums(confMat)/sum(colSums(confMat))))
  
  my_parameters <<- c(as.list(environment()), list(...))
  
  print(sprintf("MICE = %.2f", MICE), quote = F)
  print("Adjusted Class Level Accuracy", quote = F)
  print(adjClAcc)
  
  #return(list(MICE = MICE, AdjClassAcc = adjClAcc))
  
}

#############################################################################
