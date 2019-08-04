
# not ready yet

ksInit <- function() {
   lst <- list(f = function() NULL)
   class(lst) <- 'ks'
   assign('ksProto',lst,envir=.GlobalEnv)
}

print.ks <- function(ksobj) {
   print(ksobj$f())
}

### # example
### lsks$f <- function() ls(,envir=.GlobalEnv)
### # then 
### # lsks
### # prints what ls() prints at top level
### 
### # directory ops
### 
### wdInit <- function() {
###    wdStack <<- getwd()
### }
### 
# get current dir
   assign('gwd',ksProto,envir=.GlobalEnv)
   assign('gwd$f',getwd,envir=.GlobalEnv)
# then gwd prints current dir

### # set current dir
### swd <- proto
### swd$f <- function() {
###    tmp <- readline()
###    setwd(tmp)
###    wdStack <<- c(tmp,wdStack)
### }
### # then swd will take 1 line of keybd input, to state the new dir, will
### # change to that dir, and add it to the stack
### 
### # pop dir
### popd <- proto
### popd$f <- function() {
###    wdStack <<- wdStack[-1]
###    setwd(wdStack[1])
### }
### 
### # swap dirs
### swpd <- proto
### swpd$f <- function() {
###    wdStack[1:2] <<- wdStack[2:1]
###    setwd(wdStack[1])
### }

