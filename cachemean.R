# File: cachemeanV002.R (modified in attempt to fix "$" issue)
#       cachemean.R (example from class assignment: "Programming Assignment 2")

## EXAMPLE (based on Joseph Ng's post in the Coursera Data Science discussion forum):
## > a <- makeVector(8:25)
## > class(a)
## [1] "list"
## > a
## .....[long listing]
## > a$get
## [1]  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
## > cachemean(a)
## [1] 16.5
## > cachemean(a)
## > getting cached data
## [1] 16.5

makeVector <- function(x = numeric()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    get <- function() x
    
    setmean <- function(mean) m <<- mean
    
    getmean <- function() m
    
    list(set = set, get = get,
         setmean = setmean,
         getmean = getmean)
}

cachemean <- function(x, ...) {
    m <- x$getmean()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    
    m <- mean(data, ...)
    
    x$setmean(m)
    m
}

## End of: cachemeanV002.R