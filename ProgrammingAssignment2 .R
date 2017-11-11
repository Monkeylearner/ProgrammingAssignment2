Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than compute it repeatedly.
Below are two functions that are used to create a special object that cache the inverse of a matrix.
makeCacheMatrix creates a list containing a function to
  set the value of the matrix
  get the value of the matrix
  set the value of inverse of the matrix
  get the value of inverse of the matrix
  
makeCacheMatrix <- function(x = matrix()){
	inv <- NULL
	set <- function(y){
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) inv <<- inverse
	getinverse <- function() inv
	list(set = set, get = get,
	     setinverse = setinverse,
	     getinverse = getinverse)
}

The following function returns the inverse of the matrix. However, it first checks to see if the inverse has already been computed. If so, it gets the inverse and skips the computation. Otherwise, it calculates the inverse and sets the value in the cache via setinverse function.

cacheSolve <- function(x, ...) {
	inv <- x$getinverse()
	if(!is.null(inv)) {
		    message("getting cached data")
		    return(inv)
	}
	data <- x$get()
	inv <- solve(data, ...)
	x$setinverse(inv)
	inv	
}