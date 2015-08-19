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

## TEST 1
## sample data (this example is from StackOverFlow.com)
## http://stackoverflow.com/questions/11995832/inverse-of-matrix-in-r

# Build a sample matrix
a <- rbind(c(1, -1/4), c(-1/4, 1))

# Verify the object "a" is a matrix
class(a)

# Print the matrix
a

# Invert the matrix
solve(a)

# Verify that inverse "matrix-multiplied" by original matrix gives an identity matrix
# Identity matrix is all zeros, except for ones on the diagonal

solve(a) %*%  a

# NOTE: Must use " %*% " and NOT " * " because it must be "matrix multiplication"
#       That is the subject of the StackOverFlow.com article above.

# Now that we have a matrix and an known inverse we can test the programs.

# TEST2:
# Build a sample matrix
a <- rbind(c(1, -1/4), c(-1/4, 1))

# Verify the object "a" is a matrix
class(a)

# Print the matrix
a

# Assign the function to variable x.
# VERY IMPORTANT -- MUST ASSIGN TO A VARIABLE.
# DO NOT RUN makeCacheMatrix() on line by itself WITHOUT an assignment " <- ".
xLib <- makeCacheMatrix(a)

# Verify that x is a list
class(x)

# Print the list x
xLib

xLib$get

# 1st call: Invert the matrix
cacheSolve(a)

# 2nd call: Avoid inverting matrix by retrieving cached solution
cacheSolve(a)

### End of cachematrix.R