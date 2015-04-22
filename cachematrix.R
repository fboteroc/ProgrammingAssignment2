## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix<-function(x=matrix()){          #takes a matrix as argument
        m <- NULL                               #Creates an empty object to store the reversed matrix,...
        set <- function(z){                     #stores input 'z', defined in the global environment...
                x <<- z                         # into the local variable 'x', replacing the ancient value if there was one
                m <<- NULL
        }
        get <- function() x                      # This line returns the object stored above
        setsolve <- function(solve) m <<- solve  # Stores the value of the reversed matrix into the variable 'm'
        getsolve <- function() m                 # Returns the value stored in 'm'
        list(set = set, get = get,               # Stores the values of set, get, setsolve and getsolve
            setsolve = setsolve,
            getsolve = getsolve)
        }


## Write a short comment describing this function

cacheSolve<-function(x, ...){
        m <- x$getsolve()                       #Checks if there's a value in cache for solve(x)
        if(!is.null(m)){                        #If there's a stored value,...
                message("getting cached data")  # it gets it from cache,...
                return(m)                       # and returns it.
    }
        data <-x$get()                          #if there's no value...
        m <- solve(data,...)                    #it's calculated,...
        x$setsolve(m)                           #stored,...
        m                                       #... and returned. 
}
