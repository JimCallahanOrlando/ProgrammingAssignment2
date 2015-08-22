# Test_cachematrix.R
## TEST 1
## sample data (this example is from StackOverFlow.com)
## http://stackoverflow.com/questions/11995832/inverse-of-matrix-in-r

# Build a sample matrix
A <- as.matrix( rbind(c(1, -1/4), c(-1/4, 1) ) )
# create an identity matrix, the same size as A
identity <- diag( nrow = nrow(A) )
B <- identity

# Verify the object "a" is a matrix
class(A)
class(B)

# Print the matrix
A
B

# Invert the matrix
X = solve(A,B)

# Verify that inverse "matrix-multiplied" by original matrix gives an identity matrix
# Identity matrix is all zeros, except for ones on the diagonal

solve(A) %*%  A

# NOTE: Must use " %*% " and NOT " * " because it must be "matrix multiplication"
#       That is the subject of the StackOverFlow.com article above.

# Now that we have a matrix and an known inverse we can test the programs.

# TEST2:
# Load code
source('~/GitHub/ProgrammingAssignment2/cachematrix.R', echo=FALSE)
# Matrix Inverse for AX = B system of equations
# the right-hand side(s) of the linear system. 
# b is an identity matrix and solve will return the inverse of a.

# Build a sample matrix
A <- as.matrix( rbind(c(1, -1/4), c(-1/4, 1) ) )

# Assign function library/list to "L"
L <- makeCacheMatrix(A)

# Request inverse (this is the first time so it is calcuated)
X <- cacheSolve(A)

# Request inverse again (this is the second time so the stored copy is retrieved)
X <- cacheSolve(A)

