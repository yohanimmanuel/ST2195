x <- 105
if (x > 100) {
  print("A")
  print("B")
} 

x <- 80
if (x > 90) {
  print("A")
} else if (x > 80) {
  print("B")
} else
  print("C")

x <- "c"
if (x == "a") {
  "A"
} else if (x == "b") {
  "B"
} else if (x == "c") {
  "C"
} else {
  stop("Invalid `x` value")
}

x <- "b"
switch(x,
       "a" = "A",
       "b" = "B",
       "c" = "C",
       stop("Invalid `x` value")
)

# Using for loop
for (i in 1:100) {
  print(i)
}

i <- 1
while (i<=100) {
  print(i)
  i <- i+1
}

# Alternative using repeat
i <- 1
repeat { 
  print(i)
  i <- i+1
  if(i>100) {
    break
  }
}

for (i in 1:10) {
  if (i < 3) 
    next
  print(i)
  if (i >= 5)
    break
}

for (i in 1:10) {
  if (i < 3) 
    next
 
  if (i >= 5)
    break
  
  print(i)
}

k <- numeric(3)
for (i in 1:5) {
  k[i] = i^2
}
print(k)

func_name <- function(arguments) {
  body
}

# Default Values for Arguments
raise <- function(x, y) {
  # prints x to the power of y
  result <- x^y
  print(paste(x,"to the power of", y, "is", result))
  
  #To be clear on the output returned, you can use the return function
  #return(result)
  #return(c(result, x, y))
  #return(list(result, x, y))
}
raise(10,7)
raise(2,8)

raise <- function(x, y = 2) {
  # prints x to the power y
  result <- x^y
  print(paste(x,"to the power", y, "is", result))
}
raise(3)

#Composing and Nesting Functions
cm_to_inches <- function(cm) {
  inches <- cm/2.54
  return(inches)
}
# check that the function gives 1 inch for 2.54 centimetres
cm_to_inches(2.54)

cm_to_yards <- function(cm) {
  inches <- cm_to_inches(cm)
  yards <- inches_to_yards(inches)
  yards
}
# check that 91.44 centimetres correspond to 1 yard
cm_to_yards(91.44)
inches_to_yards(cm_to_inches(91.44))

# Error Logging
f1 <- function(x) {
  log(x)
  10
}
f1("x")

f2 <- function(x) {
  try(log(x))
  10
}
f2("a")

#Handling Conditions with tryCatch()
show_condition <- function(code) {
  tryCatch(code,
           error = function(c) "error",       # simple function for each condition
           warning = function(c) "warning",
           message = function(c) "message"
  )
}
show_condition(stop("!"))
## [1] "error"
show_condition(warning("?!"))
show_condition(message("?"))
show_condition(10)
show_condition("x"+2)
show_condition(log(-1))

show_condition(library(dplyr))
is_even <- function(n) {
  n %% 2 == 0
}
is_even(768)

is_even("two")

is_even_error <- function(n) {
  tryCatch(n %% 2 == 0,
           error = function(e) {
             FALSE
           })
}
is_even_error(714)

is_even_error("eight")
