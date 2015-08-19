# Test_cachematrix.R
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