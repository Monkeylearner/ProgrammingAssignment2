
  # The following function creates a list containing a function to 
 set the value of the matrix
 get the value of the matrix
 set the value of inverse of the matrix
 get the value of inverse of the matrix
  
makeCacheMatrix <- function(x = matrix()){
	inv <- NULL
	setMatrix <- function(newMatrix){
		x <<- newMatrix
		inv <<- NULL
	}
	getMatrix <- function() x
	setinverse <- function(solve) inv <<- solve
	getinverse <- function() inv
	list(setMatrix = setMatrix, getMatrix = getMatrix,
	     setinverse = setinverse,
	     getinverse = getinverse)
}


# The following function inverse the matrix created with the above function. It first checks to see if the matrix has already been inversed. If so, it gets the inverse and skips the computation. Otherwise, it inverses the matrix and sets the inversed matrix in the cache via setinverse function.

cacheSolve <- function(x, ...) {## Return a matrix that is the inverse of x
	inv <- x$getinverse()
	if(!is.null(inv)) {
		    message("getting cached data")
		    return(inv)
	}
	data <- x$getMatrix()
	inv <- solve(data)
	x$setinverse(inv)
	inv	
}
