source("cachematrix.R")

m1 <- matrix(c(4,6,10,12),2,2)
m2 <- matrix(c(10,20,15,25),2,2)
m3 <- matrix(c(100,200,150,250),2,2)

matrixObj1 <- makeCacheMatrix(m1) 
matrixObj2 <- makeCacheMatrix(m2) 

cacheSolve(matrixObj1)
cacheSolve(matrixObj1)
cacheSolve(matrixObj2)

matrixObj1 <- makeCacheMatrix(m3)
cacheSolve(matrixObj1)
