#!/bin/sh
# This is a shell archive (produced by GNU sharutils 4.6.3).
# To extract the files from this archive, save it to some FILE, remove
# everything before the `#!/bin/sh' line above, then type `sh FILE'.
#
lock_dir=_sh08414
# Made on 2010-12-08 20:37 UTC by <ying@althonx4>.
# Source directory was `/mnt/rd1/lithp'.
#
# Existing files will *not* be overwritten, unless `-c' is specified.
#
# This shar contains:
# length mode       name
# ------ ---------- ------------------------------------------
#   2166 -rw-r--r-- lithp/version.nw
#   7067 -rw-r--r-- lithp/vars.nw
#    624 -rw-r--r-- lithp/TODO
#   6103 -rw-r--r-- lithp/samples.nw
#   5106 -rw-r--r-- lithp/README
#   5109 -rw-r--r-- lithp/parser.nw
#   3526 -rw-r--r-- lithp/main.nw
#  13471 -rw-r--r-- lithp/lists.nw
#  24480 -rw-r--r-- lithp/LICENSE
#   1824 -rw-r--r-- lithp/intro.nw
#   2611 -rw-r--r-- lithp/GNUmakefile
#  52035 -rw-r--r-- lithp/eval.nw
#
MD5SUM=${MD5SUM-md5sum}
f=`${MD5SUM} --version | egrep '^md5sum .*(core|text)utils'`
test -n "${f}" && md5check=true || md5check=false
${md5check} || \
  echo 'Note: not verifying md5sums.  Consider installing GNU coreutils.'
save_IFS="${IFS}"
IFS="${IFS}:"
gettext_dir=FAILED
locale_dir=FAILED
first_param="$1"
for dir in $PATH
do
  if test "$gettext_dir" = FAILED && test -f $dir/gettext \
     && ($dir/gettext --version >/dev/null 2>&1)
  then
    case `$dir/gettext --version 2>&1 | sed 1q` in
      *GNU*) gettext_dir=$dir ;;
    esac
  fi
  if test "$locale_dir" = FAILED && test -f $dir/shar \
     && ($dir/shar --print-text-domain-dir >/dev/null 2>&1)
  then
    locale_dir=`$dir/shar --print-text-domain-dir`
  fi
done
IFS="$save_IFS"
if test "$locale_dir" = FAILED || test "$gettext_dir" = FAILED
then
  echo=echo
else
  TEXTDOMAINDIR=$locale_dir
  export TEXTDOMAINDIR
  TEXTDOMAIN=sharutils
  export TEXTDOMAIN
  echo="$gettext_dir/gettext -s"
fi
if (echo "testing\c"; echo 1,2,3) | grep c >/dev/null
then if (echo -n test; echo 1,2,3) | grep n >/dev/null
     then shar_n= shar_c='
'
     else shar_n=-n shar_c= ; fi
else shar_n= shar_c='\c' ; fi
f=shar-touch.$$
st1=200112312359.59
st2=123123592001.59
st2tr=123123592001.5 # old SysV 14-char limit
st3=1231235901

if touch -am -t ${st1} ${f} >/dev/null 2>&1 && \
   test ! -f ${st1} && test -f ${f}; then
  shar_touch='touch -am -t $1$2$3$4$5$6.$7 "$8"'

elif touch -am ${st2} ${f} >/dev/null 2>&1 && \
   test ! -f ${st2} && test ! -f ${st2tr} && test -f ${f}; then
  shar_touch='touch -am $3$4$5$6$1$2.$7 "$8"'

elif touch -am ${st3} ${f} >/dev/null 2>&1 && \
   test ! -f ${st3} && test -f ${f}; then
  shar_touch='touch -am $3$4$5$6$2 "$8"'

else
  shar_touch=:
  echo
  ${echo} 'WARNING: not restoring timestamps.  Consider getting and'
  ${echo} 'installing GNU `touch'\'', distributed in GNU coreutils...'
  echo
fi
rm -f ${st1} ${st2} ${st2tr} ${st3} ${f}
#
if test ! -d ${lock_dir}
then : ; else ${echo} 'lock directory '${lock_dir}' exists'
  exit 1
fi
if mkdir ${lock_dir}
then ${echo} 'x - created lock directory `'${lock_dir}\''.'
else ${echo} 'x - failed to create lock directory `'${lock_dir}\''.'
  exit 1
fi
# ============= lithp/version.nw ==============
if test ! -d 'lithp'; then
  mkdir 'lithp'
if test $? -eq 0
then ${echo} 'x - created directory `lithp'\''.'
else ${echo} 'x - failed to create directory `lithp'\''.'
  exit 1
fi
fi
if test -f 'lithp/version.nw' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING lithp/version.nw (file already exists)'
else
${echo} 'x - extracting lithp/version.nw (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'lithp/version.nw' &&
@
\section{Version information}
\label{sec:version}
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X
<<version build version>>=
"0.6"
@
X
<<version build date>>=
"2001-10-16"
@
X
<<version build tpotc>>=
"Baloo"
@
X
2001-10-16 "Baloo" 0.06
\begin{itemize}
\item set and setq combined to one helper function to reduce code size
\item fixed single parameter defun calls 
\item fixed parsing over tabs 
\item new: gc, garbage-collect  (return "T")
\item new: enum, select
\item added a hello, world to the sample.  (type 'make test')
\item added version information into main.nw
\end{itemize}
X
2001-10-10 "Storm" 0.5
\begin{itemize}
\item	Changed the parser to use a pair of callbacks. (more flexible)
\end{itemize}
X
X
2001-10-10 "Trebuchet" 0.4
\begin{itemize}
\item	new: defun
\item	List tagging functions (list.nw) added for the above
\end{itemize}
X
2001-10-09 "Collasping" 0.3
\begin{itemize}
\item	new: set, setf, setq (new version)
\item	new: equal
\item   old: quote
\end{itemize}
X
2001-10-08 "Uakti" 0.2
\begin{itemize}
\item	Philip Glass album, and Brazillian band
\item	added 'quote' parsing
\item	converted over to full list passing (setq hello '(0 1 1 3 4)) works
\item	fixed the evaluation of a variable name as a return valuE
\item	new: and, or, not, null, atom, car, cdr, cons, list
\item	new: if, unless, when, cond
\item	new: eval, prog1, prog2, progn
\item	new: printc, terpri
\end{itemize}
X
2001-10-07 "In The Window"
\begin{itemize}
\item	basics of setq done.  integrated and debugged the variable mechanism
\item	it does not yet do things like:  (setq hello '(0 1 1 3 4))
\end{itemize}
X	 
2001-10-03 "Building A Wall" 0.1
\begin{itemize}
\item	Orbital - "Illuminate"
\item	initial file parser
\item	initial tree builder
\item	variable list tools
\item	beginnings of the evaluator
\item	add, subtract, multiply, divide added
\end{itemize}
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{The Source File [[version.h]]}
\label{sec:version.h}
X
<<version.h>>=
X
#define VER_BUILD_DATE  <<version build date>>
#define VER_BUILD_VER	<<version build version>>
#define VER_BUILD_TPOTC <<version build tpotc>>
X
@
SHAR_EOF
  (set 20 01 12 23 03 00 40 'lithp/version.nw'; eval "$shar_touch") &&
  chmod 0644 'lithp/version.nw'
if test $? -ne 0
then ${echo} 'restore of lithp/version.nw failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'lithp/version.nw: MD5 check failed'
       ) << SHAR_EOF
0f5d90aff3e067588987355b08e5eac5  lithp/version.nw
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'lithp/version.nw'` -ne 2166 && \
  ${echo} 'restoration warning:  size of lithp/version.nw is not 2166'
  fi
fi
# ============= lithp/vars.nw ==============
if test ! -d 'lithp'; then
  mkdir 'lithp'
if test $? -eq 0
then ${echo} 'x - created directory `lithp'\''.'
else ${echo} 'x - failed to create directory `lithp'\''.'
  exit 1
fi
fi
if test -f 'lithp/vars.nw' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING lithp/vars.nw (file already exists)'
else
${echo} 'x - extracting lithp/vars.nw (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'lithp/vars.nw' &&
@
\section{The Variable Mechanisms}
\label{sec:variablemechanisms}
X
Rather than using another structure and linked-list system, we will just
use the same list structure that we use for the files itself.  This also
gives us the flexibility of having a variable point to a structure or 
the like.  
X
We will basically assume we have another list, called [[varlist]] in
these methods, which will basically be a single backbone with all of the
variable names.  Their [[branch]] element will contain a pointer to the 
data that the variable defines.
X
All of these basic methods will interact with the list at the level of 
the list itself.  That is to say, with the exception of macros, when you
add a new variable or retrieve a variable, you will be handing around 
[[le]] structs.  
X
Any data passed in will be duplicated internally where storage is involved.
Any returned elements will be the new stored data bits.  That is to say,
that you should not free any pointers returned by these methods.
X
<<Variable list definition>>=
extern le * mainVarList;
@
<<Variable list initialization>>=
le * mainVarList = NULL;
@
X
Since the mechanisms are identical for working with user-defined
functions, we will store those lists in here as well, even though 
we don't have to.  
X
<<Defun list definition>>=
extern le * defunList;
@
<<Defun list initialization>>=
le * defunList = NULL;
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {List Manips}
\label{sec:listmanips}
X
Some functions for working specifically with the variable lists.
Since these use the same [[le]] structure as defined previously,
but it is used a little differently, we need some functions for
working with the lists.  These are those functions.
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {variableFind}
X
This will return the [[le]] element whose [[data]] matches
the [[key]] passed in, in the variable list, [[varlist]].
X
If it was not found, a [[NULL]] is returned.
X
<<Variable find proto>>=
X    le * variableFind( le * varlist, char * key )
@
X
<<Variable find implementation>>=
X    <<Variable find proto>>
X    {
X	le * temp = varlist;
X
X	if (!varlist || !key) return( NULL );
X
X	while (temp)
X	{
X	    if (!strcmp(key, temp->data))
X	    {
X		return( temp );
X	    }
X	    temp = temp->list_next;
X	}
X
X	return( NULL );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {variableFree}
X
Since we're using [[le]] lists for the variable system, the 
``free'' function is just a macro that calls the appropriate
[[le]] function, as seen here:
X
<<Variable free macro>>=
#define variableFree( L ) \
X		leWipe( (L) )
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {Get and Set Variables}
\label{sec:getandsetvariables}
X
And, of course, some simple methods for dealing with setting 
and getting of variables in the variable list.
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {variableSet}
X
This will add a variable with the [[key]] and [[value]] passed in onto
the end of the [[varlist]], and then return the resulting list.
X
This is used when we set lists for variable values.
X
<<Variable set proto>>=
X    le * variableSet( le * varlist, char * key, le * value )
@
X
<<Variable set Implementation>>=
X    <<Variable set proto>>
X    {
X	le * temp;
X
X	if (!key || !value)  return( varlist );
X
X	temp = variableFind( varlist, key );
X	if ( temp )
X	{
X	    leWipe( temp->branch );
X	    temp->branch = leDup( value );
X	} else {
X	    temp = leNew( key );
X	    temp->branch = leDup( value );
X	    varlist = leAddHead( varlist, temp );
X	}
X	return( varlist );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {variableSetString}
X
This will add a variable with the [[key]] and [[value]] passed in onto
the end of the [[varlist]], and then return the resulting list.
X
This is used when we set strings for variable values.
X
<<Variable set string proto>>=
X    le * variableSetString( le * varlist, char * key, char * value )
@
X
<<Variable set string Implementation>>=
X    <<Variable set string proto>>
X    {
X	le * temp;
X
X	if (!key || !value)  return( varlist );
X
X	temp = leNew(value);
X
X	varlist = variableSet( varlist, key, temp );
X	
X	leWipe( temp );
X
X	return( varlist );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {variableGet}
X
This will retrieve a variable with the [[key]] from the [[varlist]].
It will return the variable data, or a [[NULL]] if it was not found.
X
This is used when we want to retrieve list values.
X
<<Variable get proto>>=
X    le * variableGet( le * varlist, char * key )
@
X
<<Variable get Implementation>>=
X    <<Variable get proto>>
X    {
X	le * temp = variableFind(varlist, key);
X	if (temp && temp->branch)
X	    return( temp->branch );
X	return( NULL );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {variableGetString}
X
This will retrieve a variable with the [[key]] from the [[varlist]].
It will return the variable data, or a [[NULL]] if it was not found.
X
This is used when we want to retrieve string values.
X
<<Variable get string proto>>=
X    char * variableGetString( le * varlist, char * key )
@
X
<<Variable get string Implementation>>=
X    <<Variable get string proto>>
X    {
X	le * temp = variableFind(varlist, key);
X	if (   temp
X            && temp->branch
X            && temp->branch->data
X	    && countNodes(temp->branch) == 1
X	    )
X	    return( strdup(temp->branch->data) );
X	return( strdup("-1") );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {Debug functions}
\label{sec:varsdebugtools}
X
A simple iterator to print out all of the variables in the variable
list [[varlist]] passed in.
X
<<Variable dump proto>>=
X    void variableDump( le * varlist )
@
X
<<Variable dump Implementation>>=
X    <<Variable dump proto>>
X    {
X        le * temp = varlist;
X	while (temp)
X	{
X	    if (temp->branch && temp->data)
X	    {
X		printf("%s \t", temp->data);
X		leDumpReformat( stdout, temp->branch );
X		printf("\n");
X	    }
X	    temp = temp->list_next;
X	}
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {vars.c}
\label{varsdotc}
X
Here we build up all of the above blocks into the .c file.
X
<<vars.c>>=
#include "vars.h"
#include <string.h>
X
<<Variable list initialization>>
<<Defun list initialization>>
X
<<Variable find implementation>>
X
<<Variable set Implementation>>
<<Variable set string Implementation>>
<<Variable get Implementation>>
<<Variable get string Implementation>>
X
<<Variable dump Implementation>>
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {vars.h}
\label{varsdoth}
X
And we need to do the same for the header file as well.
X
<<vars.h>>=
#include <stdio.h>
#include "lists.h"
X
<<Variable list definition>>
<<Defun list definition>>
X
<<Variable find proto>>;
<<Variable free macro>>;
X
<<Variable set proto>>;
<<Variable set string proto>>;
<<Variable get proto>>;
<<Variable get string proto>>;
X
<<Variable dump proto>>;
@
SHAR_EOF
  (set 20 01 10 10 22 08 22 'lithp/vars.nw'; eval "$shar_touch") &&
  chmod 0644 'lithp/vars.nw'
if test $? -ne 0
then ${echo} 'restore of lithp/vars.nw failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'lithp/vars.nw: MD5 check failed'
       ) << SHAR_EOF
4eee5f7a601f32408e4ff3ee26f007ff  lithp/vars.nw
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'lithp/vars.nw'` -ne 7067 && \
  ${echo} 'restoration warning:  size of lithp/vars.nw is not 7067'
  fi
fi
# ============= lithp/TODO ==============
if test -f 'lithp/TODO' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING lithp/TODO (file already exists)'
else
${echo} 'x - extracting lithp/TODO (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'lithp/TODO' &&
########## 
>> (setf x 4)
4
>> x   
4
>> (x)
NIL
>> '(x)
NIL
X
X
########## load
Recursively load the specified file, and evaluate it.
X
(load "filepath")
X - returns "T" if successfully loaded
X
X
########## let
X
Let evaluates the expressions, and sets up local variables with
those expressions in them, then executes the body with those
expressions.  (very similar to 'defun' in a lot of ways, nearly
identical to the horribly formatted 'lambda')
X
The last return value from the from the body block gets returned.
X
(let ( (<var1> <exp1>)
X       (<var2> <exp2>)
X       (<varN> <expN>))
X     <body>
) ; vars are local to the body
SHAR_EOF
  (set 20 01 10 16 18 11 36 'lithp/TODO'; eval "$shar_touch") &&
  chmod 0644 'lithp/TODO'
if test $? -ne 0
then ${echo} 'restore of lithp/TODO failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'lithp/TODO: MD5 check failed'
       ) << SHAR_EOF
8a3e332e102e3da22eb6eca3d739f4ac  lithp/TODO
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'lithp/TODO'` -ne 624 && \
  ${echo} 'restoration warning:  size of lithp/TODO is not 624'
  fi
fi
# ============= lithp/samples.nw ==============
if test -f 'lithp/samples.nw' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING lithp/samples.nw (file already exists)'
else
${echo} 'x - extracting lithp/samples.nw (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'lithp/samples.nw' &&
@
\section{Sample files}
\label{sec:samples}
X
This is a bunch of sample files to test the system with.
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {Sample 01}
X
<<sample01.lsp>>=
(setq world "world" hi "Hello" comma "," exclamation "!")
(list hi comma world exclamation)
X
@
X
<<sample04.lsp>>=
(setq world "world" hi "Hello" comma "," exclamation "!")
(list hi comma world exclamation)
X
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {Sample 02}
X
<<sample02.lsp>>=
;; this is a test
; this should be a comment 
; (+ 4 5)
X
; first some simple math functions
(+ 3 2)
(- 4 5)
(* 4 9)
(/ 100 20)
X
; some nests and paren testing.
(+ (- 4 5) ( + 3 4) 10)
( * ( + 3 4 ( - 10 7) 9) 17)
(* ( + 3 4 ( - 10 7) 9) 17)
(*(+ 3 4(- 10 7)9)17)
(- 4)
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {Sample 03}
X
<<sample03.lsp>>=
; this is a bunch of supported stuff.  it's good regression testing material...
; uncomment the part you want to try...
; (+ 4 5)
X
; some simple math functions
(+ 4 3 2)
(- 10 4)
(- 3)
(- (- 1 10) )
(* 4 9)
(/ 100 20)
X
;(1+ 30)
;(1- 30)
X
;(1+ (+ 20 30))
;(1- (+ 20 30))
;(% 2001 4)
;(% 4 2001)
X
;(4)
;(-4)
;4
X
;(and (< 100 (setq a 1)) (> 300 (setq a 2)) (setq a 3) )
;(a)
;(and (> 100 (setq a 1)) (> 300 (setq a 2)) (setq a 3) )
;(a)
;(and (> 100 (setq a 1)) (> 300 (setq a 2)) (setq a 400) )
;(a)
;(and (> 100 (setq a 1)) (> 300 (setq a 2)) )
;(a)
X
(or (< 100 (setq a 1)) (< 300 (setq a 2)) NIL)
(a)
X
;(< 100 5)
;(< 5 100)
;(< 5 5)
X
;(<= 100 5)
;(<= 5 100)
;(<= 5 5)
X
;(> 100 5)
;(> 5 100)
;(> 5 5)
X
;(>= 100 5)
;(>= 5 100)
;(>= 5 5)
X
;(= 100 5)
;(= 5 100)
;(= 5 5)
X
;(not (= 100 5))
;(not (= 5 100))
;(not (= 5 5))
X
;(setq hello '(0 1 1 3 4))
;(hello)
;(atom hello)
X
;(atom (setq foo  (+ 2 3)))
;(atom (setq bar '(+ 2 3)))
;(atom 'a)
;(atom 8)
;(atom '(a b c))
X
X
;(setq hi quote (H E L L O))
;(setq hi2 '(H E L L O))
X
;(setq floop goo)
(setq cheese "cheese is quite yummy")
;(setq f 34)
;(setq g '(+ 4 3))
;(setq q 3)
;(setq w '3)
;(setq e '(3))    ; these don't currently get handled properly in eval
;(setq r '((3)))  ; these don't currently get handled properly in eval
;(setq t '(()))   ; these don't currently get handled properly in eval
;(setq g (+ 9 2))
;(setq foo '(+ (- 3 4 5) (* 2 3 4)))
;(setq bar (+ (- 3 4 5) (* 2 3 4)))
;(+ 2 (setq p (+ 5 3)))
X
;(+ f g p)
X
;(+ 2 (setq x (* 3 4)))
;(+ 0 x)
X
(setq x 5)
(setq y (1+(+ 0 x)))
(x) (y)
X
;(+ 4 '(+ 3 4 '5 6 7))
;(+ 4 quote (+ 3 4 '5 6 7))
X
;(setq mud "dirt" smog "smoke")
X
X
;(car '(a b c))
;(cdr '(a b c))
;(setq x '(a b c))
;(car x)
;(cdr x)
X
;(cdr '())
;(car '())
;(cdr '(a))
;(car '(a))
X
;(car '((a b)))
;(car (car '((a b))))
;(cdr '((a b) (c d))))
X
;(cdr '(a b))
;(car (cdr '(a b c d e)))
;(car '( (a b c) (d e f) (g h i) ) )
;(cdr '( (a b c) (d e f) (g h i) ) )
X
;(car (cdr '((a b) (c d)) ))
;(cdr (car '((a b) (c d)) ))
X
;(atom (cdr '((a b) (c d)) ))
;
;(cdr (car '((a b) (c d))))
;;
;(cdr (car '((a b c) (d e f))))
;(car (car '((a b c) (d e f))))
;(car (cdr '((a b c) (d e f))))
;(car (car (cdr '((a b c) (d e f)))))
(cdr (car (cdr '((a b c) (d e f)))))
(car (cdr (car (cdr '((a b c) (d e f))))))
X
;(cons 'a '(b c))
;(setq x (cons 'a '(b c)))
;(car x)
;(cdr x)
;(cons 'a '(b))
;(cons '(a b) '(c d))
;(cons 'a (cons 'b '(c d)))
X
;(setq x '(a b))
;(cons (car x) (cons (car (cdr x)) '(c d)) )
X
;(setq x 'a)
;(setq y '(b c))
;(cons x y)
;(x)
;(y)
;(car (setq x '(a b c)))
;(car '(setq x '(a b c)))
X
(list 'a 'b 'c)
(list 'a '(b c) 'd)
(list 'a 'b 'c 'd)
;(list 'a)
;(list)
X
(setq result (if (< 3 4) (setq a '(t r o o)) (setq b '(f a l e s))) )
(a)(b)(result)
(setq result (if (> 3 4) (setq c '(t r o o)) (setq d '(f a l e s))) )
(c)(d)(result)
X
;(setq result (if (< 3 4) (setq a '(t r o o)) ) )
;(a)(b)(result)
;(setq result (if (> 3 4) (setq c '(t r o o)) ) )
;(c)(d)(result)
X
;(unless (< 3 4) (setq x (+ 3 4)) (setq y '(+ 9 8)) )
;(unless (> 3 4) (setq w (+ 3 4)) (setq z '(+ 9 8)) )
;
;(when (< 3 4) (setq a (+ 3 4)) (setq d '(+ 9 8)) )
;(when (> 3 4) (setq s (+ 3 4)) (setq f '(+ 9 8)) )
X
;(cond ( (> 3 4) (setq a 'one1) (setq b 'one2) )
;      ( (= 3 4) (setq c 'two1) (setq d 'two2) )
;      ( (< 3 4) (setq e 'three1) (setq f 'three2) )
;)
;
;(cond ( (> 3 4) (setq g 'one1) (setq h 'one2) )
;      ( (= 3 4) (setq i 'two1) (setq j 'two2) )
;      ( (< 3 4) )
;)
X
;(princ '"hello world")
;(terpri)
;(princ "this is also a test");
X
;(setq a 'b)
;(setq b 'c)
;(a)
;(b)
;(eval a)
;
;(eval (cons '+ '(2 3)))
X
;(prog1 (car '(a b c)) (cdr '(a b c)) (cdr '(d e f)) (cdr '(g h i)))
;(prog2 (car '(a b c)) (cdr '(a b c)) (cdr '(d e f)) (cdr '(g h i)))
;(progn (car '(a b c)) (cdr '(a b c)) (cdr '(d e f)) (cdr '(g h i)))
X
;(setq hello '(0 1 1 3 4))
;(hello)
;(atom hello)
X
;(setq a '(f 0 o))
;(setq b (+ 3 4))
;(setq c (+ 3 4) d (1+ b) e '(4 5 6))
;(setq f (+ 3 4) g (1+ b) h)
X
;(setq g '(a b c d))
;(set 'b '(a b c d))
;
;(set (car g) (cdr g))
X
;(setq x '(a b c))
;(setq y (cdr x))
;(setq z '(b c))
;
;(equal (cdr x) y)
;(equal y z)
;(equal z z)
;(equal x z)
;(equal x '(a b c))
X
;(defun addthree (x) (+ x 3))
;
;(defun addtwoto3 (x y) (+ x y 3))
;
;(addtwoto3 2 3)
;(addtwoto3 2 3 4)
;
(addthree 3)
;(addthree 3 5 7)
;
;(addthree (* 4 (1- 7)))
;
;(defun average (x y) (/ (+ x y) 2))
;(average 7 (car '(21 3 4 5)))
;(average 9 31)
;
;(setq foo  '(7 21 34 22 99))
;(car foo) (car (cdr foo))
;(/ (+ (car foo) (car (cdr foo))) 2)
;
;(defun averagel (x) (/ (+ (car x) (car (cdr x))) 2))
;(averagel '(7 21 34 22 99))
;(averagel '(9 31 34 22 99))
;
(defun three (x) (+ 2 1))
(three 4)
;(setq x (+ 4 5))
;(setq x (1+ x))
;(defun addthree (x) (+ x 3))
;
;(addthree 4)
;(addthree (5))
;
;(addthree 4)
;(addthree 5 2)
;(defun seven () '(7))
;(defun seven2 () (7))
;
;(seven)
;(seven2 ())
X
;(enum a b c d e)
;(enum)
;(enum ())
;(enum z y (e r t y) x)
;(enum aa bb aa cc)
X
; (gc)
; (pq)
X
;(setq x 4)
;
;(select)
;(select (+ x 1) 
;	(3 (setq a 'three)) 
;	(4 (setq a 'four)) 
;	(9 (setq a 'five)) 
;	(6 (setq a 'six))
;;)
;
;(select (+ x 1) 
;	(5 (setq b 'five)) 
;	(6 (setq b 'six))
;)
;
;(select (+ x 1) 
;	(6 (setq b 'six))
;)
;
;(select (+ x 1) 
;)
@
SHAR_EOF
  (set 20 01 11 10 05 31 41 'lithp/samples.nw'; eval "$shar_touch") &&
  chmod 0644 'lithp/samples.nw'
if test $? -ne 0
then ${echo} 'restore of lithp/samples.nw failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'lithp/samples.nw: MD5 check failed'
       ) << SHAR_EOF
ea1a3c621540afb3a8eb86cb2dc14195  lithp/samples.nw
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'lithp/samples.nw'` -ne 6103 && \
  ${echo} 'restoration warning:  size of lithp/samples.nw is not 6103'
  fi
fi
# ============= lithp/README ==============
if test -f 'lithp/README' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING lithp/README (file already exists)'
else
${echo} 'x - extracting lithp/README (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'lithp/README' &&
----------------------------------------
X                                   LITHP
X         A small simple LISP interpreter
X
X                  Scott "Jerry" Lawrence
X                            2001 October
X                         jsl@absynth.com
X
X           http://www.cis.rit.edu/~jerry
X
X
----------------------------------------
X                                OVERVIEW
X
This is a basic, tiny LISP implementation.  It was created to be a
configuration/logic file format for a game I am working on.  It is
easily extendable enough to be used for other projects as well.
X
This project is meant to be included within your own work.  There is a
sample executable that gets built that reads in from a file, and
interprets it, but it is very easy to integrate this source into your
own projects.
X
It is also very easy to add your own methods into the evaluation core.
X
X
----------------------------------------
X                      Supported Commands
X
Misc:
X
#	# foo		comment - skipped during parsing
;	; foo		comment - skipped during parsing
X
A	(A)		returns the value
X
Variables, Functions:
set	(set A B ... )	sets A to B, evaluating both.  Returns B.
setf	(setf A B ... )	sets A to B, evaluating only B.  Returns B.
setq	(setq x 4 y 3)	same as 'setf'
defun	(defun A B C)	defines a function called A with parameter list B
X			and code block C.  Returns A.
X	(A X Y)		Calling the above (if there were two parameters.)
X			Wrong number of parameters returns NIL w/o evaluating
enum	(enum a b c)	sets up N variables with incrementing values.
X
Numbers:
X
+	(+ A B C)	add a list
-	(- A B C)       subtract a list
*	(* A B C)       multiply a list
/	(/ A B C)       divide a list
%	(% A B)		After A is divided by B, what's the leftover?
X
1+	(1+ A)		returns the number plus one
1-	(1- A)		returns the number minus one
X
X
Comparisons:
X
<	(<  A B)	returns T if A <  B, otherwise NIL
<=	(<= A B)	returns T if A <= B, otherwise NIL
>	(>  A B)	returns T if A >  B, otherwise NIL
>=	(>= A B)	returns T if A >= B, otherwise NIL
=	(=  A B)	returns T if A == B, otherwise NIL
X
and	(and A B)	eval's the arguments until it hits a NIL
or	(or A B)	eval's the arguments while args are NIL
not	(not A)		returns the opposite of A (T->NIL),(NIL->T)
null	(null A)	same as 'not'
X
if 	(if A B C)	if A is true, then B else C. if there's no C, return NIL
unless	(unless A B C)	unless A is true, do B, C and any others.
when	(when A B C)	when A is true, do B, C and any others.
cond	(cond (A B C))  if A is true then do B,C... otherwise, try the next set
select	(select A B C)	case statement.  Evaluates 'A', then compares it to
X			the first values of lists B and C.  If they were equal,
X			the rest of the list gets evaluated, and last return 
X			gets returned.
X
X
Evaluations:
X
eval	(eval (A B))	evaluates (A B) as if it were directly input
prog1	(prog1 A B C)	evaluates all parts, returns the first's return value
prog2	(prog2 A B C)	evaluates all parts, returns the second's return value
progn	(progn A B C)	evaluates all parts, returns the last's return value
X
X
Lists:
X
quote	quote (A B)	returns the element instead of evaluating it
'	'(A B)		same as 'quote'
X
atom 	(atom E)	returns T if E evaluates to an atom, not a list
equal	(equal A B)	returns T if A and B have the same structure and atoms
X
car 	(car E)		returns the head of list E
cdr 	(cdr E)		returns all but the head of list E
cons 	(cons A B)	returns a appended to the head of list B
list	(list A B)	returns a list of the elements as passed in
X
X
Output:
X
princ	(princ A B)	print out the list entries and atoms
terpri	(terpri)	print out a new line (terminate printing)
X
X
Misc:
X
gc	(gc)		garbage collect.  Returns "T".  (does nothing)
garbage-collect		same as 'gc'
X
----------------------------------------
X                                   BUILD
X
You should be able to just type 'make' or 'gmake' or whatever your
GNU make is called.  The Build process depends on:
X	noweb literate programming toolset
X	
If you want the document, you also need:
X	pdflatex
X	latex
X
To build the doc, type:
X	make docs
X
The build process will also generate a few sample LISP test files.
X
X
----------------------------------------
X                                 VERSION
X
The latest version of this should be available off of 
X
X	http://www.cis.rit.edu/~jerry/Software/lithp
X
Be sure you're using the latest version.
X
X
X
----------------------------------------
X                                 LICENSE
X
X
This program is free software; you can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License as published
by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
X
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.
X
You should have received a copy of the GNU Lesser General Public
License along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
USA
SHAR_EOF
  (set 20 01 10 16 18 31 16 'lithp/README'; eval "$shar_touch") &&
  chmod 0644 'lithp/README'
if test $? -ne 0
then ${echo} 'restore of lithp/README failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'lithp/README: MD5 check failed'
       ) << SHAR_EOF
2c2938983b9ff976a3bb4c5bde232ae9  lithp/README
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'lithp/README'` -ne 5106 && \
  ${echo} 'restoration warning:  size of lithp/README is not 5106'
  fi
fi
# ============= lithp/parser.nw ==============
if test -f 'lithp/parser.nw' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING lithp/parser.nw (file already exists)'
else
${echo} 'x - extracting lithp/parser.nw (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'lithp/parser.nw' &&
@
\section{The File Parser}
\label{sec:parser}
X
The File Parser is basically a simple tokenizer of the file passed in.
These tokens are pulled from the file stream in \S\ref{sec:tokenizer},
and added to the list in \S\ref{sec:listbuilder}.
X
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {List Builder}
\label{sec:listbuilder}
X
This is the main engine of the parser.  It will use the below 
tokenizer to read in all elements of the file.
X
We will be passing in two pointers to functions.  These two functions
will be used to get and unget characters to the buffer or stream, or
whatever input device you are using.
X
For the ``get a character'' function, we will be using this format:
X
<<Parse get character callback typedef>>=
X    typedef int 
X    (*getcCallback)
X	(
X	    void
X	);
@
X
And to ``unget a character'', we will use this format:
X
<<Parse unget character callback typedef>>=
X    typedef void
X    (*ungetcCallback)
X	(
X	    int c
X	);
@
X
<<Parse in file proto>>=
X    struct le *
X    parseInFile(
X	    getcCallback getachar,
X	    ungetcCallback ungetachar,
X	    struct le * list,
X	    int * line
X    )
@
X
<<Parse in file implementation>>=
X    <<Parse in file proto>>
X    {
X	char * temp = NULL;
X	enum tokenname tokenid = T_NONE;
X	int isquoted = 0;
X
X	if (!getachar || !ungetachar)  return( NULL );
X
X	while (1){
X	    
X	    temp = snagAToken(getachar, ungetachar, &tokenid);
X
X	    switch (tokenid)
X	    {
X	    case (T_QUOTE):
X		isquoted = 1;
X		break;
X
X	    case (T_OPENPAREN):
X		list = leAddBranchElement(
X				list, 
X				parseInFile(getachar, 
X					ungetachar, 
X					NULL,
X					line),
X				isquoted
X				);
X		isquoted = 0;
X		break;
X
X	    case (T_NEWLINE):
X		isquoted = 0;
X		*line = *line +1;
X		break;
X
X	    case (T_WORD):
X		list = leAddDataElement(
X				list,
X				temp,
X				isquoted
X				);
X		free(temp);
X		isquoted = 0;
X		break;
X	    
X	    case (T_CLOSEPAREN):
X	    case (T_EOF):
X		isquoted = 0;
X		return (list);
X	    }
X	}
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {Tokenizer}
\label{sec:tokenizer}
X
Different handlings for different tokens:
X
[[whitespace]]: skip over
[[comment]]: skip to end of line
[[(]]: return NULL, tokenid gets [[OPENPAREN]]
[[)]]: return NULL, tokenid gets [[CLOSEPAREN]]
[[newline]]: return NULL, tokenid gets [[NEWLINE]]
[["foo"]]: return "foo", tokenid gets [[WORD]]
[[number]]: return number in a string, tokenid gets [[WORD]]
X
buffers returned need to be freed later.
X
<<Parse token enum>>=
enum tokenname { 
X	T_NONE, 
X	T_CLOSEPAREN, 
X	T_OPENPAREN, 
X	T_NEWLINE, 
X	T_QUOTE,
X	T_WORD, 
X	T_EOF
};
@
X
<<Parse snag a token proto>>=
X    char *
X    snagAToken(
X	getcCallback getachar,
X	ungetcCallback ungetachar,
X	enum tokenname * tokenid
X    )
@
X
<<Parse snag a token implementation>>=
X    <<Parse snag a token proto>>
X    {
X	unsigned int pos = 0;
X	int c;
X	int doublequotes = 0;
X	char temp[128];
X
X	*tokenid = T_EOF;
X
X	if (!getachar || !ungetachar)
X	{
X	    *tokenid = T_EOF;
X	    return( NULL );
X	}
X
X	/* chew space to next token */
X	while (1)
X	{
X	    c = getachar();
X
X	    /* munch comments */
X	    if (    (c == '#') 
X                 || (c == ';')
X               )
X	    {
X		do {
X		    c = getachar();
X		} while (c != '\n');
X	    }
X		
X	    if ((    (c == '(')
X		 || (c == ')')
X		 || (c == '\n')
X		 || (c == '\"')
X		 || (c == '\'')
X		 || (c == EOF)
X		 || (c > '-')
X		 || (c <= 'z')
X	       ) && ( c != ' ') && ( c != '\t') )
X	    {
X		break;
X	    }
X	}
X
X	/* snag token */
X	if (c == '(')
X	{
X	    *tokenid = T_OPENPAREN;
X	    return( NULL );
X	} else 
X
X	if (c == ')')
X	{
X	    *tokenid = T_CLOSEPAREN;
X	    return( NULL );
X	} else 
X
X	if (c == '\'')
X	{
X	    *tokenid = T_QUOTE;
X	    return( NULL );
X	} else 
X
X	if (c == '\n')
X	{
X	    *tokenid = T_NEWLINE;
X	    return( NULL );
X	} else 
X
X	if (c == EOF)
X	{
X	    *tokenid = T_EOF;
X	    return( NULL );
X	}
X
X	/* oh well. it looks like a string.  snag to the next whitespace. */
X
X	if (c == '\"')
X	{
X	    doublequotes = 1;
X	    c = getachar();
X	}
X
X
X	while (1)
X	{
X	    temp[pos++] = (char) c;
X
X	    if (!doublequotes)
X	    { 
X		if (    (c == ')')
X		     || (c == '(')
X		     || (c == ';')
X		     || (c == '#')
X		     || (c == ' ')
X		     || (c == '\n')
X		     || (c == '\r')
X		     || (c == EOF)
X		   )
X		{
X		    ungetachar(c);
X		    temp[pos-1] = '\0';
X
X		    if ( !strcmp(temp, "quote") )
X		    {
X			*tokenid = T_QUOTE;
X			return( NULL );
X		    }
X		    *tokenid = T_WORD;
X		    return( strdup(temp) );
X		}
X	    } else {
X		switch (c)
X		{
X		case ( '\n' ):
X		case ( '\r' ):
X		case ( EOF ):
X		    ungetachar(c);
X
X		case ( '\"' ):
X		    temp[pos-1] = '\0';
X		    *tokenid = T_WORD;
X		    return( strdup(temp) );
X    
X		}
X	    }
X
X	    c = getachar();
X	}
X	return( NULL );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X
<<parser.c>>=
#include "parser.h"
#include <string.h>
X
<<Parse in file implementation>>
<<Parse snag a token implementation>>
@
X
X
<<parser.h>>=
#include <stdio.h>
#include "lists.h"
X
<<Parse token enum>>
X
<<Parse get character callback typedef>>
<<Parse unget character callback typedef>>
X
<<Parse snag a token proto>>;
<<Parse in file proto>>;
@
SHAR_EOF
  (set 20 01 10 15 21 37 35 'lithp/parser.nw'; eval "$shar_touch") &&
  chmod 0644 'lithp/parser.nw'
if test $? -ne 0
then ${echo} 'restore of lithp/parser.nw failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'lithp/parser.nw: MD5 check failed'
       ) << SHAR_EOF
cf54dabd5c37013611d982731efe8449  lithp/parser.nw
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'lithp/parser.nw'` -ne 5109 && \
  ${echo} 'restoration warning:  size of lithp/parser.nw is not 5109'
  fi
fi
# ============= lithp/main.nw ==============
if test -f 'lithp/main.nw' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING lithp/main.nw (file already exists)'
else
${echo} 'x - extracting lithp/main.nw (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'lithp/main.nw' &&
@
\section{The Lithp Interpreter's Main Program}
\label{sec:main}
X
This is a sample main program that uses the lithp functions to read in
all files contained on the command line, and interpret each one
seperately.
X
Once the lists have been evaluated using the [[leDumpEval]] function,
it dumps out the variable and defun lists as well.
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{Parser Callbacks}
X
These are the callbacks so that we can read in from a file. You can
probably write your own callbacks to read in from a buffer or the 
like.  It expects a stdio [[EOF]] at the end of the file to be 
processed.
X
<<main parser globals>>=
X    FILE * fp = NULL;
@
X
First, the callback for the getc function...
X
<<main parser getc callback proto>>=
X    int mygetc( void )
@  
<<main parser getc callback implementation>>=
X    <<main parser getc callback proto>>
X    {
X	return( getc( fp ) );
X    }
@
X
X
And our callback for the ungetc function...
X
<<main parser ungetc callback proto>>=
X    void myungetc( int c )
@  
<<main parser ungetc callback implementation>>=
X    <<main parser ungetc callback proto>>
X    {
X	ungetc( c, fp );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{main()}
X
And now the main function itself.  
X
<<main function variables>>=
X    int fileno;
X    int lineno;
X    struct le * list = NULL;
@
X
<<main check commandline>>=
X    if (argc <= 1)
X    {
X	fprintf(stderr, "ERROR: You must specify a .lsp file!\n");
X	return __LINE__;
X    }
@
X
X
What we're basically going to do is that for each file loaded in,
X
If it can open the file, we will parse it in using our [[mygetc]]
and [[myungetc]] utility functions.  We will then evaluate and dump
the main list, then dump out all of the variables and user defined
functions.
X
we're going to start off with a new set of variables for the next
file, so we wipe them when we're done with them.
X
<<main function body>>=
X    for (fileno = 0 ; fileno < argc-1 ; fileno ++)
X    {
X	/* parse in the file */
X	printf("==== File %02d: %s\n", fileno, argv[fileno+1]);
X	fp = fopen(argv[fileno+1], "r");
X
X	if (!fp)
X	{
X	    fprintf(stderr, "ERROR: Couldn't open \"%s\".\n", argv[fileno+1]);
X	    continue;
X	}
X	lineno = 0;
X	list = parseInFile(mygetc, myungetc, list, &lineno);
X	fclose(fp);
X	fp = NULL;
X
X	/* evaluate the read-in lists and free */
X	leDumpEval(list, 0); 
X	leWipe(list);
X
X	/* display the variables and free */
X	printf("Variables:\n");
X	variableDump( mainVarList );
X	variableFree( mainVarList );
X
X	/* display the user-defined functions and free */
X	printf("defun's:\n");
X	variableDump( defunList );
X	variableFree( defunList );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection{The Source File [[main.c]]}
\label{sec:main.c}
X
The source file for the main program simply includes the headers for
the standard C headers it uses.  
X
<<main.c>>=
#include <stdio.h>
#include "parser.h"
#include "version.h"
#include "vars.h"
@
X
X
All of the stuff for the parser callbacks...
<<main.c>>=
<<main parser globals>>
X
<<main parser ungetc callback implementation>>
<<main parser getc callback implementation>>
@
X
Then, it includes the main routine.  
<<main.c>>=
int
main( int argc, char* argv[] )
{
X    <<main function variables>>
X
X    printf( "lithp sample executable by jsl.lithp@absynth.com\n" );
X    printf( "Version " VER_BUILD_VER 
X		" "    VER_BUILD_DATE 
X		" \""  VER_BUILD_TPOTC
X		"\"\n" );
X    <<main check commandline>>
X    <<main function body>>
X    return 0;
}
@
SHAR_EOF
  (set 20 01 10 15 06 21 40 'lithp/main.nw'; eval "$shar_touch") &&
  chmod 0644 'lithp/main.nw'
if test $? -ne 0
then ${echo} 'restore of lithp/main.nw failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'lithp/main.nw: MD5 check failed'
       ) << SHAR_EOF
19819f7590b84017364362c2d046191a  lithp/main.nw
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'lithp/main.nw'` -ne 3526 && \
  ${echo} 'restoration warning:  size of lithp/main.nw is not 3526'
  fi
fi
# ============= lithp/lists.nw ==============
if test -f 'lithp/lists.nw' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING lithp/lists.nw (file already exists)'
else
${echo} 'x - extracting lithp/lists.nw (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'lithp/lists.nw' &&
@
\section{List Manipulations}
\label{sec:lists}
X
The internal storage system that we're using for both parsed in LISP
trees, as well as variables, and user-defined functions are all stored
using the structures and mechanisms contained in this section.
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {Structure}
\label{sec:structure}
X
This is the basic, multipurpose structure that we are using in this 
project.  
X
If for example this node is a list of other items, then the [[branch]]
item will be a pointer.  If it is an atom of data, then the [[data]]
item will be a pointer.  In the case of the variable list, then both of
these items are used.
X
If the data or item is quoted, then the [[quoted]] flag should be set
to [[1]].
X
The [[tag]] field is used exclusively for the tagging functions, when a
tree is to be marked up in some way for future processing.
X
This structure creates doubly-linked list, although there is nothing
currently that requires this... that is to say that the [[list_prev]]
references in this project can probably be removed with no harm done.
X
The [[list_next]] points to the next [[le]] structure on the same level
of nesting as the current one.
X
<<List Structure>>=
X    typedef struct le{
X	/* either data or a branch */
X	struct le * branch;
X	char * data;
X	int quoted;
X	int tag;
X
X	/* for the next in the list in the current parenlevel */
X	struct le * list_prev;
X	struct le * list_next;
X    } le;
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {Creation and Destruction}
\label{sec:createdestroy}
X
We need ways to create and destroy these structures, and that is done
here with the following functions:
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {leNew}
X
This creates a new [[le]] structure with the passed in [[text]] as the
data string.  If no [[text]] is passed in, then a NULL pointer is set
for it.  The elements of this new item are initialized to something
sane.
X
<<List new proto>>=
X    le * leNew(char * text)
@
X
<<List new implementation>>=
X    <<List new proto>>
X    {
X	le * new = (le *) malloc (sizeof(le));
X	if (new)
X	{
X	    new->branch = NULL;
X	    new->data = (text)?strdup(text):NULL;
X	    new->quoted = 0;
X	    new->tag = -1;
X	    new->list_prev = NULL;
X	    new->list_next = NULL;
X	}
X	return( new );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {leDelete}
X
To delete an element, all that we need to do is to free the data
pointed to in the element, and then free itself.
X
The [[branch]] and [[list_prev]] of the items around this will either
be invalid or unreachable after this is called.  This is really only
useful for deleting known atoms.
X
<<List delete proto>>=
X    void leDelete(le * element)
@
X
<<List delete implementation>>=
X    <<List delete proto>>
X    {
X	if (element)
X	{
X	    if (element->data) free( element->data );
X	    free(element);
X	}
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {leWipe}
X
To delete an entire list, we will recursively call this function to
delete all of the [[branch]]es, and [[next]] elements in turn.  This is
a post-order iterator so that pointers don't get munged as we try to
traverse the tree.  We will free ourself after all of our descendants
have been freed.
X
<<List wipe proto>>=
X    void leWipe(le * list)
@
X
<<List wipe implementation>>=
X    <<List wipe proto>>
X    {
X	if (list)
X	{
X	    /* free descendants */
X	    leWipe(list->branch);
X	    leWipe(list->list_next);
X
X	    /* free ourself */
X	    if (list->data) free( list->data );
X	    free( list );
X	}
X    }
@
X
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {Basic List Manips}
\label{sec:basiclistmanips}
X
The last thing we need are a few functions to add things onto the list for
callers outside of this section.
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {leAddHead}
X
This will add a new [[element]] onto the head of the list.
X
This simply takes the new [[element]], appends the current [[list]]
onto its [[list_next]] item, patches the [[list]]'s [[list_prev]] to
point to the element, then return the element.  It's just a simple
insertion to the beginning of the list.
X
<<List add head proto>>=
X    le * leAddHead(le * list, le * element)
@
X
<<List add head implementation>>=
X    <<List add head proto>>
X    {
X	if (!element)  return( list );
X
X	element->list_next = list;
X	if (list) list->list_prev = element;
X	return( element );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {leAddTail}
X
This will add a new [[element]] onto the end of the list.
X
We will simply go to the end of the [[list]] (if it exists) then tack
ourselves on, modifying the [[list_prev]] of the [[element]], as well
as the [[list_next]] of the end of the list.  Then we return the new
list and we're all good.
X
<<List add tail proto>>=
X    le * leAddTail(le * list, le * element)
@
X
<<List add tail implementation>>=
X    <<List add tail proto>>
X    {
X	le * temp = list;
X
X	/* if neither element or list don't 
X	   exist return the 'new' list */
X	if (!element) return( list );
X	if (!list)  return( element );
X
X	/* find the end element of the list */
X	while (temp->list_next)
X	{
X	    temp = temp->list_next;
X	}
X
X	/* tack ourselves on */
X	temp->list_next = element;
X	element->list_prev = temp;
X
X	/* return the list */
X	return( list );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {Derived List Manips}
\label{sec:derivedlistmanips}
X
And for ease of use, we have the following functions, which use the
above.
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {leAddBranchElement}
X
This will add on a new element onto the end of the [[list]] passed in,
containing the [[branch]] passed in, with its [[quoted]] flag set
appropriately.
X
<<List add branch proto>>=
X    le * leAddBranchElement( le * list, le * branch, int quoted )
@
X
<<List add branch implementation>>=
X    <<List add branch proto>>
X    {
X	le * temp = leNew(NULL);
X	temp->branch = branch;
X	temp->quoted = quoted;
X	return leAddTail(list, temp);
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {leAddDataElement}
X
This will add on a new element onto the end of the [[list]] passed in,
containing the [[data]] passed in, with its [[quoted]] flag set
appropriately.
X
<<List add data proto>>=
X    le * leAddDataElement( le * list, char * data, int quoted )
@
X
<<List add data implementation>>=
X    <<List add data proto>>
X    {
X	le * newdata = leNew(data);
X	if (newdata)
X	{
X	    newdata->quoted = quoted;
X	    return leAddTail(list, newdata);
X	}
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {leDup}
X
There are some cases where we want to duplicate an [[le]] tree.  This 
function does exactly that.
X
It simply iterates over the current list, recursing down for branches,
duplicating the [[list]] passed in.  It returns the duplicated tree.
X
<<List dup proto>>=
X    le * leDup( le * list )
@
X
<<List dup implementation>>=
X    <<List dup proto>>
X    {
X	le * temp;
X	if (!list) return( NULL );
X
X	
X	temp = leNew(list->data);
X	temp->branch = leDup(list->branch);
X	temp->list_next = leDup(list->list_next);
X
X	if (temp->list_next)
X	{
X	    temp->list_next->list_prev = temp;
X	}
X
X	return( temp );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {List Tagging}
X
For search and replace of items in a tree (for the implementation
of the ``defun'' evaluator for example) we need a way to tag 
elements in a tree, and work based on these tags.  The following
functions accomplish this.
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {leClearTag}
X
Set all of the tags in a list to -1.
X
<<List tag clear proto>>=
X    void leClearTag( le * list )
@
X
<<List tag clear implementation>>=
X    <<List tag clear proto>>
X    {
X	if (!list) return;
X	list->tag = -1;
X	leClearTag( list->branch );
X	leClearTag( list->list_next );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {leTagData}
X
Sets all data that matches [[data]] with the tag numbered [[tagval]].
X
<<List tag data proto>>=
X    void leTagData(le * list, char * data, int tagval)
@
<<List tag data implementation>>=
X    <<List tag data proto>>
X    {
X	if (!data || !list) return;
X
X	while (list)
X	{
X	    if( list->data )
X	    {
X		if (!strcmp( list->data, data ))
X		{
X		    list->tag = tagval;
X		}
X	    }
X	    leTagData( list->branch, data, tagval );
X
X	    list = list->list_next;
X	}
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {leTagReplace}
X
Sets all nodes whose tag matches [[tagval]] and replaces the data/branch 
with the data/branch information from [[newinfo]].
X
<<List tag replace proto>>=
X    void leTagReplace(le * list, int tagval, le * newinfo)
@
<<List tag replace implementation>>=
X    <<List tag replace proto>>
X    {
X	if (!list || !newinfo) return;
X
X	while (list)
X	{
X	    if( list->tag == tagval )
X	    {
X		/* free any existing stuff */
X		if ( list->data )
X		{
X		    free( list->data );
X		    list->data = NULL;
X		}
X
X		/* NOTE: This next comparison might be flawed */
X		if ( newinfo->list_next || newinfo->branch )
X		{
X		    list->branch = leDup( newinfo );
X		    list->quoted = 1;
X		} 
X		else if ( newinfo->data )
X		{
X		    list->data = strdup( newinfo->data );
X		}
X
X	    }
X	    leTagReplace( list->branch, tagval, newinfo );
X
X	    list = list->list_next;
X	}
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {Debug Tools}
\label{sec:debugtools}
X
These are for dubug output, and can probably be removed if you're 
crunched for space.
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {leDump}
X
Dump out the entire list, all pretty-like.
X
<<List dump proto>>=
X    void leDump( le * list, int indent )
@
X
<<List dump implementation>>=
X    <<List dump proto>>
X    {
X	int c;
X	le * temp = list;
X
X	while (temp)
X	{
X	    if (temp->data)
X	    {
X		for( c=0 ; c<indent ; c++ ) printf( " " );
X		printf( "%s %s\n", 
X			temp->data,
X			(temp->quoted == 1) ? "quoted" : ""
X			);
X	    } else {
X		leDump(temp->branch, indent + 4);
X	    }
X
X	    temp=temp->list_next;
X	}
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {leDumpEvalTree}
X
Dump out the entire list, all pretty-like, while evaluating each node.
X
X
<<List dump eval tree proto>>=
X    void leDumpEvalTree( le * list, int indent )
@
X
<<List dump eval tree implementation>>=
X    <<List dump eval tree proto>>
X    {
X	int c;
X	le * temp = list;
X
X	while (temp)
X	{
X	    for( c=0 ; c<indent ; c++ ) printf( " " );
X	    if (temp->data)
X	    {
X		printf( "%s %s\n", 
X			temp->data,
X			(temp->quoted == 1) ? "quoted" : ""
X			);
X	    } else {
X		le * le_value = evaluateBranch(temp->branch) ;
X		printf( "B: %s", (temp->quoted) ? "quoted " : "");
X		leDumpReformat( stdout, le_value );
X		printf( "\n" );
X		leWipe(le_value);
X
X		leDump(temp->branch, indent + 4);
X	    }
X
X	    temp=temp->list_next;
X	}
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {leDumpEval}
X
Dump out the entire list, all pretty-like, while evaluating each node.
X
<<List dump eval proto>>=
X    void leDumpEval( le * list, int indent )
@
X
<<List dump eval implementation>>=
X    <<List dump eval proto>>
X    {
X	int c;
X	le * temp = list;
X	le * le_value = NULL;
X
X	while (temp)
X	{
X	    if (temp->branch)
X	    {
X		printf ("\n");
X		leDumpReformat( stdout, temp->branch );
X
X		printf ("\n==> ");
X		le_value = evaluateBranch(temp->branch) ;
X		leDumpReformat( stdout, le_value );
X		leWipe(le_value);
X		printf ("\n");
X	    }
X
X	    temp=temp->list_next;
X	}
X	printf("=======\n");
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection {leDumpReformat}
X
Print out the tree as a standard s-expression list (as originally read
in from a file) to the [[FILE]] as defined by [[of]].
X
<<List dump reformat proto>>=
X    void leDumpReformat(FILE * of, le * tree)
@
X
<<List dump reformat implementation>>=
X    <<List dump reformat proto>>
X    {
X	le * treetemp = tree;
X	int len;
X	int notfirst = 0;
X	char * retstring;
X
X	if (!tree) return;
X
X	fprintf( of, "(" );
X	while (treetemp)
X	{
X	    if (treetemp->data)
X	    {
X		fprintf( of, "%s%s", notfirst?" ":"", treetemp->data);
X		notfirst++;
X	    }
X
X	    if (treetemp->branch)
X	    {
X		fprintf( of, " %s", (treetemp->quoted)? "\'":"");
X		leDumpReformat( of, treetemp->branch );
X	    }
X
X	    treetemp = treetemp->list_next;
X	}
X	fprintf( of, ")" );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {lists.c}
X
And finally, glue it all together in the .c file.
X
<<lists.c>>=
#include "lists.h"
#include "eval.h"
#include <string.h>
X
<<List new implementation>>
<<List delete implementation>>
<<List wipe implementation>>
X
<<List add head implementation>>
<<List add tail implementation>>
X
<<List add branch implementation>>
<<List add data implementation>>
<<List dup implementation>>
X
<<List tag clear implementation>>
<<List tag data implementation>>
<<List tag replace implementation>>
X
<<List dump implementation>>
<<List dump eval tree implementation>>
<<List dump eval implementation>>
<<List dump reformat implementation>>
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {lists.h}
X
And the header file as well.
X
<<lists.h>>=
#ifndef __LISTS_H__
#define __LISTS_H__
X
#include <stdio.h>
X
<<List Structure>>
X
<<List new proto>>;
<<List delete proto>>;
<<List wipe proto>>;
X
<<List add head proto>>;
<<List add tail proto>>;
X
<<List add branch proto>>;
<<List add data proto>>;
<<List dup proto>>;
X
<<List tag clear proto>>;
<<List tag data proto>>;
<<List tag replace proto>>;
X
<<List dump proto>>;
<<List dump eval proto>>;
<<List dump eval tree proto>>;
<<List dump reformat proto>>;
#endif
@
SHAR_EOF
  (set 20 01 10 10 18 15 10 'lithp/lists.nw'; eval "$shar_touch") &&
  chmod 0644 'lithp/lists.nw'
if test $? -ne 0
then ${echo} 'restore of lithp/lists.nw failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'lithp/lists.nw: MD5 check failed'
       ) << SHAR_EOF
ca3deb18e86d777c25122a1592cac774  lithp/lists.nw
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'lithp/lists.nw'` -ne 13471 && \
  ${echo} 'restoration warning:  size of lithp/lists.nw is not 13471'
  fi
fi
# ============= lithp/LICENSE ==============
if test -f 'lithp/LICENSE' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING lithp/LICENSE (file already exists)'
else
${echo} 'x - extracting lithp/LICENSE (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'lithp/LICENSE' &&
X                   GNU LESSER GENERAL PUBLIC LICENSE
X                       Version 2.1, February 1999
X
X Copyright (C) 1991, 1999 Free Software Foundation, Inc.
X     59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
X Everyone is permitted to copy and distribute verbatim copies
X of this license document, but changing it is not allowed.
X
[This is the first released version of the Lesser GPL.  It also counts
X as the successor of the GNU Library Public License, version 2, hence
X the version number 2.1.]
X
X                            Preamble
X
X  The licenses for most software are designed to take away your
freedom to share and change it.  By contrast, the GNU General Public
Licenses are intended to guarantee your freedom to share and change
free software--to make sure the software is free for all its users.
X
X  This license, the Lesser General Public License, applies to some
specially designated software packages--typically libraries--of the
Free Software Foundation and other authors who decide to use it.  You
can use it too, but we suggest you first think carefully about whether
this license or the ordinary General Public License is the better
strategy to use in any particular case, based on the explanations below.
X
X  When we speak of free software, we are referring to freedom of use,
not price.  Our General Public Licenses are designed to make sure that
you have the freedom to distribute copies of free software (and charge
for this service if you wish); that you receive source code or can get
it if you want it; that you can change the software and use pieces of
it in new free programs; and that you are informed that you can do
these things.
X
X  To protect your rights, we need to make restrictions that forbid
distributors to deny you these rights or to ask you to surrender these
rights.  These restrictions translate to certain responsibilities for
you if you distribute copies of the library or if you modify it.
X
X  For example, if you distribute copies of the library, whether gratis
or for a fee, you must give the recipients all the rights that we gave
you.  You must make sure that they, too, receive or can get the source
code.  If you link other code with the library, you must provide
complete object files to the recipients, so that they can relink them
with the library after making changes to the library and recompiling
it.  And you must show them these terms so they know their rights.
X
X  We protect your rights with a two-step method: (1) we copyright the
library, and (2) we offer you this license, which gives you legal
permission to copy, distribute and/or modify the library.
X
X  To protect each distributor, we want to make it very clear that
there is no warranty for the free library.  Also, if the library is
modified by someone else and passed on, the recipients should know
that what they have is not the original version, so that the original
author's reputation will not be affected by problems that might be
introduced by others.
X
X  Finally, software patents pose a constant threat to the existence of
any free program.  We wish to make sure that a company cannot
effectively restrict the users of a free program by obtaining a
restrictive license from a patent holder.  Therefore, we insist that
any patent license obtained for a version of the library must be
consistent with the full freedom of use specified in this license.
X
X  Most GNU software, including some libraries, is covered by the
ordinary GNU General Public License.  This license, the GNU Lesser
General Public License, applies to certain designated libraries, and
is quite different from the ordinary General Public License.  We use
this license for certain libraries in order to permit linking those
libraries into non-free programs.
X
X  When a program is linked with a library, whether statically or using
a shared library, the combination of the two is legally speaking a
combined work, a derivative of the original library.  The ordinary
General Public License therefore permits such linking only if the
entire combination fits its criteria of freedom.  The Lesser General
Public License permits more lax criteria for linking other code with
the library.
X
X  We call this license the "Lesser" General Public License because it
does Less to protect the user's freedom than the ordinary General
Public License.  It also provides other free software developers Less
of an advantage over competing non-free programs.  These disadvantages
are the reason we use the ordinary General Public License for many
libraries.  However, the Lesser license provides advantages in certain
special circumstances.
X
X  For example, on rare occasions, there may be a special need to
encourage the widest possible use of a certain library, so that it becomes
a de-facto standard.  To achieve this, non-free programs must be
allowed to use the library.  A more frequent case is that a free
library does the same job as widely used non-free libraries.  In this
case, there is little to gain by limiting the free library to free
software only, so we use the Lesser General Public License.
X
X  In other cases, permission to use a particular library in non-free
programs enables a greater number of people to use a large body of
free software.  For example, permission to use the GNU C Library in
non-free programs enables many more people to use the whole GNU
operating system, as well as its variant, the GNU/Linux operating
system.
X
X  Although the Lesser General Public License is Less protective of the
users' freedom, it does ensure that the user of a program that is
linked with the Library has the freedom and the wherewithal to run
that program using a modified version of the Library.
X
X  The precise terms and conditions for copying, distribution and
modification follow.  Pay close attention to the difference between a
"work based on the library" and a "work that uses the library".  The
former contains code derived from the library, whereas the latter must
be combined with the library in order to run.
X
X                  GNU LESSER GENERAL PUBLIC LICENSE
X   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
X
X  0. This License Agreement applies to any software library or other
program which contains a notice placed by the copyright holder or
other authorized party saying it may be distributed under the terms of
this Lesser General Public License (also called "this License").
Each licensee is addressed as "you".
X
X  A "library" means a collection of software functions and/or data
prepared so as to be conveniently linked with application programs
(which use some of those functions and data) to form executables.
X
X  The "Library", below, refers to any such software library or work
which has been distributed under these terms.  A "work based on the
Library" means either the Library or any derivative work under
copyright law: that is to say, a work containing the Library or a
portion of it, either verbatim or with modifications and/or translated
straightforwardly into another language.  (Hereinafter, translation is
included without limitation in the term "modification".)
X
X  "Source code" for a work means the preferred form of the work for
making modifications to it.  For a library, complete source code means
all the source code for all modules it contains, plus any associated
interface definition files, plus the scripts used to control compilation
and installation of the library.
X
X  Activities other than copying, distribution and modification are not
covered by this License; they are outside its scope.  The act of
running a program using the Library is not restricted, and output from
such a program is covered only if its contents constitute a work based
on the Library (independent of the use of the Library in a tool for
writing it).  Whether that is true depends on what the Library does
and what the program that uses the Library does.
X  
X  1. You may copy and distribute verbatim copies of the Library's
complete source code as you receive it, in any medium, provided that
you conspicuously and appropriately publish on each copy an
appropriate copyright notice and disclaimer of warranty; keep intact
all the notices that refer to this License and to the absence of any
warranty; and distribute a copy of this License along with the
Library.
X
X  You may charge a fee for the physical act of transferring a copy,
and you may at your option offer warranty protection in exchange for a
fee.
X
X  2. You may modify your copy or copies of the Library or any portion
of it, thus forming a work based on the Library, and copy and
distribute such modifications or work under the terms of Section 1
above, provided that you also meet all of these conditions:
X
X    a) The modified work must itself be a software library.
X
X    b) You must cause the files modified to carry prominent notices
X    stating that you changed the files and the date of any change.
X
X    c) You must cause the whole of the work to be licensed at no
X    charge to all third parties under the terms of this License.
X
X    d) If a facility in the modified Library refers to a function or a
X    table of data to be supplied by an application program that uses
X    the facility, other than as an argument passed when the facility
X    is invoked, then you must make a good faith effort to ensure that,
X    in the event an application does not supply such function or
X    table, the facility still operates, and performs whatever part of
X    its purpose remains meaningful.
X
X    (For example, a function in a library to compute square roots has
X    a purpose that is entirely well-defined independent of the
X    application.  Therefore, Subsection 2d requires that any
X    application-supplied function or table used by this function must
X    be optional: if the application does not supply it, the square
X    root function must still compute square roots.)
X
These requirements apply to the modified work as a whole.  If
identifiable sections of that work are not derived from the Library,
and can be reasonably considered independent and separate works in
themselves, then this License, and its terms, do not apply to those
sections when you distribute them as separate works.  But when you
distribute the same sections as part of a whole which is a work based
on the Library, the distribution of the whole must be on the terms of
this License, whose permissions for other licensees extend to the
entire whole, and thus to each and every part regardless of who wrote
it.
X
Thus, it is not the intent of this section to claim rights or contest
your rights to work written entirely by you; rather, the intent is to
exercise the right to control the distribution of derivative or
collective works based on the Library.
X
In addition, mere aggregation of another work not based on the Library
with the Library (or with a work based on the Library) on a volume of
a storage or distribution medium does not bring the other work under
the scope of this License.
X
X  3. You may opt to apply the terms of the ordinary GNU General Public
License instead of this License to a given copy of the Library.  To do
this, you must alter all the notices that refer to this License, so
that they refer to the ordinary GNU General Public License, version 2,
instead of to this License.  (If a newer version than version 2 of the
ordinary GNU General Public License has appeared, then you can specify
that version instead if you wish.)  Do not make any other change in
these notices.
X
X  Once this change is made in a given copy, it is irreversible for
that copy, so the ordinary GNU General Public License applies to all
subsequent copies and derivative works made from that copy.
X
X  This option is useful when you wish to copy part of the code of
the Library into a program that is not a library.
X
X  4. You may copy and distribute the Library (or a portion or
derivative of it, under Section 2) in object code or executable form
under the terms of Sections 1 and 2 above provided that you accompany
it with the complete corresponding machine-readable source code, which
must be distributed under the terms of Sections 1 and 2 above on a
medium customarily used for software interchange.
X
X  If distribution of object code is made by offering access to copy
from a designated place, then offering equivalent access to copy the
source code from the same place satisfies the requirement to
distribute the source code, even though third parties are not
compelled to copy the source along with the object code.
X
X  5. A program that contains no derivative of any portion of the
Library, but is designed to work with the Library by being compiled or
linked with it, is called a "work that uses the Library".  Such a
work, in isolation, is not a derivative work of the Library, and
therefore falls outside the scope of this License.
X
X  However, linking a "work that uses the Library" with the Library
creates an executable that is a derivative of the Library (because it
contains portions of the Library), rather than a "work that uses the
library".  The executable is therefore covered by this License.
Section 6 states terms for distribution of such executables.
X
X  When a "work that uses the Library" uses material from a header file
that is part of the Library, the object code for the work may be a
derivative work of the Library even though the source code is not.
Whether this is true is especially significant if the work can be
linked without the Library, or if the work is itself a library.  The
threshold for this to be true is not precisely defined by law.
X
X  If such an object file uses only numerical parameters, data
structure layouts and accessors, and small macros and small inline
functions (ten lines or less in length), then the use of the object
file is unrestricted, regardless of whether it is legally a derivative
work.  (Executables containing this object code plus portions of the
Library will still fall under Section 6.)
X
X  Otherwise, if the work is a derivative of the Library, you may
distribute the object code for the work under the terms of Section 6.
Any executables containing that work also fall under Section 6,
whether or not they are linked directly with the Library itself.
X
X  6. As an exception to the Sections above, you may also combine or
link a "work that uses the Library" with the Library to produce a
work containing portions of the Library, and distribute that work
under terms of your choice, provided that the terms permit
modification of the work for the customer's own use and reverse
engineering for debugging such modifications.
X
X  You must give prominent notice with each copy of the work that the
Library is used in it and that the Library and its use are covered by
this License.  You must supply a copy of this License.  If the work
during execution displays copyright notices, you must include the
copyright notice for the Library among them, as well as a reference
directing the user to the copy of this License.  Also, you must do one
of these things:
X
X    a) Accompany the work with the complete corresponding
X    machine-readable source code for the Library including whatever
X    changes were used in the work (which must be distributed under
X    Sections 1 and 2 above); and, if the work is an executable linked
X    with the Library, with the complete machine-readable "work that
X    uses the Library", as object code and/or source code, so that the
X    user can modify the Library and then relink to produce a modified
X    executable containing the modified Library.  (It is understood
X    that the user who changes the contents of definitions files in the
X    Library will not necessarily be able to recompile the application
X    to use the modified definitions.)
X
X    b) Use a suitable shared library mechanism for linking with the
X    Library.  A suitable mechanism is one that (1) uses at run time a
X    copy of the library already present on the user's computer system,
X    rather than copying library functions into the executable, and (2)
X    will operate properly with a modified version of the library, if
X    the user installs one, as long as the modified version is
X    interface-compatible with the version that the work was made with.
X
X    c) Accompany the work with a written offer, valid for at
X    least three years, to give the same user the materials
X    specified in Subsection 6a, above, for a charge no more
X    than the cost of performing this distribution.
X
X    d) If distribution of the work is made by offering access to copy
X    from a designated place, offer equivalent access to copy the above
X    specified materials from the same place.
X
X    e) Verify that the user has already received a copy of these
X    materials or that you have already sent this user a copy.
X
X  For an executable, the required form of the "work that uses the
Library" must include any data and utility programs needed for
reproducing the executable from it.  However, as a special exception,
the materials to be distributed need not include anything that is
normally distributed (in either source or binary form) with the major
components (compiler, kernel, and so on) of the operating system on
which the executable runs, unless that component itself accompanies
the executable.
X
X  It may happen that this requirement contradicts the license
restrictions of other proprietary libraries that do not normally
accompany the operating system.  Such a contradiction means you cannot
use both them and the Library together in an executable that you
distribute.
X
X  7. You may place library facilities that are a work based on the
Library side-by-side in a single library together with other library
facilities not covered by this License, and distribute such a combined
library, provided that the separate distribution of the work based on
the Library and of the other library facilities is otherwise
permitted, and provided that you do these two things:
X
X    a) Accompany the combined library with a copy of the same work
X    based on the Library, uncombined with any other library
X    facilities.  This must be distributed under the terms of the
X    Sections above.
X
X    b) Give prominent notice with the combined library of the fact
X    that part of it is a work based on the Library, and explaining
X    where to find the accompanying uncombined form of the same work.
X
X  8. You may not copy, modify, sublicense, link with, or distribute
the Library except as expressly provided under this License.  Any
attempt otherwise to copy, modify, sublicense, link with, or
distribute the Library is void, and will automatically terminate your
rights under this License.  However, parties who have received copies,
or rights, from you under this License will not have their licenses
terminated so long as such parties remain in full compliance.
X
X  9. You are not required to accept this License, since you have not
signed it.  However, nothing else grants you permission to modify or
distribute the Library or its derivative works.  These actions are
prohibited by law if you do not accept this License.  Therefore, by
modifying or distributing the Library (or any work based on the
Library), you indicate your acceptance of this License to do so, and
all its terms and conditions for copying, distributing or modifying
the Library or works based on it.
X
X  10. Each time you redistribute the Library (or any work based on the
Library), the recipient automatically receives a license from the
original licensor to copy, distribute, link with or modify the Library
subject to these terms and conditions.  You may not impose any further
restrictions on the recipients' exercise of the rights granted herein.
You are not responsible for enforcing compliance by third parties with
this License.
X
X  11. If, as a consequence of a court judgment or allegation of patent
infringement or for any other reason (not limited to patent issues),
conditions are imposed on you (whether by court order, agreement or
otherwise) that contradict the conditions of this License, they do not
excuse you from the conditions of this License.  If you cannot
distribute so as to satisfy simultaneously your obligations under this
License and any other pertinent obligations, then as a consequence you
may not distribute the Library at all.  For example, if a patent
license would not permit royalty-free redistribution of the Library by
all those who receive copies directly or indirectly through you, then
the only way you could satisfy both it and this License would be to
refrain entirely from distribution of the Library.
X
If any portion of this section is held invalid or unenforceable under any
particular circumstance, the balance of the section is intended to apply,
and the section as a whole is intended to apply in other circumstances.
X
It is not the purpose of this section to induce you to infringe any
patents or other property right claims or to contest validity of any
such claims; this section has the sole purpose of protecting the
integrity of the free software distribution system which is
implemented by public license practices.  Many people have made
generous contributions to the wide range of software distributed
through that system in reliance on consistent application of that
system; it is up to the author/donor to decide if he or she is willing
to distribute software through any other system and a licensee cannot
impose that choice.
X
This section is intended to make thoroughly clear what is believed to
be a consequence of the rest of this License.
X
X  12. If the distribution and/or use of the Library is restricted in
certain countries either by patents or by copyrighted interfaces, the
original copyright holder who places the Library under this License may add
an explicit geographical distribution limitation excluding those countries,
so that distribution is permitted only in or among countries not thus
excluded.  In such case, this License incorporates the limitation as if
written in the body of this License.
X
X  13. The Free Software Foundation may publish revised and/or new
versions of the Lesser General Public License from time to time.
Such new versions will be similar in spirit to the present version,
but may differ in detail to address new problems or concerns.
X
Each version is given a distinguishing version number.  If the Library
specifies a version number of this License which applies to it and
"any later version", you have the option of following the terms and
conditions either of that version or of any later version published by
the Free Software Foundation.  If the Library does not specify a
license version number, you may choose any version ever published by
the Free Software Foundation.
X
X  14. If you wish to incorporate parts of the Library into other free
programs whose distribution conditions are incompatible with these,
write to the author to ask for permission.  For software which is
copyrighted by the Free Software Foundation, write to the Free
Software Foundation; we sometimes make exceptions for this.  Our
decision will be guided by the two goals of preserving the free status
of all derivatives of our free software and of promoting the sharing
and reuse of software generally.
X
X                            NO WARRANTY
X
X  15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO
WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR
OTHER PARTIES PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY
KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
LIBRARY IS WITH YOU.  SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME
THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
X
X  16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN
WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY
AND/OR REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU
FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR
CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE
LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
DAMAGES.
X
X                     END OF TERMS AND CONDITIONS
SHAR_EOF
  (set 20 01 10 04 19 48 00 'lithp/LICENSE'; eval "$shar_touch") &&
  chmod 0644 'lithp/LICENSE'
if test $? -ne 0
then ${echo} 'restore of lithp/LICENSE failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'lithp/LICENSE: MD5 check failed'
       ) << SHAR_EOF
e11467f1bb5c8af1c961d94891ad5f4a  lithp/LICENSE
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'lithp/LICENSE'` -ne 24480 && \
  ${echo} 'restoration warning:  size of lithp/LICENSE is not 24480'
  fi
fi
# ============= lithp/intro.nw ==============
if test -f 'lithp/intro.nw' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING lithp/intro.nw (file already exists)'
else
${echo} 'x - extracting lithp/intro.nw (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'lithp/intro.nw' &&
\begin{center}
{\huge Lithp}\\
\begin{tabular}{ll}
Jerry Lawrence    & [[jsl.lithp@absynth.com]] \\
\end{tabular}
\end{center}
X
\tableofcontents
\pagebreak
X
X
@
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section{Audience}
X
The target audience for this document is those who wish to become more
familiar with the innter workings of the Lithp LISP interpreter.
X
This is not a users guide for people new to LISP.  It is implied that
the reader has some familiarity with C programming as well as LISP
programming, since in essence, this document is the source code to a
LISP interpreter.
X
People wishing to integrate Lithp into their own projects will probably
want to examine the included ``[[main.c]]'', in \S\ref{sec:main} to see
how it is done.  If you wish to expand or reduce the functionality of
Lithp, then \S\ref{sec:listevaluator} will be where you want to look.
X
@
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section{Introduction}
X
X
This document is broken up into a few sections.  
In \S\ref{sec:main}, a sample main routine is implemented.
In \S\ref{sec:parser}, the file parser is implemented.  
In \S\ref{sec:lists}, all of the list manipulation functions are implemented.
In \S\ref{sec:variablemechanisms}, the same list structures are used to store 
variables and user-defined functions.
In \S\ref{sec:listevaluator}, the list interpreter and evaluators are implemented.
And finally, in \S\ref{sec:samples}, a few sample LISP files that work
properly are given out as examples.
\S\ref{sec:version} shows the current version information and changelog.
X
X
Each of these
major sections begins with an introduction describing the internal
layout of that section.
X
X
Most of this document is geared toward developers who wish to
understand the internal workings of the interpreter.
SHAR_EOF
  (set 20 01 10 10 22 12 06 'lithp/intro.nw'; eval "$shar_touch") &&
  chmod 0644 'lithp/intro.nw'
if test $? -ne 0
then ${echo} 'restore of lithp/intro.nw failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'lithp/intro.nw: MD5 check failed'
       ) << SHAR_EOF
0b15f3ef6eeb6f1ac97b2b208d034ee6  lithp/intro.nw
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'lithp/intro.nw'` -ne 1824 && \
  ${echo} 'restoration warning:  size of lithp/intro.nw is not 1824'
  fi
fi
# ============= lithp/GNUmakefile ==============
if test -f 'lithp/GNUmakefile' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING lithp/GNUmakefile (file already exists)'
else
${echo} 'x - extracting lithp/GNUmakefile (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'lithp/GNUmakefile' &&
##########################################################
X
TARGET := lithp
VERSION := 0.6
X
DOC := lithp.pdf
TEX := $(DOC:%.pdf=%.tex)
X
NWS := intro.nw main.nw parser.nw lists.nw vars.nw eval.nw samples.nw version.nw
X
SRCS := main.c parser.c lists.c eval.c vars.c
HDRS := parser.h lists.h eval.h vars.h version.h
SAMPLES := sample01.lsp sample02.lsp sample03.lsp
X
GEN_FILES := \
X	$(SRCS) $(HDRS) \
X	$(SAMPLES) \
X	$(TEX) \
X	    $(TEX:%.tex=%.aux) \
X	    $(TEX:%.tex=%.toc) \
X	    $(TEX:%.tex=%.log) \
X	    $(TEX:%.tex=%.idx)
X
OBJS := main.o parser.o lists.o eval.o vars.o
X
##########################################################
X
X
all:	$(TARGET) samples
X
all2:	$(TARGET) docs samples
X
docs:	$(DOC)
X
samples: $(SAMPLES)
X
tidy:
X	rm -f core
X	rm -f $(OBJS)
X	rm -f $(GEN_FILES)
X
clean:	tidy
X	rm -f $(TARGET)
X	rm -f $(DOC)
X
clobber: clean
X
backup: clean
X	cd .. ;\
X	tar -cvf lithp-$(VERSION).tar lithp ;\
X	gzip -f lithp-$(VERSION).tar
X
test: all
X	./lithp sample01.lsp
X
X
X
##########################################################
X
CXX := CC
X
CXXFLAGS := -g -mt -instances=static 
X
CFLAGS := -g 
X
LDFLAGS := -g
X
NLIBS := \
X	-lsocket -ldl -lnsl -lgen -lposix4
X
##########################################################
X
$(SRCS):	$(NWS)
X	@[ -f $@ ] && chmod u+w $@ || true
X	notangle -L -R$@ $(NWS) | cpif $@
X	@chmod u-w $@
X
$(HDRS):	$(NWS)
X	@[ -f $@ ] && chmod u+w $@ || true
X	notangle -R$@ $(NWS) | cpif $@
X	@chmod u-w $@
X
$(SAMPLES):	$(NWS)
X	@[ -f $@ ] && chmod u+w $@ || true
X	notangle -L -R$@ $(NWS) | cpif $@
X	@chmod u-w $@
X
##########################################################
X
MKDIR_CMD = test -d $(@D) || mkdir -p $(@D)
X
X    #
X    # Ugly hack to run pdflatex as often as needed.
X    #
%.pdf:	%.tex
X	oldFingerprint="XXX" ; \
X	if [ -f $*.aux ]; then \
X	    fingerprint="`sum $*.aux`" ; \
X	else \
X	    fingerprint="YYY" ; \
X	fi ; \
X	while [ ! "$${oldFingerprint}" = "$${fingerprint}" ]; do \
X	    oldFingerprint="$${fingerprint}" ; \
X	    pdflatex $< ; \
X	    fingerprint="`sum $*.aux`" ; \
X	done
X
$(TOP)/bin/%:	%
X	@$(MKDIR_CMD)
X	cp -p $< $@
X	strip $@
X
$(TOP)/doc/pdf/%.pdf:	%.pdf
X	@$(MKDIR_CMD)
X	cp -p $< $@
X
$(TEX):	$(NWS)
X	noweave -x $(NWS) > $@
X
$(TARGET):	$(OBJS)
X	$(CXX) -o $@ $(LDFLAGS) $(OBJS) $(LIBS)
X
##########################################################
X
X.PHONY:	install
X.PHONY:	all
X.PHONY:	docs
X.PHONY:	tidy
X.PHONY:	clean
X.PHONY:	clobber
X
##########################################################
X
main.o:	parser.h lists.h version.h eval.h vars.h
parser.o: parser.h lists.h
eval.o: eval.h lists.h
vars.o: vars.h lists.h
X
##########################################################
# $Id: $
SHAR_EOF
  (set 20 01 12 23 03 00 03 'lithp/GNUmakefile'; eval "$shar_touch") &&
  chmod 0644 'lithp/GNUmakefile'
if test $? -ne 0
then ${echo} 'restore of lithp/GNUmakefile failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'lithp/GNUmakefile: MD5 check failed'
       ) << SHAR_EOF
fcb19a2658f0320795cdf131711d31e6  lithp/GNUmakefile
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'lithp/GNUmakefile'` -ne 2611 && \
  ${echo} 'restoration warning:  size of lithp/GNUmakefile is not 2611'
  fi
fi
# ============= lithp/eval.nw ==============
if test -f 'lithp/eval.nw' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING lithp/eval.nw (file already exists)'
else
${echo} 'x - extracting lithp/eval.nw (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'lithp/eval.nw' &&
@
\section{The List Evaluator}
\label{sec:listevaluator}
X
The list evaluator is basically a callback mechanism that traverses the
list passed in, and returns a char * containing the result.
X
It will look up the first parameter of a list in the callback registry,
then call that method with the list itself, without removing that head
entry from it, so a list of [[(foo a b c)]] will trigger a callback for
[[foo]], which will receive the list [[(foo a b c)]] as the [[branch]]
parameter.
X
Evaluate will also try to dereference variables if they exist.
X
The [[evaluateBranch()]] method will evaluate a complete list passed
in, while [[evaluateNode()]] method will only evaluate the single
branch passed in.  [[evaluateNode()]] is useful for dereferencing
variables or lists in a list when in the callback.  It is perfectly
safe to recurse in this manner.
X
There are also methods in this section relating to casting values to
list nodes and back, as well as the evaluator callbacks for a basic
LISP implementation.
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {Adding More Functionality}
X
It is quite easy to add more functionality into this system.  All that
you need to do is to create a callback satisfying the prototype as
described in the next section, then add it into the [[evalTable]].
X
If you look at any of the following callbacks, you will see how it gets
entered into the list, and some basic range checks that are done to
make sure that the callback gets the right number of parameters and the
like.
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {Callback Registry}
\label{sec:callbackregistry}
X
The callbacks will get their branch as one parameter.  The other parameter
is the number of items on the list, including the first word.  All callbacks
must return a newly allocated [[le]] list containing the return value.
X
For example [[(foo A B)]] will get sent [[3]] as [[argc]] as well as
the list [[(foo A B)]] as the [[branch]] parameter.  This list is
stored in [[le]] structures, which are just a simple tree/linked list.
X
<<Eval callback typedef>>=
X    typedef
X    le *
X    (*eval_cb)
X	(
X	    const int argc,
X	    le * branch
X	);
@
X
This is the lookup structure that we'll use to store all of our
callbacks in.  It is simply a list of command strings to match, as well
as the function callbacks as defined above.  Do note that the evaluator
is currently case sensitive.  That is to say that ``[[foo]]'' and
``[[FOO]]'' will get evaluated differetntly.
X
<<Eval lookup struct>>=
X    typedef struct evalLookupNode {
X	char    * word;
X	eval_cb   callback;
X    } evalLookupNode;
@
X
And now, here is the list of builtin functions that we support..  The
final element must be a pairing of [[NULL]]s so that the lookup
function knows where to stop when looking through the table.
X
<<Eval lookup table>>=
X    evalLookupNode evalTable[] =
X    {
X	{ "+" 		, eval_cb_add		},
X	{ "-" 		, eval_cb_subtract	},
X	{ "*" 		, eval_cb_multiply	},
X	{ "/" 		, eval_cb_divide	},
X
X	{ "1+" 		, eval_cb_oneplus	},
X	{ "1-" 		, eval_cb_oneminus	},
X
X	{ "%" 		, eval_cb_modulus	},
X
X	{ "<" 		, eval_cb_lt		},
X	{ "<=" 		, eval_cb_lt_eq		},
X	{ ">" 		, eval_cb_gt		},
X	{ ">=" 		, eval_cb_gt_eq		},
X	{ "=" 		, eval_cb_eqsign	},
X
X	{ "and" 	, eval_cb_and		},
X	{ "or" 		, eval_cb_or		},
X	{ "not" 	, eval_cb_not		},
X	{ "null" 	, eval_cb_not		},
X
X	{ "atom" 	, eval_cb_atom		},
X	{ "car" 	, eval_cb_car		},
X	{ "cdr" 	, eval_cb_cdr		},
X	{ "cons" 	, eval_cb_cons		},
X	{ "list" 	, eval_cb_list		},
X	{ "equal"	, eval_cb_equal		},
X
X	{ "if"		, eval_cb_if		},
X	{ "unless"	, eval_cb_unless	},
X	{ "when"	, eval_cb_when		},
X	{ "cond"	, eval_cb_cond		},
X	{ "select"	, eval_cb_select	},
X
X	{ "princ"	, eval_cb_princ		},
X	{ "terpri"	, eval_cb_terpri	},
X
X	{ "eval"	, eval_cb_eval		},
X	{ "prog1"	, eval_cb_prog1		},
X	{ "prog2"	, eval_cb_prog2		},
X	{ "progn"	, eval_cb_progn		},
X
X	{ "set"		, eval_cb_set		},
X	{ "setq"	, eval_cb_setq		},
X	{ "setf"	, eval_cb_setq		},
X	{ "enum"	, eval_cb_enum		},
X
X	{ "defun"	, eval_cb_defun		},
X
X	{ "gc"		, eval_cb_nothing	},
X	{ "garbage-collect" , eval_cb_nothing	},
X
X	{ NULL		, NULL			}
X    };
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {Evaluator Callbacks}
\label{sec:evaluatorcallbacks}
X
These callbacks will get the raw branch for which they should process.
The first element on the list is the keyword for which we were called.
The remaining elements are the list parameters to be used.  Each
parameter used should get evaulated using the [[evaluateNode()]]
function.
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ [[nothing]] }
X
This is a dummy function that does nothing, and always returns "T".  This
is for unimplemented placeholder methods like ``gc'' for example.
X
<<eval cb nothing proto>>=
X    le * eval_cb_nothing( const int argc, le * branch )
@
<<eval cb nothing implementation>>=
X    <<eval cb nothing proto>>
X    {
X	return( leNew( "T" ));
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ [[set helper]] }
X
This is basically a method that embodies both the functionalities of 
[[setq]] and [[set]], to minimize code space.
X
Pass in one of these two values to select the functionality set.
<<Eval cb set helper enum>>=
enum setfcn { S_SET, S_SETQ };
@       
X
<<Eval cb set helper proto>>=
X    le * eval_cb_set_helper( 
X		enum setfcn function,
X		const int argc, 
X		le * branch
X		)
@
<<Eval cb set helper implementation>>=
X    <<Eval cb set helper proto>>
X    {
X	le * newkey;
X	le * newvalue;
X	le * current;
X
X	if (!branch || argc < 3)  return( leNew( "NIL" ) );
X
X	current = branch->list_next;
X	while ( current )
X	{
X	    if (!current->list_next)
X	    {
X		newvalue = leNew( "NIL" );
X	    } else {
X		newvalue = evaluateNode(current->list_next);
X	    }
X
X	    if ( function == S_SET )
X		newkey = evaluateNode(current);
X
X	    mainVarList = variableSet( 
X			    mainVarList,
X		( function == S_SET )? newkey->data : current->data,
X			    newvalue
X			    );
X
X	    if ( function == S_SET )
X		leWipe(newkey);
X
X	    if (!current->list_next)
X	    {
X		current = NULL;
X	    } else {
X		current = current->list_next->list_next;
X	    }
X	}
X	return( leDup(newvalue) );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ [[set]] }
X
The basic param list for [[set]] is; [[(set key value key value
X...)]].  So we need to skip to the next element on the list, then start
setting variables.  both the key and variable will get evaluated.
X
<<Eval cb set proto>>=
X    le * eval_cb_set( const int argc, le * branch )
@
<<Eval cb set implementation>>=
X    <<Eval cb set proto>>
X    {
X	return( eval_cb_set_helper( S_SET, argc, branch ) );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ [[setq]] }
X
The basic param list for [[setq]] is; [[(setq key value key value
X...)]].  So we need to skip to the next element on the list, then start
setting variables.  The key portion of this pairing is not evaluated, 
while the value is.
X
<<Eval cb setq proto>>=
X    le * eval_cb_setq( const int argc, le * branch )
@
<<Eval cb setq implementation>>=
X    <<Eval cb setq proto>>
X    {
X	return( eval_cb_set_helper( S_SETQ, argc, branch ) );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ [[enum]] }
X
Enum will create a series of variables, incrementing their value for each
one encountered.  Any lists will NOT be evaluated, but rather skipped
for now.  (Since this is not a valid Common Lisp method, I can implement
it however I like. hehehe.)   The final value will be returned.
X
ie:  (enum a b c d e) 
will result in (a = 0), (b = 1) ... (e = 4), and will return '4'.
X
<<Eval cb enum proto>>=
X    le * eval_cb_enum( const int argc, le * branch )
@
<<Eval cb enum implementation>>=
X    <<Eval cb enum proto>>
X    {
X	le * newvalue;
X	le * current;
X	int count = -1;
X	char value[16];
X
X	if (!branch || argc < 2)  return( leNew( "NIL" ) );
X
X	current = branch->list_next;
X	while ( current )
X	{
X	    if (current->data)
X	    {
X		sprintf( value, "%d", ++count);
X
X		mainVarList = variableSetString( 
X				mainVarList,
X				current->data,
X				value
X				);
X	    }
X	    current = current->list_next;
X	}
X
X	if (count == -1)
X	    return( leNew( "NIL" ) );
X	else
X	    return( evalCastIntToLe(count) );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ cumehelper }
X
Since Add, Subtract, Multiply and Divide are all basically the same
function, with only a small difference, we will abstract out their
commonalities into this ``cume helper'' method.  It basically
accumulates in whichever style is defined by the [[function]]
parameter.  It starts off by setting the accumulator to the [[value]]
passed in, and works along the [[branch]] passed in.  The result value
is returned.
X
To define which mathematical function needs to be done, we will pass in
the [[function]] as one of the following enum values.  It is pretty
evident which one specifies what.
X
<<Eval cb cume helper enum>>=
enum cumefcn { C_NONE, C_ADD, C_SUBTRACT, C_MULTIPLY, C_DIVIDE };
@
X
<<Eval cb cume helper proto>>=
X    int
X    eval_cume_helper(
X	    enum cumefcn function,
X	    int value,
X	    le * branch
X    ) 
@
X
The basic methodology here is that while there is a parameter on the
list, we evaluate it, then cast it to an integer, then accumulate it
onto [[value]].  Once we've run out of parameters, return the
[[value]].
X
<<Eval cb cume helper implementation>>=
X    <<Eval cb cume helper proto>>
X    {
X	int newvalue = 0;
X	int first = 1;
X	le * temp = branch;
X	le * value_le;
X	char * tval;
X	if (!branch) return( 0 );
X
X	while (temp)
X	{
X	    value_le = evaluateNode(temp); 
X	    newvalue = evalCastLeToInt(value_le);
X	    leWipe(value_le);
X
X	    switch(function)
X	    {
X	    case( C_ADD ):
X		value += newvalue;
X		break;
X
X	    case( C_SUBTRACT ):
X		value -= newvalue;
X		break;
X
X	    case( C_MULTIPLY ):
X		value *= newvalue;
X		break;
X
X	    case( C_DIVIDE ):
X		value /= newvalue;
X		break;
X	    }
X
X	    temp = temp->list_next;
X	}
X
X	return( value );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ addition }
X
This handles lists such as [[(+ 2 3)]], [[(+ 9 foo)]], and so on.
We simply check to see how many parameters are passed in, and if
it is valid for our purposes, call the above [[cume helper]].
X
<<Eval cb add proto>>=
X    le * eval_cb_add( const int argc, le * branch )
@
<<Eval cb add implementation>>=
X    <<Eval cb add proto>>
X    {
X	char * returnval = NULL;
X
X	if (!branch || argc < 2) return( leNew( "NIL" ) );
X
X	return( evalCastIntToLe(
X			    eval_cume_helper( 
X				    C_ADD,
X				    0, 
X				    branch->list_next
X			            )
X				   )
X	       );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ subtraction }
X
This handles lists such as [[(- 2 3)]], [[(- 9 foo)]], and so on.
We simply check to see how many parameters are passed in, and if
it is valid for our purposes, call the above [[cume helper]].
X
We have to do an extra check in here to handle items such as [[(- 2)]]
where we just need to multiply the parameter by negative one and return
it.
X
<<Eval cb subtract proto>>=
X    le * eval_cb_subtract( const int argc, le * branch )
@
<<Eval cb subtract implementation>>=
X    <<Eval cb subtract proto>>
X    {
X	int firstitem = 0;
X	le * lefirst;
X	char * tval;
X
X	if (!branch || argc < 2) return( leNew( "NIL" ) );
X
X	lefirst = evaluateNode( branch->list_next );
X	firstitem = evalCastLeToInt( lefirst );
X	leWipe( lefirst );
X
X	if (argc == 2)
X	{
X	    return( evalCastIntToLe( -1 * firstitem) );
X	}
X	
X	return( evalCastIntToLe(
X			    eval_cume_helper( 
X				    C_SUBTRACT,
X				    firstitem, 
X				    branch->list_next->list_next
X			            )
X				   )
X	       );
X    }
@
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ multiplication }
X
This handles lists such as [[(* 2 3)]], [[(* 9 foo)]], and so on.  We
simply check to see how many parameters are passed in, and if it is
valid for our purposes, call the above [[cume helper]].
X
Since we're accumulating multiplications, we need to start this one off
with a [[1]] rather than the [[0]] above, since we must start off the
accumulator with the multiplicative identity, and not the addative
identity.
X
<<Eval cb multiply proto>>=
X    le * eval_cb_multiply( const int argc, le * branch )
@
<<Eval cb multiply implementation>>=
X    <<Eval cb multiply proto>>
X    {
X	if (!branch || argc < 2) return( leNew( "NIL" ) );
X
X	return( evalCastIntToLe(
X			    eval_cume_helper( 
X				    C_MULTIPLY,
X				    1, 
X				    branch->list_next
X			            )
X				   )
X	       );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ divide }
X
This handles lists such as [[(/ 2 3)]], [[(/ 9 foo)]], and so on.
We simply check to see how many parameters are passed in, and if
it is valid for our purposes, call the above [[cume helper]].
X
Since we're accumulating divisions, we need to start this one off 
with the first number passed in as the initial value.
X
One thing that we do not currently support is [[(/ 2)]] which should
yield [[0.5]] or ``one half''... inverses of numbers.  Since all math
is currently integer based, and not real based, it wouldn't make sense
to implement this yet.
X
<<Eval cb divide proto>>=
X    le * eval_cb_divide( const int argc, le * branch )
@
<<Eval cb divide implementation>>=
X    <<Eval cb divide proto>>
X    {
X	int firstitem = 0;
X	le * lefirst;
X	if (!branch || argc < 2) return( leNew( "NIL" ) );
X
X	lefirst = evaluateNode( branch->list_next );
X	firstitem = evalCastLeToInt( lefirst );
X	leWipe( lefirst );
X
X	return( evalCastIntToLe(
X			    eval_cume_helper( 
X				    C_DIVIDE,
X				    firstitem, 
X				    branch->list_next->list_next
X			            )
X				   )
X	       );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ oneplus }
X
This handles lists such as [[(1+ 3)]], [[(1+ foo)]], and so on.
X
This basically just converts the evaluated parameter to an integer,
increments it, then returns that value back to the caller.
X
<<Eval cb oneplus proto>>=
X    le * eval_cb_oneplus( const int argc, le * branch )
@
<<Eval cb oneplus implementation>>=
X    <<Eval cb oneplus proto>>
X    {
X	le * retle;
X	int value;
X
X	if (!branch || argc < 2) return( leNew( "NIL" ) );
X
X	retle = evaluateNode( branch->list_next ); 
X	value = evalCastLeToInt( retle );
X	leWipe( retle );
X
X	return( evalCastIntToLe(value + 1) );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ oneminus }
X
This handles lists such as [[(1- 3)]], [[(1- foo)]], and so on.
X
This basically just converts the evaluated parameter to an integer,
decrements it, then returns an atom containing that value back to the
caller.
X
<<Eval cb oneminus proto>>=
X    le * eval_cb_oneminus( const int argc, le * branch )
@
<<Eval cb oneminus implementation>>=
X    <<Eval cb oneminus proto>>
X    {
X	le * retle;
X	int value;
X
X	if (!branch || argc < 2) return( leNew( "NIL" ) );
X
X	retle = evaluateNode( branch->list_next ); 
X	value = evalCastLeToInt( retle );
X	leWipe( retle );
X
X	return( evalCastIntToLe(value - 1) );
X
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ \%: modulus }
X
This handles lists such as [[(\% 2 3)]], [[(\% 9 foo)]], and so on.
X
We simply convert the two evaluated parameters to integers, then return
an atom with the modulus of those numbers back to the caller.
X
<<Eval cb modulus proto>>=
X    le * eval_cb_modulus( const int argc, le * branch )
@
<<Eval cb modulus implementation>>=
X    <<Eval cb modulus proto>>
X    {
X	le * letemp;
X	int value1, value2;
X
X	if (!branch || argc != 3) return( leNew( "NIL" ) );
X
X	letemp = evaluateNode( branch->list_next );
X	value1 = evalCastLeToInt( letemp );
X	leWipe( letemp );
X
X	letemp = evaluateNode( branch->list_next->list_next );
X	value2 = evalCastLeToInt( letemp );
X	leWipe( letemp );
X
X	return( evalCastIntToLe ( value1 % value2 ) );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ lt:  A less than B}
X
This handles lists such as [[(< 2 3)]], [[(< 9 foo)]], and so on.
X
The values of the two parameters are evaluated, then compared with
eachother.  If the first is less than the second, a ``[[T]]'' atom
is returned, otherwise a ``[[NIL]]'' atom is returned.
X
<<Eval cb lt proto>>=
X    le * eval_cb_lt( const int argc, le * branch )
@
<<Eval cb lt implementation>>=
X    <<Eval cb lt proto>>
X    {
X	le * letemp;
X        int value1, value2;
X
X	if (!branch || argc != 3 ) return( leNew( "NIL" ) );
X
X        letemp = evaluateNode( branch->list_next );
X        value1 = evalCastLeToInt( letemp );
X        leWipe( letemp );
X
X        letemp = evaluateNode( branch->list_next->list_next );
X        value2 = evalCastLeToInt( letemp );
X        leWipe( letemp );
X
X        return( leNew ( (value1 < value2 )?"T":"NIL" ) );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ lteq:  A less than or equal to B}
X
This handles lists such as [[(<= 2 3)]], [[(<= 9 foo)]], and so on.
X
The values of the two parameters are evaluated, then compared with
eachother.  If the first is less than or equal to the second, a
``[[T]]'' atom is returned, otherwise a ``[[NIL]]'' atom is returned.
X
<<Eval cb lt eq proto>>=
X    le * eval_cb_lt_eq( const int argc, le * branch )
@
<<Eval cb lt eq implementation>>=
X    <<Eval cb lt eq proto>>
X    {
X	le * letemp;
X        int value1, value2;
X
X	if (!branch || argc != 3 ) return( leNew( "NIL" ) );
X
X        letemp = evaluateNode( branch->list_next );
X        value1 = evalCastLeToInt( letemp );
X        leWipe( letemp );
X
X        letemp = evaluateNode( branch->list_next->list_next );
X        value2 = evalCastLeToInt( letemp );
X        leWipe( letemp );
X
X        return( leNew ( (value1 <= value2 )?"T":"NIL" ) );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ gt:  A greater than B}
X
This handles lists such as [[(> 2 3)]], [[(> 9 foo)]], and so on.
X
The values of the two parameters are evaluated, then compared with
eachother.  If the first is greater than the second, a ``[[T]]'' atom
is returned, otherwise a ``[[NIL]]'' atom is returned.
X
<<Eval cb gt proto>>=
X    le * eval_cb_gt( const int argc, le * branch )
@
<<Eval cb gt implementation>>=
X    <<Eval cb gt proto>>
X    {
X	le * letemp;
X        int value1, value2;
X
X	if (!branch || argc != 3 ) return( leNew( "NIL" ) );
X
X        letemp = evaluateNode( branch->list_next );
X        value1 = evalCastLeToInt( letemp );
X        leWipe( letemp );
X
X        letemp = evaluateNode( branch->list_next->list_next );
X        value2 = evalCastLeToInt( letemp );
X        leWipe( letemp );
X
X        return( leNew ( (value1 > value2 )?"T":"NIL" ) );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ gteq:  A greater than or equal to B}
X
This handles lists such as [[(>= 2 3)]], [[(>= 9 foo)]], and so on.
X
The values of the two parameters are evaluated, then compared with
eachother.  If the first is greater than or equal to the second, a
``[[T]]'' atom is returned, otherwise a ``[[NIL]]'' atom is returned.
X
<<Eval cb gt eq proto>>=
X    le * eval_cb_gt_eq( const int argc, le * branch )
@
<<Eval cb gt eq implementation>>=
X    <<Eval cb gt eq proto>>
X    {
X	le * letemp;
X        int value1, value2;
X
X	if (!branch || argc != 3 ) return( leNew( "NIL" ) );
X
X        letemp = evaluateNode( branch->list_next );
X        value1 = evalCastLeToInt( letemp );
X        leWipe( letemp );
X
X        letemp = evaluateNode( branch->list_next->list_next );
X        value2 = evalCastLeToInt( letemp );
X        leWipe( letemp );
X
X        return( leNew ( (value1 >= value2 )?"T":"NIL" ) );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ eqsign:  A equal to B}
X
This handles lists such as [[(= 2 3)]], [[(= 9 foo)]], and so on.
X
The values of the two parameters are evaluated, then compared with
eachother.  If the first is equal to the second, a ``[[T]]'' atom is
returned, otherwise a ``[[NIL]]'' atom is returned.
X
<<Eval cb eqsign proto>>=
X    le * eval_cb_eqsign( const int argc, le * branch )
@
<<Eval cb eqsign implementation>>=
X    <<Eval cb eqsign proto>>
X    {
X	le * letemp;
X        int value1, value2;
X
X	if (!branch || argc != 3 ) return( leNew( "NIL" ) );
X
X        letemp = evaluateNode( branch->list_next );
X        value1 = evalCastLeToInt( letemp );
X        leWipe( letemp );
X
X        letemp = evaluateNode( branch->list_next->list_next );
X        value2 = evalCastLeToInt( letemp );
X        leWipe( letemp );
X
X        return( leNew ( (value1 == value2 )?"T":"NIL" ) );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ and }
X
This handles lists such as [[(and A B)]], [[(and A (...))]], and so on.
X
Evaluate all of the arguments until one of them yields a [[NIL]], then
return [[NIL]].  The remaining parameters are not evaluated.  If none
evaluates to [[NIL]], then the last one's evaluation is returned.
X
<<Eval cb and proto>>=
X    le * eval_cb_and( const int argc, le * branch )
@
<<Eval cb and implementation>>=
X    <<Eval cb and proto>>
X    {
X	le * temp;
X	le * result = NULL;
X	if (!branch || argc < 2 ) return( leNew( "NIL" ));
X
X	temp = branch->list_next;
X	while( temp )
X	{
X	    if( result )  leWipe( result );
X
X	    result = evaluateNode(temp);
X	    if (result->data)
X	    {
X		if (!strcmp ( result->data, "NIL" ))
X		{
X		    return( result );
X		}
X	    }
X	    temp = temp->list_next;
X	}
X	return( result );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ or }
X
Evaluate all of the arguments until one of them yields a non-[[NIL]], then
return their value.  The remaining arguments are not evaluated.  If all
parameters evaluate to [[NIL]], then a [[NIL]] atom is returned.
X
<<Eval cb or proto>>=
X    le * eval_cb_or( const int argc, le * branch )
@
<<Eval cb or implementation>>=
X    <<Eval cb or proto>>
X    {
X	le * temp;
X	le * result = NULL;
X	if (!branch || argc < 2 ) return( leNew( "NIL" ));
X
X	temp = branch->list_next;
X	while( temp )
X	{
X	    if( result )  leWipe( result );
X
X	    result = evaluateNode(temp);
X	    if (result->data)
X	    {
X		if (strcmp ( result->data, "NIL" ))
X		{
X		    return( result );
X		}
X	    }
X	    temp = temp->list_next;
X	}
X	return( result );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ not }
X
If the evaluated parameter yields a true value (perhaps [[T]]) then return
a [[NIL]] atom.  If the evaluated parameter yields a [[NIL]], then we return
a [[T]] atom.
X
<<Eval cb not proto>>=
X    le * eval_cb_not( const int argc, le * branch )
@
<<Eval cb not implementation>>=
X    <<Eval cb not proto>>
X    {
X	le * result = NULL;
X	if (!branch || argc != 2 ) return( leNew( "NIL" ));
X
X	result = evaluateNode(branch->list_next);
X
X	if (result->data)
X	{
X	    if (!strcmp (result->data, "NIL" ))
X	    {
X		leWipe( result );
X		return( leNew( "T" ) );
X	    } else {
X		leWipe( result );
X		return( leNew( "NIL" ) );
X	    }
X	} else if (result->branch) {
X	    leWipe( result );
X	    return( leNew( "NIL" ) );
X	}
X	
X	leWipe( result );
X	return( leNew( "T" ));
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ atom }
X
If the evaluated parameter is a list, return a [[NIL]] atom, otherwise
return a [[T]] atom.
X
<<Eval cb atom proto>>=
X    le * eval_cb_atom( const int argc, le * branch )
@
<<Eval cb atom implementation>>=
X    <<Eval cb atom proto>>
X    {
X	le * result = NULL;
X	if (!branch || argc != 2 ) return( leNew( "NIL" ));
X
X	result = evaluateNode(branch->list_next);
X
X	if (countNodes(result) == 1)
X	{
X	    leWipe( result );
X	    return( leNew( "T" ) );
X	}
X	return( leNew( "NIL" ) );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ car }
X
Return the topmost atom of the list passed in.  If an atom was passed in,
then we simply return it.  
X
There is some extra magic in here to dereference nesting by one layer 
since we're returning the atoms from the passed in list, rather than 
just sublists, like what CDR does.
X
<<Eval cb car proto>>=
X    le * eval_cb_car( const int argc, le * branch )
@
<<Eval cb car implementation>>=
X    <<Eval cb car proto>>
X    {
X	le * result = NULL;
X	le * temp = NULL;
X	if (!branch || argc != 2 ) return( leNew( "NIL" ));
X
X	result = evaluateNode(branch->list_next);
X
X	if( result == NULL )  return( leNew( "NIL" ) );
X
X	if (countNodes(result) <= 1)
X	{
X	    if (result->branch)
X	    {
X		temp = result;
X		result = result->branch;
X		temp->branch = NULL;
X		leWipe( temp );
X	    }
X	    return( result );
X	}
X
X	result->list_next->list_prev = NULL;
X	leWipe( result->list_next );
X	result->list_next = NULL;
X
X	if (result->branch)
X	{
X	    temp = result;
X	    result = result->branch;
X	    temp->branch = NULL;
X	    leWipe( temp );
X	}
X
X	return( result );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ cdr }
X
Return all but the topmost atom of the passed in list after it has been
evaluated.  If the list contains just one entry, we instead return a
[[NIL]] atom.
X
<<Eval cb cdr proto>>=
X    le * eval_cb_cdr( const int argc, le * branch )
@
<<Eval cb cdr implementation>>=
X    <<Eval cb cdr proto>>
X    {
X	le * result = NULL;
X	le * temp = NULL;
X	if (!branch || argc != 2 ) return( leNew( "NIL" ));
X
X	result = evaluateNode(branch->list_next);
X
X	if( result == NULL )  return( leNew( "NIL" ) );
X
X	if (result == NULL  || countNodes(result) == 1)
X	{
X	    return( leNew( "NIL" ) );
X	}
X
X	temp = result;
X	temp->list_next->list_prev = NULL;
X	result = result->list_next;
X
X	temp->list_next = NULL;
X	leWipe( temp );
X
X
X	return( result );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ cons }
X
Evaluate the two parameters, then add the first parameter, an atom, onto
the second parameter, a list.  Cons does the opposite of CAR and CDR.
X
<<Eval cb cons proto>>=
X    le * eval_cb_cons( const int argc, le * branch )
@
<<Eval cb cons implementation>>=
X    <<Eval cb cons proto>>
X    {
X	le * result1 = NULL;
X	le * result2 = NULL;
X
X	if (!branch || argc != 3 ) return( leNew( "NIL" ));
X
X	result1 = evaluateNode(branch->list_next);
X	if ( result1 == NULL ) return( leNew( "NIL" ));
X
X	result2 = evaluateNode(branch->list_next->list_next);
X	if ( result2 == NULL )
X	{
X	    leWipe( result1 );
X	    return( leNew( "NIL" ));
X	}
X
X	if ( countNodes(result1) > 1 )
X	{
X	    le * temp = leNew( NULL );
X	    temp->branch = result1;
X	    result1 = temp;
X	} 
X	result1->list_next = result2;
X	result2->list_prev = result1;
X
X	return( result1 );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ list }
X
Return a list generated by joining all of the passed in parameters,
after evaluating them.  Each of the parameters are treated like atoms
being joined into the final list.
X
<<Eval cb list proto>>=
X    le * eval_cb_list( const int argc, le * branch )
@
<<Eval cb list implementation>>=
X    <<Eval cb list proto>>
X    {
X	le * currelement = NULL;
X	le * finaltree = NULL;
X	le * lastadded = NULL;
X	le * result = NULL;
X
X	if (!branch) return( leNew( "NIL" ));
X
X	currelement = branch->list_next;
X	while (currelement)
X	{
X	    result = evaluateNode(currelement);
X	    if ( result == NULL )
X	    {
X		leWipe( finaltree );
X		return( leNew( "NIL" ));
X	    }
X
X	    if( countNodes(result) > 1)
X	    {
X		le * temp = leNew( NULL );
X		temp->branch = result;
X		result = temp;
X	    }
X    
X	    if (!finaltree)
X	    {
X		finaltree = result;
X		lastadded = result;
X	    } else {
X		lastadded->list_next = result;
X		result->list_prev    = lastadded;
X		lastadded = result;
X		
X	    }
X	    
X	    currelement = currelement->list_next;
X	}
X
X	if (!finaltree)
X	{
X	    return( leNew( "NIL" ));
X	}
X	return( finaltree );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ equal: similar objects? }
X
This is a helper function for the following [[equal]] callback.
This gets recursively called by itself.  It basically traverses
the [[list1]] tree, comparing it to [[list2]], making sure it has
the same structure and elements in it. 
X
If the lists are the same, it returns a [[1]].  If they differ, it will
return a [[0]].
X
X
<<Eval cb equal helper proto>>=
X    int eval_cb_lists_same( le * list1, le * list2 )
@
<<Eval cb equal helper implementation>>=
X    <<Eval cb equal helper proto>>
X    {
X	if (!list1 && !list2)    return( 1 );
X
X	while( list1 )
X	{
X	    /* if list2 ended prematurely, fail */
X	    if (list2 == NULL)
X	    {
X		return( 0 );
X	    }
X
X	    /* if one has data and the other doesn't, fail */
X	    if (   (list1->data && ! list2->data)
X		|| (list2->data && ! list1->data))
X	    {
X		return( 0 );
X	    }
X
X	    /* if the data is different, fail */
X	    if (list1->data && list2->data)
X	    {
X		if (strcmp( list1->data, list2->data ))
X		{
X		    return( 0 );
X		}
X	    }
X
X	    /* if one is quoted and the other isn't, fail */
X	    if (list1->quoted != list2->quoted)
X	    {
X		return( 0 );
X	    }
X
X	    /* if their branches aren't the same, fail */
X	    if (!eval_cb_lists_same( list1->branch, list2->branch ))
X	    {
X		return( 0 );
X	    }
X
X	    /* try the next in the list */
X	    list1 = list1->list_next;
X	    list2 = list2->list_next;
X	}
X
X	/* if list2 goes on, fail */
X	if (list2)
X	{
X	    return( 0 );
X	}
X
X	return( 1 );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ equal: compare two lists }
X
Evaluate the two parameters, and compare them to see if they have the
same structure and elements.  We will just call the above [[...same()]]
method which will return a [[1]] if they are the same.
X
We then will return a [[T]] atom if they were the same, and a [[NIL]]
if they were different.
X
<<Eval cb equal proto>>=
X    le * eval_cb_equal( const int argc, le * branch )
@
<<Eval cb equal implementation>>=
X    <<Eval cb equal proto>>
X    {
X	le * letemp;
X        le * list1 = NULL;
X	le * list2 = NULL;
X	int retval = 0;
X
X	if (!branch || argc != 3 ) return( leNew( "NIL" ) );
X
X        list1 = evaluateNode( branch->list_next );
X        list2 = evaluateNode( branch->list_next->list_next );
X
X	retval = eval_cb_lists_same( list1, list2 );
X
X        leWipe( list1 );
X        leWipe( list2 );
X
X        return( leNew ( (retval == 1) ? "T" : "NIL" ) );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ if }
X
The standard conditional.   (if (conditional) (then-block) (else-block))
X
[[if]] will evaluate the first parameter.  If it evaluates to the [[T]]
atom, then [[if]] will then evaluate the following [[then]] block.  If 
it was non-[[T]], then it will evaluate the [[else]] block.
X
<<Eval cb if proto>>=
X    le * eval_cb_if( const int argc, le * branch )
@
<<Eval cb if implementation>>=
X    <<Eval cb if proto>>
X    {
X	le * retcond = NULL;
X	le * retblock = NULL;
X
X	if (!branch || argc < 3 || argc > 4) return( leNew( "NIL" ));
X
X	/* if */
X	retcond = evaluateNode(branch->list_next);
X
X	if (!strcmp ( retcond->data, "NIL" ))
X	{
X	    /* else */
X	    if (argc == 3) /* no else */
X		return( retcond );
X
X	    leWipe( retcond );
X	    return( evaluateNode( branch->list_next->list_next->list_next ) );
X	}
X
X	/* then */
X	leWipe( retcond );
X	return( evaluateNode(branch->list_next->list_next) );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ when and unless helper }
X
This will evaluate the first parameter.  
X
If it evaluates to [[NIL]] and the [[which]] parameter is set to
[[WU_UNLESS]],  OR it evaluates to non-[[NIL]] the [[which]] parameter
is set to [[WU_WHEN]] then the body blocks get evaluated, otherwise a
[[NIL]] atom is returned.  The final body block to get evaluated has
its value returned.
X
<<Eval cb when unless helper enum>>=
enum whenunless { WU_WHEN, WU_UNLESS };
@
X
<<Eval cb when unless proto>>=
X    le *
X	eval_cb_whenunless_helper(
X	    enum whenunless which,
X	    const int argc, 
X	    le * branch
X	)
@
<<Eval cb when unless implementation>>=
X    <<Eval cb when unless proto>>
X    {
X	le * retval = NULL;
X	le * retblock = NULL;
X	le * trythis = NULL;
X
X	if (!branch || argc < 3 ) return( leNew( "NIL" ));
X
X	/* conditional */
X	retval = evaluateNode(branch->list_next);
X
X	if ( which == WU_UNLESS )
X	{
X	    /* unless - it wasn't true... bail */
X	    if ( strcmp( retval->data, "NIL" ))
X	    {
X		leWipe( retval );
X		return( leNew( "NIL" ) );
X	    }
X	} else {
X	    /* when:   it wasn't false... bail */
X	    if ( !strcmp( retval->data, "NIL" ))
X	    {
X		return( retval );
X	    }
X	}
X
X	trythis = branch->list_next->list_next;
X	while( trythis )
X	{
X	    if (retval)  leWipe( retval );
X
X	    retval = evaluateNode(trythis);
X	    trythis = trythis->list_next;
X	}
X	return( retval );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ unless }
X
(unless (conditional) (block) (block) ... )
X
[[unless]] will evaluate the first parameter.  If it evaluates to [[NIL]]
then the body blocks get evaluated, otherwise a [[NIL]] atom is returned.
The final body block to get evaluated has its value returned.
X
<<Eval cb unless proto>>=
X    le * eval_cb_unless( const int argc, le * branch )
@
<<Eval cb unless implementation>>=
X    <<Eval cb unless proto>>
X    {
X	return( eval_cb_whenunless_helper(
X			WU_UNLESS,
X			argc,
X			branch ) );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ when }
X
(when (conditional) (block) (block) ... )
X
[[when]] evaluates the first parameter.  If it returns a non-[[NIL]] value,
then the remaining body blocks get evaluated, otherwise it will return
a [[NIL]] atom.  The last conditional's value gets returned otherwise.
X
This is basically the same as [[unless]] but with a reversed conditional.
This might be integrated with it into a helper function eventually.
X
<<Eval cb when proto>>=
X    le * eval_cb_when( const int argc, le * branch )
@
<<Eval cb when implementation>>=
X    <<Eval cb when proto>>
X    {
X	return( eval_cb_whenunless_helper(
X			WU_WHEN,
X			argc,
X			branch ) );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ cond }
X
(cond ((conditional) (block) ... )
X      ((conditional) (block) ... )
X      ((conditional) (block) ... )
)
X
[[cond]] checks each conditional in turn.  The first one returning
non-[[NIL]] gets its body blocks evaluated.  The last block related to
that condtional gets its value returned.
X
If the succeeding conditional has no block, the return value of the
conditional is returned.
X
If no conditional satisfies it, a [[NIL]] atom will be returned.
X
<<Eval cb cond proto>>=
X    le * eval_cb_cond( const int argc, le * branch )
@
<<Eval cb cond implementation>>=
X    <<Eval cb cond proto>>
X    {
X	le * retval = NULL;
X	le * retblock = NULL;
X	le * trythis = NULL;
X	le * tryblock = NULL;
X	int newargc;
X
X	if (!branch || argc < 2 ) return( leNew( "NIL" ));
X
X	trythis = branch->list_next;
X	while (trythis)
X	{
X	    newargc = countNodes( trythis->branch );
X	    if (newargc == 0)  continue;
X
X	    /* conditional */
X	    if (retval)  leWipe(retval);
X	    retval = evaluateNode(trythis->branch);
X
X	    if ( strcmp(retval->data, "NIL" )) 
X	    {
X		if (newargc == 1)
X		{
X		    return( retval );
X		}
X
X		tryblock = trythis->branch->list_next;
X		while (tryblock)
X		{
X		    if (retblock)  leWipe(retblock);
X		    retblock = NULL;
X
X		    retblock = evaluateNode(tryblock);
X		    tryblock = tryblock->list_next;
X		}
X		return( retblock );
X	    }
X		
X	    trythis = trythis->list_next;
X	}
X	return( retval );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ select }
X
(select	(expression)
X	(value1 <body1>)
X	(value2 <body2>) ...
X	(valueN <bodyN>)
)
X
This acts like the 'switch' or 'case' statements in other languages.  It
will evaluate the expression, then look for that value in the list of items
remaining.  When it finds the right value, that body block is executed.
X
If there is none found, the value from the expression is returned.
X
The last return value from the from the body block gets returned.
X
<<Eval cb select proto>>=
X    le * eval_cb_select( const int argc, le * branch )
@
<<Eval cb select implementation>>=
X    <<Eval cb select proto>>
X    {
X	le * result;
X
X	if (argc < 2)  return( leNew( "NIL" ));
X
X	branch = branch->list_next;
X	result = evaluateNode(branch);
X
X	branch = branch->list_next;
X	while( branch )
X	{
X	    if( branch->branch )
X	    {
X		le * check = branch->branch;
X		if (check && check->data
X		    && (!strcmp( check->data, result->data )))
X		{
X		    /* we're in the right place, evaluate and return */
X		    le * computelist = check->list_next;
X		    while( computelist )
X		    {
X			leWipe( result );
X			result = evaluateNode( computelist );
X			computelist = computelist->list_next;
X		    }
X		    return( result );
X		}
X	    }
X	    
X	    branch = branch->list_next;
X	}
X
X	return( result );
X    }
@
X
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ princ }
X
Simply print to standard output the parameters passed in.
X
<<Eval cb princ proto>>=
X    le * eval_cb_princ( const int argc, le * branch )
@
<<Eval cb princ implementation>>=
X    <<Eval cb princ proto>>
X    {
X	le * thisnode;
X	le * retblock = NULL;
X	if (!branch || argc < 1 ) return( leNew( "NIL" ));
X
X	thisnode = branch->list_next;
X	while (thisnode)
X	{
X	    if (retblock)  leWipe( retblock );
X	    retblock = evaluateNode(thisnode);
X	    leDumpReformat(stdout, retblock);
X
X	    thisnode = thisnode->list_next;
X	}
X	return( retblock );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ terpri }
X
Simply print to standard output a newline characater.
X
<<Eval cb terpri proto>>=
X    le * eval_cb_terpri( const int argc, le * branch )
@
<<Eval cb terpri implementation>>=
X    <<Eval cb terpri proto>>
X    {
X	le * thisnode;
X	le * retblock = NULL;
X	if (!branch || argc != 1 ) return( leNew( "NIL" ));
X
X	printf( "\n" );
X	return( leNew( "NIL" ) );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ eval }
X
[[eval]] evaluates its parameter, and returns the result from the
evaluation.  It must basically do a double evaluation due to the way
things are stored internally.
X
<<Eval cb eval proto>>=
X    le * eval_cb_eval( const int argc, le * branch )
@
<<Eval cb eval implementation>>=
X    <<Eval cb eval proto>>
X    {
X	le * temp;
X	le * retval;
X	if (!branch || argc != 2 ) return( leNew( "NIL" ));
X
X	temp = evaluateNode(branch->list_next);
X	retval = evaluateBranch(temp);
X	leWipe( temp );
X	return( retval );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ proghelper }
X
Since the functions [[prog1]], [[prog2]] and [[progn]] are nearly identical
in nature, we will use the following function to do most of their work.
The only difference is that there is an extra parameter, [[returnit]].
If [[returnit]] is 1, then the first code block's result gets returned.  
If [[returnit]] is 2, then the second code block's result gets returned.  
If [[returnit]] is negative, then the last code block's result gets returned.  
X
Basically, we will evaluate all body blocks passed in, and return the
appropriate return list.
X
<<Eval cb prog proto>>=
X    le * eval_cb_prog( const int argc, le * branch, int returnit )
@
<<Eval cb prog implementation>>=
X    <<Eval cb prog proto>>
X    {
X	le * curr;
X	le * retval = NULL;
X	le * tempval = NULL;
X	int current = 0;
X	if (!branch || argc < (returnit +1) ) return( leNew( "NIL" ));
X
X	curr = branch->list_next;
X	while (curr)
X	{
X	    ++current;
X
X	    if ( tempval ) leWipe (tempval);
X	    tempval = evaluateNode( curr );
X
X	    if (current == returnit)
X		retval = leDup( tempval );
X	    
X	    curr = curr->list_next;
X	}
X
X	if (!retval)  retval = tempval;
X
X	return( retval );
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ prog1 }
X
Using the above helper, we want to evaluate all code blocks, returning 
the return value from the first block.
X
<<Eval cb prog1 proto>>=
X    le * eval_cb_prog1( const int argc, le * branch )
@
<<Eval cb prog1 implementation>>=
X    <<Eval cb prog1 proto>>
X    {
X	return( eval_cb_prog( argc, branch, 1 ));
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ prog2 }
X
Using the above helper, we want to evaluate all code blocks, returning 
the return value from the second block.
X
<<Eval cb prog2 proto>>=
X    le * eval_cb_prog2( const int argc, le * branch )
@
<<Eval cb prog2 implementation>>=
X    <<Eval cb prog2 proto>>
X    {
X	return( eval_cb_prog( argc, branch, 2 ));
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ progn }
X
Using the above helper, we want to evaluate all code blocks, returning 
the return value from the final block.
X
<<Eval cb progn proto>>=
X    le * eval_cb_progn( const int argc, le * branch )
@
<<Eval cb progn implementation>>=
X    <<Eval cb progn proto>>
X    {
X	return( eval_cb_prog( argc, branch, -1 ));
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ defun }
X
This stores away a function to be used later.  The format for this
is:  (defun funcname (parameters) (bodyblock))
X
None of this gets evaluated when it is called here.  It will get 
evaulated later on if they get called.  We will just store it 
aside for now.
X
The funcname is returned as an atom.
X
The parameters for this function are not the same as variables in the
system.  They are local variables of local scope, and will override any
global variables when the function is called later.
X
<<Eval cb defun proto>>=
X    le * eval_cb_defun( const int argc, le * branch )
@
<<Eval cb defun implementation>>=
X    <<Eval cb defun proto>>
X    {
X	le * thisnode;
X	le * retblock = NULL;
X	if (!branch || argc < 4 ) return( leNew( "NIL" ));
X
X	if ( !branch->list_next->data )  return( leNew( "NIL" ));
X
X	defunList = variableSet( 
X			defunList,
X			branch->list_next->data,
X			branch->list_next->list_next
X			);
X
X	return( leNew( branch->list_next->data ));
X    }
@
X
X
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {Utility methods}
\label{sec:utilitymethods}
X
We need a few utility functions to help us do all of the above work.  Those
utilities follow.  They are [[countNodes]], [[evalCastLeToInt]] and
[[evalCastIntToLe]].
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{ [[countNodes()]] }
X
This simply takes in a branch and returns the number of [[le]] nodes
along its primary list. (Through the [[list next]] pointer).  Empty
lists will return [[0]].  This is just a simple iterator, traversing the list.
X
<<Eval utility counter proto>>=
X    int countNodes(le * branch)
@
<<Eval utility counter implementation>>=
X    <<Eval utility counter proto>>
X    {
X	int count = 0;
X
X	while (branch)
X	{
X	    count++;
X	    branch = branch->list_next;
X	}
X	return( count );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{cast LE To Int}
X
This is a simple 'cast' function which takes in a [[le]] atom, converts
its data to an integer using the standard [[atoi()]] call.  That value
is then returned.
X
<<Eval cast le to int proto>>=
X    int evalCastLeToInt( const le * levalue )
@
<<Eval cast le to int implementation>>=
X    <<Eval cast le to int proto>>
X    {
X	if (!levalue) return( 0 );
X	if (!levalue->data) return( 0 );
X	
X	return( atoi(levalue->data) );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{cast Int To LE}
X
This is a simple 'cast' function which takes in an integer, and then
builds a new [[le]] atom using that value as its data.  That new atom
is then returned.
X
<<Eval cast int to le proto>>=
X    le * evalCastIntToLe( int intvalue )
@
<<Eval cast int to le implementation>>=
X    <<Eval cast int to le proto>>
X    {
X	char buffer[80];
X	sprintf (buffer, "%d", intvalue);
X
X	return( leNew(buffer) );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {Evaluator Valves}
\label{sec:evaluatorvalves}
X
X
These two functions are the brains behind the interpreter.  They will
traverse lisp trees, and recursively evaluate each part of them.  They
look up values in the variable list where necessary.
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{evaluateBranch}
X
Evaluate branch will for example evaluate all of [[(+ 3 A)]].
X
It first looks to see if the current entry is a list.  If it is,
it will evaluate it to determine the keyword to use.  It will then
use this keyword to look up a callback in the [[evalTable]].  
If it was found, it will simply return what the callback returns.
If no function had been called, it will try to evaluate the node 
using the [[evaluateNode]] function below. 
X
<<Eval evaluateBranch proto>>=
X    le * evaluateBranch(le * trybranch)
@
X
<<Eval evaluateBranch implementation>>=
X    <<Eval evaluateBranch proto>>
X    {
X	le * keyword;
X	int tryit = 0;
X	if (!trybranch) return( NULL );
X
X	if (trybranch->branch)
X	{
X	    keyword = evaluateBranch(trybranch->branch);
X	}
X	else 
X	    keyword = leNew( trybranch->data );
X
X	if (!keyword->data)
X	{
X	    leWipe( keyword );
X	    return( leNew( "NIL" ));
X	}
X
X	for ( tryit=0 ; evalTable[tryit].word ; tryit++)
X	{
X	    if (!strcmp(evalTable[tryit].word, keyword->data))
X	    {
X		leWipe( keyword );
X		return( evalTable[tryit].callback(
X				    countNodes( trybranch ), 
X				    trybranch) 
X				);
X	    }
X	}
X
X	leWipe( keyword );
X	return( evaluateNode( trybranch ));
X    }
@
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{evaluateNode}
X
EvaluateNode will for example evaluate just the [[A]] of [[(+ 3 A)]].
X
It will look to see if the node has a branch.  If it does, it will
evaluate it using the above function.  If it had been quoted, then that
branch will just get returned.
X
If it has no branch, then it will attempt to retrieve the variable with
the name specified in the data.  If that was unsuccessful, it will just
return the data itself as an atom.
X
<<Eval evaluateNode proto>>=
X    le * evaluateNode(le * node)
@
X
<<Eval evaluateNode implementation>>=
X    <<Eval evaluateNode proto>>
X    {
X	le * temp;
X	le * value;
X
X	if (node->branch)
X	{
X	    if( node->quoted )
X	    {
X		value = leDup( node->branch );
X	    } else {
X		value = evaluateBranch( node->branch );
X	    }
X	} else {
X	    temp = variableGet( defunList, node->data );
X
X	    if (temp)
X	    {
X		value = evaluateDefun( temp, node->list_next );
X	    } else {
X		temp = variableGet( mainVarList, node->data );
X
X		if (temp)
X		{
X		    value = leDup( temp );
X		} else {
X
X		    value = leNew( node->data );
X		}
X	    }
X	}
X
X	return( value );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsubsection{evaluateDefun}
X
This is a tricky one.  It gets called when a predefined function, set
up with the ``defun'' command earlier, gets called during
interpretation time.
X
This could be done any number of ways, using a stack based system or the 
like for variable lists, but instead I decided to go with a macro-like
pre-processing design.
X
First both lists passed in, the function definition [[fcn]] as well as
the list of new parameters [[params]] are both non-[[NULL]], and
contain an equal number of parameters.  If this is not the case, we
instantly bail out and return a [[NIL]] atom.
X
Next, we [[leDup]] the function, [[fcn]] into a new structure, [[function]].
X
Now, we make two passes over this new structure.  First we go through
and tag each variable in [[function]] as defined with its variable
list.  The first parameter's occurrance in the structure gets tagged
with ``[[1]]'', the second with ``[[2]]'' and so on.
X
The second pass replaces the items tagged as ``[[1]]'' with the first
parameter in the [[params]] list, ``[[2]]'' with the second in the
[[params]] list, and so on.
X
Then all we need to do is to evaluate the resulting [[function]] list,
which now has all of its local variables replaced with the passed in
parameters, and return that value.
X
We do two passes to make sure that any variables in the parameter list
get replaced appropriately, in case their names clash with the global
variable list entries.
X
<<Eval evaluateDefun proto>>=
X    le * evaluateDefun( le * fcn, le * params )
@
X
<<Eval evaluateDefun implementation>>=
X    <<Eval evaluateDefun proto>>
X    {
X	le * function;
X	le * thisparam;
X	le * result;
X	int count;
X
X	/* make sure both lists exist */
X	if (!fcn)  return( leNew( "NIL" ));
X
X	/* check for the correct number of parameters */
X	if (countNodes(fcn->branch) > countNodes(params))
X	    return( leNew( "NIL" ));
X
X	/* allocate another function definition, since we're gonna hack it */
X	function = leDup(fcn);
X
X	/* pass 1:  tag each node properly. 
X		    for each parameter: (fcn)
X		    - look for it in the tree, tag those with the value
X	*/
X	count = 0;
X	thisparam = fcn->branch;
X	while (thisparam)
X	{
X	    leTagData(function, thisparam->data, count);
X	    thisparam = thisparam->list_next;
X	    count++;
X	}
X
X	/* pass 2:  replace
X		    for each parameter: (param)
X		    - evaluate the passed in value
X		    - replace it in the tree
X	*/
X	count = 0;
X	thisparam = params;
X	while (thisparam)
X	{
X	    result = evaluateNode( thisparam );
X	    leTagReplace(function, count, result);
X	    thisparam = thisparam->list_next;
X	    leWipe(result);
X	    count++;
X	}
X
X	/* then evaluate the resulting tree */
X	result = evaluateBranch( function->list_next );
X	
X	/* free any space allocated */
X	leWipe( function );
X
X	/* return the evaluation */
X	return( result );
X    }
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {eval.c}
\label{evaldotc}
X
Here we build up all of the above blocks into the .c file.
X
<<eval.c>>=
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "eval.h"
#include "vars.h"
X
<<Eval lookup table>>
X
<<Eval evaluateBranch implementation>>
<<Eval evaluateNode implementation>>
<<Eval evaluateDefun implementation>>
X
<<Eval utility counter implementation>>
X
<<Eval cast le to int implementation>>
<<Eval cast int to le implementation>>
X
<<eval cb nothing implementation>>
<<Eval cb cume helper implementation>>
<<Eval cb add implementation>>
<<Eval cb subtract implementation>>
<<Eval cb multiply implementation>>
<<Eval cb divide implementation>>
<<Eval cb oneplus implementation>>
<<Eval cb oneminus implementation>>
<<Eval cb modulus implementation>>
X
<<Eval cb lt implementation>>
<<Eval cb lt eq implementation>>
<<Eval cb gt implementation>>
<<Eval cb gt eq implementation>>
<<Eval cb eqsign implementation>>
X
<<Eval cb and implementation>>
<<Eval cb or implementation>>
<<Eval cb not implementation>>
X
<<Eval cb atom implementation>>
<<Eval cb car implementation>>
<<Eval cb cdr implementation>>
<<Eval cb cons implementation>>
<<Eval cb list implementation>>
<<Eval cb equal helper implementation>>
<<Eval cb equal implementation>>
X
<<Eval cb if implementation>>
<<Eval cb when unless implementation>>
<<Eval cb unless implementation>>
<<Eval cb when implementation>>
<<Eval cb cond implementation>>
<<Eval cb select implementation>>
X
<<Eval cb princ implementation>>
<<Eval cb terpri implementation>>
X
<<Eval cb eval implementation>>
<<Eval cb prog implementation>>
<<Eval cb prog1 implementation>>
<<Eval cb prog2 implementation>>
<<Eval cb progn implementation>>
X
<<Eval cb set helper implementation>>
<<Eval cb set implementation>>
<<Eval cb setq implementation>>
<<Eval cb enum implementation>>
X
<<Eval cb defun implementation>>
@
X
X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsection {eval.h}
\label{evaldoth}
X
And we need to do the same for the header file as well.
X
<<eval.h>>=
#include "lists.h"
X
<<Eval callback typedef>>
<<Eval lookup struct>>
X
<<Eval evaluateBranch proto>>;
<<Eval evaluateNode proto>>;
<<Eval evaluateDefun proto>>;
X
<<Eval utility counter proto>>;
X
<<Eval cast le to int proto>>;
<<Eval cast int to le proto>>;
X
<<eval cb nothing proto>>;
X
<<Eval cb cume helper enum>>
<<Eval cb cume helper proto>>;
<<Eval cb add proto>>;
<<Eval cb subtract proto>>;
<<Eval cb multiply proto>>;
<<Eval cb divide proto>>;
<<Eval cb oneplus proto>>;
<<Eval cb oneminus proto>>;
<<Eval cb modulus proto>>;
X
<<Eval cb lt proto>>;
<<Eval cb lt eq proto>>;
<<Eval cb gt proto>>;
<<Eval cb gt eq proto>>;
<<Eval cb eqsign proto>>;
X
<<Eval cb and proto>>;
<<Eval cb or proto>>;
<<Eval cb not proto>>;
X
<<Eval cb atom proto>>;
<<Eval cb car proto>>;
<<Eval cb cdr proto>>;
<<Eval cb cons proto>>;
<<Eval cb list proto>>;
<<Eval cb equal helper proto>>;
<<Eval cb equal proto>>;
X
X
<<Eval cb if proto>>;
<<Eval cb when unless helper enum>>
<<Eval cb when unless proto>>;
<<Eval cb unless proto>>;
<<Eval cb when proto>>;
<<Eval cb cond proto>>;
<<Eval cb select proto>>;
X
<<Eval cb princ proto>>;
<<Eval cb terpri proto>>;
X
<<Eval cb eval proto>>;
<<Eval cb prog proto>>;
<<Eval cb prog1 proto>>;
<<Eval cb prog2 proto>>;
<<Eval cb progn proto>>;
X
<<Eval cb set helper enum>>
<<Eval cb set helper proto>>;
<<Eval cb set proto>>;
<<Eval cb setq proto>>;
<<Eval cb enum proto>>;
X
<<Eval cb defun proto>>;
@
SHAR_EOF
  (set 20 01 10 15 21 29 01 'lithp/eval.nw'; eval "$shar_touch") &&
  chmod 0644 'lithp/eval.nw'
if test $? -ne 0
then ${echo} 'restore of lithp/eval.nw failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'lithp/eval.nw: MD5 check failed'
       ) << SHAR_EOF
e388c9142331e3cd2a72bea0178b5ae8  lithp/eval.nw
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'lithp/eval.nw'` -ne 52035 && \
  ${echo} 'restoration warning:  size of lithp/eval.nw is not 52035'
  fi
fi
if rm -fr ${lock_dir}
then ${echo} 'x - removed lock directory `'${lock_dir}\''.'
else ${echo} 'x - failed to remove lock directory `'${lock_dir}\''.'
  exit 1
fi
exit 0
