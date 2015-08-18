# File: cachemeanV003.R (modified in attempt to fix "$" issue)
#       This will attempt a more drastic solution -- embedding functions in list
#       cachemean.R (example from class assignment: "Programming Assignment 2")

# makeVector creates a list of functions for use by cachemean
makeVector <- function()
    
    xLib <-- list(
        set <- function(y) {
            x <<- y
            m <<- NULL
            } ,
        
    
        get <- function() x ,
        
    
        setmean <- function(mean) m <<- mean ,
    
        getmean <- function() m 
    
        )

cachemean <- function(x, xLib = xLib, ...) {
    # cachemean: If available, use saved (cached) result, "m".
    
    # Attempt to retrieve saved result "m" 
    # without reading passed data and performing computation.
    m <- xLib$getmean()
    
    
    # If m is FOUND (m is NOT NULL); RETURN SAVED (cached) "m" and EXIT.
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    # If the program has reached this point
    # m was NOT FOUND; get the passed data.
    data <- xLib$get()
    
    # Compute the mean using the passed data.
    m <- mean(data, ...)
    
    # Use function setmean() to persist "m" 
    # (so it doesn't have to be calculated next call of cachemean)
    xLib$setmean(m)
    
    # Print m
    m
}

## End of: cachemeanV003.R
    
