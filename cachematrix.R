## FUNCTION: cachematrix.R
## PURPOSE:  Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix(x) : 

makeCacheMatrix <- function( x = matrix() ) {
    m <- NULL
    
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    get <- function() x
    
    setSolve <- function(Solve) m <<-Solve
    
    getSolve <- function() m
    
    list(set = set, get = get,
         setSolve = setSolve,
         getSolve = getSolve)

}


## cacheSolve(x, ...) : Returns a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
        
    m <- x$getSolve()
    
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    ## Return a matrix that is the inverse of 'x'
    data <- x$get()
    m <- Solve(data, ...)
    x$setSolve(m)
    m
}

## TEST
## sample data (this example is from StackOverFlow.com)
## http://stackoverflow.com/questions/11995832/inverse-of-matrix-in-r

# Build a sample matrix
c <- rbind(c(1, -1/4), c(-1/4, 1))

# Verify the object "c" is a matrix
class(c)

# Invert the matrix
solve(c)

# Verify that inverse "matrix-multiplied" by original matrix gives an identity matrix
# Identity matrix is all zeros, except for ones on the diagonal

solve(c) %*%  c

# NOTE: Must use " %*% " and NOT " * " because it must be "matrix multiplication"
#       That is the subject of the StackOverFlow.com article above.

# Now that we have a matrix and an inverse we can test the programs

# TEST2:

x <- rbind(c(1, -1/4), c(-1/4, 1))

makeCacheMatrix(x)

# 1st call: Invert the matrix
cacheSolve(x)

# 2nd call: Avoid inverting matrix by retrieving cached solution
cacheSolve(x)

### End of cachematrix.R