

# keyboard shortcuts for R command line

# to be used only in R interactive mode

# executed automatically upon loading the packge
ksInit <- function() 
{

   # set up a general prototype, and S3 object
   lst <<- list(f = function() NA,prnt=TRUE)
   class(lst) <<- 'ksr'
   ksrProto <<- lst
   
   print.ksr <<- function(ksobj) {
      if (ksobj$prnt) print(ksobj$f()) else ksobj$f()
   }
   
   ### '/.ksr' <<- function(ksobj,x) ksobj$f(x)
   
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
   
   # setwd(dir) but also save current directory for later use with bkd;
   # sstd = "save and set directory"
      sstd <<- ksrProto
      sstd$f <<- function()  {
         d <- readline('new directory: ')
         saveDir <<- getwd() 
         setwd(d)
         print(getwd())
      }
   
   # restore dir to the one saved above
      bkd <<- ksrProto
      bkd$f <<- function() {setwd(saveDir); saveDir <<- NULL; message(getwd())}

}

# forms the abbreviation 'name' for the operation 'op'
ksrAbbrev <- function(name,op,hasArgs) {
   cmd <- paste0(name,' <<- ksrProto')
   evalrstring(cmd)
   cmd <- paste0(name,'$f <<- function() ',op)
   evalrstring(cmd)
}

# example:

# x <- 3
# ksrAbbrev('ad1','x <<- x + 1')
# ad1
# print(x)  # 4
