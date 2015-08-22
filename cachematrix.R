## FUNCTION: cachematrix.R
## PURPOSE:  cachematrix -- Inverts a matrix, but
##           if available, cachematrix uses a saved (cached) result, "m"
##           otherwise it calls solve() to compute a new solution.

## FOR DEMO ONLY:   Build a sample matrix
#                   A <- as.matrix( rbind(c(1, -1/4), c(-1/4, 1) ) )

## INVOKE AS:    L <- makeCacheMatrix(A)   # Assigns "list/library" of functions to "L"
## followed by   X <- cacheSolve(A)
#
## where "L" is the name of the Library
##       "A" is the input matrix (must be square)
## and   "B" is an identity matrix the same size as "A" created by program
## and   "X" is the results matrix (the inverse of "x")
#
## If "X" has been previously computed in the current session
## wihtout any intervening calculations; "X" will be retrieved from the cache.
## If "x" is not available for retrieval a solution will be computed
## using the R solve() function.

## makeCacheMatrix() -- creates a list of functions for use by cacheSolve
makeCacheMatrix <- function(A = as.matrix() ) {
    m <- NULL
    
    ## Store passed matrix in A.
    set <- function(Z) {
        A <<- Z
        m <<- NULL
    }
    
    ##
    get <- function() {
        as.matrix(A)
    }    
    
    ##
    setSolve <- function(solve) {
        m <<- NULL
        m <<-solve
    }
        
    
    ##
    getSolve <- function() m
    
    ##
    
    L   <-  list(set = set, 
                 get = get,
                 setSolve = setSolve,
                 getSolve = getSolve)
    
    L   <- as.list(L) 
}


## cacheSolve(x, ...) : Returns a matrix that is the inverse of 'x'

cacheSolve <- function(A = as.matrix(), ...) {
    
    # Attempt to retrieve saved result "m" 
    # without reading passed data and performing computation.
    m <- L$getSolve()
    
    # If m is FOUND (m is NOT NULL); RETURN SAVED (cached) "m" and EXIT.
    if(!is.null(m)) {
            message("getting cached data")
            print(m)
            return(as.matrix(m) )
    }
    
    # If the program has reached this point
    # m was NOT FOUND; get the passed data.
    data <- L$get()
    # create an identity matrix, the same size as A
    identity <- diag( nrow = nrow(data) ) 
    
    # Compute the inverse using the passed data and .        
    m <- solve(data, identity, ...)
    
    ## Return a matrix that is the inverse of 'x'
    L$setSolve(m)
    
    ## Print m
    print(m)
    return(as.matrix(m))
}

### End of cachematrix.R