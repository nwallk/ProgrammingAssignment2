## This R program caches the Inverse of a Matrix. Matrix inversion is usually a 
## costly computation and there may be some benefit to caching the inverse of a 
## matrix rather than compute it repeatedly (there are also alternatives to matrix 
## inversion that we will not discuss here). This assignment calls a pair of 
## functions that cache the inverse of a matrix.
##
## Computing the inverse of a square matrix can be done with the solve function in 
## R. For example, if X is a square invertible matrix, then solve(X) returns its 
## inverse.
##
## makeCacheMatrix: This function creates a special "matrix" object that can cache 
## its inverse.

makeCacheMatrix <- function(x = matrix()) {   

        inv <- NULL                                
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setInv <-function(inverse) inv <<- inverse
        getInv <- function() inv
        list(set = set,
             get = get,
             setInv = setInv,
             getInv = getInv)
}

## cacheSolve: This function computes the inverse of the special "matrix" returned 
## by makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then the cachesolve should retrieve the inverse from the 
## cache.

cacheSolve <- function(x, ...) {
        
        ## Return a matrix that is the inverse of 'x'

        inv <- x$getInv()
        if(!is.null(inv)) {
                message("waiting for cached inverse")
                return(inv)
        }
        mtrx <- x$get()
        inv <- solve(mtrx, ...)
        x$setInv(inv)
        inv
}

## source("C:/Users/nwall/OneDrive/Documents/GitHub/ProgrammingAssignment2/cachematrix.R")
## my_matrix <- makeCacheMatrix(matrix(1:4, 2,2))
## my_matrix$get()
##     [,1] [,2]
## [1,]    1    3
## [2,]    2    4
## my_matrix$getInv()
## NULL
## cacheSolve(my_matrix)
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
## my_matrix$getInv()
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
