## This functions checks a square matrix to know if it is invert-able and calculate it's inverse matrix, 
# while attempting to calculate the inverse matrix, it checks through the list in 
# it cache to see if the attempted square matrix about to invert has once been calculated
# if the attempt result pinto  a positive search, it only use the cache result of inverse matrix. 
# But if the search result is FALSE, it continues with the calculation
## functions do


## Below is the function that creates the inverse cache matrix
makeCacheMatrix <- function(x = matrix()) {
    inv_matx <- NULL
    set_cache <- function(matx1){  # This function is created and initialize a lexical scoping function
        x <<- matx1 # initialize a lexical scoping function
        inv_matx <<- NULL # initialize a lexical scoping function
    }
    get_cache <- function() x
    Set_inv <- function(main_inv) inv_matx <<- main_inv # This line is implemented and used as a lexical scope in set_cache line 12
    get_inv <- function() inv_matx
    list(
        set_cache = set_cache, 
        get_cache = get_cache,
        Set_inv = set_inv,
        get_inv = get_inv
    )
}



# is the function that checks 
cacheSolve <- function(x, ...) {
    inv_matx <- x$get_inv()
    if(!is.null(inv_matx)){
        message("getting cache data...")
        return(inv_matx) ## This line of code return the value of the inverse matrix 
    }
    data <- x$get_now()
    inv_matx <- solve(data)
    x$set_inv(inv_matx)
    inv_matx
        
}


