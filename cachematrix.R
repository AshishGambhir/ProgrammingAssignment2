## [1]  makeCacheMatrix( x = matrix() )
## Purpose:  Creates a function closure to store a matrix(mat), its inverse(matInv)  
##           and getter/setter functions for the matrix and its inverse
## Input:    Takes a matrix data type as its input. Defaults to empty matrix.
## Returns:  List of four getter and setter functions
##
## [2]  cacheSolve <- function(x, ...) 
## Purpose:  Calculates matrix inverse for a Matrix cached in R object "x"
## Input:    Takes R object which is an enclosure
## Returns:  Matrix inverse



## Creates a function enclosure to store a matrix(mat), its inverse(matInv)  
## and getter/setter functions for the matrix and its inverse
makeCacheMatrix <- function( mat = matrix() ) 
{
    matInv <- NULL
    setMatrix <- function( inputMat ) 
    {
        # Input matrix assigned to "mat" in parent environment   
        mat <<- inputMat
        
        # If matrix changes, you set inverse to NULL to force recomputation
        matInv <<- NULL 
    }
    
    getMatrix <- function() mat
    
    setMatrixInverse <- function( inputMatInv ) matInv <<- inputMatInv
    
    getMatrixInverse <- function() matInv
    
    list( setMatrix = setMatrix, 
          getMatrix = getMatrix,
          setMatrixInverse = setMatrixInverse,
          getMatrixInverse = getMatrixInverse )
}



## Returns matrix inverse for a Matrix cached in argument "X" of type closure
cacheSolve <- function(x, ...) 
{
        
    mInv <- x$getMatrixInverse()
  
    if(!is.null(mInv)) 
    {
        message("Getting Cached Matrix Inverse....")
        return(mInv)
    }
  
    message("Computing Matrix Inverse....")
    localMat <- x$getMatrix()
    localMatInv <- solve(localMat)
    x$setMatrixInverse(localMatInv)
    x$getMatrixInverse()
}
