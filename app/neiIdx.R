# Function that as Input takes the neighborhood matrix, and as Output
# gives their indeces 
neiIdx <- function(neiMat){
  p <- ncol(neiMat)
  ii <- NULL
  jj <- NULL
  for(i in 1:p){
    for (j in i:p) {
      if(neiMat[i,j]){
        ii <- c(ii,i)
        jj <- c(jj,j)
      }
    }  
  }
  Idx <- cbind.data.frame(ii,jj)
  return(Idx)
}




