

# keyboard shortcuts for R command line

# to be used only in R interactive mode

# executed automatically upon loading the packge
ksInit <- function() 
{

   # set up a general prototype, and S3 object
   lst <<- list(f = function() NA,prnt=TRUE)
   class(lst) <<- 'ksr'
   ksProto <<- lst

   print.ksr <<- function(ksobj) {
      if (ksobj$prnt) print(ksobj$f()) else ksobj$f()
   }
   
   ### '/.ksr' <<- function(ksobj,x) ksobj$f(x)
   
   # print(getwd())
      gtd <<- ksProto
      gtd$f <<- getwd
      ksList <<- data.frame(opName='gtd',op='getwd()')
      browser()
   
   # setwd('..')
      upd <<- ksProto
      upd$f <<- function() {setwd('..'); message(getwd())}
      upd$prnt <<- FALSE
      ksList <<- rbind(ksList,data.frame(opName='upd',op='setwd(..)'))
   
   # setwd(dir) but also save current directory for later use with bkd;
   # sstd = "save and set directory"
      sstd <<- ksProto
      sstd$f <<- function()  {
         d <- readline('new directory: ')
         saveDir <<- getwd() 
         setwd(d)
         print(getwd())
      }
      ksList <<- rbind(ksList,data.frame(opName='sstd',op='save dir, setwd()'))
   
   # restore dir to the one saved above
      bkd <<- ksProto
      bkd$f <<- function() {setwd(saveDir); saveDir <<- NULL; message(getwd())}
      ksList <<- rbind(ksList,data.frame(opName='bkd',op='back to saved dir'))

}

# forms the abbreviation 'name' for the operation 'op'
ksAbbrev <- function(name,op,hasArgs) {
   cmd <- paste0(name,' <<- ksProto')
   evalrstring(cmd)
   cmd <- paste0(name,'$f <<- function() ',op)
   evalrstring(cmd)
   ksList <<- rbind(ksList,data.frame(opName=name,op=op))

}

# example:

# x <- 3
# ksAbbrev('ad1','x <<- x + 1')
# ad1
# print(x)  # 4
