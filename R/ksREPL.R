

# keyboard shortcuts for R command line

# to be used only in R interactive mode

ksInit <- function() 
{

   lst <<- list(f = function() NA,prnt=TRUE)
   class(lst) <<- 'ksr'
   ksrProto <<- lst
   
   print.ksr <<- function(ksobj) {
      if (ksobj$prnt) print(ksobj$f()) else ksobj$f()
   }
   
   '/.ksr' <<- function(ksobj,x) ksobj$f(x)
   
   # print(getwd())
      gtd <<- ksrProto
      gtd$f <<- getwd
   #  then 
   #     > gtd 
   #  prints current dir
   
   # setwd('..')
      upd <<- ksrProto
      upd$f <<- function() {setwd('..'); message(getwd())}
      upd$prnt <<- FALSE
   #  then 
   #  > upd
   #  does cd ..
   
   # setwd(dir)
   #   could do
   #    std <<- ksrProto
   #    std$f <<- function(dir) {saveDir <<- dir; setwd(dir); message(getwd())}
   #    std$prnt <<- FALSE
   # then std/'xyz' to go to xyz dir, but doesn't save many keystrokes
      std <<- function(dir) {
          saveDir <<- getwd()
          setwd(dir)
      }
   #  then e.g.
   #  > std('abc')
   #  does cd to 'abc', saving current dir first
   
   # restore dir
      bkd <<- ksrProto
      bkd$f <<- function() {setwd(saveDir); saveDir <<- NULL; message(getwd())}
      upd$prnt <<- FALSE

}

# forms the abbreviation 'name' for the operation 'op'
ksrAbbrev <- function(name,op) {
   cmd <- paste0(name,' <<- ksrProto')
   evalrstring(cmd)
   cmd <- paste0(name,'$f <<- function() ',op)
   evalrstring(cmd)
}

# example:

x <- 3
ksrAbbrev('ad1','x << x + 1')
ad1
print(x)  # 4
