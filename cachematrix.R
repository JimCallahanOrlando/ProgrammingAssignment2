## FUNCTION: cachematrix.R
## PURPOSE:  cachematrix -- Inverts a matrix, but
##           if available, cachematrix uses a saved (cached) result, "m"
##           otherwise it calls solve() to compute a new solution.

## INVOKE AS: a <- makeCacheMatrix() -- see examples at end of this file.

## makeCacheMatrix() -- creates a list of functions for use by cacheSolve
makeCacheMatrix <- function( x = matrix() ) {
    m <- NULL
    
    ## 
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    ##
    get <- function() x
    
    ##
    setSolve <- function(solve) m <<-solve
    
    ##
    getSolve <- function() m
    
    ##
    list(set = set, get = get,
         setSolve = setSolve,
         getSolve = getSolve)

}


## cacheSolve(x, ...) : Returns a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
    
    # Attempt to retrieve saved result "m" 
    # without reading passed data and performing computation.    
    m <- x$getSolve()
    
    # If m is FOUND (m is NOT NULL); RETURN SAVED (cached) "m" and EXIT.
    if(!is.null(m)) {
            message("getting cached data")
            return(m)
    }
    
    # If the program has reached this point
    # m was NOT FOUND; get the passed data.
    data <- x$get()
    
    # Compute the inverse using the passed data.        
    m <- solve(data, ...)
    
    ## Return a matrix that is the inverse of 'x'
    x$setSolve(m)
    
    ## Print m
    m
}

### End of cachematrix.R