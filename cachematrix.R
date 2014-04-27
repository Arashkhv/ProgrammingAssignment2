## Put comments here that give an overall description of what your
## functions do

        # The purpose of these 2 functions is to use cache data in
        # calculating the inverse of a matrix, to skip re-doing
        # the same operations (esp. when there is a loop) and 
        # increasing the overall speed and running time.

## Write a short comment describing this function

        # This Function Makes a special matrix, which is a list containing
        # 4 functions to be used together with cacheSolve.R function.

makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
        set <- function(y) {
                x <<- y
                s <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) s <<- solve
        getsolve <- function() s
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## Write a short comment describing this function
        
        # This function makes use of the MakeCacheMatrix.R function. It
        # checks if the inverse has already been calculated. If so, It 
        # returns its calculated value from the cache. If not, It calculates
        # it and sets it in the cache.

cacheSolve <- function(x, ...) {
        
        ## Return a matrix that is the inverse of 'x'
        s <- x$getsolve()
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
        }
        data <- x$get()
        s <- solve(data, ...)
        x$setsolve(s)
        s
}
