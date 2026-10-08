
###########################################################
###########################################################

## Getting Started with R

###########################################################
###########################################################

###########################################################
## Task One: R Overview & Preliminaries
## In this task, you will learn about the R programming
## language and write basic R commands.
###########################################################

### Basic R Commands

### 1.1: Assignments in R

## Assign x to 1, y to 2 and z to 3

x <-  1
y <-  2
z <-  3

x
y
z
### 12.2: Functions

## Print Hello World
print("Hello World")


### 1.3: Computations

## Add 17 to 5
17 + 5

## Add 5 to x
5 + x
## Add 15 to 5 and store it in a variable called n
n <-  15 + 5
n
## Find the square root of 16 and store it in a variable called p
      #Square root function
p <-  sqrt(16);

## Display the square root of 16
p
## Calling variable in R

# Call y, see y value in console
y
# Call x, see x value in console
x
###########################################################
## Task Two: Basic Data Types in R 
## In this task, you will understand the different data types
## in R, and how they are used in R.
###########################################################

### 2.1: Variable Assignment

## Set the variable x to (Numeric Type)
## This is the default. 
numeric(x)
## Set the variable z (small letter z) to "Hello" (Character Type)
z <-  "Hello"
## Note: R is case sensitive: The variables 'z' and 'Z' can coexist
## in R environment and have different values.

# Set Z (capital Z) to "World"
Z <-  "World"

### 2.2: Call Variables

# Call small z
z
# Call capital Z
Z
### 2.3: Adding Object Together
z+Z
## 2.4: What do you think will be the result of this?
##Error since you cant add char vectors, only numeric
### Data Types

### Numeric

## 2.5: Check the data type of the variable a
a <-  ""
class(a)
## 2.6: Set a variable num to 8.5
num <-  8.5
## Call the variable num
num
## This is used to check the data type of a variable
class(num)
### Integers

## 2.7: Change numeric data type to integer
as.integer(num)
## Check the data type of the variable int
int <- 0
class(int)
### Character

# Check the data type of the variable w
class(w)
## 2.8: Create a character variable from a numeric variable
char <-  as.character(num)
## Call the char variable
char
class(char)
### Boolean/Logical

## 2.9: Create a logical variable u and set it as TRUE
u <- TRUE
## Check the data type of u variable
class(u)
### Factors

## 2.10: Store movie ratings in a variable called fac
fac <- c("G", "PG", "PG-13", "R")
## Check the data type
class(fac)
## 2.11: Check how many levels and the data type of the levels
fac
## 4 levels
## 2.12: Check all variables and objects that have been defined. Where can you see this?
## You can see all of the variables and objects in the environment tab
###########################################################
## Task Three: Data Structures in R: Vectors
## In this task, you will understand vectors as a data structure
## in R, and how to perform sub-setting on the vector created.
###########################################################

### VECTORS

## 3.1: Create a vector of the marks of 4 students: 79, 92, 85, 71
students <- c(79, 92, 85, 71)
## 3.2: Check the data type of the vector
class(students)
## 3.3: Check the length of the variable
length(students)
## 3.4: Indexing and Slicing
## Returns the 4th mark
students[4]
## Returns the 2nd, 3rd and 4th marks
students[2]
students[3]
students[4]
## 3.5: Create a character vector: aa, bb, cc, dd, ee, ff
s <-  c("aa", "bb", "cc", "dd", "ee") 
## 3.6 (Ex.): Check the data type and length of the vector
class(s)
length(s)
## 3.7 (Ex.): Retrieve the 1st, 2nd and 3rd characters in the char_vec vector
s[1]
s[2]
s[3]
## 3.8: Create the variable char_num_vec to take numeric and character types: aa, 2, q, xyz, 32, 42
char_num_vec <- c("aa", 2, "q", "xyz", 32, 42)
## 3.9 (Ex.) : What do you think will be the data type of the vector?
##Character since the first value is a character
class(char_num_vec)
###########################################################
## Task Four: Data Structures in R: Matrices
## In this task, you will understand matrices as a data structure
## in R, and how to perform sub-setting on the matrix created by
## accessing rows and columns of the matrix
###########################################################

### MATRICES

# 4.1: Create matrix with values from marks, 2 rows and 2 columns
A <- matrix(c(1, 2, 3, 4), nrow=2, ncol=2, byrow=TRUE)
# Call the matrix created

## 4.2: Change byrow to TRUE

# Call the matrix created
A
# 4.3: Create vector with 9 integers from 1 to 9
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)

# 4.4: Access value on second row, second column
A[2, 2]
# 4.5: Access second row
A[2, ]
# 4.6: Access second column
A[, 2]
# 4.7: Access sub-matrix with components on both 
# first 2 rows and first 2 columns
A[ ,c(1,2)]
# 4.8: Access sub-matrix with components that are 
# not on 3rd row and 3rd column
A[ ,c(1,2)]
#2x2 matrix?
###########################################################
## Task Five: Data Structures in R: Data frames
## In this task, you will understand data frames as a data structure
## in R, and how to access specific rows and columns of a data frame.
###########################################################

### DATA FRAMES

## 5.1: Create data frame with 2 columns: marks and char_vec Marks (90, 75, 40, 83), Names (Mark, Sally, Jim, Bob)
Marks <- c(90, 75, 40, 83)
Names <-  c('Mark', 'Sally', 'Jim', 'Bob')
df <-  data.frame(Marks, Names)
## Look at data frame's overall type
class(df)
## 5.2: Check the structure of each variable/feature in the data frame
str(df)
# 5.3: Look at columns' data types
df
# 5.4: Call a column in a data frame
df[ ,2]
# 5.5: Create sub data frame with first 3 rows only

subDF <- df[c(1,2,3), ]

subDF
## 5.6: Create a new data frame with 3 rows and explore it
x <- ""
y <- ""
z <- ""
df <-  data.frame(x,y,z)
str(df)
## Call the data frame 
df
## Check the data type 
class(df)
## 5.7: Create another data frame with 2 rows and the same column headers Marks (25, 35), names (Sue, Jose)
Marks <- c(25, 35)
names <- c("Sue", "Jose")
df <-  data.frame(Marks, names)
## 5.8: Use rbind and cbind to append new data to an existing dataset

## rbind - A row bind appends new values in row fashion
fashion <- c(1,3)
rbind(df, fashion)
## Create two new columns; Gender and LastName (gender M/F) and last names (Smith, Jones, Collns, Ann, Pole)
Gender <- "gender M/F"
LastName <- c("Smith", "Jones", "Collns", "Ann", "Pole")
dataFrame <- data.frame(Gender,LastName)
dataFrame
## cbind - A column bind appends new values in column fashion
cbind(fashion,1)
## Check the dataframe and its structure
str(fashion)
