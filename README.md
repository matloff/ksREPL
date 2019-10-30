# ksREPL
Keyboard shortcuts for the R command line.

For example, in R, I work a lot with directories, moving often from one
to another.  This is the case for my classwork, where I have a different
directory for each student, each exam, and so on.  The same is true for
my work on the *R Journal* editorial board.

So for instance I'd like to have a short alias for common R command-line
operations, e.g. typing *gtd* instead of *getwd()*.  By saving
keystrokes, and especially by avoding having to hunt for the left and
right parenthesis keys, I type faster and get can better focus on the
operations I need to go through.

To make this abbreviation, I type 

``` r
> ksrAbbrev('gtd','getwd()')
```

From then on, whenever I want to check which directory I'm in, I type

``` r
> gtd
```

This one is included in the package; see below.  Here's how to make new
ones:

For instance, in debugging a program function **f(x,s)**, say my test
case is **f(8,'abc')**.  It would be nice if I could just type, say,
'f8' as an abbrevation, again fewer keystrokes and no parentheses.

I set this up by typing

``` r
> f8 <- ksProto
> f8$f <- ksrAbbrev('f8','f(8,"abc")')
```

From then on, I simply type

``` r
> f8
```

The package has a few macros built in: including *gtd* (as above), *upd*
(same as *setwd('..')*. 

*gtd*: "get directory," getwd()
<br>
*upd*: "up directory," setwd('..')
<br>
*sstd*: "save and set directory," save current directory in saveDir,
then change (reads new directory from keyboard)

