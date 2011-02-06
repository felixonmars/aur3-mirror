#!/bin/sh
# This is a shell archive (produced by GNU sharutils 4.6.3).
# To extract the files from this archive, save it to some FILE, remove
# everything before the `#!/bin/sh' line above, then type `sh FILE'.
#
lock_dir=_sh09655
# Made on 2010-12-08 20:41 UTC by <ying@althonx4>.
# Source directory was `/mnt/rd1/lithp_c'.
#
# Existing files will *not* be overwritten, unless `-c' is specified.
#
# This shar contains:
# length mode       name
# ------ ---------- ------------------------------------------
#   5106 -rw-r--r-- c/doc/README
#  24480 -rw-r--r-- c/doc/LICENSE
# 181626 -rw-r--r-- c/doc/lithp.tex
#    115 -r--r--r-- c/samples/sample01.lsp
#    291 -r--r--r-- c/samples/sample02.lsp
#   5224 -r--r--r-- c/samples/sample03.lsp
#  25615 -r--r--r-- c/c_src/eval.c
#   5842 -r--r--r-- c/c_src/lists.c
#   1635 -r--r--r-- c/c_src/main.c
#   3093 -r--r--r-- c/c_src/parser.c
#   2165 -r--r--r-- c/c_src/vars.c
#   3192 -r--r--r-- c/c_src/eval.h
#   1034 -r--r--r-- c/c_src/lists.h
#    645 -r--r--r-- c/c_src/parser.h
#    479 -r--r--r-- c/c_src/vars.h
#    101 -r--r--r-- c/c_src/version.h
#     55 -rw-r--r-- c/c_src/Makefile
#  27607 -rwxr-xr-x c/c_src/lithp
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
# ============= c/doc/README ==============
if test ! -d 'c'; then
  mkdir 'c'
if test $? -eq 0
then ${echo} 'x - created directory `c'\''.'
else ${echo} 'x - failed to create directory `c'\''.'
  exit 1
fi
fi
if test ! -d 'c/doc'; then
  mkdir 'c/doc'
if test $? -eq 0
then ${echo} 'x - created directory `c/doc'\''.'
else ${echo} 'x - failed to create directory `c/doc'\''.'
  exit 1
fi
fi
if test -f 'c/doc/README' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/doc/README (file already exists)'
else
${echo} 'x - extracting c/doc/README (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c/doc/README' &&
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
  (set 20 10 08 31 12 52 47 'c/doc/README'; eval "$shar_touch") &&
  chmod 0644 'c/doc/README'
if test $? -ne 0
then ${echo} 'restore of c/doc/README failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/doc/README: MD5 check failed'
       ) << SHAR_EOF
2c2938983b9ff976a3bb4c5bde232ae9  c/doc/README
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/doc/README'` -ne 5106 && \
  ${echo} 'restoration warning:  size of c/doc/README is not 5106'
  fi
fi
# ============= c/doc/LICENSE ==============
if test ! -d 'c/doc'; then
  mkdir 'c/doc'
if test $? -eq 0
then ${echo} 'x - created directory `c/doc'\''.'
else ${echo} 'x - failed to create directory `c/doc'\''.'
  exit 1
fi
fi
if test -f 'c/doc/LICENSE' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/doc/LICENSE (file already exists)'
else
${echo} 'x - extracting c/doc/LICENSE (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c/doc/LICENSE' &&
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
  (set 20 10 08 31 12 52 47 'c/doc/LICENSE'; eval "$shar_touch") &&
  chmod 0644 'c/doc/LICENSE'
if test $? -ne 0
then ${echo} 'restore of c/doc/LICENSE failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/doc/LICENSE: MD5 check failed'
       ) << SHAR_EOF
e11467f1bb5c8af1c961d94891ad5f4a  c/doc/LICENSE
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/doc/LICENSE'` -ne 24480 && \
  ${echo} 'restoration warning:  size of c/doc/LICENSE is not 24480'
  fi
fi
# ============= c/doc/lithp.tex ==============
if test -f 'c/doc/lithp.tex' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/doc/lithp.tex (file already exists)'
else
${echo} 'x - extracting c/doc/lithp.tex (binary)'
  sed 's/^X//' << 'SHAR_EOF' | uudecode &&
begin 600 c/doc/lithp.tex
M7&1O8W5M96YT8VQA<W-[87)T:6-L97U<=7-E<&%C:V%G97MN;W=E8GU<<&%G
M97-T>6QE>VYO=V5B?5QN;W=E8F]P=&EO;G-[?5QB96=I;GMD;V-U;65N='U<
M;G=F:6QE;F%M97MI;G1R;RYN=WU<;G=B96=I;F1O8W-[,'U<8F5G:6Y[8V5N
M=&5R?0I[7&AU9V4@3&ET:'!]7%P*7&)E9VEN>W1A8G5L87)]>VQL?0I*97)R
M>2!,87=R96YC92`@("`F('M<='1[?6IS;"YL:71H<$!A8G-Y;G1H+F-O;7T@
M7%P*7&5N9'MT86)U;&%R?0I<96YD>V-E;G1E<GT*"EQT86)L96]F8V]N=&5N
M=',*7'!A9V5B<F5A:PH*"EQN=V5N9&1O8W-[?5QN=V)E9VEN9&]C<WLQ?5QN
M=V1O8W-P87(*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E"EQS96-T:6]N>T%U9&EE;F-E?0H*
M5&AE('1A<F=E="!A=61I96YC92!F;W(@=&AI<R!D;V-U;65N="!I<R!T:&]S
M92!W:&\@=VES:"!T;R!B96-O;64@;6]R90IF86UI;&EA<B!W:71H('1H92!I
M;FYT97(@=V]R:VEN9W,@;V8@=&AE($QI=&AP($Q)4U`@:6YT97)P<F5T97(N
M"@I4:&ES(&ES(&YO="!A('5S97)S(&=U:61E(&9O<B!P96]P;&4@;F5W('1O
M($Q)4U`N("!)="!I<R!I;7!L:65D('1H870*=&AE(')E861E<B!H87,@<V]M
M92!F86UI;&EA<FET>2!W:71H($,@<')O9W)A;6UI;F<@87,@=V5L;"!A<R!,
M25-0"G!R;V=R86UM:6YG+"!S:6YC92!I;B!E<W-E;F-E+"!T:&ES(&1O8W5M
M96YT(&ES('1H92!S;W5R8V4@8V]D92!T;R!A"DQ)4U`@:6YT97)P<F5T97(N
M"@I096]P;&4@=VES:&EN9R!T;R!I;G1E9W)A=&4@3&ET:'`@:6YT;R!T:&5I
M<B!O=VX@<')O:F5C=',@=VEL;"!P<F]B86)L>0IW86YT('1O(&5X86UI;F4@
M=&AE(&EN8VQU9&5D(&!@>UQT='M];6%I;BYC?2<G+"!I;B!<4UQR969[<V5C
M.FUA:6Y]('1O('-E90IH;W<@:70@:7,@9&]N92X@($EF('EO=2!W:7-H('1O
M(&5X<&%N9"!O<B!R961U8V4@=&AE(&9U;F-T:6]N86QI='D@;V8*3&ET:'`L
M('1H96X@7%-<<F5F>W-E8SIL:7-T979A;'5A=&]R?2!W:6QL(&)E('=H97)E
M('EO=2!W86YT('1O(&QO;VLN"@I<;G=E;F1D;V-S>WU<;G=B96=I;F1O8W-[
M,GU<;G=D;V-S<&%R"B4E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<V5C=&EO;GM);G1R;V1U
M8W1I;VY]"@H*5&AI<R!D;V-U;65N="!I<R!B<F]K96X@=7`@:6YT;R!A(&9E
M=R!S96-T:6]N<RX@(`I);B!<4UQR969[<V5C.FUA:6Y]+"!A('-A;7!L92!M
M86EN(')O=71I;F4@:7,@:6UP;&5M96YT960N"DEN(%Q37')E9GMS96,Z<&%R
M<V5R?2P@=&AE(&9I;&4@<&%R<V5R(&ES(&EM<&QE;65N=&5D+B`@"DEN(%Q3
M7')E9GMS96,Z;&ES='-]+"!A;&P@;V8@=&AE(&QI<W0@;6%N:7!U;&%T:6]N
M(&9U;F-T:6]N<R!A<F4@:6UP;&5M96YT960N"DEN(%Q37')E9GMS96,Z=F%R
M:6%B;&5M96-H86YI<VUS?2P@=&AE('-A;64@;&ES="!S=')U8W1U<F5S(&%R
M92!U<V5D('1O('-T;W)E(`IV87)I86)L97,@86YD('5S97(M9&5F:6YE9"!F
M=6YC=&EO;G,N"DEN(%Q37')E9GMS96,Z;&ES=&5V86QU871O<GTL('1H92!L
M:7-T(&EN=&5R<')E=&5R(&%N9"!E=F%L=6%T;W)S(&%R92!I;7!L96UE;G1E
M9"X*06YD(&9I;F%L;'DL(&EN(%Q37')E9GMS96,Z<V%M<&QE<WTL(&$@9F5W
M('-A;7!L92!,25-0(&9I;&5S('1H870@=V]R:PIP<F]P97)L>2!A<F4@9VEV
M96X@;W5T(&%S(&5X86UP;&5S+@I<4UQR969[<V5C.G9E<G-I;VY]('-H;W=S
M('1H92!C=7)R96YT('9E<G-I;VX@:6YF;W)M871I;VX@86YD(&-H86YG96QO
M9RX*"@I%86-H(&]F('1H97-E"FUA:F]R('-E8W1I;VYS(&)E9VEN<R!W:71H
M(&%N(&EN=')O9'5C=&EO;B!D97-C<FEB:6YG('1H92!I;G1E<FYA;`IL87EO
M=70@;V8@=&AA="!S96-T:6]N+@H*"DUO<W0@;V8@=&AI<R!D;V-U;65N="!I
M<R!G96%R960@=&]W87)D(&1E=F5L;W!E<G,@=VAO('=I<V@@=&\*=6YD97)S
M=&%N9"!T:&4@:6YT97)N86P@=V]R:VEN9W,@;V8@=&AE(&EN=&5R<')E=&5R
M+@I<;G=E;F1D;V-S>WU<;G=F:6QE;F%M97MM86EN+FYW?5QN=V)E9VEN9&]C
M<WLP?5QN=V5N9&1O8W-[?5QN=V)E9VEN9&]C<WLQ?5QN=V1O8W-P87(*7'-E
M8W1I;VY[5&AE($QI=&AP($EN=&5R<')E=&5R)W,@36%I;B!0<F]G<F%M?0I<
M;&%B96Q[<V5C.FUA:6Y]"@I4:&ES(&ES(&$@<V%M<&QE(&UA:6X@<')O9W)A
M;2!T:&%T('5S97,@=&AE(&QI=&AP(&9U;F-T:6]N<R!T;R!R96%D(&EN"F%L
M;"!F:6QE<R!C;VYT86EN960@;VX@=&AE(&-O;6UA;F0@;&EN92P@86YD(&EN
M=&5R<')E="!E86-H(&]N90IS97!E<F%T96QY+@H*3VYC92!T:&4@;&ES=',@
M:&%V92!B965N(&5V86QU871E9"!U<VEN9R!T:&4@>UQT='M];&5$=6UP179A
M;'T@9G5N8W1I;VXL"FET(&1U;7!S(&]U="!T:&4@=F%R:6%B;&4@86YD(&1E
M9G5N(&QI<W1S(&%S('=E;&PN"@HE)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B
M<V5C=&EO;GM087)S97(@0V%L;&)A8VMS?0H*5&AE<V4@87)E('1H92!C86QL
M8F%C:W,@<V\@=&AA="!W92!C86X@<F5A9"!I;B!F<F]M(&$@9FEL92X@66]U
M(&-A;@IP<F]B86)L>2!W<FET92!Y;W5R(&]W;B!C86QL8F%C:W,@=&\@<F5A
M9"!I;B!F<F]M(&$@8G5F9F5R(&]R('1H92`*;&EK92X@($ET(&5X<&5C=',@
M82!S=&1I;R![7'1T>WU%3T9](&%T('1H92!E;F0@;V8@=&AE(&9I;&4@=&\@
M8F4@"G!R;V-E<W-E9"X*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LR?5QS
M=6)L86)E;'M.5VUA:3<M;6%I2BTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7;6%I-RUM86E*+3%]?7U<;6]D9&5F>VUA:6X@
M<&%R<V5R(&=L;V)A;'-^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VUA
M:3<M;6%I2BTQ?7U]7&5N9&UO9&1E9@H@("`@1DE,12`J(&9P(#T@3E5,3#L*
M7&YW=7-E9'M<7'M.5VUA:3<M;6%I-BTR?7U<;G=E;F1C;V1E>WU<;G=B96=I
M;F1O8W-[,WU<;G=D;V-S<&%R"@I&:7)S="P@=&AE(&-A;&QB86-K(&9O<B!T
M:&4@9V5T8R!F=6YC=&EO;BXN+@H*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E
M>S1]7'-U8FQA8F5L>TY7;6%I-RUM86E6+3%]7&YW;6%R9VEN=&%G>WM<;G=T
M86=S='EL97M]7'-U8G!A9V5R969[3E=M86DW+6UA:58M,7U]?5QM;V1D969[
M;6%I;B!P87)S97(@9V5T8R!C86QL8F%C:R!P<F]T;WY[7&YW=&%G<W1Y;&5[
M?5QS=6)P86=E<F5F>TY7;6%I-RUM86E6+3%]?7U<96YD;6]D9&5F"B`@("!I
M;G0@;7EG971C*"!V;VED("D*7&YW=7-E9'M<7'M.5VUA:3<M;6%I92TQ?7U<
M;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[-7T@"EQN=V5N9&1O8W-[?5QN=V)E
M9VEN8V]D97LV?5QS=6)L86)E;'M.5VUA:3<M;6%I92TQ?5QN=VUA<F=I;G1A
M9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;6%I-RUM86EE+3%]?7U<
M;6]D9&5F>VUA:6X@<&%R<V5R(&=E=&,@8V%L;&)A8VL@:6UP;&5M96YT871I
M;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VUA:3<M;6%I92TQ?7U]
M7&5N9&UO9&1E9@H@("`@7$Q!>WUM86EN('!A<G-E<B!G971C(&-A;&QB86-K
M('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=M86DW+6UA:58M
M,7U]7%)!>WT*("`@(%Q["B`@("`@("`@<F5T=7)N*"!G971C*"!F<"`I("D[
M"B`@("!<?0I<;G=U<V5D>UQ<>TY7;6%I-RUM86DV+3)]?5QN=V5N9&-O9&5[
M?5QN=V)E9VEN9&]C<WLW?5QN=V1O8W-P87(*"@I!;F0@;W5R(&-A;&QB86-K
M(&9O<B!T:&4@=6YG971C(&9U;F-T:6]N+BXN"@I<;G=E;F1D;V-S>WU<;G=B
M96=I;F-O9&5[.'U<<W5B;&%B96Q[3E=M86DW+6UA:5@M,7U<;G=M87)G:6YT
M86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VUA:3<M;6%I6"TQ?7U]
M7&UO9&1E9GMM86EN('!A<G-E<B!U;F=E=&,@8V%L;&)A8VL@<')O=&]^>UQN
M=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VUA:3<M;6%I6"TQ?7U]7&5N9&UO
M9&1E9@H@("`@=F]I9"!M>75N9V5T8R@@:6YT(&,@*0I<;G=U<V5D>UQ<>TY7
M;6%I-RUM86EG+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLY?2`*7&YW
M96YD9&]C<WM]7&YW8F5G:6YC;V1E>S$P?5QS=6)L86)E;'M.5VUA:3<M;6%I
M9RTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7
M;6%I-RUM86EG+3%]?7U<;6]D9&5F>VUA:6X@<&%R<V5R('5N9V5T8R!C86QL
M8F%C:R!I;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F
M>TY7;6%I-RUM86EG+3%]?7U<96YD;6]D9&5F"B`@("!<3$%[?6UA:6X@<&%R
M<V5R('5N9V5T8R!C86QL8F%C:R!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P
M86=E<F5F>TY7;6%I-RUM86E8+3%]?5Q207M]"B`@("!<>PH@("`@("`@('5N
M9V5T8R@@8RP@9G`@*3L*("`@(%Q]"EQN=W5S961[7%Q[3E=M86DW+6UA:38M
M,GU]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S$Q?5QN=V1O8W-P87(*"B4E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E"EQS=6)S96-T:6]N>VUA:6XH*7T*"D%N9"!N
M;W<@=&AE(&UA:6X@9G5N8W1I;VX@:71S96QF+B`@"@I<;G=E;F1D;V-S>WU<
M;G=B96=I;F-O9&5[,3)]7'-U8FQA8F5L>TY7;6%I-RUM86E.+3%]7&YW;6%R
M9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=M86DW+6UA:4XM
M,7U]?5QM;V1D969[;6%I;B!F=6YC=&EO;B!V87)I86)L97-^>UQN=W1A9W-T
M>6QE>WU<<W5B<&%G97)E9GM.5VUA:3<M;6%I3BTQ?7U]7&5N9&UO9&1E9@H@
M("`@:6YT(&9I;&5N;SL*("`@(&EN="!L:6YE;F\["B`@("!S=')U8W0@;&4@
M*B!L:7-T(#T@3E5,3#L*7&YW=7-E9'M<7'M.5VUA:3<M;6%I-BTS?7U<;G=E
M;F1C;V1E>WU<;G=B96=I;F1O8W-[,3-]7&YW9&]C<W!A<@H*7&YW96YD9&]C
M<WM]7&YW8F5G:6YC;V1E>S$T?5QS=6)L86)E;'M.5VUA:3<M;6%I32TQ?5QN
M=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;6%I-RUM
M86E-+3%]?7U<;6]D9&5F>VUA:6X@8VAE8VL@8V]M;6%N9&QI;F5^>UQN=W1A
M9W-T>6QE>WU<<W5B<&%G97)E9GM.5VUA:3<M;6%I32TQ?7U]7&5N9&UO9&1E
M9@H@("`@:68@*&%R9V,@/#T@,2D*("`@(%Q["B`@("`@("`@9G!R:6YT9BAS
M=&1E<G(L(")%4E)/4CH@66]U(&UU<W0@<W!E8VEF>2!A("YL<W`@9FEL92%<
M7&XB*3L*("`@("`@("!R971U<FX@7U],24Y%7U\["B`@("!<?0I<;G=U<V5D
M>UQ<>TY7;6%I-RUM86DV+3-]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLQ
M-7U<;G=D;V-S<&%R"@H*5VAA="!W92=R92!B87-I8V%L;'D@9V]I;F<@=&\@
M9&\@:7,@=&AA="!F;W(@96%C:"!F:6QE(&QO861E9"!I;BP*"DEF(&ET(&-A
M;B!O<&5N('1H92!F:6QE+"!W92!W:6QL('!A<G-E(&ET(&EN('5S:6YG(&]U
M<B![7'1T>WUM>6=E=&-]"F%N9"![7'1T>WUM>75N9V5T8WT@=71I;&ET>2!F
M=6YC=&EO;G,N("!792!W:6QL('1H96X@979A;'5A=&4@86YD(&1U;7`*=&AE
M(&UA:6X@;&ES="P@=&AE;B!D=6UP(&]U="!A;&P@;V8@=&AE('9A<FEA8FQE
M<R!A;F0@=7-E<B!D969I;F5D"F9U;F-T:6]N<RX*"G=E)W)E(&=O:6YG('1O
M('-T87)T(&]F9B!W:71H(&$@;F5W('-E="!O9B!V87)I86)L97,@9F]R('1H
M92!N97AT"F9I;&4L('-O('=E('=I<&4@=&AE;2!W:&5N('=E)W)E(&1O;F4@
M=VET:"!T:&5M+@H*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S$V?5QS=6)L
M86)E;'M.5VUA:3<M;6%I22TQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[
M?5QS=6)P86=E<F5F>TY7;6%I-RUM86E)+3%]?7U<;6]D9&5F>VUA:6X@9G5N
M8W1I;VX@8F]D>7Y[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;6%I-RUM
M86E)+3%]?7U<96YD;6]D9&5F"B`@("!F;W(@*&9I;&5N;R`](#`@.R!F:6QE
M;F\@/"!A<F=C+3$@.R!F:6QE;F\@*RLI"B`@("!<>PH@("`@("`@("\J('!A
M<G-E(&EN('1H92!F:6QE("HO"B`@("`@("`@<')I;G1F*"(]/3T]($9I;&4@
M)3`R9#H@)7-<7&XB+"!F:6QE;F\L(&%R9W9;9FEL96YO*S%=*3L*("`@("`@
M("!F<"`](&9O<&5N*&%R9W9;9FEL96YO*S%=+"`B<B(I.PH*("`@("`@("!I
M9B`H(69P*0H@("`@("`@(%Q["B`@("`@("`@("`@(&9P<FEN=&8H<W1D97)R
M+"`B15)23U(Z($-O=6QD;B=T(&]P96X@7%PB)7-<7"(N7%QN(BP@87)G=EMF
M:6QE;F\K,5TI.PH@("`@("`@("`@("!C;VYT:6YU93L*("`@("`@("!<?0H@
M("`@("`@(&QI;F5N;R`](#`["B`@("`@("`@;&ES="`]('!A<G-E26Y&:6QE
M*&UY9V5T8RP@;7EU;F=E=&,L(&QI<W0L("9L:6YE;F\I.PH@("`@("`@(&9C
M;&]S92AF<"D["B`@("`@("`@9G`@/2!.54Q,.PH*("`@("`@("`O*B!E=F%L
M=6%T92!T:&4@<F5A9"UI;B!L:7-T<R!A;F0@9G)E92`J+PH@("`@("`@(&QE
M1'5M<$5V86PH;&ES="P@,"D[(`H@("`@("`@(&QE5VEP92AL:7-T*3L*"B`@
M("`@("`@+RH@9&ES<&QA>2!T:&4@=F%R:6%B;&5S(&%N9"!F<F5E("HO"B`@
M("`@("`@<')I;G1F*")687)I86)L97,Z7%QN(BD["B`@("`@("`@=F%R:6%B
M;&5$=6UP*"!M86EN5F%R3&ES="`I.PH@("`@("`@('9A<FEA8FQE1G)E92@@
M;6%I;E9A<DQI<W0@*3L*"B`@("`@("`@+RH@9&ES<&QA>2!T:&4@=7-E<BUD
M969I;F5D(&9U;F-T:6]N<R!A;F0@9G)E92`J+PH@("`@("`@('!R:6YT9B@B
M9&5F=6XG<SI<7&XB*3L*("`@("`@("!V87)I86)L941U;7`H(&1E9G5N3&ES
M="`I.PH@("`@("`@('9A<FEA8FQE1G)E92@@9&5F=6Y,:7-T("D["B`@("!<
M?0I<;G=U<V5D>UQ<>TY7;6%I-RUM86DV+3-]?5QN=V5N9&-O9&5[?5QN=V)E
M9VEN9&]C<WLQ-WU<;G=D;V-S<&%R"@HE)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<
M<W5B<V5C=&EO;GM4:&4@4V]U<F-E($9I;&4@>UQT='M];6%I;BYC?7T*7&QA
M8F5L>W-E8SIM86EN+F-]"@I4:&4@<V]U<F-E(&9I;&4@9F]R('1H92!M86EN
M('!R;V=R86T@<VEM<&QY(&EN8VQU9&5S('1H92!H96%D97)S(&9O<@IT:&4@
M<W1A;F1A<F0@0R!H96%D97)S(&ET('5S97,N("`*"EQN=V5N9&1O8W-[?5QN
M=V)E9VEN8V]D97LQ.'U<<W5B;&%B96Q[3E=M86DW+6UA:38M,7U<;G=M87)G
M:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VUA:3<M;6%I-BTQ
M?7U]7&UO9&1E9GMM86EN+F-^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.
M5VUA:3<M;6%I-BTQ?7U]7&5N9&UO9&1E9@HC:6YC;'5D92`\<W1D:6\N:#X*
M(VEN8VQU9&4@(G!A<G-E<BYH(@HC:6YC;'5D92`B=F5R<VEO;BYH(@HC:6YC
M;'5D92`B=F%R<RYH(@I<;G=A;'-O9&5F:6YE9'M<7'M.5VUA:3<M;6%I-BTR
M?5Q<>TY7;6%I-RUM86DV+3-]?5QN=VYO='5S961[;6%I;BYC?5QN=V5N9&-O
M9&5[?5QN=V)E9VEN9&]C<WLQ.7U<;G=D;V-S<&%R"@H*06QL(&]F('1H92!S
M='5F9B!F;W(@=&AE('!A<G-E<B!C86QL8F%C:W,N+BX*7&YW96YD9&]C<WM]
M7&YW8F5G:6YC;V1E>S(P?5QS=6)L86)E;'M.5VUA:3<M;6%I-BTR?5QN=VUA
M<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;6%I-RUM86DV
M+3)]?7U<;6]D9&5F>VUA:6XN8WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F
M>TY7;6%I-RUM86DV+3%]?7U<<&QU<V5N9&UO9&1E9@I<3$%[?6UA:6X@<&%R
M<V5R(&=L;V)A;'-^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VUA:3<M
M;6%I2BTQ?7U<4D%[?0H*7$Q!>WUM86EN('!A<G-E<B!U;F=E=&,@8V%L;&)A
M8VL@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.
M5VUA:3<M;6%I9RTQ?7U<4D%[?0I<3$%[?6UA:6X@<&%R<V5R(&=E=&,@8V%L
M;&)A8VL@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5VUA:3<M;6%I92TQ?7U<4D%[?0I<;G=E;F1C;V1E>WU<;G=B96=I;F1O
M8W-[,C%]7&YW9&]C<W!A<@H*5&AE;BP@:70@:6YC;'5D97,@=&AE(&UA:6X@
M<F]U=&EN92X@(`I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,C)]7'-U8FQA
M8F5L>TY7;6%I-RUM86DV+3-]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=M86DW+6UA:38M,WU]?5QM;V1D969[;6%I;BYC?GM<
M;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=M86DW+6UA:38M,7U]?5QP;'5S
M96YD;6]D9&5F"FEN=`IM86EN*"!I;G0@87)G8RP@8VAA<BH@87)G=EM=("D*
M7'L*("`@(%Q,07M];6%I;B!F=6YC=&EO;B!V87)I86)L97-^>UQN=W1A9W-T
M>6QE>WU<<W5B<&%G97)E9GM.5VUA:3<M;6%I3BTQ?7U<4D%[?0H*("`@('!R
M:6YT9B@@(FQI=&AP('-A;7!L92!E>&5C=71A8FQE(&)Y(&IS;"YL:71H<$!A
M8G-Y;G1H+F-O;5Q<;B(@*3L*("`@('!R:6YT9B@@(E9E<G-I;VX@(B!615)?
M0E5)3$1?5D52(`H@("`@("`@("`@("`@("`@(B`B("`@(%9%4E]"54E,1%]$
M051%(`H@("`@("`@("`@("`@("`@(B!<7"(B("!615)?0E5)3$1?5%!/5$,*
M("`@("`@("`@("`@("`@(")<7")<7&XB("D["B`@("!<3$%[?6UA:6X@8VAE
M8VL@8V]M;6%N9&QI;F5^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VUA
M:3<M;6%I32TQ?7U<4D%[?0H@("`@7$Q!>WUM86EN(&9U;F-T:6]N(&)O9'E^
M>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VUA:3<M;6%I22TQ?7U<4D%[
M?0H@("`@<F5T=7)N(#`["EQ]"EQN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLR
M,WU<;G=D;V-S<&%R"EQN=V5N9&1O8W-[?5QN=V9I;&5N86UE>W!A<G-E<BYN
M=WU<;G=B96=I;F1O8W-[,'U<;G=E;F1D;V-S>WU<;G=B96=I;F1O8W-[,7U<
M;G=D;V-S<&%R"EQS96-T:6]N>U1H92!&:6QE(%!A<G-E<GT*7&QA8F5L>W-E
M8SIP87)S97)]"@I4:&4@1FEL92!087)S97(@:7,@8F%S:6-A;&QY(&$@<VEM
M<&QE('1O:V5N:7IE<B!O9B!T:&4@9FEL92!P87-S960@:6XN"E1H97-E('1O
M:V5N<R!A<F4@<'5L;&5D(&9R;VT@=&AE(&9I;&4@<W1R96%M(&EN(%Q37')E
M9GMS96,Z=&]K96YI>F5R?2P*86YD(&%D9&5D('1O('1H92!L:7-T(&EN(%Q3
M7')E9GMS96,Z;&ES=&)U:6QD97)]+@H*"@HE)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24*7'-U
M8G-E8W1I;VX@>TQI<W0@0G5I;&1E<GT*7&QA8F5L>W-E8SIL:7-T8G5I;&1E
M<GT*"E1H:7,@:7,@=&AE(&UA:6X@96YG:6YE(&]F('1H92!P87)S97(N("!)
M="!W:6QL('5S92!T:&4@8F5L;W<@"G1O:V5N:7IE<B!T;R!R96%D(&EN(&%L
M;"!E;&5M96YT<R!O9B!T:&4@9FEL92X*"E=E('=I;&P@8F4@<&%S<VEN9R!I
M;B!T=V\@<&]I;G1E<G,@=&\@9G5N8W1I;VYS+B`@5&AE<V4@='=O(&9U;F-T
M:6]N<PIW:6QL(&)E('5S960@=&\@9V5T(&%N9"!U;F=E="!C:&%R86-T97)S
M('1O('1H92!B=69F97(@;W(@<W1R96%M+"!O<@IW:&%T979E<B!I;G!U="!D
M979I8V4@>6]U(&%R92!U<VEN9RX*"D9O<B!T:&4@8&!G970@82!C:&%R86-T
M97(G)R!F=6YC=&EO;BP@=V4@=VEL;"!B92!U<VEN9R!T:&ES(&9O<FUA=#H*
M"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LR?5QS=6)L86)E;'M.5W!A<CDM
M4&%R82TQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F
M>TY7<&%R.2U087)A+3%]?7U<;6]D9&5F>U!A<G-E(&=E="!C:&%R86-T97(@
M8V%L;&)A8VL@='EP961E9GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7
M<&%R.2U087)A+3%]?7U<96YD;6]D9&5F"B`@("!T>7!E9&5F(&EN="`*("`@
M("@J9V5T8T-A;&QB86-K*0H@("`@("`@("@*("`@("`@("`@("`@=F]I9`H@
M("`@("`@("D["EQN=W5S961[7%Q[3E=P87(Y+7!A<C@N,BTQ?7U<;G=E;F1C
M;V1E>WU<;G=B96=I;F1O8W-[,WU<;G=D;V-S<&%R"@I!;F0@=&\@8&!U;F=E
M="!A(&-H87)A8W1E<B<G+"!W92!W:6QL('5S92!T:&ES(&9O<FUA=#H*"EQN
M=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LT?5QS=6)L86)E;'M.5W!A<CDM4&%R
M8RTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7
M<&%R.2U087)C+3%]?7U<;6]D9&5F>U!A<G-E('5N9V5T(&-H87)A8W1E<B!C
M86QL8F%C:R!T>7!E9&5F?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=P
M87(Y+5!A<F,M,7U]?5QE;F1M;V1D968*("`@('1Y<&5D968@=F]I9`H@("`@
M*"IU;F=E=&-#86QL8F%C:RD*("`@("`@("`H"B`@("`@("`@("`@(&EN="!C
M"B`@("`@("`@*3L*7&YW=7-E9'M<7'M.5W!A<CDM<&%R."XR+3%]?5QN=V5N
M9&-O9&5[?5QN=V)E9VEN9&]C<WLU?5QN=V1O8W-P87(*"EQN=V5N9&1O8W-[
M?5QN=V)E9VEN8V]D97LV?5QS=6)L86)E;'M.5W!A<CDM4&%R2BTQ?5QN=VUA
M<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7<&%R.2U087)*
M+3%]?7U<;6]D9&5F>U!A<G-E(&EN(&9I;&4@<')O=&]^>UQN=W1A9W-T>6QE
M>WU<<W5B<&%G97)E9GM.5W!A<CDM4&%R2BTQ?7U]7&5N9&UO9&1E9@H@("`@
M<W1R=6-T(&QE("H*("`@('!A<G-E26Y&:6QE*`H@("`@("`@("`@("!G971C
M0V%L;&)A8VL@9V5T86-H87(L"B`@("`@("`@("`@('5N9V5T8T-A;&QB86-K
M('5N9V5T86-H87(L"B`@("`@("`@("`@('-T<G5C="!L92`J(&QI<W0L"B`@
M("`@("`@("`@(&EN="`J(&QI;F4*("`@("D*7&YW=7-E9'M<7'M.5W!A<CDM
M4&%R4RTQ?5Q<>TY7<&%R.2UP87(X+C(M,7U]7&YW96YD8V]D97M]7&YW8F5G
M:6YD;V-S>S=]7&YW9&]C<W!A<@H*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E
M>SA]7'-U8FQA8F5L>TY7<&%R.2U087)3+3%]7&YW;6%R9VEN=&%G>WM<;G=T
M86=S='EL97M]7'-U8G!A9V5R969[3E=P87(Y+5!A<E,M,7U]?5QM;V1D969[
M4&%R<V4@:6X@9FEL92!I;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS
M=6)P86=E<F5F>TY7<&%R.2U087)3+3%]?7U<96YD;6]D9&5F"B`@("!<3$%[
M?5!A<G-E(&EN(&9I;&4@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5W!A<CDM4&%R2BTQ?7U<4D%[?0H@("`@7'L*("`@("`@("!C:&%R("H@
M=&5M<"`]($Y53$P["B`@("`@("`@96YU;2!T;VME;FYA;64@=&]K96YI9"`]
M(%1?3D].13L*("`@("`@("!I;G0@:7-Q=6]T960@/2`P.PH*("`@("`@("!I
M9B`H(6=E=&%C:&%R('Q\("%U;F=E=&%C:&%R*2`@<F5T=7)N*"!.54Q,("D[
M"@H@("`@("`@('=H:6QE("@Q*5Q["B`@("`@("`@("`@(`H@("`@("`@("`@
M("!T96UP(#T@<VYA9T%4;VME;BAG971A8VAA<BP@=6YG971A8VAA<BP@)G1O
M:V5N:60I.PH*("`@("`@("`@("`@<W=I=&-H("AT;VME;FED*0H@("`@("`@
M("`@("!<>PH@("`@("`@("`@("!C87-E("A47U%53U1%*3H*("`@("`@("`@
M("`@("`@(&ES<75O=&5D(#T@,3L*("`@("`@("`@("`@("`@(&)R96%K.PH*
M("`@("`@("`@("`@8V%S92`H5%]/4$5.4$%214XI.@H@("`@("`@("`@("`@
M("`@;&ES="`](&QE061D0G)A;F-H16QE;65N="@*("`@("`@("`@("`@("`@
M("`@("`@("`@("`@("`@("!L:7-T+"`*("`@("`@("`@("`@("`@("`@("`@
M("`@("`@("`@("!P87)S94EN1FEL92AG971A8VAA<BP@"B`@("`@("`@("`@
M("`@("`@("`@("`@("`@("`@("`@("`@("`@("!U;F=E=&%C:&%R+"`*("`@
M("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@($Y53$PL"B`@
M("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("!L:6YE*2P*
M("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("!I<W%U;W1E9`H@("`@
M("`@("`@("`@("`@("`@("`@("`@("`@("`@("D["B`@("`@("`@("`@("`@
M("!I<W%U;W1E9"`](#`["B`@("`@("`@("`@("`@("!B<F5A:SL*"B`@("`@
M("`@("`@(&-A<V4@*%1?3D573$E.12DZ"B`@("`@("`@("`@("`@("!I<W%U
M;W1E9"`](#`["B`@("`@("`@("`@("`@("`J;&EN92`]("IL:6YE("LQ.PH@
M("`@("`@("`@("`@("`@8G)E86L["@H@("`@("`@("`@("!C87-E("A47U=/
M4D0I.@H@("`@("`@("`@("`@("`@;&ES="`](&QE061D1&%T845L96UE;G0H
M"B`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@;&ES="P*("`@("`@
M("`@("`@("`@("`@("`@("`@("`@("`@("!T96UP+`H@("`@("`@("`@("`@
M("`@("`@("`@("`@("`@("`@(&ES<75O=&5D"B`@("`@("`@("`@("`@("`@
M("`@("`@("`@("`@("`@*3L*("`@("`@("`@("`@("`@(&9R964H=&5M<"D[
M"B`@("`@("`@("`@("`@("!I<W%U;W1E9"`](#`["B`@("`@("`@("`@("`@
M("!B<F5A:SL*("`@("`@("`@("`@"B`@("`@("`@("`@(&-A<V4@*%1?0TQ/
M4T5005)%3BDZ"B`@("`@("`@("`@(&-A<V4@*%1?14]&*3H*("`@("`@("`@
M("`@("`@(&ES<75O=&5D(#T@,#L*("`@("`@("`@("`@("`@(')E='5R;B`H
M;&ES="D["B`@("`@("`@("`@(%Q]"B`@("`@("`@7'T*("`@(%Q]"EQN=W5S
M961[7%Q[3E=P87(Y+7!A<C@M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S
M>SE]7&YW9&]C<W!A<@H*"B4E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<V5C=&EO;B![
M5&]K96YI>F5R?0I<;&%B96Q[<V5C.G1O:V5N:7IE<GT*"D1I9F9E<F5N="!H
M86YD;&EN9W,@9F]R(&1I9F9E<F5N="!T;VME;G,Z"@I[7'1T>WUW:&ET97-P
M86-E?3H@<VMI<"!O=F5R"GM<='1[?6-O;6UE;G1].B!S:VEP('1O(&5N9"!O
M9B!L:6YE"GM<='1[?2A].B!R971U<FX@3E5,3"P@=&]K96YI9"!G971S('M<
M='1[?4]014Y005)%3GT*>UQT='M]*7TZ(')E='5R;B!.54Q,+"!T;VME;FED
M(&=E=',@>UQT='M]0TQ/4T5005)%3GT*>UQT='M];F5W;&EN97TZ(')E='5R
M;B!.54Q,+"!T;VME;FED(&=E=',@>UQT='M]3D573$E.17T*>UQT='M](F9O
M;R)].B!R971U<FX@(F9O;R(L('1O:V5N:60@9V5T<R![7'1T>WU73U)$?0I[
M7'1T>WUN=6UB97)].B!R971U<FX@;G5M8F5R(&EN(&$@<W1R:6YG+"!T;VME
M;FED(&=E=',@>UQT='M]5T]21'T*"F)U9F9E<G,@<F5T=7)N960@;F5E9"!T
M;R!B92!F<F5E9"!L871E<BX*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LQ
M,'U<<W5B;&%B96Q[3E=P87(Y+5!A<D<M,7U<;G=M87)G:6YT86=[>UQN=W1A
M9W-T>6QE>WU<<W5B<&%G97)E9GM.5W!A<CDM4&%R1RTQ?7U]7&UO9&1E9GM0
M87)S92!T;VME;B!E;G5M?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=P
M87(Y+5!A<D<M,7U]?5QE;F1M;V1D968*96YU;2!T;VME;FYA;64@7'L@"B`@
M("`@("`@5%].3TY%+"`*("`@("`@("!47T-,3U-%4$%214XL(`H@("`@("`@
M(%1?3U!%3E!!4D5.+"`*("`@("`@("!47TY%5TQ)3D4L(`H@("`@("`@(%1?
M455/5$4L"B`@("`@("`@5%]73U)$+"`*("`@("`@("!47T5/1@I<?3L*7&YW
M=7-E9'M<7'M.5W!A<CDM<&%R."XR+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN
M9&]C<WLQ,7U<;G=D;V-S<&%R"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[
M,3)]7'-U8FQA8F5L>TY7<&%R.2U087)/+3%]7&YW;6%R9VEN=&%G>WM<;G=T
M86=S='EL97M]7'-U8G!A9V5R969[3E=P87(Y+5!A<D\M,7U]?5QM;V1D969[
M4&%R<V4@<VYA9R!A('1O:V5N('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A
M9V5R969[3E=P87(Y+5!A<D\M,7U]?5QE;F1M;V1D968*("`@(&-H87(@*@H@
M("`@<VYA9T%4;VME;B@*("`@("`@("!G971C0V%L;&)A8VL@9V5T86-H87(L
M"B`@("`@("`@=6YG971C0V%L;&)A8VL@=6YG971A8VAA<BP*("`@("`@("!E
M;G5M('1O:V5N;F%M92`J('1O:V5N:60*("`@("D*7&YW=7-E9'M<7'M.5W!A
M<CDM4&%R6"TQ?5Q<>TY7<&%R.2UP87(X+C(M,7U]7&YW96YD8V]D97M]7&YW
M8F5G:6YD;V-S>S$S?5QN=V1O8W-P87(*"EQN=V5N9&1O8W-[?5QN=V)E9VEN
M8V]D97LQ-'U<<W5B;&%B96Q[3E=P87(Y+5!A<E@M,7U<;G=M87)G:6YT86=[
M>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5W!A<CDM4&%R6"TQ?7U]7&UO
M9&1E9GM087)S92!S;F%G(&$@=&]K96X@:6UP;&5M96YT871I;VY^>UQN=W1A
M9W-T>6QE>WU<<W5B<&%G97)E9GM.5W!A<CDM4&%R6"TQ?7U]7&5N9&UO9&1E
M9@H@("`@7$Q!>WU087)S92!S;F%G(&$@=&]K96X@<')O=&]^>UQN=W1A9W-T
M>6QE>WU<<W5B<&%G97)E9GM.5W!A<CDM4&%R3RTQ?7U<4D%[?0H@("`@7'L*
M("`@("`@("!U;G-I9VYE9"!I;G0@<&]S(#T@,#L*("`@("`@("!I;G0@8SL*
M("`@("`@("!I;G0@9&]U8FQE<75O=&5S(#T@,#L*("`@("`@("!C:&%R('1E
M;7!;,3(X73L*"B`@("`@("`@*G1O:V5N:60@/2!47T5/1CL*"B`@("`@("`@
M:68@*"%G971A8VAA<B!\?"`A=6YG971A8VAA<BD*("`@("`@("!<>PH@("`@
M("`@("`@("`J=&]K96YI9"`](%1?14]&.PH@("`@("`@("`@("!R971U<FXH
M($Y53$P@*3L*("`@("`@("!<?0H*("`@("`@("`O*B!C:&5W('-P86-E('1O
M(&YE>'0@=&]K96X@*B\*("`@("`@("!W:&EL92`H,2D*("`@("`@("!<>PH@
M("`@("`@("`@("!C(#T@9V5T86-H87(H*3L*"B`@("`@("`@("`@("\J(&UU
M;F-H(&-O;6UE;G1S("HO"B`@("`@("`@("`@(&EF("@@("`@*&,@/3T@)R,G
M*2`*("`@("`@("`@("`@("`@("!\?"`H8R`]/2`G.R<I"B`@("`@("`@("`@
M("`@("D*("`@("`@("`@("`@7'L*("`@("`@("`@("`@("`@(&1O(%Q["B`@
M("`@("`@("`@("`@("`@("`@8R`](&=E=&%C:&%R*"D["B`@("`@("`@("`@
M("`@("!<?2!W:&EL92`H8R`A/2`G7%QN)RD["B`@("`@("`@("`@(%Q]"B`@
M("`@("`@("`@("`@("`*("`@("`@("`@("`@:68@*"@@("`@*&,@/3T@)R@G
M*0H@("`@("`@("`@("`@("`@('Q\("AC(#T]("<I)RD*("`@("`@("`@("`@
M("`@("!\?"`H8R`]/2`G7%QN)RD*("`@("`@("`@("`@("`@("!\?"`H8R`]
M/2`G7%PB)RD*("`@("`@("`@("`@("`@("!\?"`H8R`]/2`G7%PG)RD*("`@
M("`@("`@("`@("`@("!\?"`H8R`]/2!%3T8I"B`@("`@("`@("`@("`@("`@
M?'P@*&,@/B`G+2<I"B`@("`@("`@("`@("`@("`@?'P@*&,@/#T@)WHG*0H@
M("`@("`@("`@("`@("`I("8F("@@8R`A/2`G("<I("8F("@@8R`A/2`G7%QT
M)RD@*0H@("`@("`@("`@("!<>PH@("`@("`@("`@("`@("`@8G)E86L["B`@
M("`@("`@("`@(%Q]"B`@("`@("`@7'T*"B`@("`@("`@+RH@<VYA9R!T;VME
M;B`J+PH@("`@("`@(&EF("AC(#T]("<H)RD*("`@("`@("!<>PH@("`@("`@
M("`@("`J=&]K96YI9"`](%1?3U!%3E!!4D5..PH@("`@("`@("`@("!R971U
M<FXH($Y53$P@*3L*("`@("`@("!<?2!E;'-E(`H*("`@("`@("!I9B`H8R`]
M/2`G*2<I"B`@("`@("`@7'L*("`@("`@("`@("`@*G1O:V5N:60@/2!47T-,
M3U-%4$%214X["B`@("`@("`@("`@(')E='5R;B@@3E5,3"`I.PH@("`@("`@
M(%Q](&5L<V4@"@H@("`@("`@(&EF("AC(#T]("=<7"<G*0H@("`@("`@(%Q[
M"B`@("`@("`@("`@("IT;VME;FED(#T@5%]154]413L*("`@("`@("`@("`@
M<F5T=7)N*"!.54Q,("D["B`@("`@("`@7'T@96QS92`*"B`@("`@("`@:68@
M*&,@/3T@)UQ<;B<I"B`@("`@("`@7'L*("`@("`@("`@("`@*G1O:V5N:60@
M/2!47TY%5TQ)3D4["B`@("`@("`@("`@(')E='5R;B@@3E5,3"`I.PH@("`@
M("`@(%Q](&5L<V4@"@H@("`@("`@(&EF("AC(#T]($5/1BD*("`@("`@("!<
M>PH@("`@("`@("`@("`J=&]K96YI9"`](%1?14]&.PH@("`@("`@("`@("!R
M971U<FXH($Y53$P@*3L*("`@("`@("!<?0H*("`@("`@("`O*B!O:"!W96QL
M+B!I="!L;V]K<R!L:6ME(&$@<W1R:6YG+B`@<VYA9R!T;R!T:&4@;F5X="!W
M:&ET97-P86-E+B`J+PH*("`@("`@("!I9B`H8R`]/2`G7%PB)RD*("`@("`@
M("!<>PH@("`@("`@("`@("!D;W5B;&5Q=6]T97,@/2`Q.PH@("`@("`@("`@
M("!C(#T@9V5T86-H87(H*3L*("`@("`@("!<?0H*"B`@("`@("`@=VAI;&4@
M*#$I"B`@("`@("`@7'L*("`@("`@("`@("`@=&5M<%MP;W,K*UT@/2`H8VAA
M<BD@8SL*"B`@("`@("`@("`@(&EF("@A9&]U8FQE<75O=&5S*0H@("`@("`@
M("`@("!<>R`*("`@("`@("`@("`@("`@(&EF("@@("`@*&,@/3T@)RDG*0H@
M("`@("`@("`@("`@("`@("`@("!\?"`H8R`]/2`G*"<I"B`@("`@("`@("`@
M("`@("`@("`@('Q\("AC(#T]("<[)RD*("`@("`@("`@("`@("`@("`@("`@
M?'P@*&,@/3T@)R,G*0H@("`@("`@("`@("`@("`@("`@("!\?"`H8R`]/2`G
M("<I"B`@("`@("`@("`@("`@("`@("`@('Q\("AC(#T]("=<7&XG*0H@("`@
M("`@("`@("`@("`@("`@("!\?"`H8R`]/2`G7%QR)RD*("`@("`@("`@("`@
M("`@("`@("`@?'P@*&,@/3T@14]&*0H@("`@("`@("`@("`@("`@("`@*0H@
M("`@("`@("`@("`@("`@7'L*("`@("`@("`@("`@("`@("`@("!U;F=E=&%C
M:&%R*&,I.PH@("`@("`@("`@("`@("`@("`@('1E;7!;<&]S+3%=(#T@)UQ<
M,"<["@H@("`@("`@("`@("`@("`@("`@(&EF("@@(7-T<F-M<"AT96UP+"`B
M<75O=&4B*2`I"B`@("`@("`@("`@("`@("`@("`@7'L*("`@("`@("`@("`@
M("`@("`@("`@("`@*G1O:V5N:60@/2!47U%53U1%.PH@("`@("`@("`@("`@
M("`@("`@("`@("!R971U<FXH($Y53$P@*3L*("`@("`@("`@("`@("`@("`@
M("!<?0H@("`@("`@("`@("`@("`@("`@("IT;VME;FED(#T@5%]73U)$.PH@
M("`@("`@("`@("`@("`@("`@(')E='5R;B@@<W1R9'5P*'1E;7`I("D["B`@
M("`@("`@("`@("`@("!<?0H@("`@("`@("`@("!<?2!E;'-E(%Q["B`@("`@
M("`@("`@("`@("!S=VET8V@@*&,I"B`@("`@("`@("`@("`@("!<>PH@("`@
M("`@("`@("`@("`@8V%S92`H("=<7&XG("DZ"B`@("`@("`@("`@("`@("!C
M87-E("@@)UQ<<B<@*3H*("`@("`@("`@("`@("`@(&-A<V4@*"!%3T8@*3H*
M("`@("`@("`@("`@("`@("`@("!U;F=E=&%C:&%R*&,I.PH*("`@("`@("`@
M("`@("`@(&-A<V4@*"`G7%PB)R`I.@H@("`@("`@("`@("`@("`@("`@('1E
M;7!;<&]S+3%=(#T@)UQ<,"<["B`@("`@("`@("`@("`@("`@("`@*G1O:V5N
M:60@/2!47U=/4D0["B`@("`@("`@("`@("`@("`@("`@<F5T=7)N*"!S=')D
M=7`H=&5M<"D@*3L*("`@(`H@("`@("`@("`@("`@("`@7'T*("`@("`@("`@
M("`@7'T*"B`@("`@("`@("`@(&,@/2!G971A8VAA<B@I.PH@("`@("`@(%Q]
M"B`@("`@("`@<F5T=7)N*"!.54Q,("D["B`@("!<?0I<;G=U<V5D>UQ<>TY7
M<&%R.2UP87(X+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLQ-7U<;G=D
M;V-S<&%R"@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E"@I<;G=E;F1D;V-S>WU<;G=B96=I
M;F-O9&5[,39]7'-U8FQA8F5L>TY7<&%R.2UP87(X+3%]7&YW;6%R9VEN=&%G
M>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=P87(Y+7!A<C@M,7U]?5QM
M;V1D969[<&%R<V5R+F-^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5W!A
M<CDM<&%R."TQ?7U]7&5N9&UO9&1E9@HC:6YC;'5D92`B<&%R<V5R+F@B"B-I
M;F-L=61E(#QS=')I;F<N:#X*"EQ,07M]4&%R<V4@:6X@9FEL92!I;7!L96UE
M;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7<&%R.2U087)3
M+3%]?5Q207M]"EQ,07M]4&%R<V4@<VYA9R!A('1O:V5N(&EM<&QE;65N=&%T
M:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=P87(Y+5!A<E@M,7U]
M7%)!>WT*7&YW;F]T=7-E9'MP87)S97(N8WU<;G=E;F1C;V1E>WU<;G=B96=I
M;F1O8W-[,3=]7&YW9&]C<W!A<@H*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D
M97LQ.'U<<W5B;&%B96Q[3E=P87(Y+7!A<C@N,BTQ?5QN=VUA<F=I;G1A9WM[
M7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7<&%R.2UP87(X+C(M,7U]?5QM
M;V1D969[<&%R<V5R+FA^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5W!A
M<CDM<&%R."XR+3%]?7U<96YD;6]D9&5F"B-I;F-L=61E(#QS=&1I;RYH/@HC
M:6YC;'5D92`B;&ES=',N:"(*"EQ,07M]4&%R<V4@=&]K96X@96YU;7Y[7&YW
M=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7<&%R.2U087)'+3%]?5Q207M]"@I<
M3$%[?5!A<G-E(&=E="!C:&%R86-T97(@8V%L;&)A8VL@='EP961E9GY[7&YW
M=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7<&%R.2U087)A+3%]?5Q207M]"EQ,
M07M]4&%R<V4@=6YG970@8VAA<F%C=&5R(&-A;&QB86-K('1Y<&5D969^>UQN
M=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5W!A<CDM4&%R8RTQ?7U<4D%[?0H*
M7$Q!>WU087)S92!S;F%G(&$@=&]K96X@<')O=&]^>UQN=W1A9W-T>6QE>WU<
M<W5B<&%G97)E9GM.5W!A<CDM4&%R3RTQ?7U<4D%[?3L*7$Q!>WU087)S92!I
M;B!F:6QE('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=P87(Y
M+5!A<DHM,7U]7%)!>WT["EQN=VYO='5S961[<&%R<V5R+FA]7&YW96YD8V]D
M97M]7&YW8F5G:6YD;V-S>S$Y?5QN=V1O8W-P87(*7&YW96YD9&]C<WM]7&YW
M9FEL96YA;65[;&ES=',N;G=]7&YW8F5G:6YD;V-S>S!]7&YW96YD9&]C<WM]
M7&YW8F5G:6YD;V-S>S%]7&YW9&]C<W!A<@I<<V5C=&EO;GM,:7-T($UA;FEP
M=6QA=&EO;G-]"EQL86)E;'MS96,Z;&ES='-]"@I4:&4@:6YT97)N86P@<W1O
M<F%G92!S>7-T96T@=&AA="!W92=R92!U<VEN9R!F;W(@8F]T:"!P87)S960@
M:6X@3$E34`IT<F5E<RP@87,@=V5L;"!A<R!V87)I86)L97,L(&%N9"!U<V5R
M+61E9FEN960@9G5N8W1I;VYS(&%R92!A;&P@<W1O<F5D"G5S:6YG('1H92!S
M=')U8W1U<F5S(&%N9"!M96-H86YI<VUS(&-O;G1A:6YE9"!I;B!T:&ES('-E
M8W1I;VXN"@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E"EQS=6)S96-T:6]N('M3=')U8W1U
M<F5]"EQL86)E;'MS96,Z<W1R=6-T=7)E?0H*5&AI<R!I<R!T:&4@8F%S:6,L
M(&UU;'1I<'5R<&]S92!S=')U8W1U<F4@=&AA="!W92!A<F4@=7-I;F<@:6X@
M=&AI<R`*<')O:F5C="X@(`H*268@9F]R(&5X86UP;&4@=&AI<R!N;V1E(&ES
M(&$@;&ES="!O9B!O=&AE<B!I=&5M<RP@=&AE;B!T:&4@>UQT='M]8G)A;F-H
M?0II=&5M('=I;&P@8F4@82!P;VEN=&5R+B`@268@:70@:7,@86X@871O;2!O
M9B!D871A+"!T:&5N('1H92![7'1T>WUD871A?0II=&5M('=I;&P@8F4@82!P
M;VEN=&5R+B`@26X@=&AE(&-A<V4@;V8@=&AE('9A<FEA8FQE(&QI<W0L('1H
M96X@8F]T:"!O9@IT:&5S92!I=&5M<R!A<F4@=7-E9"X*"DEF('1H92!D871A
M(&]R(&ET96T@:7,@<75O=&5D+"!T:&5N('1H92![7'1T>WUQ=6]T961](&9L
M86<@<VAO=6QD(&)E('-E=`IT;R![7'1T>WTQ?2X*"E1H92![7'1T>WUT86=]
M(&9I96QD(&ES('5S960@97AC;'5S:79E;'D@9F]R('1H92!T86=G:6YG(&9U
M;F-T:6]N<RP@=VAE;B!A"G1R964@:7,@=&\@8F4@;6%R:V5D('5P(&EN('-O
M;64@=V%Y(&9O<B!F=71U<F4@<')O8V5S<VEN9RX*"E1H:7,@<W1R=6-T=7)E
M(&-R96%T97,@9&]U8FQY+6QI;FME9"!L:7-T+"!A;'1H;W5G:"!T:&5R92!I
M<R!N;W1H:6YG"F-U<G)E;G1L>2!T:&%T(')E<75I<F5S('1H:7,N+BX@=&AA
M="!I<R!T;R!S87D@=&AA="!T:&4@>UQT='M];&ES='M<8VAA<CDU?7!R979]
M"G)E9F5R96YC97,@:6X@=&AI<R!P<F]J96-T(&-A;B!P<F]B86)L>2!B92!R
M96UO=F5D('=I=&@@;F\@:&%R;2!D;VYE+@H*5&AE('M<='1[?6QI<W1[7&-H
M87(Y-7UN97AT?2!P;VEN=',@=&\@=&AE(&YE>'0@>UQT='M];&5]('-T<G5C
M='5R92!O;B!T:&4@<V%M92!L979E;`IO9B!N97-T:6YG(&%S('1H92!C=7)R
M96YT(&]N92X*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LR?5QS=6)L86)E
M;'M.5VQI<S@M3&ES12TQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS
M=6)P86=E<F5F>TY7;&ES."U,:7-%+3%]?7U<;6]D9&5F>TQI<W0@4W1R=6-T
M=7)E?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<T4M,7U]
M?5QE;F1M;V1D968*("`@('1Y<&5D968@<W1R=6-T(&QE7'L*("`@("`@("`O
M*B!E:71H97(@9&%T82!O<B!A(&)R86YC:"`J+PH@("`@("`@('-T<G5C="!L
M92`J(&)R86YC:#L*("`@("`@("!C:&%R("H@9&%T83L*("`@("`@("!I;G0@
M<75O=&5D.PH@("`@("`@(&EN="!T86<["@H@("`@("`@("\J(&9O<B!T:&4@
M;F5X="!I;B!T:&4@;&ES="!I;B!T:&4@8W5R<F5N="!P87)E;FQE=F5L("HO
M"B`@("`@("`@<W1R=6-T(&QE("H@;&ES=%]P<F5V.PH@("`@("`@('-T<G5C
M="!L92`J(&QI<W1?;F5X=#L*("`@(%Q](&QE.PI<;G=U<V5D>UQ<>TY7;&ES
M."UL:7,W+C(M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S-]7&YW9&]C
M<W!A<@H*"B4E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<V5C=&EO;B![0W)E871I;VX@
M86YD($1E<W1R=6-T:6]N?0I<;&%B96Q[<V5C.F-R96%T961E<W1R;WE]"@I7
M92!N965D('=A>7,@=&\@8W)E871E(&%N9"!D97-T<F]Y('1H97-E('-T<G5C
M='5R97,L(&%N9"!T:&%T(&ES(&1O;F4*:&5R92!W:71H('1H92!F;VQL;W=I
M;F<@9G5N8W1I;VYS.@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M"EQS=6)S=6)S96-T:6]N('ML94YE=WT*"E1H:7,@8W)E871E<R!A(&YE=R![
M7'1T>WUL97T@<W1R=6-T=7)E('=I=&@@=&AE('!A<W-E9"!I;B![7'1T>WUT
M97AT?2!A<R!T:&4*9&%T82!S=')I;F<N("!)9B!N;R![7'1T>WUT97AT?2!I
M<R!P87-S960@:6XL('1H96X@82!.54Q,('!O:6YT97(@:7,@<V5T"F9O<B!I
M="X@(%1H92!E;&5M96YT<R!O9B!T:&ES(&YE=R!I=&5M(&%R92!I;FET:6%L
M:7IE9"!T;R!S;VUE=&AI;F<*<V%N92X*"EQN=V5N9&1O8W-[?5QN=V)E9VEN
M8V]D97LT?5QS=6)L86)E;'M.5VQI<S@M3&ES12XR+3%]7&YW;6%R9VEN=&%G
M>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<T4N,BTQ?7U]
M7&UO9&1E9GM,:7-T(&YE=R!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E
M<F5F>TY7;&ES."U,:7-%+C(M,7U]?5QE;F1M;V1D968*("`@(&QE("H@;&5.
M97<H8VAA<B`J('1E>'0I"EQN=W5S961[7%Q[3E=L:7,X+4QI<TXM,7U<7'M.
M5VQI<S@M;&ES-RXR+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLU?5QN
M=V1O8W-P87(*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LV?5QS=6)L86)E
M;'M.5VQI<S@M3&ES3BTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS
M=6)P86=E<F5F>TY7;&ES."U,:7-.+3%]?7U<;6]D9&5F>TQI<W0@;F5W(&EM
M<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X
M+4QI<TXM,7U]?5QE;F1M;V1D968*("`@(%Q,07M]3&ES="!N97<@<')O=&]^
M>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VQI<S@M3&ES12XR+3%]?5Q2
M07M]"B`@("!<>PH@("`@("`@(&QE("H@;F5W(#T@*&QE("HI(&UA;&QO8R`H
M<VEZ96]F*&QE*2D["B`@("`@("`@:68@*&YE=RD*("`@("`@("!<>PH@("`@
M("`@("`@("!N97<M/F)R86YC:"`]($Y53$P["B`@("`@("`@("`@(&YE=RT^
M9&%T82`]("AT97AT*3]S=')D=7`H=&5X="DZ3E5,3#L*("`@("`@("`@("`@
M;F5W+3YQ=6]T960@/2`P.PH@("`@("`@("`@("!N97<M/G1A9R`]("TQ.PH@
M("`@("`@("`@("!N97<M/FQI<W1?<')E=B`]($Y53$P["B`@("`@("`@("`@
M(&YE=RT^;&ES=%]N97AT(#T@3E5,3#L*("`@("`@("!<?0H@("`@("`@(')E
M='5R;B@@;F5W("D["B`@("!<?0I<;G=U<V5D>UQ<>TY7;&ES."UL:7,W+3%]
M?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLW?5QN=V1O8W-P87(*"@HE)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24*7'-U8G-U8G-E8W1I;VX@>VQE
M1&5L971E?0H*5&\@9&5L971E(&%N(&5L96UE;G0L(&%L;"!T:&%T('=E(&YE
M960@=&\@9&\@:7,@=&\@9G)E92!T:&4@9&%T80IP;VEN=&5D('1O(&EN('1H
M92!E;&5M96YT+"!A;F0@=&AE;B!F<F5E(&ET<V5L9BX*"E1H92![7'1T>WUB
M<F%N8VA](&%N9"![7'1T>WUL:7-T>UQC:&%R.35]<')E=GT@;V8@=&AE(&ET
M96US(&%R;W5N9"!T:&ES('=I;&P@96ET:&5R"F)E(&EN=F%L:60@;W(@=6YR
M96%C:&%B;&4@869T97(@=&AI<R!I<R!C86QL960N("!4:&ES(&ES(')E86QL
M>2!O;FQY"G5S969U;"!F;W(@9&5L971I;F<@:VYO=VX@871O;7,N"@I<;G=E
M;F1D;V-S>WU<;G=B96=I;F-O9&5[.'U<<W5B;&%B96Q[3E=L:7,X+4QI<T@M
M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VQI
M<S@M3&ES2"TQ?7U]7&UO9&1E9GM,:7-T(&1E;&5T92!P<F]T;WY[7&YW=&%G
M<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES."U,:7-(+3%]?7U<96YD;6]D9&5F
M"B`@("!V;VED(&QE1&5L971E*&QE("H@96QE;65N="D*7&YW=7-E9'M<7'M.
M5VQI<S@M3&ES42TQ?5Q<>TY7;&ES."UL:7,W+C(M,7U]7&YW96YD8V]D97M]
M7&YW8F5G:6YD;V-S>SE]7&YW9&]C<W!A<@H*7&YW96YD9&]C<WM]7&YW8F5G
M:6YC;V1E>S$P?5QS=6)L86)E;'M.5VQI<S@M3&ES42TQ?5QN=VUA<F=I;G1A
M9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES."U,:7-1+3%]?7U<
M;6]D9&5F>TQI<W0@9&5L971E(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL
M97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<U$M,7U]?5QE;F1M;V1D968*("`@
M(%Q,07M]3&ES="!D96QE=&4@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G
M97)E9GM.5VQI<S@M3&ES2"TQ?7U<4D%[?0H@("`@7'L*("`@("`@("!I9B`H
M96QE;65N="D*("`@("`@("!<>PH@("`@("`@("`@("!I9B`H96QE;65N="T^
M9&%T82D@9G)E92@@96QE;65N="T^9&%T82`I.PH@("`@("`@("`@("!F<F5E
M*&5L96UE;G0I.PH@("`@("`@(%Q]"B`@("!<?0I<;G=U<V5D>UQ<>TY7;&ES
M."UL:7,W+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLQ,7U<;G=D;V-S
M<&%R"@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E"EQS=6)S=6)S
M96-T:6]N('ML95=I<&5]"@I4;R!D96QE=&4@86X@96YT:7)E(&QI<W0L('=E
M('=I;&P@<F5C=7)S:79E;'D@8V%L;"!T:&ES(&9U;F-T:6]N('1O"F1E;&5T
M92!A;&P@;V8@=&AE('M<='1[?6)R86YC:'UE<RP@86YD('M<='1[?6YE>'1]
M(&5L96UE;G1S(&EN('1U<FXN("!4:&ES(&ES"F$@<&]S="UO<F1E<B!I=&5R
M871O<B!S;R!T:&%T('!O:6YT97)S(&1O;B=T(&=E="!M=6YG960@87,@=V4@
M=')Y('1O"G1R879E<G-E('1H92!T<F5E+B`@5V4@=VEL;"!F<F5E(&]U<G-E
M;&8@869T97(@86QL(&]F(&]U<B!D97-C96YD86YT<PIH879E(&)E96X@9G)E
M960N"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,3)]7'-U8FQA8F5L>TY7
M;&ES."U,:7-&+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A
M9V5R969[3E=L:7,X+4QI<T8M,7U]?5QM;V1D969[3&ES="!W:7!E('!R;W1O
M?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<T8M,7U]?5QE
M;F1M;V1D968*("`@('9O:60@;&57:7!E*&QE("H@;&ES="D*7&YW=7-E9'M<
M7'M.5VQI<S@M3&ES3RTQ?5Q<>TY7;&ES."UL:7,W+C(M,7U]7&YW96YD8V]D
M97M]7&YW8F5G:6YD;V-S>S$S?5QN=V1O8W-P87(*"EQN=V5N9&1O8W-[?5QN
M=V)E9VEN8V]D97LQ-'U<<W5B;&%B96Q[3E=L:7,X+4QI<T\M,7U<;G=M87)G
M:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VQI<S@M3&ES3RTQ
M?7U]7&UO9&1E9GM,:7-T('=I<&4@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T
M>6QE>WU<<W5B<&%G97)E9GM.5VQI<S@M3&ES3RTQ?7U]7&5N9&UO9&1E9@H@
M("`@7$Q!>WU,:7-T('=I<&4@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G
M97)E9GM.5VQI<S@M3&ES1BTQ?7U<4D%[?0H@("`@7'L*("`@("`@("!I9B`H
M;&ES="D*("`@("`@("!<>PH@("`@("`@("`@("`O*B!F<F5E(&1E<V-E;F1A
M;G1S("HO"B`@("`@("`@("`@(&QE5VEP92AL:7-T+3YB<F%N8V@I.PH@("`@
M("`@("`@("!L95=I<&4H;&ES="T^;&ES=%]N97AT*3L*"B`@("`@("`@("`@
M("\J(&9R964@;W5R<V5L9B`J+PH@("`@("`@("`@("!I9B`H;&ES="T^9&%T
M82D@9G)E92@@;&ES="T^9&%T82`I.PH@("`@("`@("`@("!F<F5E*"!L:7-T
M("D["B`@("`@("`@7'T*("`@(%Q]"EQN=W5S961[7%Q[3E=L:7,X+6QI<S<M
M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S$U?5QN=V1O8W-P87(*"@H*
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E"EQS=6)S96-T:6]N('M"87-I8R!,:7-T($UA;FEP
M<WT*7&QA8F5L>W-E8SIB87-I8VQI<W1M86YI<'-]"@I4:&4@;&%S="!T:&EN
M9R!W92!N965D(&%R92!A(&9E=R!F=6YC=&EO;G,@=&\@861D('1H:6YG<R!O
M;G1O('1H92!L:7-T(&9O<@IC86QL97)S(&]U='-I9&4@;V8@=&AI<R!S96-T
M:6]N+@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E"EQS=6)S=6)S
M96-T:6]N('ML94%D9$AE861]"@I4:&ES('=I;&P@861D(&$@;F5W('M<='1[
M?65L96UE;G1](&]N=&\@=&AE(&AE860@;V8@=&AE(&QI<W0N"@I4:&ES('-I
M;7!L>2!T86ME<R!T:&4@;F5W('M<='1[?65L96UE;G1]+"!A<'!E;F1S('1H
M92!C=7)R96YT('M<='1[?6QI<W1]"F]N=&\@:71S('M<='1[?6QI<W1[7&-H
M87(Y-7UN97AT?2!I=&5M+"!P871C:&5S('1H92![7'1T>WUL:7-T?2=S('M<
M='1[?6QI<W1[7&-H87(Y-7UP<F5V?2!T;PIP;VEN="!T;R!T:&4@96QE;65N
M="P@=&AE;B!R971U<FX@=&AE(&5L96UE;G0N("!)="=S(&IU<W0@82!S:6UP
M;&4*:6YS97)T:6]N('1O('1H92!B96=I;FYI;F<@;V8@=&AE(&QI<W0N"@I<
M;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,39]7'-U8FQA8F5L>TY7;&ES."U,
M:7-*+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=L:7,X+4QI<THM,7U]?5QM;V1D969[3&ES="!A9&0@:&5A9"!P<F]T;WY[
M7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES."U,:7-*+3%]?7U<96YD
M;6]D9&5F"B`@("!L92`J(&QE061D2&5A9"AL92`J(&QI<W0L(&QE("H@96QE
M;65N="D*7&YW=7-E9'M<7'M.5VQI<S@M3&ES4RTQ?5Q<>TY7;&ES."UL:7,W
M+C(M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S$W?5QN=V1O8W-P87(*
M"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LQ.'U<<W5B;&%B96Q[3E=L:7,X
M+4QI<U,M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5VQI<S@M3&ES4RTQ?7U]7&UO9&1E9GM,:7-T(&%D9"!H96%D(&EM<&QE
M;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI
M<U,M,7U]?5QE;F1M;V1D968*("`@(%Q,07M]3&ES="!A9&0@:&5A9"!P<F]T
M;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES."U,:7-*+3%]?5Q2
M07M]"B`@("!<>PH@("`@("`@(&EF("@A96QE;65N="D@(')E='5R;B@@;&ES
M="`I.PH*("`@("`@("!E;&5M96YT+3YL:7-T7VYE>'0@/2!L:7-T.PH@("`@
M("`@(&EF("AL:7-T*2!L:7-T+3YL:7-T7W!R978@/2!E;&5M96YT.PH@("`@
M("`@(')E='5R;B@@96QE;65N="`I.PH@("`@7'T*7&YW=7-E9'M<7'M.5VQI
M<S@M;&ES-RTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[,3E]7&YW9&]C
M<W!A<@H*"B4E)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<W5B
M<V5C=&EO;B![;&5!9&1486EL?0H*5&AI<R!W:6QL(&%D9"!A(&YE=R![7'1T
M>WUE;&5M96YT?2!O;G1O('1H92!E;F0@;V8@=&AE(&QI<W0N"@I792!W:6QL
M('-I;7!L>2!G;R!T;R!T:&4@96YD(&]F('1H92![7'1T>WUL:7-T?2`H:68@
M:70@97AI<W1S*2!T:&5N('1A8VL*;W5R<V5L=F5S(&]N+"!M;V1I9GEI;F<@
M=&AE('M<='1[?6QI<W1[7&-H87(Y-7UP<F5V?2!O9B!T:&4@>UQT='M]96QE
M;65N='TL(&%S('=E;&P*87,@=&AE('M<='1[?6QI<W1[7&-H87(Y-7UN97AT
M?2!O9B!T:&4@96YD(&]F('1H92!L:7-T+B`@5&AE;B!W92!R971U<FX@=&AE
M(&YE=PIL:7-T(&%N9"!W92=R92!A;&P@9V]O9"X*"EQN=V5N9&1O8W-[?5QN
M=V)E9VEN8V]D97LR,'U<<W5B;&%B96Q[3E=L:7,X+4QI<THN,BTQ?5QN=VUA
M<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES."U,:7-*
M+C(M,7U]?5QM;V1D969[3&ES="!A9&0@=&%I;"!P<F]T;WY[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7;&ES."U,:7-*+C(M,7U]?5QE;F1M;V1D968*
M("`@(&QE("H@;&5!9&1486EL*&QE("H@;&ES="P@;&4@*B!E;&5M96YT*0I<
M;G=U<V5D>UQ<>TY7;&ES."U,:7-3+C(M,7U<7'M.5VQI<S@M;&ES-RXR+3%]
M?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLR,7U<;G=D;V-S<&%R"@I<;G=E
M;F1D;V-S>WU<;G=B96=I;F-O9&5[,C)]7'-U8FQA8F5L>TY7;&ES."U,:7-3
M+C(M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.
M5VQI<S@M3&ES4RXR+3%]?7U<;6]D9&5F>TQI<W0@861D('1A:6P@:6UP;&5M
M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VQI<S@M3&ES
M4RXR+3%]?7U<96YD;6]D9&5F"B`@("!<3$%[?4QI<W0@861D('1A:6P@<')O
M=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VQI<S@M3&ES2BXR+3%]
M?5Q207M]"B`@("!<>PH@("`@("`@(&QE("H@=&5M<"`](&QI<W0["@H@("`@
M("`@("\J(&EF(&YE:71H97(@96QE;65N="!O<B!L:7-T(&1O;B=T(`H@("`@
M("`@("`@(&5X:7-T(')E='5R;B!T:&4@)VYE=R<@;&ES="`J+PH@("`@("`@
M(&EF("@A96QE;65N="D@<F5T=7)N*"!L:7-T("D["B`@("`@("`@:68@*"%L
M:7-T*2`@<F5T=7)N*"!E;&5M96YT("D["@H@("`@("`@("\J(&9I;F0@=&AE
M(&5N9"!E;&5M96YT(&]F('1H92!L:7-T("HO"B`@("`@("`@=VAI;&4@*'1E
M;7`M/FQI<W1?;F5X="D*("`@("`@("!<>PH@("`@("`@("`@("!T96UP(#T@
M=&5M<"T^;&ES=%]N97AT.PH@("`@("`@(%Q]"@H@("`@("`@("\J('1A8VL@
M;W5R<V5L=F5S(&]N("HO"B`@("`@("`@=&5M<"T^;&ES=%]N97AT(#T@96QE
M;65N=#L*("`@("`@("!E;&5M96YT+3YL:7-T7W!R978@/2!T96UP.PH*("`@
M("`@("`O*B!R971U<FX@=&AE(&QI<W0@*B\*("`@("`@("!R971U<FXH(&QI
M<W0@*3L*("`@(%Q]"EQN=W5S961[7%Q[3E=L:7,X+6QI<S<M,7U]7&YW96YD
M8V]D97M]7&YW8F5G:6YD;V-S>S(S?5QN=V1O8W-P87(*"@HE)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24*7'-U8G-E8W1I;VX@>T1E<FEV960@3&ES="!-86YI<'-]"EQL86)E
M;'MS96,Z9&5R:79E9&QI<W1M86YI<'-]"@I!;F0@9F]R(&5A<V4@;V8@=7-E
M+"!W92!H879E('1H92!F;VQL;W=I;F<@9G5N8W1I;VYS+"!W:&EC:"!U<V4@
M=&AE"F%B;W9E+@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E"EQS
M=6)S=6)S96-T:6]N('ML94%D9$)R86YC:$5L96UE;G1]"@I4:&ES('=I;&P@
M861D(&]N(&$@;F5W(&5L96UE;G0@;VYT;R!T:&4@96YD(&]F('1H92![7'1T
M>WUL:7-T?2!P87-S960@:6XL"F-O;G1A:6YI;F<@=&AE('M<='1[?6)R86YC
M:'T@<&%S<V5D(&EN+"!W:71H(&ET<R![7'1T>WUQ=6]T961](&9L86<@<V5T
M"F%P<')O<')I871E;'DN"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,C1]
M7'-U8FQA8F5L>TY7;&ES."U,:7-,+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S
M='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<TPM,7U]?5QM;V1D969[3&ES
M="!A9&0@8G)A;F-H('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=L:7,X+4QI<TPM,7U]?5QE;F1M;V1D968*("`@(&QE("H@;&5!9&1"<F%N
M8VA%;&5M96YT*"!L92`J(&QI<W0L(&QE("H@8G)A;F-H+"!I;G0@<75O=&5D
M("D*7&YW=7-E9'M<7'M.5VQI<S@M3&ES52TQ?5Q<>TY7;&ES."UL:7,W+C(M
M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S(U?5QN=V1O8W-P87(*"EQN
M=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LR-GU<<W5B;&%B96Q[3E=L:7,X+4QI
M<U4M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.
M5VQI<S@M3&ES52TQ?7U]7&UO9&1E9GM,:7-T(&%D9"!B<F%N8V@@:6UP;&5M
M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VQI<S@M3&ES
M52TQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU,:7-T(&%D9"!B<F%N8V@@<')O
M=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VQI<S@M3&ES3"TQ?7U<
M4D%[?0H@("`@7'L*("`@("`@("!L92`J('1E;7`@/2!L94YE=RA.54Q,*3L*
M("`@("`@("!T96UP+3YB<F%N8V@@/2!B<F%N8V@["B`@("`@("`@=&5M<"T^
M<75O=&5D(#T@<75O=&5D.PH@("`@("`@(')E='5R;B!L94%D9%1A:6PH;&ES
M="P@=&5M<"D["B`@("!<?0I<;G=U<V5D>UQ<>TY7;&ES."UL:7,W+3%]?5QN
M=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLR-WU<;G=D;V-S<&%R"@H*)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E"EQS=6)S=6)S96-T:6]N('ML94%D
M9$1A=&%%;&5M96YT?0H*5&AI<R!W:6QL(&%D9"!O;B!A(&YE=R!E;&5M96YT
M(&]N=&\@=&AE(&5N9"!O9B!T:&4@>UQT='M];&ES='T@<&%S<V5D(&EN+`IC
M;VYT86EN:6YG('1H92![7'1T>WUD871A?2!P87-S960@:6XL('=I=&@@:71S
M('M<='1[?7%U;W1E9'T@9FQA9R!S970*87!P<F]P<FEA=&5L>2X*"EQN=V5N
M9&1O8W-[?5QN=V)E9VEN8V]D97LR.'U<<W5B;&%B96Q[3E=L:7,X+4QI<THN
M,RTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7
M;&ES."U,:7-*+C,M,7U]?5QM;V1D969[3&ES="!A9&0@9&%T82!P<F]T;WY[
M7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES."U,:7-*+C,M,7U]?5QE
M;F1M;V1D968*("`@(&QE("H@;&5!9&1$871A16QE;65N="@@;&4@*B!L:7-T
M+"!C:&%R("H@9&%T82P@:6YT('%U;W1E9"`I"EQN=W5S961[7%Q[3E=L:7,X
M+4QI<U,N,RTQ?5Q<>TY7;&ES."UL:7,W+C(M,7U]7&YW96YD8V]D97M]7&YW
M8F5G:6YD;V-S>S(Y?5QN=V1O8W-P87(*"EQN=V5N9&1O8W-[?5QN=V)E9VEN
M8V]D97LS,'U<<W5B;&%B96Q[3E=L:7,X+4QI<U,N,RTQ?5QN=VUA<F=I;G1A
M9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES."U,:7-3+C,M,7U]
M?5QM;V1D969[3&ES="!A9&0@9&%T82!I;7!L96UE;G1A=&EO;GY[7&YW=&%G
M<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES."U,:7-3+C,M,7U]?5QE;F1M;V1D
M968*("`@(%Q,07M]3&ES="!A9&0@9&%T82!P<F]T;WY[7&YW=&%G<W1Y;&5[
M?5QS=6)P86=E<F5F>TY7;&ES."U,:7-*+C,M,7U]7%)!>WT*("`@(%Q["B`@
M("`@("`@;&4@*B!N97=D871A(#T@;&5.97<H9&%T82D["B`@("`@("`@:68@
M*&YE=V1A=&$I"B`@("`@("`@7'L*("`@("`@("`@("`@;F5W9&%T82T^<75O
M=&5D(#T@<75O=&5D.PH@("`@("`@("`@("!R971U<FX@;&5!9&1486EL*&QI
M<W0L(&YE=V1A=&$I.PH@("`@("`@(%Q]"B`@("!<?0I<;G=U<V5D>UQ<>TY7
M;&ES."UL:7,W+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLS,7U<;G=D
M;V-S<&%R"@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E"EQS=6)S
M=6)S96-T:6]N('ML941U<'T*"E1H97)E(&%R92!S;VUE(&-A<V5S('=H97)E
M('=E('=A;G0@=&\@9'5P;&EC871E(&%N('M<='1[?6QE?2!T<F5E+B`@5&AI
M<R`*9G5N8W1I;VX@9&]E<R!E>&%C=&QY('1H870N"@I)="!S:6UP;'D@:71E
M<F%T97,@;W9E<B!T:&4@8W5R<F5N="!L:7-T+"!R96-U<G-I;F<@9&]W;B!F
M;W(@8G)A;F-H97,L"F1U<&QI8V%T:6YG('1H92![7'1T>WUL:7-T?2!P87-S
M960@:6XN("!)="!R971U<FYS('1H92!D=7!L:6-A=&5D('1R964N"@I<;G=E
M;F1D;V-S>WU<;G=B96=I;F-O9&5[,S)]7'-U8FQA8F5L>TY7;&ES."U,:7-%
M+C,M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.
M5VQI<S@M3&ES12XS+3%]?7U<;6]D9&5F>TQI<W0@9'5P('!R;W1O?GM<;G=T
M86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<T4N,RTQ?7U]7&5N9&UO
M9&1E9@H@("`@;&4@*B!L941U<"@@;&4@*B!L:7-T("D*7&YW=7-E9'M<7'M.
M5VQI<S@M3&ES3BXR+3%]7%Q[3E=L:7,X+6QI<S<N,BTQ?7U<;G=E;F1C;V1E
M>WU<;G=B96=I;F1O8W-[,S-]7&YW9&]C<W!A<@H*7&YW96YD9&]C<WM]7&YW
M8F5G:6YC;V1E>S,T?5QS=6)L86)E;'M.5VQI<S@M3&ES3BXR+3%]7&YW;6%R
M9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<TXN
M,BTQ?7U]7&UO9&1E9GM,:7-T(&1U<"!I;7!L96UE;G1A=&EO;GY[7&YW=&%G
M<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES."U,:7-.+C(M,7U]?5QE;F1M;V1D
M968*("`@(%Q,07M]3&ES="!D=7`@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B
M<&%G97)E9GM.5VQI<S@M3&ES12XS+3%]?5Q207M]"B`@("!<>PH@("`@("`@
M(&QE("H@=&5M<#L*("`@("`@("!I9B`H(6QI<W0I(')E='5R;B@@3E5,3"`I
M.PH*("`@("`@("`*("`@("`@("!T96UP(#T@;&5.97<H;&ES="T^9&%T82D[
M"B`@("`@("`@=&5M<"T^8G)A;F-H(#T@;&5$=7`H;&ES="T^8G)A;F-H*3L*
M("`@("`@("!T96UP+3YL:7-T7VYE>'0@/2!L941U<"AL:7-T+3YL:7-T7VYE
M>'0I.PH*("`@("`@("!I9B`H=&5M<"T^;&ES=%]N97AT*0H@("`@("`@(%Q[
M"B`@("`@("`@("`@('1E;7`M/FQI<W1?;F5X="T^;&ES=%]P<F5V(#T@=&5M
M<#L*("`@("`@("!<?0H*("`@("`@("!R971U<FXH('1E;7`@*3L*("`@(%Q]
M"EQN=W5S961[7%Q[3E=L:7,X+6QI<S<M,7U]7&YW96YD8V]D97M]7&YW8F5G
M:6YD;V-S>S,U?5QN=V1O8W-P87(*"B4E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<V5C
M=&EO;B![3&ES="!486=G:6YG?0H*1F]R('-E87)C:"!A;F0@<F5P;&%C92!O
M9B!I=&5M<R!I;B!A('1R964@*&9O<B!T:&4@:6UP;&5M96YT871I;VX*;V8@
M=&AE(&!@9&5F=6XG)R!E=F%L=6%T;W(@9F]R(&5X86UP;&4I('=E(&YE960@
M82!W87D@=&\@=&%G(`IE;&5M96YT<R!I;B!A('1R964L(&%N9"!W;W)K(&)A
M<V5D(&]N('1H97-E('1A9W,N("!4:&4@9F]L;&]W:6YG"F9U;F-T:6]N<R!A
M8V-O;7!L:7-H('1H:7,N"@HE)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24*7'-U8G-U8G-E8W1I;VX@>VQE0VQE87)486=]"@I3970@86QL(&]F('1H
M92!T86=S(&EN(&$@;&ES="!T;R`M,2X*"EQN=V5N9&1O8W-[?5QN=V)E9VEN
M8V]D97LS-GU<<W5B;&%B96Q[3E=L:7,X+4QI<TLM,7U<;G=M87)G:6YT86=[
M>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VQI<S@M3&ES2RTQ?7U]7&UO
M9&1E9GM,:7-T('1A9R!C;&5A<B!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P
M86=E<F5F>TY7;&ES."U,:7-++3%]?7U<96YD;6]D9&5F"B`@("!V;VED(&QE
M0VQE87)486<H(&QE("H@;&ES="`I"EQN=W5S961[7%Q[3E=L:7,X+4QI<U0M
M,7U<7'M.5VQI<S@M;&ES-RXR+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C
M<WLS-WU<;G=D;V-S<&%R"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,SA]
M7'-U8FQA8F5L>TY7;&ES."U,:7-4+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S
M='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<U0M,7U]?5QM;V1D969[3&ES
M="!T86<@8VQE87(@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B
M<&%G97)E9GM.5VQI<S@M3&ES5"TQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU,
M:7-T('1A9R!C;&5A<B!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F
M>TY7;&ES."U,:7-++3%]?5Q207M]"B`@("!<>PH@("`@("`@(&EF("@A;&ES
M="D@<F5T=7)N.PH@("`@("`@(&QI<W0M/G1A9R`]("TQ.PH@("`@("`@(&QE
M0VQE87)486<H(&QI<W0M/F)R86YC:"`I.PH@("`@("`@(&QE0VQE87)486<H
M(&QI<W0M/FQI<W1?;F5X="`I.PH@("`@7'T*7&YW=7-E9'M<7'M.5VQI<S@M
M;&ES-RTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[,SE]7&YW9&]C<W!A
M<@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E"EQS=6)S=6)S96-T
M:6]N('ML951A9T1A=&%]"@I3971S(&%L;"!D871A('1H870@;6%T8VAE<R![
M7'1T>WUD871A?2!W:71H('1H92!T86<@;G5M8F5R960@>UQT='M]=&%G=F%L
M?2X*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LT,'U<<W5B;&%B96Q[3E=L
M:7,X+4QI<THN-"TQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P
M86=E<F5F>TY7;&ES."U,:7-*+C0M,7U]?5QM;V1D969[3&ES="!T86<@9&%T
M82!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES."U,:7-*
M+C0M,7U]?5QE;F1M;V1D968*("`@('9O:60@;&5486=$871A*&QE("H@;&ES
M="P@8VAA<B`J(&1A=&$L(&EN="!T86=V86PI"EQN=W5S961[7%Q[3E=L:7,X
M+4QI<U,N-"TQ?5Q<>TY7;&ES."UL:7,W+C(M,7U]7&YW96YD8V]D97M]7&YW
M8F5G:6YD;V-S>S0Q?5QN=V1O8W-P87(*7&YW96YD9&]C<WM]7&YW8F5G:6YC
M;V1E>S0R?5QS=6)L86)E;'M.5VQI<S@M3&ES4RXT+3%]7&YW;6%R9VEN=&%G
M>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<U,N-"TQ?7U]
M7&UO9&1E9GM,:7-T('1A9R!D871A(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S
M='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<U,N-"TQ?7U]7&5N9&UO9&1E
M9@H@("`@7$Q!>WU,:7-T('1A9R!D871A('!R;W1O?GM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=L:7,X+4QI<THN-"TQ?7U<4D%[?0H@("`@7'L*("`@
M("`@("!I9B`H(61A=&$@?'P@(6QI<W0I(')E='5R;CL*"B`@("`@("`@=VAI
M;&4@*&QI<W0I"B`@("`@("`@7'L*("`@("`@("`@("`@:68H(&QI<W0M/F1A
M=&$@*0H@("`@("`@("`@("!<>PH@("`@("`@("`@("`@("`@:68@*"%S=')C
M;7`H(&QI<W0M/F1A=&$L(&1A=&$@*2D*("`@("`@("`@("`@("`@(%Q["B`@
M("`@("`@("`@("`@("`@("`@;&ES="T^=&%G(#T@=&%G=F%L.PH@("`@("`@
M("`@("`@("`@7'T*("`@("`@("`@("`@7'T*("`@("`@("`@("`@;&5486=$
M871A*"!L:7-T+3YB<F%N8V@L(&1A=&$L('1A9W9A;"`I.PH*("`@("`@("`@
M("`@;&ES="`](&QI<W0M/FQI<W1?;F5X=#L*("`@("`@("!<?0H@("`@7'T*
M7&YW=7-E9'M<7'M.5VQI<S@M;&ES-RTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I
M;F1O8W-[-#-]7&YW9&]C<W!A<@H*"B4E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)0I<<W5B<W5B<V5C=&EO;B![;&5486=297!L86-E?0H*4V5T<R!A
M;&P@;F]D97,@=VAO<V4@=&%G(&UA=&-H97,@>UQT='M]=&%G=F%L?2!A;F0@
M<F5P;&%C97,@=&AE(&1A=&$O8G)A;F-H(`IW:71H('1H92!D871A+V)R86YC
M:"!I;F9O<FUA=&EO;B!F<F]M('M<='1[?6YE=VEN9F]]+@H*7&YW96YD9&]C
M<WM]7&YW8F5G:6YC;V1E>S0T?5QS=6)L86)E;'M.5VQI<S@M3&ES32TQ?5QN
M=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES."U,
M:7--+3%]?7U<;6]D9&5F>TQI<W0@=&%G(')E<&QA8V4@<')O=&]^>UQN=W1A
M9W-T>6QE>WU<<W5B<&%G97)E9GM.5VQI<S@M3&ES32TQ?7U]7&5N9&UO9&1E
M9@H@("`@=F]I9"!L951A9U)E<&QA8V4H;&4@*B!L:7-T+"!I;G0@=&%G=F%L
M+"!L92`J(&YE=VEN9F\I"EQN=W5S961[7%Q[3E=L:7,X+4QI<U8M,7U<7'M.
M5VQI<S@M;&ES-RXR+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLT-7U<
M;G=D;V-S<&%R"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LT-GU<<W5B;&%B
M96Q[3E=L:7,X+4QI<U8M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<
M<W5B<&%G97)E9GM.5VQI<S@M3&ES5BTQ?7U]7&UO9&1E9GM,:7-T('1A9R!R
M97!L86-E(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R
M969[3E=L:7,X+4QI<U8M,7U]?5QE;F1M;V1D968*("`@(%Q,07M]3&ES="!T
M86<@<F5P;&%C92!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7
M;&ES."U,:7--+3%]?5Q207M]"B`@("!<>PH@("`@("`@(&EF("@A;&ES="!\
M?"`A;F5W:6YF;RD@<F5T=7)N.PH*("`@("`@("!W:&EL92`H;&ES="D*("`@
M("`@("!<>PH@("`@("`@("`@("!I9B@@;&ES="T^=&%G(#T]('1A9W9A;"`I
M"B`@("`@("`@("`@(%Q["B`@("`@("`@("`@("`@("`O*B!F<F5E(&%N>2!E
M>&ES=&EN9R!S='5F9B`J+PH@("`@("`@("`@("`@("`@:68@*"!L:7-T+3YD
M871A("D*("`@("`@("`@("`@("`@(%Q["B`@("`@("`@("`@("`@("`@("`@
M9G)E92@@;&ES="T^9&%T82`I.PH@("`@("`@("`@("`@("`@("`@(&QI<W0M
M/F1A=&$@/2!.54Q,.PH@("`@("`@("`@("`@("`@7'T*"B`@("`@("`@("`@
M("`@("`O*B!.3U1%.B!4:&ES(&YE>'0@8V]M<&%R:7-O;B!M:6=H="!B92!F
M;&%W960@*B\*("`@("`@("`@("`@("`@(&EF("@@;F5W:6YF;RT^;&ES=%]N
M97AT('Q\(&YE=VEN9F\M/F)R86YC:"`I"B`@("`@("`@("`@("`@("!<>PH@
M("`@("`@("`@("`@("`@("`@(&QI<W0M/F)R86YC:"`](&QE1'5P*"!N97=I
M;F9O("D["B`@("`@("`@("`@("`@("`@("`@;&ES="T^<75O=&5D(#T@,3L*
M("`@("`@("`@("`@("`@(%Q](`H@("`@("`@("`@("`@("`@96QS92!I9B`H
M(&YE=VEN9F\M/F1A=&$@*0H@("`@("`@("`@("`@("`@7'L*("`@("`@("`@
M("`@("`@("`@("!L:7-T+3YD871A(#T@<W1R9'5P*"!N97=I;F9O+3YD871A
M("D["B`@("`@("`@("`@("`@("!<?0H*("`@("`@("`@("`@7'T*("`@("`@
M("`@("`@;&5486=297!L86-E*"!L:7-T+3YB<F%N8V@L('1A9W9A;"P@;F5W
M:6YF;R`I.PH*("`@("`@("`@("`@;&ES="`](&QI<W0M/FQI<W1?;F5X=#L*
M("`@("`@("!<?0H@("`@7'T*7&YW=7-E9'M<7'M.5VQI<S@M;&ES-RTQ?7U<
M;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[-#=]7&YW9&]C<W!A<@H*"B4E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)0I<<W5B<V5C=&EO;B![1&5B=6<@5&]O;'-]"EQL86)E;'MS
M96,Z9&5B=6=T;V]L<WT*"E1H97-E(&%R92!F;W(@9'5B=6<@;W5T<'5T+"!A
M;F0@8V%N('!R;V)A8FQY(&)E(')E;6]V960@:68@>6]U)W)E(`IC<G5N8VAE
M9"!F;W(@<W!A8V4N"@HE)24E)24E)24E)24E)24E)24E)24E)24E)24E)24*
M7'-U8G-U8G-E8W1I;VX@>VQE1'5M<'T*"D1U;7`@;W5T('1H92!E;G1I<F4@
M;&ES="P@86QL('!R971T>2UL:6ME+@H*7&YW96YD9&]C<WM]7&YW8F5G:6YC
M;V1E>S0X?5QS=6)L86)E;'M.5VQI<S@M3&ES1BXR+3%]7&YW;6%R9VEN=&%G
M>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<T8N,BTQ?7U]
M7&UO9&1E9GM,:7-T(&1U;7`@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G
M97)E9GM.5VQI<S@M3&ES1BXR+3%]?7U<96YD;6]D9&5F"B`@("!V;VED(&QE
M1'5M<"@@;&4@*B!L:7-T+"!I;G0@:6YD96YT("D*7&YW=7-E9'M<7'M.5VQI
M<S@M3&ES3RXR+3%]7%Q[3E=L:7,X+6QI<S<N,BTQ?7U<;G=E;F1C;V1E>WU<
M;G=B96=I;F1O8W-[-#E]7&YW9&]C<W!A<@H*7&YW96YD9&]C<WM]7&YW8F5G
M:6YC;V1E>S4P?5QS=6)L86)E;'M.5VQI<S@M3&ES3RXR+3%]7&YW;6%R9VEN
M=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<T\N,BTQ
M?7U]7&UO9&1E9GM,:7-T(&1U;7`@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T
M>6QE>WU<<W5B<&%G97)E9GM.5VQI<S@M3&ES3RXR+3%]?7U<96YD;6]D9&5F
M"B`@("!<3$%[?4QI<W0@9'5M<"!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P
M86=E<F5F>TY7;&ES."U,:7-&+C(M,7U]7%)!>WT*("`@(%Q["B`@("`@("`@
M:6YT(&,["B`@("`@("`@;&4@*B!T96UP(#T@;&ES=#L*"B`@("`@("`@=VAI
M;&4@*'1E;7`I"B`@("`@("`@7'L*("`@("`@("`@("`@:68@*'1E;7`M/F1A
M=&$I"B`@("`@("`@("`@(%Q["B`@("`@("`@("`@("`@("!F;W(H(&,],"`[
M(&,\:6YD96YT(#L@8RLK("D@<')I;G1F*"`B("(@*3L*("`@("`@("`@("`@
M("`@('!R:6YT9B@@(B5S("5S7%QN(BP@"B`@("`@("`@("`@("`@("`@("`@
M("`@('1E;7`M/F1A=&$L"B`@("`@("`@("`@("`@("`@("`@("`@("AT96UP
M+3YQ=6]T960@/3T@,2D@/R`B<75O=&5D(B`Z("(B"B`@("`@("`@("`@("`@
M("`@("`@("`@("D["B`@("`@("`@("`@(%Q](&5L<V4@7'L*("`@("`@("`@
M("`@("`@(&QE1'5M<"AT96UP+3YB<F%N8V@L(&EN9&5N="`K(#0I.PH@("`@
M("`@("`@("!<?0H*("`@("`@("`@("`@=&5M<#UT96UP+3YL:7-T7VYE>'0[
M"B`@("`@("`@7'T*("`@(%Q]"EQN=W5S961[7%Q[3E=L:7,X+6QI<S<M,7U]
M7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S4Q?5QN=V1O8W-P87(*"B4E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<W5B<V5C=&EO;B![;&5$
M=6UP179A;%1R965]"@I$=6UP(&]U="!T:&4@96YT:7)E(&QI<W0L(&%L;"!P
M<F5T='DM;&EK92P@=VAI;&4@979A;'5A=&EN9R!E86-H(&YO9&4N"@H*7&YW
M96YD9&]C<WM]7&YW8F5G:6YC;V1E>S4R?5QS=6)L86)E;'M.5VQI<S@M3&ES
M4"TQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7
M;&ES."U,:7-0+3%]?7U<;6]D9&5F>TQI<W0@9'5M<"!E=F%L('1R964@<')O
M=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VQI<S@M3&ES4"TQ?7U]
M7&5N9&UO9&1E9@H@("`@=F]I9"!L941U;7!%=F%L5')E92@@;&4@*B!L:7-T
M+"!I;G0@:6YD96YT("D*7&YW=7-E9'M<7'M.5VQI<S@M3&ES62TQ?5Q<>TY7
M;&ES."UL:7,W+C(M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S4S?5QN
M=V1O8W-P87(*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LU-'U<<W5B;&%B
M96Q[3E=L:7,X+4QI<UDM,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<
M<W5B<&%G97)E9GM.5VQI<S@M3&ES62TQ?7U]7&UO9&1E9GM,:7-T(&1U;7`@
M979A;"!T<F5E(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A
M9V5R969[3E=L:7,X+4QI<UDM,7U]?5QE;F1M;V1D968*("`@(%Q,07M]3&ES
M="!D=6UP(&5V86P@=')E92!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E
M<F5F>TY7;&ES."U,:7-0+3%]?5Q207M]"B`@("!<>PH@("`@("`@(&EN="!C
M.PH@("`@("`@(&QE("H@=&5M<"`](&QI<W0["@H@("`@("`@('=H:6QE("AT
M96UP*0H@("`@("`@(%Q["B`@("`@("`@("`@(&9O<B@@8STP(#L@8SQI;F1E
M;G0@.R!C*RL@*2!P<FEN=&8H("(@(B`I.PH@("`@("`@("`@("!I9B`H=&5M
M<"T^9&%T82D*("`@("`@("`@("`@7'L*("`@("`@("`@("`@("`@('!R:6YT
M9B@@(B5S("5S7%QN(BP@"B`@("`@("`@("`@("`@("`@("`@("`@('1E;7`M
M/F1A=&$L"B`@("`@("`@("`@("`@("`@("`@("`@("AT96UP+3YQ=6]T960@
M/3T@,2D@/R`B<75O=&5D(B`Z("(B"B`@("`@("`@("`@("`@("`@("`@("`@
M("D["B`@("`@("`@("`@(%Q](&5L<V4@7'L*("`@("`@("`@("`@("`@(&QE
M("H@;&5?=F%L=64@/2!E=F%L=6%T94)R86YC:"AT96UP+3YB<F%N8V@I(#L*
M("`@("`@("`@("`@("`@('!R:6YT9B@@(D(Z("5S(BP@*'1E;7`M/G%U;W1E
M9"D@/R`B<75O=&5D("(@.B`B(BD["B`@("`@("`@("`@("`@("!L941U;7!2
M969O<FUA="@@<W1D;W5T+"!L95]V86QU92`I.PH@("`@("`@("`@("`@("`@
M<')I;G1F*"`B7%QN(B`I.PH@("`@("`@("`@("`@("`@;&57:7!E*&QE7W9A
M;'5E*3L*"B`@("`@("`@("`@("`@("!L941U;7`H=&5M<"T^8G)A;F-H+"!I
M;F1E;G0@*R`T*3L*("`@("`@("`@("`@7'T*"B`@("`@("`@("`@('1E;7`]
M=&5M<"T^;&ES=%]N97AT.PH@("`@("`@(%Q]"B`@("!<?0I<;G=U<V5D>UQ<
M>TY7;&ES."UL:7,W+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLU-7U<
M;G=D;V-S<&%R"@HE)24E)24E)24E)24E)24E)24E)24E)24E)24E)24*7'-U
M8G-U8G-E8W1I;VX@>VQE1'5M<$5V86Q]"@I$=6UP(&]U="!T:&4@96YT:7)E
M(&QI<W0L(&%L;"!P<F5T='DM;&EK92P@=VAI;&4@979A;'5A=&EN9R!E86-H
M(&YO9&4N"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[-39]7'-U8FQA8F5L
M>TY7;&ES."U,:7-++C(M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<
M<W5B<&%G97)E9GM.5VQI<S@M3&ES2RXR+3%]?7U<;6]D9&5F>TQI<W0@9'5M
M<"!E=F%L('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X
M+4QI<TLN,BTQ?7U]7&5N9&UO9&1E9@H@("`@=F]I9"!L941U;7!%=F%L*"!L
M92`J(&QI<W0L(&EN="!I;F1E;G0@*0I<;G=U<V5D>UQ<>TY7;&ES."U,:7-4
M+C(M,7U<7'M.5VQI<S@M;&ES-RXR+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN
M9&]C<WLU-WU<;G=D;V-S<&%R"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[
M-3A]7'-U8FQA8F5L>TY7;&ES."U,:7-4+C(M,7U<;G=M87)G:6YT86=[>UQN
M=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VQI<S@M3&ES5"XR+3%]?7U<;6]D
M9&5F>TQI<W0@9'5M<"!E=F%L(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL
M97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<U0N,BTQ?7U]7&5N9&UO9&1E9@H@
M("`@7$Q!>WU,:7-T(&1U;7`@979A;"!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS
M=6)P86=E<F5F>TY7;&ES."U,:7-++C(M,7U]7%)!>WT*("`@(%Q["B`@("`@
M("`@:6YT(&,["B`@("`@("`@;&4@*B!T96UP(#T@;&ES=#L*("`@("`@("!L
M92`J(&QE7W9A;'5E(#T@3E5,3#L*"B`@("`@("`@=VAI;&4@*'1E;7`I"B`@
M("`@("`@7'L*("`@("`@("`@("`@:68@*'1E;7`M/F)R86YC:"D*("`@("`@
M("`@("`@7'L*("`@("`@("`@("`@("`@('!R:6YT9B`H(EQ<;B(I.PH@("`@
M("`@("`@("`@("`@;&5$=6UP4F5F;W)M870H('-T9&]U="P@=&5M<"T^8G)A
M;F-H("D["@H@("`@("`@("`@("`@("`@<')I;G1F("@B7%QN/3T^("(I.PH@
M("`@("`@("`@("`@("`@;&5?=F%L=64@/2!E=F%L=6%T94)R86YC:"AT96UP
M+3YB<F%N8V@I(#L*("`@("`@("`@("`@("`@(&QE1'5M<%)E9F]R;6%T*"!S
M=&1O=70L(&QE7W9A;'5E("D["B`@("`@("`@("`@("`@("!L95=I<&4H;&5?
M=F%L=64I.PH@("`@("`@("`@("`@("`@<')I;G1F("@B7%QN(BD["B`@("`@
M("`@("`@(%Q]"@H@("`@("`@("`@("!T96UP/71E;7`M/FQI<W1?;F5X=#L*
M("`@("`@("!<?0H@("`@("`@('!R:6YT9B@B/3T]/3T]/5Q<;B(I.PH@("`@
M7'T*7&YW=7-E9'M<7'M.5VQI<S@M;&ES-RTQ?7U<;G=E;F1C;V1E>WU<;G=B
M96=I;F1O8W-[-3E]7&YW9&]C<W!A<@H*)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E"EQS=6)S=6)S96-T:6]N('ML941U;7!2969O<FUA='T*"E!R
M:6YT(&]U="!T:&4@=')E92!A<R!A('-T86YD87)D(',M97AP<F5S<VEO;B!L
M:7-T("AA<R!O<FEG:6YA;&QY(')E860*:6X@9G)O;2!A(&9I;&4I('1O('1H
M92![7'1T>WU&24Q%?2!A<R!D969I;F5D(&)Y('M<='1[?6]F?2X*"EQN=V5N
M9&1O8W-[?5QN=V)E9VEN8V]D97LV,'U<<W5B;&%B96Q[3E=L:7,X+4QI<T\N
M,RTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7
M;&ES."U,:7-/+C,M,7U]?5QM;V1D969[3&ES="!D=6UP(')E9F]R;6%T('!R
M;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<T\N,RTQ
M?7U]7&5N9&UO9&1E9@H@("`@=F]I9"!L941U;7!2969O<FUA="A&24Q%("H@
M;V8L(&QE("H@=')E92D*7&YW=7-E9'M<7'M.5VQI<S@M3&ES6"TQ?5Q<>TY7
M;&ES."UL:7,W+C(M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S8Q?5QN
M=V1O8W-P87(*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LV,GU<<W5B;&%B
M96Q[3E=L:7,X+4QI<U@M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<
M<W5B<&%G97)E9GM.5VQI<S@M3&ES6"TQ?7U]7&UO9&1E9GM,:7-T(&1U;7`@
M<F5F;W)M870@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G
M97)E9GM.5VQI<S@M3&ES6"TQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU,:7-T
M(&1U;7`@<F5F;W)M870@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5VQI<S@M3&ES3RXS+3%]?5Q207M]"B`@("!<>PH@("`@("`@(&QE("H@
M=')E971E;7`@/2!T<F5E.PH@("`@("`@(&EN="!L96X["B`@("`@("`@:6YT
M(&YO=&9I<G-T(#T@,#L*("`@("`@("!C:&%R("H@<F5T<W1R:6YG.PH*("`@
M("`@("!I9B`H(71R964I(')E='5R;CL*"B`@("`@("`@9G!R:6YT9B@@;V8L
M("(H(B`I.PH@("`@("`@('=H:6QE("AT<F5E=&5M<"D*("`@("`@("!<>PH@
M("`@("`@("`@("!I9B`H=')E971E;7`M/F1A=&$I"B`@("`@("`@("`@(%Q[
M"B`@("`@("`@("`@("`@("!F<')I;G1F*"!O9BP@(B5S)7,B+"!N;W1F:7)S
M=#\B("(Z(B(L('1R965T96UP+3YD871A*3L*("`@("`@("`@("`@("`@(&YO
M=&9I<G-T*RL["B`@("`@("`@("`@(%Q]"@H@("`@("`@("`@("!I9B`H=')E
M971E;7`M/F)R86YC:"D*("`@("`@("`@("`@7'L*("`@("`@("`@("`@("`@
M(&9P<FEN=&8H(&]F+"`B("5S(BP@*'1R965T96UP+3YQ=6]T960I/R`B7%PG
M(CHB(BD["B`@("`@("`@("`@("`@("!L941U;7!2969O<FUA="@@;V8L('1R
M965T96UP+3YB<F%N8V@@*3L*("`@("`@("`@("`@7'T*"B`@("`@("`@("`@
M('1R965T96UP(#T@=')E971E;7`M/FQI<W1?;F5X=#L*("`@("`@("!<?0H@
M("`@("`@(&9P<FEN=&8H(&]F+"`B*2(@*3L*("`@(%Q]"EQN=W5S961[7%Q[
M3E=L:7,X+6QI<S<M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S8S?5QN
M=V1O8W-P87(*"@HE)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24*7'-U8G-E8W1I;VX@>VQI<W1S
M+F-]"@I!;F0@9FEN86QL>2P@9VQU92!I="!A;&P@=&]G971H97(@:6X@=&AE
M("YC(&9I;&4N"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[-C1]7'-U8FQA
M8F5L>TY7;&ES."UL:7,W+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=L:7,X+6QI<S<M,7U]?5QM;V1D969[;&ES=',N8WY[
M7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES."UL:7,W+3%]?7U<96YD
M;6]D9&5F"B-I;F-L=61E(")L:7-T<RYH(@HC:6YC;'5D92`B979A;"YH(@HC
M:6YC;'5D92`\<W1R:6YG+F@^"@I<3$%[?4QI<W0@;F5W(&EM<&QE;65N=&%T
M:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<TXM,7U]
M7%)!>WT*7$Q!>WU,:7-T(&1E;&5T92!I;7!L96UE;G1A=&EO;GY[7&YW=&%G
M<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES."U,:7-1+3%]?5Q207M]"EQ,07M]
M3&ES="!W:7!E(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A
M9V5R969[3E=L:7,X+4QI<T\M,7U]7%)!>WT*"EQ,07M]3&ES="!A9&0@:&5A
M9"!I;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7
M;&ES."U,:7-3+3%]?5Q207M]"EQ,07M]3&ES="!A9&0@=&%I;"!I;7!L96UE
M;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES."U,:7-3
M+C(M,7U]7%)!>WT*"EQ,07M]3&ES="!A9&0@8G)A;F-H(&EM<&QE;65N=&%T
M:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<U4M,7U]
M7%)!>WT*7$Q!>WU,:7-T(&%D9"!D871A(&EM<&QE;65N=&%T:6]N?GM<;G=T
M86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<U,N,RTQ?7U<4D%[?0I<
M3$%[?4QI<W0@9'5P(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U
M8G!A9V5R969[3E=L:7,X+4QI<TXN,BTQ?7U<4D%[?0H*7$Q!>WU,:7-T('1A
M9R!C;&5A<B!I;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E
M<F5F>TY7;&ES."U,:7-4+3%]?5Q207M]"EQ,07M]3&ES="!T86<@9&%T82!I
M;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES
M."U,:7-3+C0M,7U]7%)!>WT*7$Q!>WU,:7-T('1A9R!R97!L86-E(&EM<&QE
M;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI
M<U8M,7U]7%)!>WT*"EQ,07M]3&ES="!D=6UP(&EM<&QE;65N=&%T:6]N?GM<
M;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<T\N,BTQ?7U<4D%[
M?0I<3$%[?4QI<W0@9'5M<"!E=F%L('1R964@:6UP;&5M96YT871I;VY^>UQN
M=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VQI<S@M3&ES62TQ?7U<4D%[?0I<
M3$%[?4QI<W0@9'5M<"!E=F%L(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL
M97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<U0N,BTQ?7U<4D%[?0I<3$%[?4QI
M<W0@9'5M<"!R969O<FUA="!I;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[
M?5QS=6)P86=E<F5F>TY7;&ES."U,:7-8+3%]?5Q207M]"EQN=VYO='5S961[
M;&ES=',N8WU<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[-C5]7&YW9&]C<W!A
M<@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E"EQS=6)S96-T:6]N('ML:7-T<RYH?0H*06YD
M('1H92!H96%D97(@9FEL92!A<R!W96QL+@H*7&YW96YD9&]C<WM]7&YW8F5G
M:6YC;V1E>S8V?5QS=6)L86)E;'M.5VQI<S@M;&ES-RXR+3%]7&YW;6%R9VEN
M=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X+6QI<S<N,BTQ
M?7U]7&UO9&1E9GML:7-T<RYH?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=L:7,X+6QI<S<N,BTQ?7U]7&5N9&UO9&1E9@HC:69N9&5F(%]?3$E35%-?
M2%]?"B-D969I;F4@7U],25-44U](7U\*"B-I;F-L=61E(#QS=&1I;RYH/@H*
M7$Q!>WU,:7-T(%-T<G5C='5R97Y[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F
M>TY7;&ES."U,:7-%+3%]?5Q207M]"@I<3$%[?4QI<W0@;F5W('!R;W1O?GM<
M;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<T4N,BTQ?7U<4D%[
M?3L*7$Q!>WU,:7-T(&1E;&5T92!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P
M86=E<F5F>TY7;&ES."U,:7-(+3%]?5Q207M].PI<3$%[?4QI<W0@=VEP92!P
M<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES."U,:7-&+3%]
M?5Q207M].PH*7$Q!>WU,:7-T(&%D9"!H96%D('!R;W1O?GM<;G=T86=S='EL
M97M]7'-U8G!A9V5R969[3E=L:7,X+4QI<THM,7U]7%)!>WT["EQ,07M]3&ES
M="!A9&0@=&%I;"!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7
M;&ES."U,:7-*+C(M,7U]7%)!>WT["@I<3$%[?4QI<W0@861D(&)R86YC:"!P
M<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES."U,:7-,+3%]
M?5Q207M].PI<3$%[?4QI<W0@861D(&1A=&$@<')O=&]^>UQN=W1A9W-T>6QE
M>WU<<W5B<&%G97)E9GM.5VQI<S@M3&ES2BXS+3%]?5Q207M].PI<3$%[?4QI
M<W0@9'5P('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L:7,X
M+4QI<T4N,RTQ?7U<4D%[?3L*"EQ,07M]3&ES="!T86<@8VQE87(@<')O=&]^
M>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VQI<S@M3&ES2RTQ?7U<4D%[
M?3L*7$Q!>WU,:7-T('1A9R!D871A('!R;W1O?GM<;G=T86=S='EL97M]7'-U
M8G!A9V5R969[3E=L:7,X+4QI<THN-"TQ?7U<4D%[?3L*7$Q!>WU,:7-T('1A
M9R!R97!L86-E('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=L
M:7,X+4QI<TTM,7U]7%)!>WT["@I<3$%[?4QI<W0@9'5M<"!P<F]T;WY[7&YW
M=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7;&ES."U,:7-&+C(M,7U]7%)!>WT[
M"EQ,07M]3&ES="!D=6UP(&5V86P@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B
M<&%G97)E9GM.5VQI<S@M3&ES2RXR+3%]?5Q207M].PI<3$%[?4QI<W0@9'5M
M<"!E=F%L('1R964@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.
M5VQI<S@M3&ES4"TQ?7U<4D%[?3L*7$Q!>WU,:7-T(&1U;7`@<F5F;W)M870@
M<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5VQI<S@M3&ES3RXS
M+3%]?5Q207M].PHC96YD:68*7&YW;F]T=7-E9'ML:7-T<RYH?5QN=V5N9&-O
M9&5[?5QN=V)E9VEN9&]C<WLV-WU<;G=D;V-S<&%R"EQN=V5N9&1O8W-[?5QN
M=V9I;&5N86UE>W9A<G,N;G=]7&YW8F5G:6YD;V-S>S!]7&YW96YD9&]C<WM]
M7&YW8F5G:6YD;V-S>S%]7&YW9&]C<W!A<@I<<V5C=&EO;GM4:&4@5F%R:6%B
M;&4@365C:&%N:7-M<WT*7&QA8F5L>W-E8SIV87)I86)L96UE8VAA;FES;7-]
M"@I2871H97(@=&AA;B!U<VEN9R!A;F]T:&5R('-T<G5C='5R92!A;F0@;&EN
M:V5D+6QI<W0@<WES=&5M+"!W92!W:6QL(&IU<W0*=7-E('1H92!S86UE(&QI
M<W0@<W1R=6-T=7)E('1H870@=V4@=7-E(&9O<B!T:&4@9FEL97,@:71S96QF
M+B`@5&AI<R!A;'-O"F=I=F5S('5S('1H92!F;&5X:6)I;&ET>2!O9B!H879I
M;F<@82!V87)I86)L92!P;VEN="!T;R!A('-T<G5C='5R92!O<B`*=&AE(&QI
M:V4N("`*"E=E('=I;&P@8F%S:6-A;&QY(&%S<W5M92!W92!H879E(&%N;W1H
M97(@;&ES="P@8V%L;&5D('M<='1[?79A<FQI<W1](&EN"G1H97-E(&UE=&AO
M9',L('=H:6-H('=I;&P@8F%S:6-A;&QY(&)E(&$@<VEN9VQE(&)A8VMB;VYE
M('=I=&@@86QL(&]F('1H90IV87)I86)L92!N86UE<RX@(%1H96ER('M<='1[
M?6)R86YC:'T@96QE;65N="!W:6QL(&-O;G1A:6X@82!P;VEN=&5R('1O('1H
M92`*9&%T82!T:&%T('1H92!V87)I86)L92!D969I;F5S+@H*06QL(&]F('1H
M97-E(&)A<VEC(&UE=&AO9',@=VEL;"!I;G1E<F%C="!W:71H('1H92!L:7-T
M(&%T('1H92!L979E;"!O9B`*=&AE(&QI<W0@:71S96QF+B`@5&AA="!I<R!T
M;R!S87DL('=I=&@@=&AE(&5X8V5P=&EO;B!O9B!M86-R;W,L('=H96X@>6]U
M"F%D9"!A(&YE=R!V87)I86)L92!O<B!R971R:65V92!A('9A<FEA8FQE+"!Y
M;W4@=VEL;"!B92!H86YD:6YG(&%R;W5N9"`*>UQT='M];&5]('-T<G5C=',N
M("`*"D%N>2!D871A('!A<W-E9"!I;B!W:6QL(&)E(&1U<&QI8V%T960@:6YT
M97)N86QL>2!W:&5R92!S=&]R86=E(&ES(&EN=F]L=F5D+@I!;GD@<F5T=7)N
M960@96QE;65N=',@=VEL;"!B92!T:&4@;F5W('-T;W)E9"!D871A(&)I=',N
M("!4:&%T(&ES('1O('-A>2P*=&AA="!Y;W4@<VAO=6QD(&YO="!F<F5E(&%N
M>2!P;VEN=&5R<R!R971U<FYE9"!B>2!T:&5S92!M971H;V1S+@H*7&YW96YD
M9&]C<WM]7&YW8F5G:6YC;V1E>S)]7'-U8FQA8F5L>TY7=F%R-RU687)/+3%]
M7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=V87(W
M+59A<D\M,7U]?5QM;V1D969[5F%R:6%B;&4@;&ES="!D969I;FET:6]N?GM<
M;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=V87(W+59A<D\M,7U]?5QE;F1M
M;V1D968*97AT97)N(&QE("H@;6%I;E9A<DQI<W0["EQN=W5S961[7%Q[3E=V
M87(W+79A<C8N,BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[,WU<;G=D
M;V-S<&%R"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LT?5QS=6)L86)E;'M.
M5W9A<C<M5F%R4RTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P
M86=E<F5F>TY7=F%R-RU687)3+3%]?7U<;6]D9&5F>U9A<FEA8FQE(&QI<W0@
M:6YI=&EA;&EZ871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5W9A
M<C<M5F%R4RTQ?7U]7&5N9&UO9&1E9@IL92`J(&UA:6Y687),:7-T(#T@3E5,
M3#L*7&YW=7-E9'M<7'M.5W9A<C<M=F%R-BTQ?7U<;G=E;F1C;V1E>WU<;G=B
M96=I;F1O8W-[-7U<;G=D;V-S<&%R"@I3:6YC92!T:&4@;65C:&%N:7-M<R!A
M<F4@:61E;G1I8V%L(&9O<B!W;W)K:6YG('=I=&@@=7-E<BUD969I;F5D"F9U
M;F-T:6]N<RP@=V4@=VEL;"!S=&]R92!T:&]S92!L:7-T<R!I;B!H97)E(&%S
M('=E;&PL(&5V96X@=&AO=6=H(`IW92!D;VXG="!H879E('1O+B`@"@I<;G=E
M;F1D;V-S>WU<;G=B96=I;F-O9&5[-GU<<W5B;&%B96Q[3E=V87(W+41E9DPM
M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5W9A
M<C<M1&5F3"TQ?7U]7&UO9&1E9GM$969U;B!L:7-T(&1E9FEN:71I;VY^>UQN
M=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5W9A<C<M1&5F3"TQ?7U]7&5N9&UO
M9&1E9@IE>'1E<FX@;&4@*B!D969U;DQI<W0["EQN=W5S961[7%Q[3E=V87(W
M+79A<C8N,BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[-WU<;G=D;V-S
M<&%R"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LX?5QS=6)L86)E;'M.5W9A
M<C<M1&5F4"TQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E
M<F5F>TY7=F%R-RU$9690+3%]?7U<;6]D9&5F>T1E9G5N(&QI<W0@:6YI=&EA
M;&EZ871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5W9A<C<M1&5F
M4"TQ?7U]7&5N9&UO9&1E9@IL92`J(&1E9G5N3&ES="`]($Y53$P["EQN=W5S
M961[7%Q[3E=V87(W+79A<C8M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S
M>SE]7&YW9&]C<W!A<@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E"EQS=6)S96-T:6]N('M,
M:7-T($UA;FEP<WT*7&QA8F5L>W-E8SIL:7-T;6%N:7!S?0H*4V]M92!F=6YC
M=&EO;G,@9F]R('=O<FMI;F<@<W!E8VEF:6-A;&QY('=I=&@@=&AE('9A<FEA
M8FQE(&QI<W1S+@I3:6YC92!T:&5S92!U<V4@=&AE('-A;64@>UQT='M];&5]
M('-T<G5C='5R92!A<R!D969I;F5D('!R979I;W5S;'DL"F)U="!I="!I<R!U
M<V5D(&$@;&ET=&QE(&1I9F9E<F5N=&QY+"!W92!N965D('-O;64@9G5N8W1I
M;VYS(&9O<@IW;W)K:6YG('=I=&@@=&AE(&QI<W1S+B`@5&AE<V4@87)E('1H
M;W-E(&9U;F-T:6]N<RX*"B4E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<W5B<V5C=&EO
M;B![=F%R:6%B;&5&:6YD?0H*5&AI<R!W:6QL(')E='5R;B!T:&4@>UQT='M]
M;&5](&5L96UE;G0@=VAO<V4@>UQT='M]9&%T87T@;6%T8VAE<PIT:&4@>UQT
M='M]:V5Y?2!P87-S960@:6XL(&EN('1H92!V87)I86)L92!L:7-T+"![7'1T
M>WUV87)L:7-T?2X*"DEF(&ET('=A<R!N;W0@9F]U;F0L(&$@>UQT='M]3E5,
M3'T@:7,@<F5T=7)N960N"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,3!]
M7'-U8FQA8F5L>TY7=F%R-RU687)*+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S
M='EL97M]7'-U8G!A9V5R969[3E=V87(W+59A<DHM,7U]?5QM;V1D969[5F%R
M:6%B;&4@9FEN9"!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7
M=F%R-RU687)*+3%]?7U<96YD;6]D9&5F"B`@("!L92`J('9A<FEA8FQE1FEN
M9"@@;&4@*B!V87)L:7-T+"!C:&%R("H@:V5Y("D*7&YW=7-E9'M<7'M.5W9A
M<C<M5F%R4RXR+3%]7%Q[3E=V87(W+79A<C8N,BTQ?7U<;G=E;F1C;V1E>WU<
M;G=B96=I;F1O8W-[,3%]7&YW9&]C<W!A<@H*7&YW96YD9&]C<WM]7&YW8F5G
M:6YC;V1E>S$R?5QS=6)L86)E;'M.5W9A<C<M5F%R4RXR+3%]7&YW;6%R9VEN
M=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=V87(W+59A<E,N,BTQ
M?7U]7&UO9&1E9GM687)I86)L92!F:6YD(&EM<&QE;65N=&%T:6]N?GM<;G=T
M86=S='EL97M]7'-U8G!A9V5R969[3E=V87(W+59A<E,N,BTQ?7U]7&5N9&UO
M9&1E9@H@("`@7$Q!>WU687)I86)L92!F:6YD('!R;W1O?GM<;G=T86=S='EL
M97M]7'-U8G!A9V5R969[3E=V87(W+59A<DHM,7U]7%)!>WT*("`@(%Q["B`@
M("`@("`@;&4@*B!T96UP(#T@=F%R;&ES=#L*"B`@("`@("`@:68@*"%V87)L
M:7-T('Q\("%K97DI(')E='5R;B@@3E5,3"`I.PH*("`@("`@("!W:&EL92`H
M=&5M<"D*("`@("`@("!<>PH@("`@("`@("`@("!I9B`H(7-T<F-M<"AK97DL
M('1E;7`M/F1A=&$I*0H@("`@("`@("`@("!<>PH@("`@("`@("`@("`@("`@
M<F5T=7)N*"!T96UP("D["B`@("`@("`@("`@(%Q]"B`@("`@("`@("`@('1E
M;7`@/2!T96UP+3YL:7-T7VYE>'0["B`@("`@("`@7'T*"B`@("`@("`@<F5T
M=7)N*"!.54Q,("D["B`@("!<?0I<;G=U<V5D>UQ<>TY7=F%R-RUV87(V+3%]
M?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLQ,WU<;G=D;V-S<&%R"@HE)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24*7'-U8G-U8G-E8W1I;VX@>W9A<FEA8FQE1G)E97T*"E-I
M;F-E('=E)W)E('5S:6YG('M<='1[?6QE?2!L:7-T<R!F;W(@=&AE('9A<FEA
M8FQE('-Y<W1E;2P@=&AE(`I@8&9R964G)R!F=6YC=&EO;B!I<R!J=7-T(&$@
M;6%C<F\@=&AA="!C86QL<R!T:&4@87!P<F]P<FEA=&4*>UQT='M];&5](&9U
M;F-T:6]N+"!A<R!S965N(&AE<F4Z"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O
M9&5[,31]7'-U8FQA8F5L>TY7=F%R-RU687)*+C(M,7U<;G=M87)G:6YT86=[
M>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5W9A<C<M5F%R2BXR+3%]?7U<
M;6]D9&5F>U9A<FEA8FQE(&9R964@;6%C<F]^>UQN=W1A9W-T>6QE>WU<<W5B
M<&%G97)E9GM.5W9A<C<M5F%R2BXR+3%]?7U<96YD;6]D9&5F"B-D969I;F4@
M=F%R:6%B;&5&<F5E*"!,("D@7%P*("`@("`@("`@("`@("`@(&QE5VEP92@@
M*$PI("D*7&YW=7-E9'M<7'M.5W9A<C<M=F%R-BXR+3%]?5QN=V5N9&-O9&5[
M?5QN=V)E9VEN9&]C<WLQ-7U<;G=D;V-S<&%R"@HE)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24*
M7'-U8G-E8W1I;VX@>T=E="!A;F0@4V5T(%9A<FEA8FQE<WT*7&QA8F5L>W-E
M8SIG971A;F1S971V87)I86)L97-]"@I!;F0L(&]F(&-O=7)S92P@<V]M92!S
M:6UP;&4@;65T:&]D<R!F;W(@9&5A;&EN9R!W:71H('-E='1I;F<@"F%N9"!G
M971T:6YG(&]F('9A<FEA8FQE<R!I;B!T:&4@=F%R:6%B;&4@;&ES="X*"@HE
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24*7'-U8G-U8G-E8W1I;VX@>W9A<FEA8FQE4V5T?0H*
M5&AI<R!W:6QL(&%D9"!A('9A<FEA8FQE('=I=&@@=&AE('M<='1[?6ME>7T@
M86YD('M<='1[?79A;'5E?2!P87-S960@:6X@;VYT;PIT:&4@96YD(&]F('1H
M92![7'1T>WUV87)L:7-T?2P@86YD('1H96X@<F5T=7)N('1H92!R97-U;'1I
M;F<@;&ES="X*"E1H:7,@:7,@=7-E9"!W:&5N('=E('-E="!L:7-T<R!F;W(@
M=F%R:6%B;&4@=F%L=65S+@H*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S$V
M?5QS=6)L86)E;'M.5W9A<C<M5F%R22TQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G
M<W1Y;&5[?5QS=6)P86=E<F5F>TY7=F%R-RU687))+3%]?7U<;6]D9&5F>U9A
M<FEA8FQE('-E="!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7
M=F%R-RU687))+3%]?7U<96YD;6]D9&5F"B`@("!L92`J('9A<FEA8FQE4V5T
M*"!L92`J('9A<FQI<W0L(&-H87(@*B!K97DL(&QE("H@=F%L=64@*0I<;G=U
M<V5D>UQ<>TY7=F%R-RU687)2+3%]7%Q[3E=V87(W+79A<C8N,BTQ?7U<;G=E
M;F1C;V1E>WU<;G=B96=I;F1O8W-[,3=]7&YW9&]C<W!A<@H*7&YW96YD9&]C
M<WM]7&YW8F5G:6YC;V1E>S$X?5QS=6)L86)E;'M.5W9A<C<M5F%R4BTQ?5QN
M=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7=F%R-RU6
M87)2+3%]?7U<;6]D9&5F>U9A<FEA8FQE('-E="!);7!L96UE;G1A=&EO;GY[
M7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7=F%R-RU687)2+3%]?7U<96YD
M;6]D9&5F"B`@("!<3$%[?59A<FEA8FQE('-E="!P<F]T;WY[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7=F%R-RU687))+3%]?5Q207M]"B`@("!<>PH@
M("`@("`@(&QE("H@=&5M<#L*"B`@("`@("`@:68@*"%K97D@?'P@(79A;'5E
M*2`@<F5T=7)N*"!V87)L:7-T("D["@H@("`@("`@('1E;7`@/2!V87)I86)L
M949I;F0H('9A<FQI<W0L(&ME>2`I.PH@("`@("`@(&EF("@@=&5M<"`I"B`@
M("`@("`@7'L*("`@("`@("`@("`@;&57:7!E*"!T96UP+3YB<F%N8V@@*3L*
M("`@("`@("`@("`@=&5M<"T^8G)A;F-H(#T@;&5$=7`H('9A;'5E("D["B`@
M("`@("`@7'T@96QS92!<>PH@("`@("`@("`@("!T96UP(#T@;&5.97<H(&ME
M>2`I.PH@("`@("`@("`@("!T96UP+3YB<F%N8V@@/2!L941U<"@@=F%L=64@
M*3L*("`@("`@("`@("`@=F%R;&ES="`](&QE061D2&5A9"@@=F%R;&ES="P@
M=&5M<"`I.PH@("`@("`@(%Q]"B`@("`@("`@<F5T=7)N*"!V87)L:7-T("D[
M"B`@("!<?0I<;G=U<V5D>UQ<>TY7=F%R-RUV87(V+3%]?5QN=V5N9&-O9&5[
M?5QN=V)E9VEN9&]C<WLQ.7U<;G=D;V-S<&%R"@HE)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24*
M7'-U8G-U8G-E8W1I;VX@>W9A<FEA8FQE4V5T4W1R:6YG?0H*5&AI<R!W:6QL
M(&%D9"!A('9A<FEA8FQE('=I=&@@=&AE('M<='1[?6ME>7T@86YD('M<='1[
M?79A;'5E?2!P87-S960@:6X@;VYT;PIT:&4@96YD(&]F('1H92![7'1T>WUV
M87)L:7-T?2P@86YD('1H96X@<F5T=7)N('1H92!R97-U;'1I;F<@;&ES="X*
M"E1H:7,@:7,@=7-E9"!W:&5N('=E('-E="!S=')I;F=S(&9O<B!V87)I86)L
M92!V86QU97,N"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,C!]7'-U8FQA
M8F5L>TY7=F%R-RU687)0+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=V87(W+59A<E`M,7U]?5QM;V1D969[5F%R:6%B;&4@
M<V5T('-T<FEN9R!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7
M=F%R-RU687)0+3%]?7U<96YD;6]D9&5F"B`@("!L92`J('9A<FEA8FQE4V5T
M4W1R:6YG*"!L92`J('9A<FQI<W0L(&-H87(@*B!K97DL(&-H87(@*B!V86QU
M92`I"EQN=W5S961[7%Q[3E=V87(W+59A<EDM,7U<7'M.5W9A<C<M=F%R-BXR
M+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLR,7U<;G=D;V-S<&%R"@I<
M;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,C)]7'-U8FQA8F5L>TY7=F%R-RU6
M87)9+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=V87(W+59A<EDM,7U]?5QM;V1D969[5F%R:6%B;&4@<V5T('-T<FEN9R!)
M;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7=F%R
M-RU687)9+3%]?7U<96YD;6]D9&5F"B`@("!<3$%[?59A<FEA8FQE('-E="!S
M=')I;F<@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5W9A<C<M
M5F%R4"TQ?7U<4D%[?0H@("`@7'L*("`@("`@("!L92`J('1E;7`["@H@("`@
M("`@(&EF("@A:V5Y('Q\("%V86QU92D@(')E='5R;B@@=F%R;&ES="`I.PH*
M("`@("`@("!T96UP(#T@;&5.97<H=F%L=64I.PH*("`@("`@("!V87)L:7-T
M(#T@=F%R:6%B;&53970H('9A<FQI<W0L(&ME>2P@=&5M<"`I.PH@("`@("`@
M(`H@("`@("`@(&QE5VEP92@@=&5M<"`I.PH*("`@("`@("!R971U<FXH('9A
M<FQI<W0@*3L*("`@(%Q]"EQN=W5S961[7%Q[3E=V87(W+79A<C8M,7U]7&YW
M96YD8V]D97M]7&YW8F5G:6YD;V-S>S(S?5QN=V1O8W-P87(*"B4E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)0I<<W5B<W5B<V5C=&EO;B![=F%R:6%B;&5'971]"@I4:&ES('=I
M;&P@<F5T<FEE=F4@82!V87)I86)L92!W:71H('1H92![7'1T>WUK97E](&9R
M;VT@=&AE('M<='1[?79A<FQI<W1]+@I)="!W:6QL(')E='5R;B!T:&4@=F%R
M:6%B;&4@9&%T82P@;W(@82![7'1T>WU.54Q,?2!I9B!I="!W87,@;F]T(&9O
M=6YD+@H*5&AI<R!I<R!U<V5D('=H96X@=V4@=V%N="!T;R!R971R:65V92!L
M:7-T('9A;'5E<RX*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LR-'U<<W5B
M;&%B96Q[3E=V87(W+59A<DDN,BTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7=F%R-RU687))+C(M,7U]?5QM;V1D969[5F%R
M:6%B;&4@9V5T('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=V
M87(W+59A<DDN,BTQ?7U]7&5N9&UO9&1E9@H@("`@;&4@*B!V87)I86)L94=E
M="@@;&4@*B!V87)L:7-T+"!C:&%R("H@:V5Y("D*7&YW=7-E9'M<7'M.5W9A
M<C<M5F%R4BXR+3%]7%Q[3E=V87(W+79A<C8N,BTQ?7U<;G=E;F1C;V1E>WU<
M;G=B96=I;F1O8W-[,C5]7&YW9&]C<W!A<@H*7&YW96YD9&]C<WM]7&YW8F5G
M:6YC;V1E>S(V?5QS=6)L86)E;'M.5W9A<C<M5F%R4BXR+3%]7&YW;6%R9VEN
M=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=V87(W+59A<E(N,BTQ
M?7U]7&UO9&1E9GM687)I86)L92!G970@26UP;&5M96YT871I;VY^>UQN=W1A
M9W-T>6QE>WU<<W5B<&%G97)E9GM.5W9A<C<M5F%R4BXR+3%]?7U<96YD;6]D
M9&5F"B`@("!<3$%[?59A<FEA8FQE(&=E="!P<F]T;WY[7&YW=&%G<W1Y;&5[
M?5QS=6)P86=E<F5F>TY7=F%R-RU687))+C(M,7U]7%)!>WT*("`@(%Q["B`@
M("`@("`@;&4@*B!T96UP(#T@=F%R:6%B;&5&:6YD*'9A<FQI<W0L(&ME>2D[
M"B`@("`@("`@:68@*'1E;7`@)B8@=&5M<"T^8G)A;F-H*0H@("`@("`@("`@
M("!R971U<FXH('1E;7`M/F)R86YC:"`I.PH@("`@("`@(')E='5R;B@@3E5,
M3"`I.PH@("`@7'T*7&YW=7-E9'M<7'M.5W9A<C<M=F%R-BTQ?7U<;G=E;F1C
M;V1E>WU<;G=B96=I;F1O8W-[,C=]7&YW9&]C<W!A<@H*)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E"EQS=6)S=6)S96-T:6]N('MV87)I86)L94=E=%-T<FEN9WT*"E1H:7,@
M=VEL;"!R971R:65V92!A('9A<FEA8FQE('=I=&@@=&AE('M<='1[?6ME>7T@
M9G)O;2!T:&4@>UQT='M]=F%R;&ES='TN"DET('=I;&P@<F5T=7)N('1H92!V
M87)I86)L92!D871A+"!O<B!A('M<='1[?4Y53$Q](&EF(&ET('=A<R!N;W0@
M9F]U;F0N"@I4:&ES(&ES('5S960@=VAE;B!W92!W86YT('1O(')E=')I979E
M('-T<FEN9R!V86QU97,N"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,CA]
M7'-U8FQA8F5L>TY7=F%R-RU687)0+C(M,7U<;G=M87)G:6YT86=[>UQN=W1A
M9W-T>6QE>WU<<W5B<&%G97)E9GM.5W9A<C<M5F%R4"XR+3%]?7U<;6]D9&5F
M>U9A<FEA8FQE(&=E="!S=')I;F<@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B
M<&%G97)E9GM.5W9A<C<M5F%R4"XR+3%]?7U<96YD;6]D9&5F"B`@("!C:&%R
M("H@=F%R:6%B;&5'9713=')I;F<H(&QE("H@=F%R;&ES="P@8VAA<B`J(&ME
M>2`I"EQN=W5S961[7%Q[3E=V87(W+59A<EDN,BTQ?5Q<>TY7=F%R-RUV87(V
M+C(M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S(Y?5QN=V1O8W-P87(*
M"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LS,'U<<W5B;&%B96Q[3E=V87(W
M+59A<EDN,BTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E
M<F5F>TY7=F%R-RU687)9+C(M,7U]?5QM;V1D969[5F%R:6%B;&4@9V5T('-T
M<FEN9R!);7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F
M>TY7=F%R-RU687)9+C(M,7U]?5QE;F1M;V1D968*("`@(%Q,07M]5F%R:6%B
M;&4@9V5T('-T<FEN9R!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F
M>TY7=F%R-RU687)0+C(M,7U]7%)!>WT*("`@(%Q["B`@("`@("`@;&4@*B!T
M96UP(#T@=F%R:6%B;&5&:6YD*'9A<FQI<W0L(&ME>2D["B`@("`@("`@:68@
M*"`@('1E;7`*("`@("`@("`@("`@)B8@=&5M<"T^8G)A;F-H"B`@("`@("`@
M("`@("8F('1E;7`M/F)R86YC:"T^9&%T80H@("`@("`@("`@("`F)B!C;W5N
M=$YO9&5S*'1E;7`M/F)R86YC:"D@/3T@,0H@("`@("`@("`@("`I"B`@("`@
M("`@("`@(')E='5R;B@@<W1R9'5P*'1E;7`M/F)R86YC:"T^9&%T82D@*3L*
M("`@("`@("!R971U<FXH('-T<F1U<"@B+3$B*2`I.PH@("`@7'T*7&YW=7-E
M9'M<7'M.5W9A<C<M=F%R-BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[
M,S%]7&YW9&]C<W!A<@H*"B4E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<V5C=&EO;B![
M1&5B=6<@9G5N8W1I;VYS?0I<;&%B96Q[<V5C.G9A<G-D96)U9W1O;VQS?0H*
M02!S:6UP;&4@:71E<F%T;W(@=&\@<')I;G0@;W5T(&%L;"!O9B!T:&4@=F%R
M:6%B;&5S(&EN('1H92!V87)I86)L90IL:7-T('M<='1[?79A<FQI<W1]('!A
M<W-E9"!I;BX*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LS,GU<<W5B;&%B
M96Q[3E=V87(W+59A<DHN,RTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[
M?5QS=6)P86=E<F5F>TY7=F%R-RU687)*+C,M,7U]?5QM;V1D969[5F%R:6%B
M;&4@9'5M<"!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7=F%R
M-RU687)*+C,M,7U]?5QE;F1M;V1D968*("`@('9O:60@=F%R:6%B;&5$=6UP
M*"!L92`J('9A<FQI<W0@*0I<;G=U<V5D>UQ<>TY7=F%R-RU687)3+C,M,7U<
M7'M.5W9A<C<M=F%R-BXR+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLS
M,WU<;G=D;V-S<&%R"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,S1]7'-U
M8FQA8F5L>TY7=F%R-RU687)3+C,M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T
M>6QE>WU<<W5B<&%G97)E9GM.5W9A<C<M5F%R4RXS+3%]?7U<;6]D9&5F>U9A
M<FEA8FQE(&1U;7`@26UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B
M<&%G97)E9GM.5W9A<C<M5F%R4RXS+3%]?7U<96YD;6]D9&5F"B`@("!<3$%[
M?59A<FEA8FQE(&1U;7`@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5W9A<C<M5F%R2BXS+3%]?5Q207M]"B`@("!<>PH@("`@("`@(&QE("H@
M=&5M<"`]('9A<FQI<W0["B`@("`@("`@=VAI;&4@*'1E;7`I"B`@("`@("`@
M7'L*("`@("`@("`@("`@:68@*'1E;7`M/F)R86YC:"`F)B!T96UP+3YD871A
M*0H@("`@("`@("`@("!<>PH@("`@("`@("`@("`@("`@<')I;G1F*"(E<R!<
M7'0B+"!T96UP+3YD871A*3L*("`@("`@("`@("`@("`@(&QE1'5M<%)E9F]R
M;6%T*"!S=&1O=70L('1E;7`M/F)R86YC:"`I.PH@("`@("`@("`@("`@("`@
M<')I;G1F*")<7&XB*3L*("`@("`@("`@("`@7'T*("`@("`@("`@("`@=&5M
M<"`]('1E;7`M/FQI<W1?;F5X=#L*("`@("`@("!<?0H@("`@7'T*7&YW=7-E
M9'M<7'M.5W9A<C<M=F%R-BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[
M,S5]7&YW9&]C<W!A<@H*"B4E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<V5C=&EO;B![
M=F%R<RYC?0I<;&%B96Q[=F%R<V1O=&-]"@I(97)E('=E(&)U:6QD('5P(&%L
M;"!O9B!T:&4@86)O=F4@8FQO8VMS(&EN=&\@=&AE("YC(&9I;&4N"@I<;G=E
M;F1D;V-S>WU<;G=B96=I;F-O9&5[,S9]7'-U8FQA8F5L>TY7=F%R-RUV87(V
M+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=V
M87(W+79A<C8M,7U]?5QM;V1D969[=F%R<RYC?GM<;G=T86=S='EL97M]7'-U
M8G!A9V5R969[3E=V87(W+79A<C8M,7U]?5QE;F1M;V1D968*(VEN8VQU9&4@
M(G9A<G,N:"(*(VEN8VQU9&4@/'-T<FEN9RYH/@H*7$Q!>WU687)I86)L92!L
M:7-T(&EN:71I86QI>F%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=V87(W+59A<E,M,7U]7%)!>WT*7$Q!>WU$969U;B!L:7-T(&EN:71I86QI
M>F%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=V87(W+41E9E`M
M,7U]7%)!>WT*"EQ,07M]5F%R:6%B;&4@9FEN9"!I;7!L96UE;G1A=&EO;GY[
M7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7=F%R-RU687)3+C(M,7U]7%)!
M>WT*"EQ,07M]5F%R:6%B;&4@<V5T($EM<&QE;65N=&%T:6]N?GM<;G=T86=S
M='EL97M]7'-U8G!A9V5R969[3E=V87(W+59A<E(M,7U]7%)!>WT*7$Q!>WU6
M87)I86)L92!S970@<W1R:6YG($EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL
M97M]7'-U8G!A9V5R969[3E=V87(W+59A<EDM,7U]7%)!>WT*7$Q!>WU687)I
M86)L92!G970@26UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G
M97)E9GM.5W9A<C<M5F%R4BXR+3%]?5Q207M]"EQ,07M]5F%R:6%B;&4@9V5T
M('-T<FEN9R!);7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E
M<F5F>TY7=F%R-RU687)9+C(M,7U]7%)!>WT*"EQ,07M]5F%R:6%B;&4@9'5M
M<"!);7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7
M=F%R-RU687)3+C,M,7U]7%)!>WT*7&YW;F]T=7-E9'MV87)S+F-]7&YW96YD
M8V]D97M]7&YW8F5G:6YD;V-S>S,W?5QN=V1O8W-P87(*"@HE)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24*7'-U8G-E8W1I;VX@>W9A<G,N:'T*7&QA8F5L>W9A<G-D;W1H?0H*
M06YD('=E(&YE960@=&\@9&\@=&AE('-A;64@9F]R('1H92!H96%D97(@9FEL
M92!A<R!W96QL+@H*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S,X?5QS=6)L
M86)E;'M.5W9A<C<M=F%R-BXR+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL
M97M]7'-U8G!A9V5R969[3E=V87(W+79A<C8N,BTQ?7U]7&UO9&1E9GMV87)S
M+FA^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5W9A<C<M=F%R-BXR+3%]
M?7U<96YD;6]D9&5F"B-I;F-L=61E(#QS=&1I;RYH/@HC:6YC;'5D92`B;&ES
M=',N:"(*"EQ,07M]5F%R:6%B;&4@;&ES="!D969I;FET:6]N?GM<;G=T86=S
M='EL97M]7'-U8G!A9V5R969[3E=V87(W+59A<D\M,7U]7%)!>WT*7$Q!>WU$
M969U;B!L:7-T(&1E9FEN:71I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5W9A<C<M1&5F3"TQ?7U<4D%[?0H*7$Q!>WU687)I86)L92!F:6YD('!R
M;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=V87(W+59A<DHM,7U]
M7%)!>WT["EQ,07M]5F%R:6%B;&4@9G)E92!M86-R;WY[7&YW=&%G<W1Y;&5[
M?5QS=6)P86=E<F5F>TY7=F%R-RU687)*+C(M,7U]7%)!>WT["@I<3$%[?59A
M<FEA8FQE('-E="!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7
M=F%R-RU687))+3%]?5Q207M].PI<3$%[?59A<FEA8FQE('-E="!S=')I;F<@
M<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5W9A<C<M5F%R4"TQ
M?7U<4D%[?3L*7$Q!>WU687)I86)L92!G970@<')O=&]^>UQN=W1A9W-T>6QE
M>WU<<W5B<&%G97)E9GM.5W9A<C<M5F%R22XR+3%]?5Q207M].PI<3$%[?59A
M<FEA8FQE(&=E="!S=')I;F<@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G
M97)E9GM.5W9A<C<M5F%R4"XR+3%]?5Q207M].PH*7$Q!>WU687)I86)L92!D
M=6UP('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=V87(W+59A
M<DHN,RTQ?7U<4D%[?3L*7&YW;F]T=7-E9'MV87)S+FA]7&YW96YD8V]D97M]
M7&YW8F5G:6YD;V-S>S,Y?5QN=V1O8W-P87(*7&YW96YD9&]C<WM]7&YW9FEL
M96YA;65[979A;"YN=WU<;G=B96=I;F1O8W-[,'U<;G=E;F1D;V-S>WU<;G=B
M96=I;F1O8W-[,7U<;G=D;V-S<&%R"EQS96-T:6]N>U1H92!,:7-T($5V86QU
M871O<GT*7&QA8F5L>W-E8SIL:7-T979A;'5A=&]R?0H*5&AE(&QI<W0@979A
M;'5A=&]R(&ES(&)A<VEC86QL>2!A(&-A;&QB86-K(&UE8VAA;FES;2!T:&%T
M('1R879E<G-E<R!T:&4*;&ES="!P87-S960@:6XL(&%N9"!R971U<FYS(&$@
M8VAA<B`J(&-O;G1A:6YI;F<@=&AE(')E<W5L="X*"DET('=I;&P@;&]O:R!U
M<"!T:&4@9FER<W0@<&%R86UE=&5R(&]F(&$@;&ES="!I;B!T:&4@8V%L;&)A
M8VL@<F5G:7-T<GDL"G1H96X@8V%L;"!T:&%T(&UE=&AO9"!W:71H('1H92!L
M:7-T(&ET<V5L9BP@=VET:&]U="!R96UO=FEN9R!T:&%T(&AE860*96YT<GD@
M9G)O;2!I="P@<V\@82!L:7-T(&]F('M<='1[?2AF;V]<(&%<(&)<(&,I?2!W
M:6QL('1R:6=G97(@82!C86QL8F%C:R!F;W(*>UQT='M]9F]O?2P@=VAI8V@@
M=VEL;"!R96-E:79E('1H92!L:7-T('M<='1[?2AF;V]<(&%<(&)<(&,I?2!A
M<R!T:&4@>UQT='M]8G)A;F-H?0IP87)A;65T97(N"@I%=F%L=6%T92!W:6QL
M(&%L<V\@=')Y('1O(&1E<F5F97)E;F-E('9A<FEA8FQE<R!I9B!T:&5Y(&5X
M:7-T+@H*5&AE('M<='1[?65V86QU871E0G)A;F-H*"E](&UE=&AO9"!W:6QL
M(&5V86QU871E(&$@8V]M<&QE=&4@;&ES="!P87-S960*:6XL('=H:6QE('M<
M='1[?65V86QU871E3F]D92@I?2!M971H;V0@=VEL;"!O;FQY(&5V86QU871E
M('1H92!S:6YG;&4*8G)A;F-H('!A<W-E9"!I;BX@('M<='1[?65V86QU871E
M3F]D92@I?2!I<R!U<V5F=6P@9F]R(&1E<F5F97)E;F-I;F<*=F%R:6%B;&5S
M(&]R(&QI<W1S(&EN(&$@;&ES="!W:&5N(&EN('1H92!C86QL8F%C:RX@($ET
M(&ES('!E<F9E8W1L>0IS869E('1O(')E8W5R<V4@:6X@=&AI<R!M86YN97(N
M"@I4:&5R92!A<F4@86QS;R!M971H;V1S(&EN('1H:7,@<V5C=&EO;B!R96QA
M=&EN9R!T;R!C87-T:6YG('9A;'5E<R!T;PIL:7-T(&YO9&5S(&%N9"!B86-K
M+"!A<R!W96QL(&%S('1H92!E=F%L=6%T;W(@8V%L;&)A8VMS(&9O<B!A(&)A
M<VEC"DQ)4U`@:6UP;&5M96YT871I;VXN"@HE)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24*7'-U
M8G-E8W1I;VX@>T%D9&EN9R!-;W)E($9U;F-T:6]N86QI='E]"@I)="!I<R!Q
M=6ET92!E87-Y('1O(&%D9"!M;W)E(&9U;F-T:6]N86QI='D@:6YT;R!T:&ES
M('-Y<W1E;2X@($%L;"!T:&%T"GEO=2!N965D('1O(&1O(&ES('1O(&-R96%T
M92!A(&-A;&QB86-K('-A=&ES9GEI;F<@=&AE('!R;W1O='EP92!A<PID97-C
M<FEB960@:6X@=&AE(&YE>'0@<V5C=&EO;BP@=&AE;B!A9&0@:70@:6YT;R!T
M:&4@>UQT='M]979A;%1A8FQE?2X*"DEF('EO=2!L;V]K(&%T(&%N>2!O9B!T
M:&4@9F]L;&]W:6YG(&-A;&QB86-K<RP@>6]U('=I;&P@<V5E(&AO=R!I="!G
M971S"F5N=&5R960@:6YT;R!T:&4@;&ES="P@86YD('-O;64@8F%S:6,@<F%N
M9V4@8VAE8VMS('1H870@87)E(&1O;F4@=&\*;6%K92!S=7)E('1H870@=&AE
M(&-A;&QB86-K(&=E=',@=&AE(')I9VAT(&YU;6)E<B!O9B!P87)A;65T97)S
M(&%N9"!T:&4*;&EK92X*"@HE)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24*7'-U8G-E8W1I;VX@
M>T-A;&QB86-K(%)E9VES=')Y?0I<;&%B96Q[<V5C.F-A;&QB86-K<F5G:7-T
M<GE]"@I4:&4@8V%L;&)A8VMS('=I;&P@9V5T('1H96ER(&)R86YC:"!A<R!O
M;F4@<&%R86UE=&5R+B`@5&AE(&]T:&5R('!A<F%M971E<@II<R!T:&4@;G5M
M8F5R(&]F(&ET96US(&]N('1H92!L:7-T+"!I;F-L=61I;F<@=&AE(&9I<G-T
M('=O<F0N("!!;&P@8V%L;&)A8VMS"FUU<W0@<F5T=7)N(&$@;F5W;'D@86QL
M;V-A=&5D('M<='1[?6QE?2!L:7-T(&-O;G1A:6YI;F<@=&AE(')E='5R;B!V
M86QU92X*"D9O<B!E>&%M<&QE('M<='1[?2AF;V]<($%<($(I?2!W:6QL(&=E
M="!S96YT('M<='1[?3-](&%S('M<='1[?6%R9V-](&%S('=E;&P@87,*=&AE
M(&QI<W0@>UQT='M]*&9O;UP@05P@0BE](&%S('1H92![7'1T>WUB<F%N8VA]
M('!A<F%M971E<BX@(%1H:7,@;&ES="!I<PIS=&]R960@:6X@>UQT='M];&5]
M('-T<G5C='5R97,L('=H:6-H(&%R92!J=7-T(&$@<VEM<&QE('1R964O;&EN
M:V5D(&QI<W0N"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,GU<<W5B;&%B
M96Q[3E=E=F$W+45V84PM,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<
M<W5B<&%G97)E9GM.5V5V83<M179A3"TQ?7U]7&UO9&1E9GM%=F%L(&-A;&QB
M86-K('1Y<&5D969^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M
M179A3"TQ?7U]7&5N9&UO9&1E9@H@("`@='EP961E9@H@("`@;&4@*@H@("`@
M*"IE=F%L7V-B*0H@("`@("`@("@*("`@("`@("`@("`@8V]N<W0@:6YT(&%R
M9V,L"B`@("`@("`@("`@(&QE("H@8G)A;F-H"B`@("`@("`@*3L*7&YW=7-E
M9'M<7'M.5V5V83<M979A-BXR+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C
M<WLS?5QN=V1O8W-P87(*"E1H:7,@:7,@=&AE(&QO;VMU<"!S=')U8W1U<F4@
M=&AA="!W92=L;"!U<V4@=&\@<W1O<F4@86QL(&]F(&]U<@IC86QL8F%C:W,@
M:6XN("!)="!I<R!S:6UP;'D@82!L:7-T(&]F(&-O;6UA;F0@<W1R:6YG<R!T
M;R!M871C:"P@87,@=V5L;`IA<R!T:&4@9G5N8W1I;VX@8V%L;&)A8VMS(&%S
M(&1E9FEN960@86)O=F4N("!$;R!N;W1E('1H870@=&AE(&5V86QU871O<@II
M<R!C=7)R96YT;'D@8V%S92!S96YS:71I=F4N("!4:&%T(&ES('1O('-A>2!T
M:&%T(&!@>UQT='M]9F]O?2<G(&%N9`I@8'M<='1[?49/3WTG)R!W:6QL(&=E
M="!E=F%L=6%T960@9&EF9F5R971N=&QY+@H*7&YW96YD9&]C<WM]7&YW8F5G
M:6YC;V1E>S1]7'-U8FQA8F5L>TY7979A-RU%=F%)+3%]7&YW;6%R9VEN=&%G
M>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84DM,7U]?5QM
M;V1D969[179A;"!L;V]K=7`@<W1R=6-T?GM<;G=T86=S='EL97M]7'-U8G!A
M9V5R969[3E=E=F$W+45V84DM,7U]?5QE;F1M;V1D968*("`@('1Y<&5D968@
M<W1R=6-T(&5V86Q,;V]K=7!.;V1E(%Q["B`@("`@("`@8VAA<B`@("`J('=O
M<F0["B`@("`@("`@979A;%]C8B`@(&-A;&QB86-K.PH@("`@7'T@979A;$QO
M;VMU<$YO9&4["EQN=W5S961[7%Q[3E=E=F$W+65V838N,BTQ?7U<;G=E;F1C
M;V1E>WU<;G=B96=I;F1O8W-[-7U<;G=D;V-S<&%R"@I!;F0@;F]W+"!H97)E
M(&ES('1H92!L:7-T(&]F(&)U:6QT:6X@9G5N8W1I;VYS('1H870@=V4@<W5P
M<&]R="XN("!4:&4*9FEN86P@96QE;65N="!M=7-T(&)E(&$@<&%I<FEN9R!O
M9B![7'1T>WU.54Q,?7,@<V\@=&AA="!T:&4@;&]O:W5P"F9U;F-T:6]N(&MN
M;W=S('=H97)E('1O('-T;W`@=VAE;B!L;V]K:6YG('1H<F]U9V@@=&AE('1A
M8FQE+@H*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S9]7'-U8FQA8F5L>TY7
M979A-RU%=F%(+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A
M9V5R969[3E=E=F$W+45V84@M,7U]?5QM;V1D969[179A;"!L;V]K=7`@=&%B
M;&5^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A2"TQ?7U]
M7&5N9&UO9&1E9@H@("`@979A;$QO;VMU<$YO9&4@979A;%1A8FQE6UT@/0H@
M("`@7'L*("`@("`@("!<>R`B*R(@("`@("`@("`@("P@979A;%]C8E]A9&0@
M("`@("`@("`@(%Q]+`H@("`@("`@(%Q[("(M(B`@("`@("`@("`@+"!E=F%L
M7V-B7W-U8G1R86-T("`@("`@7'TL"B`@("`@("`@7'L@(BHB("`@("`@("`@
M("`L(&5V86Q?8V)?;75L=&EP;'D@("`@("!<?2P*("`@("`@("!<>R`B+R(@
M("`@("`@("`@("P@979A;%]C8E]D:79I9&4@("`@("`@(%Q]+`H*("`@("`@
M("!<>R`B,2LB("`@("`@("`@("P@979A;%]C8E]O;F5P;'5S("`@("`@(%Q]
M+`H@("`@("`@(%Q[("(Q+2(@("`@("`@("`@+"!E=F%L7V-B7V]N96UI;G5S
M("`@("`@7'TL"@H@("`@("`@(%Q[("(E(B`@("`@("`@("`@+"!E=F%L7V-B
M7VUO9'5L=7,@("`@("`@7'TL"@H@("`@("`@(%Q[("(\(B`@("`@("`@("`@
M+"!E=F%L7V-B7VQT("`@("`@("`@("`@7'TL"B`@("`@("`@7'L@(CP](B`@
M("`@("`@("`L(&5V86Q?8V)?;'1?97$@("`@("`@("!<?2P*("`@("`@("!<
M>R`B/B(@("`@("`@("`@("P@979A;%]C8E]G="`@("`@("`@("`@(%Q]+`H@
M("`@("`@(%Q[("(^/2(@("`@("`@("`@+"!E=F%L7V-B7V=T7V5Q("`@("`@
M("`@7'TL"B`@("`@("`@7'L@(CTB("`@("`@("`@("`L(&5V86Q?8V)?97%S
M:6=N("`@("`@("!<?2P*"B`@("`@("`@7'L@(F%N9"(@("`@("`@("`L(&5V
M86Q?8V)?86YD("`@("`@("`@("!<?2P*("`@("`@("!<>R`B;W(B("`@("`@
M("`@("P@979A;%]C8E]O<B`@("`@("`@("`@(%Q]+`H@("`@("`@(%Q[(")N
M;W0B("`@("`@("`@+"!E=F%L7V-B7VYO="`@("`@("`@("`@7'TL"B`@("`@
M("`@7'L@(FYU;&PB("`@("`@("`L(&5V86Q?8V)?;F]T("`@("`@("`@("!<
M?2P*"B`@("`@("`@7'L@(F%T;VTB("`@("`@("`L(&5V86Q?8V)?871O;2`@
M("`@("`@("!<?2P*("`@("`@("!<>R`B8V%R(B`@("`@("`@("P@979A;%]C
M8E]C87(@("`@("`@("`@(%Q]+`H@("`@("`@(%Q[(")C9'(B("`@("`@("`@
M+"!E=F%L7V-B7V-D<B`@("`@("`@("`@7'TL"B`@("`@("`@7'L@(F-O;G,B
M("`@("`@("`L(&5V86Q?8V)?8V]N<R`@("`@("`@("!<?2P*("`@("`@("!<
M>R`B;&ES="(@("`@("`@("P@979A;%]C8E]L:7-T("`@("`@("`@(%Q]+`H@
M("`@("`@(%Q[(")E<75A;"(@("`@("`@+"!E=F%L7V-B7V5Q=6%L("`@("`@
M("`@7'TL"@H@("`@("`@(%Q[(")I9B(@("`@("`@("`@+"!E=F%L7V-B7VEF
M("`@("`@("`@("`@7'TL"B`@("`@("`@7'L@(G5N;&5S<R(@("`@("`L(&5V
M86Q?8V)?=6YL97-S("`@("`@("!<?2P*("`@("`@("!<>R`B=VAE;B(@("`@
M("`@("P@979A;%]C8E]W:&5N("`@("`@("`@(%Q]+`H@("`@("`@(%Q[(")C
M;VYD(B`@("`@("`@+"!E=F%L7V-B7V-O;F0@("`@("`@("`@7'TL"B`@("`@
M("`@7'L@(G-E;&5C="(@("`@("`L(&5V86Q?8V)?<V5L96-T("`@("`@("!<
M?2P*"B`@("`@("`@7'L@(G!R:6YC(B`@("`@("`L(&5V86Q?8V)?<')I;F,@
M("`@("`@("!<?2P*("`@("`@("!<>R`B=&5R<')I(B`@("`@("P@979A;%]C
M8E]T97)P<FD@("`@("`@(%Q]+`H*("`@("`@("!<>R`B979A;"(@("`@("`@
M("P@979A;%]C8E]E=F%L("`@("`@("`@(%Q]+`H@("`@("`@(%Q[(")P<F]G
M,2(@("`@("`@+"!E=F%L7V-B7W!R;V<Q("`@("`@("`@7'TL"B`@("`@("`@
M7'L@(G!R;V<R(B`@("`@("`L(&5V86Q?8V)?<')O9S(@("`@("`@("!<?2P*
M("`@("`@("!<>R`B<')O9VXB("`@("`@("P@979A;%]C8E]P<F]G;B`@("`@
M("`@(%Q]+`H*("`@("`@("!<>R`B<V5T(B`@("`@("`@("P@979A;%]C8E]S
M970@("`@("`@("`@(%Q]+`H@("`@("`@(%Q[(")S971Q(B`@("`@("`@+"!E
M=F%L7V-B7W-E='$@("`@("`@("`@7'TL"B`@("`@("`@7'L@(G-E=&8B("`@
M("`@("`L(&5V86Q?8V)?<V5T<2`@("`@("`@("!<?2P*("`@("`@("!<>R`B
M96YU;2(@("`@("`@("P@979A;%]C8E]E;G5M("`@("`@("`@(%Q]+`H*("`@
M("`@("!<>R`B9&5F=6XB("`@("`@("P@979A;%]C8E]D969U;B`@("`@("`@
M(%Q]+`H*("`@("`@("!<>R`B9V,B("`@("`@("`@("P@979A;%]C8E]N;W1H
M:6YG("`@("`@(%Q]+`H@("`@("`@(%Q[(")G87)B86=E+6-O;&QE8W0B("P@
M979A;%]C8E]N;W1H:6YG("`@7'TL"@H@("`@("`@(%Q[($Y53$P@("`@("`@
M("`@+"!.54Q,("`@("`@("`@("`@("`@("`@7'T*("`@(%Q].PI<;G=U<V5D
M>UQ<>TY7979A-RUE=F$V+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLW
M?5QN=V1O8W-P87(*"B4E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<V5C=&EO;B![179A
M;'5A=&]R($-A;&QB86-K<WT*7&QA8F5L>W-E8SIE=F%L=6%T;W)C86QL8F%C
M:W-]"@I4:&5S92!C86QL8F%C:W,@=VEL;"!G970@=&AE(')A=R!B<F%N8V@@
M9F]R('=H:6-H('1H97D@<VAO=6QD('!R;V-E<W,N"E1H92!F:7)S="!E;&5M
M96YT(&]N('1H92!L:7-T(&ES('1H92!K97EW;W)D(&9O<B!W:&EC:"!W92!W
M97)E(&-A;&QE9"X*5&AE(')E;6%I;FEN9R!E;&5M96YT<R!A<F4@=&AE(&QI
M<W0@<&%R86UE=&5R<R!T;R!B92!U<V5D+B`@16%C:`IP87)A;65T97(@=7-E
M9"!S:&]U;&0@9V5T(&5V875L871E9"!U<VEN9R!T:&4@>UQT='M]979A;'5A
M=&5.;V1E*"E]"F9U;F-T:6]N+@H*)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)0I<<W5B<W5B<V5C=&EO;GL@>UQT='M];F]T:&EN
M9WT@?0H*5&AI<R!I<R!A(&1U;6UY(&9U;F-T:6]N('1H870@9&]E<R!N;W1H
M:6YG+"!A;F0@86QW87ES(')E='5R;G,@(E0B+B`@5&AI<PII<R!F;W(@=6YI
M;7!L96UE;G1E9"!P;&%C96AO;&1E<B!M971H;V1S(&QI:V4@8&!G8R<G(&9O
M<B!E>&%M<&QE+@H*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>SA]7'-U8FQA
M8F5L>TY7979A-RUE=F%,+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=E=F$W+65V84PM,7U]?5QM;V1D969[979A;"!C8B!N
M;W1H:6YG('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W
M+65V84PM,7U]?5QE;F1M;V1D968*("`@(&QE("H@979A;%]C8E]N;W1H:6YG
M*"!C;VYS="!I;G0@87)G8RP@;&4@*B!B<F%N8V@@*0I<;G=U<V5D>UQ<>TY7
M979A-RUE=F%5+3%]7%Q[3E=E=F$W+65V838N,BTQ?7U<;G=E;F1C;V1E>WU<
M;G=B96=I;F1O8W-[.7U<;G=D;V-S<&%R"EQN=V5N9&1O8W-[?5QN=V)E9VEN
M8V]D97LQ,'U<<W5B;&%B96Q[3E=E=F$W+65V854M,7U<;G=M87)G:6YT86=[
M>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M979A52TQ?7U]7&UO
M9&1E9GME=F%L(&-B(&YO=&AI;F<@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T
M>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M979A52TQ?7U]7&5N9&UO9&1E9@H@
M("`@7$Q!>WUE=F%L(&-B(&YO=&AI;F<@<')O=&]^>UQN=W1A9W-T>6QE>WU<
M<W5B<&%G97)E9GM.5V5V83<M979A3"TQ?7U<4D%[?0H@("`@7'L*("`@("`@
M("!R971U<FXH(&QE3F5W*"`B5"(@*2D["B`@("!<?0I<;G=U<V5D>UQ<>TY7
M979A-RUE=F$V+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLQ,7U<;G=D
M;V-S<&%R"@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)0I<<W5B<W5B<V5C=&EO;GL@>UQT='M]<V5T7"!H96QP97)]('T*"E1H
M:7,@:7,@8F%S:6-A;&QY(&$@;65T:&]D('1H870@96UB;V1I97,@8F]T:"!T
M:&4@9G5N8W1I;VYA;&ET:65S(&]F(`I[7'1T>WUS971Q?2!A;F0@>UQT='M]
M<V5T?2P@=&\@;6EN:6UI>F4@8V]D92!S<&%C92X*"E!A<W,@:6X@;VYE(&]F
M('1H97-E('1W;R!V86QU97,@=&\@<V5L96-T('1H92!F=6YC=&EO;F%L:71Y
M('-E="X*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S$R?5QS=6)L86)E;'M.
M5V5V83<M179A3BTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P
M86=E<F5F>TY7979A-RU%=F%.+3%]?7U<;6]D9&5F>T5V86P@8V(@<V5T(&AE
M;'!E<B!E;G5M?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V
M84XM,7U]?5QE;F1M;V1D968*96YU;2!S971F8VX@7'L@4U]3150L(%-?4T54
M42!<?3L*7&YW=7-E9'M<7'M.5V5V83<M979A-BXR+3%]?5QN=V5N9&-O9&5[
M?5QN=V)E9VEN9&]C<WLQ,WT@("`@("`*"EQN=V5N9&1O8W-[?5QN=V)E9VEN
M8V]D97LQ-'U<<W5B;&%B96Q[3E=E=F$W+45V84\M,7U<;G=M87)G:6YT86=[
M>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A3RTQ?7U]7&UO
M9&1E9GM%=F%L(&-B('-E="!H96QP97(@<')O=&]^>UQN=W1A9W-T>6QE>WU<
M<W5B<&%G97)E9GM.5V5V83<M179A3RTQ?7U]7&5N9&UO9&1E9@H@("`@;&4@
M*B!E=F%L7V-B7W-E=%]H96QP97(H(`H@("`@("`@("`@("`@("`@96YU;2!S
M971F8VX@9G5N8W1I;VXL"B`@("`@("`@("`@("`@("!C;VYS="!I;G0@87)G
M8RP@"B`@("`@("`@("`@("`@("!L92`J(&)R86YC:`H@("`@("`@("`@("`@
M("`@*0I<;G=U<V5D>UQ<>TY7979A-RU%=F%8+3%]7%Q[3E=E=F$W+65V838N
M,BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[,35]7&YW9&]C<W!A<@I<
M;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,39]7'-U8FQA8F5L>TY7979A-RU%
M=F%8+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=E=F$W+45V85@M,7U]?5QM;V1D969[179A;"!C8B!S970@:&5L<&5R(&EM
M<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W
M+45V85@M,7U]?5QE;F1M;V1D968*("`@(%Q,07M]179A;"!C8B!S970@:&5L
M<&5R('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V
M84\M,7U]7%)!>WT*("`@(%Q["B`@("`@("`@;&4@*B!N97=K97D["B`@("`@
M("`@;&4@*B!N97=V86QU93L*("`@("`@("!L92`J(&-U<G)E;G0["@H@("`@
M("`@(&EF("@A8G)A;F-H('Q\(&%R9V,@/"`S*2`@<F5T=7)N*"!L94YE=R@@
M(DY)3"(@*2`I.PH*("`@("`@("!C=7)R96YT(#T@8G)A;F-H+3YL:7-T7VYE
M>'0["B`@("`@("`@=VAI;&4@*"!C=7)R96YT("D*("`@("`@("!<>PH@("`@
M("`@("`@("!I9B`H(6-U<G)E;G0M/FQI<W1?;F5X="D*("`@("`@("`@("`@
M7'L*("`@("`@("`@("`@("`@(&YE=W9A;'5E(#T@;&5.97<H(").24PB("D[
M"B`@("`@("`@("`@(%Q](&5L<V4@7'L*("`@("`@("`@("`@("`@(&YE=W9A
M;'5E(#T@979A;'5A=&5.;V1E*&-U<G)E;G0M/FQI<W1?;F5X="D["B`@("`@
M("`@("`@(%Q]"@H@("`@("`@("`@("!I9B`H(&9U;F-T:6]N(#T](%-?4T54
M("D*("`@("`@("`@("`@("`@(&YE=VME>2`](&5V86QU871E3F]D92AC=7)R
M96YT*3L*"B`@("`@("`@("`@(&UA:6Y687),:7-T(#T@=F%R:6%B;&53970H
M(`H@("`@("`@("`@("`@("`@("`@("`@("`@("`@;6%I;E9A<DQI<W0L"B`@
M("`@("`@("`@("`@("`H(&9U;F-T:6]N(#T](%-?4T54("D_(&YE=VME>2T^
M9&%T82`Z(&-U<G)E;G0M/F1A=&$L"B`@("`@("`@("`@("`@("`@("`@("`@
M("`@("!N97=V86QU90H@("`@("`@("`@("`@("`@("`@("`@("`@("`@*3L*
M"B`@("`@("`@("`@(&EF("@@9G5N8W1I;VX@/3T@4U]3150@*0H@("`@("`@
M("`@("`@("`@;&57:7!E*&YE=VME>2D["@H@("`@("`@("`@("!I9B`H(6-U
M<G)E;G0M/FQI<W1?;F5X="D*("`@("`@("`@("`@7'L*("`@("`@("`@("`@
M("`@(&-U<G)E;G0@/2!.54Q,.PH@("`@("`@("`@("!<?2!E;'-E(%Q["B`@
M("`@("`@("`@("`@("!C=7)R96YT(#T@8W5R<F5N="T^;&ES=%]N97AT+3YL
M:7-T7VYE>'0["B`@("`@("`@("`@(%Q]"B`@("`@("`@7'T*("`@("`@("!R
M971U<FXH(&QE1'5P*&YE=W9A;'5E*2`I.PH@("`@7'T*7&YW=7-E9'M<7'M.
M5V5V83<M979A-BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[,3=]7&YW
M9&]C<W!A<@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)0I<<W5B<W5B<V5C=&EO;GL@>UQT='M]<V5T?2!]"@I4:&4@8F%S:6,@
M<&%R86T@;&ES="!F;W(@>UQT='M]<V5T?2!I<SL@>UQT='M]*'-E=%P@:V5Y
M7"!V86QU95P@:V5Y7"!V86QU95QN=VYE=VQI;F4*+BXN*7TN("!3;R!W92!N
M965D('1O('-K:7`@=&\@=&AE(&YE>'0@96QE;65N="!O;B!T:&4@;&ES="P@
M=&AE;B!S=&%R=`IS971T:6YG('9A<FEA8FQE<RX@(&)O=&@@=&AE(&ME>2!A
M;F0@=F%R:6%B;&4@=VEL;"!G970@979A;'5A=&5D+@H*7&YW96YD9&]C<WM]
M7&YW8F5G:6YC;V1E>S$X?5QS=6)L86)E;'M.5V5V83<M179A2"XR+3%]7&YW
M;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V
M84@N,BTQ?7U]7&UO9&1E9GM%=F%L(&-B('-E="!P<F]T;WY[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%(+C(M,7U]?5QE;F1M;V1D968*
M("`@(&QE("H@979A;%]C8E]S970H(&-O;G-T(&EN="!A<F=C+"!L92`J(&)R
M86YC:"`I"EQN=W5S961[7%Q[3E=E=F$W+45V85$M,7U<7'M.5V5V83<M979A
M-BXR+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLQ.7U<;G=D;V-S<&%R
M"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LR,'U<<W5B;&%B96Q[3E=E=F$W
M+45V85$M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5V5V83<M179A42TQ?7U]7&UO9&1E9GM%=F%L(&-B('-E="!I;7!L96UE
M;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%1
M+3%]?7U<96YD;6]D9&5F"B`@("!<3$%[?45V86P@8V(@<V5T('!R;W1O?GM<
M;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84@N,BTQ?7U<4D%[
M?0H@("`@7'L*("`@("`@("!R971U<FXH(&5V86Q?8V)?<V5T7VAE;'!E<B@@
M4U]3150L(&%R9V,L(&)R86YC:"`I("D["B`@("!<?0I<;G=U<V5D>UQ<>TY7
M979A-RUE=F$V+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLR,7U<;G=D
M;V-S<&%R"@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)0I<<W5B<W5B<V5C=&EO;GL@>UQT='M]<V5T<7T@?0H*5&AE(&)A<VEC
M('!A<F%M(&QI<W0@9F]R('M<='1[?7-E='%](&ES.R![7'1T>WTH<V5T<5P@
M:V5Y7"!V86QU95P@:V5Y7"!V86QU95QN=VYE=VQI;F4*+BXN*7TN("!3;R!W
M92!N965D('1O('-K:7`@=&\@=&AE(&YE>'0@96QE;65N="!O;B!T:&4@;&ES
M="P@=&AE;B!S=&%R=`IS971T:6YG('9A<FEA8FQE<RX@(%1H92!K97D@<&]R
M=&EO;B!O9B!T:&ES('!A:7)I;F<@:7,@;F]T(&5V86QU871E9"P@"G=H:6QE
M('1H92!V86QU92!I<RX*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LR,GU<
M<W5B;&%B96Q[3E=E=F$W+45V84DN,BTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G
M<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%)+C(M,7U]?5QM;V1D969[
M179A;"!C8B!S971Q('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=E=F$W+45V84DN,BTQ?7U]7&5N9&UO9&1E9@H@("`@;&4@*B!E=F%L7V-B
M7W-E='$H(&-O;G-T(&EN="!A<F=C+"!L92`J(&)R86YC:"`I"EQN=W5S961[
M7%Q[3E=E=F$W+45V85(M,7U<7'M.5V5V83<M979A-BXR+3%]?5QN=V5N9&-O
M9&5[?5QN=V)E9VEN9&]C<WLR,WU<;G=D;V-S<&%R"EQN=V5N9&1O8W-[?5QN
M=V)E9VEN8V]D97LR-'U<<W5B;&%B96Q[3E=E=F$W+45V85(M,7U<;G=M87)G
M:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A4BTQ
M?7U]7&UO9&1E9GM%=F%L(&-B('-E='$@:6UP;&5M96YT871I;VY^>UQN=W1A
M9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A4BTQ?7U]7&5N9&UO9&1E
M9@H@("`@7$Q!>WU%=F%L(&-B('-E='$@<')O=&]^>UQN=W1A9W-T>6QE>WU<
M<W5B<&%G97)E9GM.5V5V83<M179A22XR+3%]?5Q207M]"B`@("!<>PH@("`@
M("`@(')E='5R;B@@979A;%]C8E]S971?:&5L<&5R*"!37U-%5%$L(&%R9V,L
M(&)R86YC:"`I("D["B`@("!<?0I<;G=U<V5D>UQ<>TY7979A-RUE=F$V+3%]
M?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLR-7U<;G=D;V-S<&%R"@HE)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E"EQS=6)S=6)S
M96-T:6]N>R![7'1T>WUE;G5M?2!]"@I%;G5M('=I;&P@8W)E871E(&$@<V5R
M:65S(&]F('9A<FEA8FQE<RP@:6YC<F5M96YT:6YG('1H96ER('9A;'5E(&9O
M<B!E86-H"F]N92!E;F-O=6YT97)E9"X@($%N>2!L:7-T<R!W:6QL($Y/5"!B
M92!E=F%L=6%T960L(&)U="!R871H97(@<VMI<'!E9`IF;W(@;F]W+B`@*%-I
M;F-E('1H:7,@:7,@;F]T(&$@=F%L:60@0V]M;6]N($QI<W`@;65T:&]D+"!)
M(&-A;B!I;7!L96UE;G0*:70@:&]W979E<B!)(&QI:V4N(&AE:&5H92XI("`@
M5&AE(&9I;F%L('9A;'5E('=I;&P@8F4@<F5T=7)N960N"@II93H@("AE;G5M
M(&$@8B!C(&0@92D@"G=I;&P@<F5S=6QT(&EN("AA(#T@,"DL("AB(#T@,2D@
M+BXN("AE(#T@-"DL(&%N9"!W:6QL(')E='5R;B`G-"<N"@I<;G=E;F1D;V-S
M>WU<;G=B96=I;F-O9&5[,C9]7'-U8FQA8F5L>TY7979A-RU%=F%)+C,M,7U<
M;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M
M179A22XS+3%]?7U<;6]D9&5F>T5V86P@8V(@96YU;2!P<F]T;WY[7&YW=&%G
M<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%)+C,M,7U]?5QE;F1M;V1D
M968*("`@(&QE("H@979A;%]C8E]E;G5M*"!C;VYS="!I;G0@87)G8RP@;&4@
M*B!B<F%N8V@@*0I<;G=U<V5D>UQ<>TY7979A-RU%=F%2+C(M,7U<7'M.5V5V
M83<M979A-BXR+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLR-WU<;G=D
M;V-S<&%R"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LR.'U<<W5B;&%B96Q[
M3E=E=F$W+45V85(N,BTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS
M=6)P86=E<F5F>TY7979A-RU%=F%2+C(M,7U]?5QM;V1D969[179A;"!C8B!E
M;G5M(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=E=F$W+45V85(N,BTQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU%=F%L(&-B
M(&5N=6T@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M
M179A22XS+3%]?5Q207M]"B`@("!<>PH@("`@("`@(&QE("H@;F5W=F%L=64[
M"B`@("`@("`@;&4@*B!C=7)R96YT.PH@("`@("`@(&EN="!C;W5N="`]("TQ
M.PH@("`@("`@(&-H87(@=F%L=65;,39=.PH*("`@("`@("!I9B`H(6)R86YC
M:"!\?"!A<F=C(#P@,BD@(')E='5R;B@@;&5.97<H(").24PB("D@*3L*"B`@
M("`@("`@8W5R<F5N="`](&)R86YC:"T^;&ES=%]N97AT.PH@("`@("`@('=H
M:6QE("@@8W5R<F5N="`I"B`@("`@("`@7'L*("`@("`@("`@("`@:68@*&-U
M<G)E;G0M/F1A=&$I"B`@("`@("`@("`@(%Q["B`@("`@("`@("`@("`@("!S
M<')I;G1F*"!V86QU92P@(B5D(BP@*RMC;W5N="D["@H@("`@("`@("`@("`@
M("`@;6%I;E9A<DQI<W0@/2!V87)I86)L95-E=%-T<FEN9R@@"B`@("`@("`@
M("`@("`@("`@("`@("`@("`@("`@("`@;6%I;E9A<DQI<W0L"B`@("`@("`@
M("`@("`@("`@("`@("`@("`@("`@("`@8W5R<F5N="T^9&%T82P*("`@("`@
M("`@("`@("`@("`@("`@("`@("`@("`@("!V86QU90H@("`@("`@("`@("`@
M("`@("`@("`@("`@("`@("`@("D["B`@("`@("`@("`@(%Q]"B`@("`@("`@
M("`@(&-U<G)E;G0@/2!C=7)R96YT+3YL:7-T7VYE>'0["B`@("`@("`@7'T*
M"B`@("`@("`@:68@*&-O=6YT(#T]("TQ*0H@("`@("`@("`@("!R971U<FXH
M(&QE3F5W*"`B3DE,(B`I("D["B`@("`@("`@96QS90H@("`@("`@("`@("!R
M971U<FXH(&5V86Q#87-T26YT5&],92AC;W5N="D@*3L*("`@(%Q]"EQN=W5S
M961[7%Q[3E=E=F$W+65V838M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S
M>S(Y?5QN=V1O8W-P87(*"@HE)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E"EQS=6)S=6)S96-T:6]N>R!C=6UE:&5L<&5R('T*"E-I
M;F-E($%D9"P@4W5B=')A8W0L($UU;'1I<&QY(&%N9"!$:79I9&4@87)E(&%L
M;"!B87-I8V%L;'D@=&AE('-A;64*9G5N8W1I;VXL('=I=&@@;VYL>2!A('-M
M86QL(&1I9F9E<F5N8V4L('=E('=I;&P@86)S=')A8W0@;W5T('1H96ER"F-O
M;6UO;F%L:71I97,@:6YT;R!T:&ES(&!@8W5M92!H96QP97(G)R!M971H;V0N
M("!)="!B87-I8V%L;'D*86-C=6UU;&%T97,@:6X@=VAI8VAE=F5R('-T>6QE
M(&ES(&1E9FEN960@8GD@=&AE('M<='1[?69U;F-T:6]N?0IP87)A;65T97(N
M("!)="!S=&%R=',@;V9F(&)Y('-E='1I;F<@=&AE(&%C8W5M=6QA=&]R('1O
M('1H92![7'1T>WUV86QU97T*<&%S<V5D(&EN+"!A;F0@=V]R:W,@86QO;F<@
M=&AE('M<='1[?6)R86YC:'T@<&%S<V5D(&EN+B`@5&AE(')E<W5L="!V86QU
M90II<R!R971U<FYE9"X*"E1O(&1E9FEN92!W:&EC:"!M871H96UA=&EC86P@
M9G5N8W1I;VX@;F5E9',@=&\@8F4@9&]N92P@=V4@=VEL;"!P87-S(&EN"G1H
M92![7'1T>WUF=6YC=&EO;GT@87,@;VYE(&]F('1H92!F;VQL;W=I;F<@96YU
M;2!V86QU97,N("!)="!I<R!P<F5T='D*979I9&5N="!W:&EC:"!O;F4@<W!E
M8VEF:65S('=H870N"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,S!]7'-U
M8FQA8F5L>TY7979A-RU%=F%/+C(M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T
M>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A3RXR+3%]?7U<;6]D9&5F>T5V
M86P@8V(@8W5M92!H96QP97(@96YU;7Y[7&YW=&%G<W1Y;&5[?5QS=6)P86=E
M<F5F>TY7979A-RU%=F%/+C(M,7U]?5QE;F1M;V1D968*96YU;2!C=6UE9F-N
M(%Q[($-?3D].12P@0U]!1$0L($-?4U5"5%)!0U0L($-?355,5$E03%DL($-?
M1$E6241%(%Q].PI<;G=U<V5D>UQ<>TY7979A-RUE=F$V+C(M,7U]7&YW96YD
M8V]D97M]7&YW8F5G:6YD;V-S>S,Q?5QN=V1O8W-P87(*"EQN=V5N9&1O8W-[
M?5QN=V)E9VEN8V]D97LS,GU<<W5B;&%B96Q[3E=E=F$W+45V85`M,7U<;G=M
M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A
M4"TQ?7U]7&UO9&1E9GM%=F%L(&-B(&-U;64@:&5L<&5R('!R;W1O?GM<;G=T
M86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85`M,7U]?5QE;F1M;V1D
M968*("`@(&EN=`H@("`@979A;%]C=6UE7VAE;'!E<B@*("`@("`@("`@("`@
M96YU;2!C=6UE9F-N(&9U;F-T:6]N+`H@("`@("`@("`@("!I;G0@=F%L=64L
M"B`@("`@("`@("`@(&QE("H@8G)A;F-H"B`@("`I(`I<;G=U<V5D>UQ<>TY7
M979A-RU%=F%9+3%]7%Q[3E=E=F$W+65V838N,BTQ?7U<;G=E;F1C;V1E>WU<
M;G=B96=I;F1O8W-[,S-]7&YW9&]C<W!A<@H*5&AE(&)A<VEC(&UE=&AO9&]L
M;V=Y(&AE<F4@:7,@=&AA="!W:&EL92!T:&5R92!I<R!A('!A<F%M971E<B!O
M;B!T:&4*;&ES="P@=V4@979A;'5A=&4@:70L('1H96X@8V%S="!I="!T;R!A
M;B!I;G1E9V5R+"!T:&5N(&%C8W5M=6QA=&4@:70*;VYT;R![7'1T>WUV86QU
M97TN("!/;F-E('=E)W9E(')U;B!O=70@;V8@<&%R86UE=&5R<RP@<F5T=7)N
M('1H90I[7'1T>WUV86QU97TN"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[
M,S1]7'-U8FQA8F5L>TY7979A-RU%=F%9+3%]7&YW;6%R9VEN=&%G>WM<;G=T
M86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85DM,7U]?5QM;V1D969[
M179A;"!C8B!C=6UE(&AE;'!E<B!I;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%9+3%]?7U<96YD;6]D9&5F"B`@
M("!<3$%[?45V86P@8V(@8W5M92!H96QP97(@<')O=&]^>UQN=W1A9W-T>6QE
M>WU<<W5B<&%G97)E9GM.5V5V83<M179A4"TQ?7U<4D%[?0H@("`@7'L*("`@
M("`@("!I;G0@;F5W=F%L=64@/2`P.PH@("`@("`@(&EN="!F:7)S="`](#$[
M"B`@("`@("`@;&4@*B!T96UP(#T@8G)A;F-H.PH@("`@("`@(&QE("H@=F%L
M=65?;&4["B`@("`@("`@8VAA<B`J('1V86P["B`@("`@("`@:68@*"%B<F%N
M8V@I(')E='5R;B@@,"`I.PH*("`@("`@("!W:&EL92`H=&5M<"D*("`@("`@
M("!<>PH@("`@("`@("`@("!V86QU95]L92`](&5V86QU871E3F]D92AT96UP
M*3L@"B`@("`@("`@("`@(&YE=W9A;'5E(#T@979A;$-A<W1,951O26YT*'9A
M;'5E7VQE*3L*("`@("`@("`@("`@;&57:7!E*'9A;'5E7VQE*3L*"B`@("`@
M("`@("`@('-W:71C:"AF=6YC=&EO;BD*("`@("`@("`@("`@7'L*("`@("`@
M("`@("`@8V%S92@@0U]!1$0@*3H*("`@("`@("`@("`@("`@('9A;'5E("L]
M(&YE=W9A;'5E.PH@("`@("`@("`@("`@("`@8G)E86L["@H@("`@("`@("`@
M("!C87-E*"!#7U-50E1204-4("DZ"B`@("`@("`@("`@("`@("!V86QU92`M
M/2!N97=V86QU93L*("`@("`@("`@("`@("`@(&)R96%K.PH*("`@("`@("`@
M("`@8V%S92@@0U]-54Q425!,62`I.@H@("`@("`@("`@("`@("`@=F%L=64@
M*CT@;F5W=F%L=64["B`@("`@("`@("`@("`@("!B<F5A:SL*"B`@("`@("`@
M("`@(&-A<V4H($-?1$E6241%("DZ"B`@("`@("`@("`@("`@("!V86QU92`O
M/2!N97=V86QU93L*("`@("`@("`@("`@("`@(&)R96%K.PH@("`@("`@("`@
M("!<?0H*("`@("`@("`@("`@=&5M<"`]('1E;7`M/FQI<W1?;F5X=#L*("`@
M("`@("!<?0H*("`@("`@("!R971U<FXH('9A;'5E("D["B`@("!<?0I<;G=U
M<V5D>UQ<>TY7979A-RUE=F$V+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C
M<WLS-7U<;G=D;V-S<&%R"@HE)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E"EQS=6)S=6)S96-T:6]N>R!A9&1I=&EO;B!]"@I4:&ES
M(&AA;F1L97,@;&ES=',@<W5C:"!A<R![7'1T>WTH*UP@,EP@,RE]+"![7'1T
M>WTH*UP@.5P@9F]O*7TL(&%N9"!S;R!O;BX*5V4@<VEM<&QY(&-H96-K('1O
M('-E92!H;W<@;6%N>2!P87)A;65T97)S(&%R92!P87-S960@:6XL(&%N9"!I
M9@II="!I<R!V86QI9"!F;W(@;W5R('!U<G!O<V5S+"!C86QL('1H92!A8F]V
M92![7'1T>WUC=6UE7"!H96QP97)]+@H*7&YW96YD9&]C<WM]7&YW8F5G:6YC
M;V1E>S,V?5QS=6)L86)E;'M.5V5V83<M179A2"XS+3%]7&YW;6%R9VEN=&%G
M>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84@N,RTQ?7U]
M7&UO9&1E9GM%=F%L(&-B(&%D9"!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P
M86=E<F5F>TY7979A-RU%=F%(+C,M,7U]?5QE;F1M;V1D968*("`@(&QE("H@
M979A;%]C8E]A9&0H(&-O;G-T(&EN="!A<F=C+"!L92`J(&)R86YC:"`I"EQN
M=W5S961[7%Q[3E=E=F$W+45V85$N,BTQ?5Q<>TY7979A-RUE=F$V+C(M,7U]
M7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S,W?5QN=V1O8W-P87(*7&YW96YD
M9&]C<WM]7&YW8F5G:6YC;V1E>S,X?5QS=6)L86)E;'M.5V5V83<M179A42XR
M+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E
M=F$W+45V85$N,BTQ?7U]7&UO9&1E9GM%=F%L(&-B(&%D9"!I;7!L96UE;G1A
M=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%1+C(M
M,7U]?5QE;F1M;V1D968*("`@(%Q,07M]179A;"!C8B!A9&0@<')O=&]^>UQN
M=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A2"XS+3%]?5Q207M]
M"B`@("!<>PH@("`@("`@(&-H87(@*B!R971U<FYV86P@/2!.54Q,.PH*("`@
M("`@("!I9B`H(6)R86YC:"!\?"!A<F=C(#P@,BD@<F5T=7)N*"!L94YE=R@@
M(DY)3"(@*2`I.PH*("`@("`@("!R971U<FXH(&5V86Q#87-T26YT5&],92@*
M("`@("`@("`@("`@("`@("`@("`@("`@("`@(&5V86Q?8W5M95]H96QP97(H
M(`H@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("!#7T%$1"P*
M("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@,"P@"B`@("`@
M("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@(&)R86YC:"T^;&ES=%]N
M97AT"B`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("D*("`@
M("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`I"B`@("`@("`@("`@
M("`@("D["B`@("!<?0I<;G=U<V5D>UQ<>TY7979A-RUE=F$V+3%]?5QN=V5N
M9&-O9&5[?5QN=V)E9VEN9&]C<WLS.7U<;G=D;V-S<&%R"@H*)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<W5B<V5C=&EO
M;GL@<W5B=')A8W1I;VX@?0H*5&AI<R!H86YD;&5S(&QI<W1S('-U8V@@87,@
M>UQT='M]*"U<(#)<(#,I?2P@>UQT='M]*"U<(#E<(&9O;RE]+"!A;F0@<V\@
M;VXN"E=E('-I;7!L>2!C:&5C:R!T;R!S964@:&]W(&UA;GD@<&%R86UE=&5R
M<R!A<F4@<&%S<V5D(&EN+"!A;F0@:68*:70@:7,@=F%L:60@9F]R(&]U<B!P
M=7)P;W-E<RP@8V%L;"!T:&4@86)O=F4@>UQT='M]8W5M95P@:&5L<&5R?2X*
M"E=E(&AA=F4@=&\@9&\@86X@97AT<F$@8VAE8VL@:6X@:&5R92!T;R!H86YD
M;&4@:71E;7,@<W5C:"!A<R![7'1T>WTH+5P@,BE]"G=H97)E('=E(&IU<W0@
M;F5E9"!T;R!M=6QT:7!L>2!T:&4@<&%R86UE=&5R(&)Y(&YE9V%T:79E(&]N
M92!A;F0@<F5T=7)N"FET+@H*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S0P
M?5QS=6)L86)E;'M.5V5V83<M179A32TQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G
M<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%-+3%]?7U<;6]D9&5F>T5V
M86P@8V(@<W5B=')A8W0@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5V5V83<M179A32TQ?7U]7&5N9&UO9&1E9@H@("`@;&4@*B!E=F%L7V-B
M7W-U8G1R86-T*"!C;VYS="!I;G0@87)G8RP@;&4@*B!B<F%N8V@@*0I<;G=U
M<V5D>UQ<>TY7979A-RU%=F%6+3%]7%Q[3E=E=F$W+65V838N,BTQ?7U<;G=E
M;F1C;V1E>WU<;G=B96=I;F1O8W-[-#%]7&YW9&]C<W!A<@I<;G=E;F1D;V-S
M>WU<;G=B96=I;F-O9&5[-#)]7'-U8FQA8F5L>TY7979A-RU%=F%6+3%]7&YW
M;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V
M858M,7U]?5QM;V1D969[179A;"!C8B!S=6)T<F%C="!I;7!L96UE;G1A=&EO
M;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%6+3%]?7U<
M96YD;6]D9&5F"B`@("!<3$%[?45V86P@8V(@<W5B=')A8W0@<')O=&]^>UQN
M=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A32TQ?7U<4D%[?0H@
M("`@7'L*("`@("`@("!I;G0@9FER<W1I=&5M(#T@,#L*("`@("`@("!L92`J
M(&QE9FER<W0["B`@("`@("`@8VAA<B`J('1V86P["@H@("`@("`@(&EF("@A
M8G)A;F-H('Q\(&%R9V,@/"`R*2!R971U<FXH(&QE3F5W*"`B3DE,(B`I("D[
M"@H@("`@("`@(&QE9FER<W0@/2!E=F%L=6%T94YO9&4H(&)R86YC:"T^;&ES
M=%]N97AT("D["B`@("`@("`@9FER<W1I=&5M(#T@979A;$-A<W1,951O26YT
M*"!L969I<G-T("D["B`@("`@("`@;&57:7!E*"!L969I<G-T("D["@H@("`@
M("`@(&EF("AA<F=C(#T](#(I"B`@("`@("`@7'L*("`@("`@("`@("`@<F5T
M=7)N*"!E=F%L0V%S=$EN=%1O3&4H("TQ("H@9FER<W1I=&5M*2`I.PH@("`@
M("`@(%Q]"B`@("`@("`@"B`@("`@("`@<F5T=7)N*"!E=F%L0V%S=$EN=%1O
M3&4H"B`@("`@("`@("`@("`@("`@("`@("`@("`@("!E=F%L7V-U;65?:&5L
M<&5R*"`*("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@0U]3
M54)44D%#5"P*("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@
M9FER<W1I=&5M+"`*("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@
M("`@8G)A;F-H+3YL:7-T7VYE>'0M/FQI<W1?;F5X=`H@("`@("`@("`@("`@
M("`@("`@("`@("`@("`@("`@("`@("`I"B`@("`@("`@("`@("`@("`@("`@
M("`@("`@("`@("`@("`@*0H@("`@("`@("`@("`@("`I.PH@("`@7'T*7&YW
M=7-E9'M<7'M.5V5V83<M979A-BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O
M8W-[-#-]7&YW9&]C<W!A<@HE)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E"EQS=6)S=6)S96-T:6]N>R!M=6QT:7!L:6-A=&EO;B!]
M"@I4:&ES(&AA;F1L97,@;&ES=',@<W5C:"!A<R![7'1T>WTH*EP@,EP@,RE]
M+"![7'1T>WTH*EP@.5P@9F]O*7TL(&%N9"!S;R!O;BX@(%=E"G-I;7!L>2!C
M:&5C:R!T;R!S964@:&]W(&UA;GD@<&%R86UE=&5R<R!A<F4@<&%S<V5D(&EN
M+"!A;F0@:68@:70@:7,*=F%L:60@9F]R(&]U<B!P=7)P;W-E<RP@8V%L;"!T
M:&4@86)O=F4@>UQT='M]8W5M95P@:&5L<&5R?2X*"E-I;F-E('=E)W)E(&%C
M8W5M=6QA=&EN9R!M=6QT:7!L:6-A=&EO;G,L('=E(&YE960@=&\@<W1A<G0@
M=&AI<R!O;F4@;V9F"G=I=&@@82![7'1T>WTQ?2!R871H97(@=&AA;B!T:&4@
M>UQT='M],'T@86)O=F4L('-I;F-E('=E(&UU<W0@<W1A<G0@;V9F('1H90IA
M8V-U;75L871O<B!W:71H('1H92!M=6QT:7!L:6-A=&EV92!I9&5N=&ET>2P@
M86YD(&YO="!T:&4@861D871I=F4*:61E;G1I='DN"@I<;G=E;F1D;V-S>WU<
M;G=B96=I;F-O9&5[-#1]7'-U8FQA8F5L>TY7979A-RU%=F%-+C(M,7U<;G=M
M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A
M32XR+3%]?7U<;6]D9&5F>T5V86P@8V(@;75L=&EP;'D@<')O=&]^>UQN=W1A
M9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A32XR+3%]?7U<96YD;6]D
M9&5F"B`@("!L92`J(&5V86Q?8V)?;75L=&EP;'DH(&-O;G-T(&EN="!A<F=C
M+"!L92`J(&)R86YC:"`I"EQN=W5S961[7%Q[3E=E=F$W+45V858N,BTQ?5Q<
M>TY7979A-RUE=F$V+C(M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S0U
M?5QN=V1O8W-P87(*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S0V?5QS=6)L
M86)E;'M.5V5V83<M179A5BXR+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL
M97M]7'-U8G!A9V5R969[3E=E=F$W+45V858N,BTQ?7U]7&UO9&1E9GM%=F%L
M(&-B(&UU;'1I<&QY(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U
M8G!A9V5R969[3E=E=F$W+45V858N,BTQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!
M>WU%=F%L(&-B(&UU;'1I<&QY('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A
M9V5R969[3E=E=F$W+45V84TN,BTQ?7U<4D%[?0H@("`@7'L*("`@("`@("!I
M9B`H(6)R86YC:"!\?"!A<F=C(#P@,BD@<F5T=7)N*"!L94YE=R@@(DY)3"(@
M*2`I.PH*("`@("`@("!R971U<FXH(&5V86Q#87-T26YT5&],92@*("`@("`@
M("`@("`@("`@("`@("`@("`@("`@(&5V86Q?8W5M95]H96QP97(H(`H@("`@
M("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("!#7TU53%1)4$Q9+`H@
M("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`Q+"`*("`@("`@
M("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@8G)A;F-H+3YL:7-T7VYE
M>'0*("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@*0H@("`@
M("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("D*("`@("`@("`@("`@
M("`@*3L*("`@(%Q]"EQN=W5S961[7%Q[3E=E=F$W+65V838M,7U]7&YW96YD
M8V]D97M]7&YW8F5G:6YD;V-S>S0W?5QN=V1O8W-P87(*"@HE)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E"EQS=6)S=6)S96-T:6]N
M>R!D:79I9&4@?0H*5&AI<R!H86YD;&5S(&QI<W1S('-U8V@@87,@>UQT='M]
M*"]<(#)<(#,I?2P@>UQT='M]*"]<(#E<(&9O;RE]+"!A;F0@<V\@;VXN"E=E
M('-I;7!L>2!C:&5C:R!T;R!S964@:&]W(&UA;GD@<&%R86UE=&5R<R!A<F4@
M<&%S<V5D(&EN+"!A;F0@:68*:70@:7,@=F%L:60@9F]R(&]U<B!P=7)P;W-E
M<RP@8V%L;"!T:&4@86)O=F4@>UQT='M]8W5M95P@:&5L<&5R?2X*"E-I;F-E
M('=E)W)E(&%C8W5M=6QA=&EN9R!D:79I<VEO;G,L('=E(&YE960@=&\@<W1A
M<G0@=&AI<R!O;F4@;V9F(`IW:71H('1H92!F:7)S="!N=6UB97(@<&%S<V5D
M(&EN(&%S('1H92!I;FET:6%L('9A;'5E+@H*3VYE('1H:6YG('1H870@=V4@
M9&\@;F]T(&-U<G)E;G1L>2!S=7!P;W)T(&ES('M<='1[?2@O7"`R*7T@=VAI
M8V@@<VAO=6QD"GEI96QD('M<='1[?3`N-7T@;W(@8&!O;F4@:&%L9B<G+BXN
M(&EN=F5R<V5S(&]F(&YU;6)E<G,N("!3:6YC92!A;&P@;6%T:`II<R!C=7)R
M96YT;'D@:6YT96=E<B!B87-E9"P@86YD(&YO="!R96%L(&)A<V5D+"!I="!W
M;W5L9&XG="!M86ME('-E;G-E"G1O(&EM<&QE;65N="!T:&ES('EE="X*"EQN
M=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LT.'U<<W5B;&%B96Q[3E=E=F$W+45V
M84LM,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.
M5V5V83<M179A2RTQ?7U]7&UO9&1E9GM%=F%L(&-B(&1I=FED92!P<F]T;WY[
M7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%++3%]?7U<96YD
M;6]D9&5F"B`@("!L92`J(&5V86Q?8V)?9&EV:61E*"!C;VYS="!I;G0@87)G
M8RP@;&4@*B!B<F%N8V@@*0I<;G=U<V5D>UQ<>TY7979A-RU%=F%4+3%]7%Q[
M3E=E=F$W+65V838N,BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[-#E]
M7&YW9&]C<W!A<@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[-3!]7'-U8FQA
M8F5L>TY7979A-RU%=F%4+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=E=F$W+45V850M,7U]?5QM;V1D969[179A;"!C8B!D
M:79I9&4@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5V5V83<M179A5"TQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU%=F%L(&-B
M(&1I=FED92!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A
M-RU%=F%++3%]?5Q207M]"B`@("!<>PH@("`@("`@(&EN="!F:7)S=&ET96T@
M/2`P.PH@("`@("`@(&QE("H@;&5F:7)S=#L*("`@("`@("!I9B`H(6)R86YC
M:"!\?"!A<F=C(#P@,BD@<F5T=7)N*"!L94YE=R@@(DY)3"(@*2`I.PH*("`@
M("`@("!L969I<G-T(#T@979A;'5A=&5.;V1E*"!B<F%N8V@M/FQI<W1?;F5X
M="`I.PH@("`@("`@(&9I<G-T:71E;2`](&5V86Q#87-T3&54;TEN="@@;&5F
M:7)S="`I.PH@("`@("`@(&QE5VEP92@@;&5F:7)S="`I.PH*("`@("`@("!R
M971U<FXH(&5V86Q#87-T26YT5&],92@*("`@("`@("`@("`@("`@("`@("`@
M("`@("`@(&5V86Q?8W5M95]H96QP97(H(`H@("`@("`@("`@("`@("`@("`@
M("`@("`@("`@("`@("`@("!#7T1)5DE$12P*("`@("`@("`@("`@("`@("`@
M("`@("`@("`@("`@("`@("`@9FER<W1I=&5M+"`*("`@("`@("`@("`@("`@
M("`@("`@("`@("`@("`@("`@("`@8G)A;F-H+3YL:7-T7VYE>'0M/FQI<W1?
M;F5X=`H@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`I"B`@
M("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@*0H@("`@("`@("`@
M("`@("`I.PH@("`@7'T*7&YW=7-E9'M<7'M.5V5V83<M979A-BTQ?7U<;G=E
M;F1C;V1E>WU<;G=B96=I;F1O8W-[-3%]7&YW9&]C<W!A<@H*)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<W5B<V5C=&EO
M;GL@;VYE<&QU<R!]"@I4:&ES(&AA;F1L97,@;&ES=',@<W5C:"!A<R![7'1T
M>WTH,2M<(#,I?2P@>UQT='M]*#$K7"!F;V\I?2P@86YD('-O(&]N+@H*5&AI
M<R!B87-I8V%L;'D@:G5S="!C;VYV97)T<R!T:&4@979A;'5A=&5D('!A<F%M
M971E<B!T;R!A;B!I;G1E9V5R+`II;F-R96UE;G1S(&ET+"!T:&5N(')E='5R
M;G,@=&AA="!V86QU92!B86-K('1O('1H92!C86QL97(N"@I<;G=E;F1D;V-S
M>WU<;G=B96=I;F-O9&5[-3)]7'-U8FQA8F5L>TY7979A-RU%=F%,+C(M,7U<
M;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M
M179A3"XR+3%]?7U<;6]D9&5F>T5V86P@8V(@;VYE<&QU<R!P<F]T;WY[7&YW
M=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%,+C(M,7U]?5QE;F1M
M;V1D968*("`@(&QE("H@979A;%]C8E]O;F5P;'5S*"!C;VYS="!I;G0@87)G
M8RP@;&4@*B!B<F%N8V@@*0I<;G=U<V5D>UQ<>TY7979A-RU%=F%5+3%]7%Q[
M3E=E=F$W+65V838N,BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[-3-]
M7&YW9&]C<W!A<@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[-31]7'-U8FQA
M8F5L>TY7979A-RU%=F%5+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=E=F$W+45V854M,7U]?5QM;V1D969[179A;"!C8B!O
M;F5P;'5S(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R
M969[3E=E=F$W+45V854M,7U]?5QE;F1M;V1D968*("`@(%Q,07M]179A;"!C
M8B!O;F5P;'5S('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E
M=F$W+45V84PN,BTQ?7U<4D%[?0H@("`@7'L*("`@("`@("!L92`J(')E=&QE
M.PH@("`@("`@(&EN="!V86QU93L*"B`@("`@("`@:68@*"%B<F%N8V@@?'P@
M87)G8R`\(#(I(')E='5R;B@@;&5.97<H(").24PB("D@*3L*"B`@("`@("`@
M<F5T;&4@/2!E=F%L=6%T94YO9&4H(&)R86YC:"T^;&ES=%]N97AT("D[(`H@
M("`@("`@('9A;'5E(#T@979A;$-A<W1,951O26YT*"!R971L92`I.PH@("`@
M("`@(&QE5VEP92@@<F5T;&4@*3L*"B`@("`@("`@<F5T=7)N*"!E=F%L0V%S
M=$EN=%1O3&4H=F%L=64@*R`Q*2`I.PH@("`@7'T*7&YW=7-E9'M<7'M.5V5V
M83<M979A-BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[-35]7&YW9&]C
M<W!A<@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)0I<<W5B<W5B<V5C=&EO;GL@;VYE;6EN=7,@?0H*5&AI<R!H86YD;&5S(&QI
M<W1S('-U8V@@87,@>UQT='M]*#$M7"`S*7TL('M<='1[?2@Q+5P@9F]O*7TL
M(&%N9"!S;R!O;BX*"E1H:7,@8F%S:6-A;&QY(&IU<W0@8V]N=F5R=',@=&AE
M(&5V86QU871E9"!P87)A;65T97(@=&\@86X@:6YT96=E<BP*9&5C<F5M96YT
M<R!I="P@=&AE;B!R971U<FYS(&%N(&%T;VT@8V]N=&%I;FEN9R!T:&%T('9A
M;'5E(&)A8VL@=&\@=&AE"F-A;&QE<BX*"EQN=V5N9&1O8W-[?5QN=V)E9VEN
M8V]D97LU-GU<<W5B;&%B96Q[3E=E=F$W+45V84TN,RTQ?5QN=VUA<F=I;G1A
M9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%-+C,M,7U]
M?5QM;V1D969[179A;"!C8B!O;F5M:6YU<R!P<F]T;WY[7&YW=&%G<W1Y;&5[
M?5QS=6)P86=E<F5F>TY7979A-RU%=F%-+C,M,7U]?5QE;F1M;V1D968*("`@
M(&QE("H@979A;%]C8E]O;F5M:6YU<R@@8V]N<W0@:6YT(&%R9V,L(&QE("H@
M8G)A;F-H("D*7&YW=7-E9'M<7'M.5V5V83<M179A5BXS+3%]7%Q[3E=E=F$W
M+65V838N,BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[-3=]7&YW9&]C
M<W!A<@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[-3A]7'-U8FQA8F5L>TY7
M979A-RU%=F%6+C,M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B
M<&%G97)E9GM.5V5V83<M179A5BXS+3%]?7U<;6]D9&5F>T5V86P@8V(@;VYE
M;6EN=7,@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5V5V83<M179A5BXS+3%]?7U<96YD;6]D9&5F"B`@("!<3$%[?45V86P@
M8V(@;VYE;6EN=7,@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.
M5V5V83<M179A32XS+3%]?5Q207M]"B`@("!<>PH@("`@("`@(&QE("H@<F5T
M;&4["B`@("`@("`@:6YT('9A;'5E.PH*("`@("`@("!I9B`H(6)R86YC:"!\
M?"!A<F=C(#P@,BD@<F5T=7)N*"!L94YE=R@@(DY)3"(@*2`I.PH*("`@("`@
M("!R971L92`](&5V86QU871E3F]D92@@8G)A;F-H+3YL:7-T7VYE>'0@*3L@
M"B`@("`@("`@=F%L=64@/2!E=F%L0V%S=$QE5&]);G0H(')E=&QE("D["B`@
M("`@("`@;&57:7!E*"!R971L92`I.PH*("`@("`@("!R971U<FXH(&5V86Q#
M87-T26YT5&],92AV86QU92`M(#$I("D["@H@("`@7'T*7&YW=7-E9'M<7'M.
M5V5V83<M979A-BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[-3E]7&YW
M9&]C<W!A<@H*"B4E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24*7'-U8G-U8G-E8W1I;VY[(%PE.B!M;V1U;'5S('T*"E1H:7,@:&%N
M9&QE<R!L:7-T<R!S=6-H(&%S('M<='1[?2A[7&-H87(Y,GU[7&-H87(S-WU<
M(#)<(#,I?2P@>UQT='M]*'M<8VAA<CDR?7M<8VAA<C,W?5P@.5P@9F]O*7TL
M(&%N9"!S;R!O;BX*"E=E('-I;7!L>2!C;VYV97)T('1H92!T=V\@979A;'5A
M=&5D('!A<F%M971E<G,@=&\@:6YT96=E<G,L('1H96X@<F5T=7)N"F%N(&%T
M;VT@=VET:"!T:&4@;6]D=6QU<R!O9B!T:&]S92!N=6UB97)S(&)A8VL@=&\@
M=&AE(&-A;&QE<BX*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LV,'U<<W5B
M;&%B96Q[3E=E=F$W+45V84PN,RTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%,+C,M,7U]?5QM;V1D969[179A
M;"!C8B!M;V1U;'5S('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=E=F$W+45V84PN,RTQ?7U]7&5N9&UO9&1E9@H@("`@;&4@*B!E=F%L7V-B
M7VUO9'5L=7,H(&-O;G-T(&EN="!A<F=C+"!L92`J(&)R86YC:"`I"EQN=W5S
M961[7%Q[3E=E=F$W+45V854N,BTQ?5Q<>TY7979A-RUE=F$V+C(M,7U]7&YW
M96YD8V]D97M]7&YW8F5G:6YD;V-S>S8Q?5QN=V1O8W-P87(*7&YW96YD9&]C
M<WM]7&YW8F5G:6YC;V1E>S8R?5QS=6)L86)E;'M.5V5V83<M179A52XR+3%]
M7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W
M+45V854N,BTQ?7U]7&UO9&1E9GM%=F%L(&-B(&UO9'5L=7,@:6UP;&5M96YT
M871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A52XR
M+3%]?7U<96YD;6]D9&5F"B`@("!<3$%[?45V86P@8V(@;6]D=6QU<R!P<F]T
M;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%,+C,M,7U]
M7%)!>WT*("`@(%Q["B`@("`@("`@;&4@*B!L971E;7`["B`@("`@("`@:6YT
M('9A;'5E,2P@=F%L=64R.PH*("`@("`@("!I9B`H(6)R86YC:"!\?"!A<F=C
M("$](#,I(')E='5R;B@@;&5.97<H(").24PB("D@*3L*"B`@("`@("`@;&5T
M96UP(#T@979A;'5A=&5.;V1E*"!B<F%N8V@M/FQI<W1?;F5X="`I.PH@("`@
M("`@('9A;'5E,2`](&5V86Q#87-T3&54;TEN="@@;&5T96UP("D["B`@("`@
M("`@;&57:7!E*"!L971E;7`@*3L*"B`@("`@("`@;&5T96UP(#T@979A;'5A
M=&5.;V1E*"!B<F%N8V@M/FQI<W1?;F5X="T^;&ES=%]N97AT("D["B`@("`@
M("`@=F%L=64R(#T@979A;$-A<W1,951O26YT*"!L971E;7`@*3L*("`@("`@
M("!L95=I<&4H(&QE=&5M<"`I.PH*("`@("`@("!R971U<FXH(&5V86Q#87-T
M26YT5&],92`H('9A;'5E,2`E('9A;'5E,B`I("D["B`@("!<?0I<;G=U<V5D
M>UQ<>TY7979A-RUE=F$V+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLV
M,WU<;G=D;V-S<&%R"@HE)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E"EQS=6)S=6)S96-T:6]N>R!L=#H@($$@;&5S<R!T:&%N($)]
M"@I4:&ES(&AA;F1L97,@;&ES=',@<W5C:"!A<R![7'1T>WTH/%P@,EP@,RE]
M+"![7'1T>WTH/%P@.5P@9F]O*7TL(&%N9"!S;R!O;BX*"E1H92!V86QU97,@
M;V8@=&AE('1W;R!P87)A;65T97)S(&%R92!E=F%L=6%T960L('1H96X@8V]M
M<&%R960@=VET:`IE86-H;W1H97(N("!)9B!T:&4@9FER<W0@:7,@;&5S<R!T
M:&%N('1H92!S96-O;F0L(&$@8&![7'1T>WU4?2<G(&%T;VT*:7,@<F5T=7)N
M960L(&]T:&5R=VES92!A(&!@>UQT='M]3DE,?2<G(&%T;VT@:7,@<F5T=7)N
M960N"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[-C1]7'-U8FQA8F5L>TY7
M979A-RU%=F%'+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A
M9V5R969[3E=E=F$W+45V84<M,7U]?5QM;V1D969[179A;"!C8B!L="!P<F]T
M;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%'+3%]?7U<
M96YD;6]D9&5F"B`@("!L92`J(&5V86Q?8V)?;'0H(&-O;G-T(&EN="!A<F=C
M+"!L92`J(&)R86YC:"`I"EQN=W5S961[7%Q[3E=E=F$W+45V85`N,BTQ?5Q<
M>TY7979A-RUE=F$V+C(M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S8U
M?5QN=V1O8W-P87(*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S8V?5QS=6)L
M86)E;'M.5V5V83<M179A4"XR+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL
M97M]7'-U8G!A9V5R969[3E=E=F$W+45V85`N,BTQ?7U]7&UO9&1E9GM%=F%L
M(&-B(&QT(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R
M969[3E=E=F$W+45V85`N,BTQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU%=F%L
M(&-B(&QT('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W
M+45V84<M,7U]7%)!>WT*("`@(%Q["B`@("`@("`@;&4@*B!L971E;7`["B`@
M("`@("`@:6YT('9A;'5E,2P@=F%L=64R.PH*("`@("`@("!I9B`H(6)R86YC
M:"!\?"!A<F=C("$](#,@*2!R971U<FXH(&QE3F5W*"`B3DE,(B`I("D["@H@
M("`@("`@(&QE=&5M<"`](&5V86QU871E3F]D92@@8G)A;F-H+3YL:7-T7VYE
M>'0@*3L*("`@("`@("!V86QU93$@/2!E=F%L0V%S=$QE5&]);G0H(&QE=&5M
M<"`I.PH@("`@("`@(&QE5VEP92@@;&5T96UP("D["@H@("`@("`@(&QE=&5M
M<"`](&5V86QU871E3F]D92@@8G)A;F-H+3YL:7-T7VYE>'0M/FQI<W1?;F5X
M="`I.PH@("`@("`@('9A;'5E,B`](&5V86Q#87-T3&54;TEN="@@;&5T96UP
M("D["B`@("`@("`@;&57:7!E*"!L971E;7`@*3L*"B`@("`@("`@<F5T=7)N
M*"!L94YE=R`H("AV86QU93$@/"!V86QU93(@*3\B5"(Z(DY)3"(@*2`I.PH@
M("`@7'T*7&YW=7-E9'M<7'M.5V5V83<M979A-BTQ?7U<;G=E;F1C;V1E>WU<
M;G=B96=I;F1O8W-[-C=]7&YW9&]C<W!A<@H*)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<W5B<V5C=&EO;GL@;'1E<3H@
M($$@;&5S<R!T:&%N(&]R(&5Q=6%L('1O($)]"@I4:&ES(&AA;F1L97,@;&ES
M=',@<W5C:"!A<R![7'1T>WTH/#U<(#)<(#,I?2P@>UQT='M]*#P]7"`Y7"!F
M;V\I?2P@86YD('-O(&]N+@H*5&AE('9A;'5E<R!O9B!T:&4@='=O('!A<F%M
M971E<G,@87)E(&5V86QU871E9"P@=&AE;B!C;VUP87)E9"!W:71H"F5A8VAO
M=&AE<BX@($EF('1H92!F:7)S="!I<R!L97-S('1H86X@;W(@97%U86P@=&\@
M=&AE('-E8V]N9"P@80I@8'M<='1[?51])R<@871O;2!I<R!R971U<FYE9"P@
M;W1H97)W:7-E(&$@8&![7'1T>WU.24Q])R<@871O;2!I<R!R971U<FYE9"X*
M"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LV.'U<<W5B;&%B96Q[3E=E=F$W
M+45V84HM,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5V5V83<M179A2BTQ?7U]7&UO9&1E9GM%=F%L(&-B(&QT(&5Q('!R;W1O
M?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84HM,7U]?5QE
M;F1M;V1D968*("`@(&QE("H@979A;%]C8E]L=%]E<2@@8V]N<W0@:6YT(&%R
M9V,L(&QE("H@8G)A;F-H("D*7&YW=7-E9'M<7'M.5V5V83<M179A4RTQ?5Q<
M>TY7979A-RUE=F$V+C(M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S8Y
M?5QN=V1O8W-P87(*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S<P?5QS=6)L
M86)E;'M.5V5V83<M179A4RTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[
M?5QS=6)P86=E<F5F>TY7979A-RU%=F%3+3%]?7U<;6]D9&5F>T5V86P@8V(@
M;'0@97$@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5V5V83<M179A4RTQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU%=F%L(&-B
M(&QT(&5Q('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W
M+45V84HM,7U]7%)!>WT*("`@(%Q["B`@("`@("`@;&4@*B!L971E;7`["B`@
M("`@("`@:6YT('9A;'5E,2P@=F%L=64R.PH*("`@("`@("!I9B`H(6)R86YC
M:"!\?"!A<F=C("$](#,@*2!R971U<FXH(&QE3F5W*"`B3DE,(B`I("D["@H@
M("`@("`@(&QE=&5M<"`](&5V86QU871E3F]D92@@8G)A;F-H+3YL:7-T7VYE
M>'0@*3L*("`@("`@("!V86QU93$@/2!E=F%L0V%S=$QE5&]);G0H(&QE=&5M
M<"`I.PH@("`@("`@(&QE5VEP92@@;&5T96UP("D["@H@("`@("`@(&QE=&5M
M<"`](&5V86QU871E3F]D92@@8G)A;F-H+3YL:7-T7VYE>'0M/FQI<W1?;F5X
M="`I.PH@("`@("`@('9A;'5E,B`](&5V86Q#87-T3&54;TEN="@@;&5T96UP
M("D["B`@("`@("`@;&57:7!E*"!L971E;7`@*3L*"B`@("`@("`@<F5T=7)N
M*"!L94YE=R`H("AV86QU93$@/#T@=F%L=64R("D_(E0B.B).24PB("D@*3L*
M("`@(%Q]"EQN=W5S961[7%Q[3E=E=F$W+65V838M,7U]7&YW96YD8V]D97M]
M7&YW8F5G:6YD;V-S>S<Q?5QN=V1O8W-P87(*"B4E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24*7'-U8G-U8G-E8W1I;VY[(&=T.B`@
M02!G<F5A=&5R('1H86X@0GT*"E1H:7,@:&%N9&QE<R!L:7-T<R!S=6-H(&%S
M('M<='1[?2@^7"`R7"`S*7TL('M<='1[?2@^7"`Y7"!F;V\I?2P@86YD('-O
M(&]N+@H*5&AE('9A;'5E<R!O9B!T:&4@='=O('!A<F%M971E<G,@87)E(&5V
M86QU871E9"P@=&AE;B!C;VUP87)E9"!W:71H"F5A8VAO=&AE<BX@($EF('1H
M92!F:7)S="!I<R!G<F5A=&5R('1H86X@=&AE('-E8V]N9"P@82!@8'M<='1[
M?51])R<@871O;0II<R!R971U<FYE9"P@;W1H97)W:7-E(&$@8&![7'1T>WU.
M24Q])R<@871O;2!I<R!R971U<FYE9"X*"EQN=V5N9&1O8W-[?5QN=V)E9VEN
M8V]D97LW,GU<<W5B;&%B96Q[3E=E=F$W+45V84<N,BTQ?5QN=VUA<F=I;G1A
M9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%'+C(M,7U]
M?5QM;V1D969[179A;"!C8B!G="!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P
M86=E<F5F>TY7979A-RU%=F%'+C(M,7U]?5QE;F1M;V1D968*("`@(&QE("H@
M979A;%]C8E]G="@@8V]N<W0@:6YT(&%R9V,L(&QE("H@8G)A;F-H("D*7&YW
M=7-E9'M<7'M.5V5V83<M179A4"XS+3%]7%Q[3E=E=F$W+65V838N,BTQ?7U<
M;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[-S-]7&YW9&]C<W!A<@I<;G=E;F1D
M;V-S>WU<;G=B96=I;F-O9&5[-S1]7'-U8FQA8F5L>TY7979A-RU%=F%0+C,M
M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V
M83<M179A4"XS+3%]?7U<;6]D9&5F>T5V86P@8V(@9W0@:6UP;&5M96YT871I
M;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A4"XS+3%]
M?7U<96YD;6]D9&5F"B`@("!<3$%[?45V86P@8V(@9W0@<')O=&]^>UQN=W1A
M9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A1RXR+3%]?5Q207M]"B`@
M("!<>PH@("`@("`@(&QE("H@;&5T96UP.PH@("`@("`@(&EN="!V86QU93$L
M('9A;'5E,CL*"B`@("`@("`@:68@*"%B<F%N8V@@?'P@87)G8R`A/2`S("D@
M<F5T=7)N*"!L94YE=R@@(DY)3"(@*2`I.PH*("`@("`@("!L971E;7`@/2!E
M=F%L=6%T94YO9&4H(&)R86YC:"T^;&ES=%]N97AT("D["B`@("`@("`@=F%L
M=64Q(#T@979A;$-A<W1,951O26YT*"!L971E;7`@*3L*("`@("`@("!L95=I
M<&4H(&QE=&5M<"`I.PH*("`@("`@("!L971E;7`@/2!E=F%L=6%T94YO9&4H
M(&)R86YC:"T^;&ES=%]N97AT+3YL:7-T7VYE>'0@*3L*("`@("`@("!V86QU
M93(@/2!E=F%L0V%S=$QE5&]);G0H(&QE=&5M<"`I.PH@("`@("`@(&QE5VEP
M92@@;&5T96UP("D["@H@("`@("`@(')E='5R;B@@;&5.97<@*"`H=F%L=64Q
M(#X@=F%L=64R("D_(E0B.B).24PB("D@*3L*("`@(%Q]"EQN=W5S961[7%Q[
M3E=E=F$W+65V838M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S<U?5QN
M=V1O8W-P87(*"B4E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24*7'-U8G-U8G-E8W1I;VY[(&=T97$Z("!!(&=R96%T97(@=&AA;B!O
M<B!E<75A;"!T;R!"?0H*5&AI<R!H86YD;&5S(&QI<W1S('-U8V@@87,@>UQT
M='M]*#X]7"`R7"`S*7TL('M<='1[?2@^/5P@.5P@9F]O*7TL(&%N9"!S;R!O
M;BX*"E1H92!V86QU97,@;V8@=&AE('1W;R!P87)A;65T97)S(&%R92!E=F%L
M=6%T960L('1H96X@8V]M<&%R960@=VET:`IE86-H;W1H97(N("!)9B!T:&4@
M9FER<W0@:7,@9W)E871E<B!T:&%N(&]R(&5Q=6%L('1O('1H92!S96-O;F0L
M(&$*8&![7'1T>WU4?2<G(&%T;VT@:7,@<F5T=7)N960L(&]T:&5R=VES92!A
M(&!@>UQT='M]3DE,?2<G(&%T;VT@:7,@<F5T=7)N960N"@I<;G=E;F1D;V-S
M>WU<;G=B96=I;F-O9&5[-S9]7'-U8FQA8F5L>TY7979A-RU%=F%*+C(M,7U<
M;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M
M179A2BXR+3%]?7U<;6]D9&5F>T5V86P@8V(@9W0@97$@<')O=&]^>UQN=W1A
M9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A2BXR+3%]?7U<96YD;6]D
M9&5F"B`@("!L92`J(&5V86Q?8V)?9W1?97$H(&-O;G-T(&EN="!A<F=C+"!L
M92`J(&)R86YC:"`I"EQN=W5S961[7%Q[3E=E=F$W+45V85,N,BTQ?5Q<>TY7
M979A-RUE=F$V+C(M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S<W?5QN
M=V1O8W-P87(*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S<X?5QS=6)L86)E
M;'M.5V5V83<M179A4RXR+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=E=F$W+45V85,N,BTQ?7U]7&UO9&1E9GM%=F%L(&-B
M(&=T(&5Q(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R
M969[3E=E=F$W+45V85,N,BTQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU%=F%L
M(&-B(&=T(&5Q('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E
M=F$W+45V84HN,BTQ?7U<4D%[?0H@("`@7'L*("`@("`@("!L92`J(&QE=&5M
M<#L*("`@("`@("!I;G0@=F%L=64Q+"!V86QU93(["@H@("`@("`@(&EF("@A
M8G)A;F-H('Q\(&%R9V,@(3T@,R`I(')E='5R;B@@;&5.97<H(").24PB("D@
M*3L*"B`@("`@("`@;&5T96UP(#T@979A;'5A=&5.;V1E*"!B<F%N8V@M/FQI
M<W1?;F5X="`I.PH@("`@("`@('9A;'5E,2`](&5V86Q#87-T3&54;TEN="@@
M;&5T96UP("D["B`@("`@("`@;&57:7!E*"!L971E;7`@*3L*"B`@("`@("`@
M;&5T96UP(#T@979A;'5A=&5.;V1E*"!B<F%N8V@M/FQI<W1?;F5X="T^;&ES
M=%]N97AT("D["B`@("`@("`@=F%L=64R(#T@979A;$-A<W1,951O26YT*"!L
M971E;7`@*3L*("`@("`@("!L95=I<&4H(&QE=&5M<"`I.PH*("`@("`@("!R
M971U<FXH(&QE3F5W("@@*'9A;'5E,2`^/2!V86QU93(@*3\B5"(Z(DY)3"(@
M*2`I.PH@("`@7'T*7&YW=7-E9'M<7'M.5V5V83<M979A-BTQ?7U<;G=E;F1C
M;V1E>WU<;G=B96=I;F1O8W-[-SE]7&YW9&]C<W!A<@H*)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<W5B<V5C=&EO;GL@
M97%S:6=N.B`@02!E<75A;"!T;R!"?0H*5&AI<R!H86YD;&5S(&QI<W1S('-U
M8V@@87,@>UQT='M]*#U<(#)<(#,I?2P@>UQT='M]*#U<(#E<(&9O;RE]+"!A
M;F0@<V\@;VXN"@I4:&4@=F%L=65S(&]F('1H92!T=V\@<&%R86UE=&5R<R!A
M<F4@979A;'5A=&5D+"!T:&5N(&-O;7!A<F5D('=I=&@*96%C:&]T:&5R+B`@
M268@=&AE(&9I<G-T(&ES(&5Q=6%L('1O('1H92!S96-O;F0L(&$@8&![7'1T
M>WU4?2<G(&%T;VT@:7,*<F5T=7)N960L(&]T:&5R=VES92!A(&!@>UQT='M]
M3DE,?2<G(&%T;VT@:7,@<F5T=7)N960N"@I<;G=E;F1D;V-S>WU<;G=B96=I
M;F-O9&5[.#!]7'-U8FQA8F5L>TY7979A-RU%=F%++C(M,7U<;G=M87)G:6YT
M86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A2RXR+3%]
M?7U<;6]D9&5F>T5V86P@8V(@97%S:6=N('!R;W1O?GM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=E=F$W+45V84LN,BTQ?7U]7&5N9&UO9&1E9@H@("`@
M;&4@*B!E=F%L7V-B7V5Q<VEG;B@@8V]N<W0@:6YT(&%R9V,L(&QE("H@8G)A
M;F-H("D*7&YW=7-E9'M<7'M.5V5V83<M179A5"XR+3%]7%Q[3E=E=F$W+65V
M838N,BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[.#%]7&YW9&]C<W!A
M<@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[.#)]7'-U8FQA8F5L>TY7979A
M-RU%=F%4+C(M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G
M97)E9GM.5V5V83<M179A5"XR+3%]?7U<;6]D9&5F>T5V86P@8V(@97%S:6=N
M(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E
M=F$W+45V850N,BTQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU%=F%L(&-B(&5Q
M<VEG;B!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%
M=F%++C(M,7U]7%)!>WT*("`@(%Q["B`@("`@("`@;&4@*B!L971E;7`["B`@
M("`@("`@:6YT('9A;'5E,2P@=F%L=64R.PH*("`@("`@("!I9B`H(6)R86YC
M:"!\?"!A<F=C("$](#,@*2!R971U<FXH(&QE3F5W*"`B3DE,(B`I("D["@H@
M("`@("`@(&QE=&5M<"`](&5V86QU871E3F]D92@@8G)A;F-H+3YL:7-T7VYE
M>'0@*3L*("`@("`@("!V86QU93$@/2!E=F%L0V%S=$QE5&]);G0H(&QE=&5M
M<"`I.PH@("`@("`@(&QE5VEP92@@;&5T96UP("D["@H@("`@("`@(&QE=&5M
M<"`](&5V86QU871E3F]D92@@8G)A;F-H+3YL:7-T7VYE>'0M/FQI<W1?;F5X
M="`I.PH@("`@("`@('9A;'5E,B`](&5V86Q#87-T3&54;TEN="@@;&5T96UP
M("D["B`@("`@("`@;&57:7!E*"!L971E;7`@*3L*"B`@("`@("`@<F5T=7)N
M*"!L94YE=R`H("AV86QU93$@/3T@=F%L=64R("D_(E0B.B).24PB("D@*3L*
M("`@(%Q]"EQN=W5S961[7%Q[3E=E=F$W+65V838M,7U]7&YW96YD8V]D97M]
M7&YW8F5G:6YD;V-S>S@S?5QN=V1O8W-P87(*"B4E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24*7'-U8G-U8G-E8W1I;VY[(&%N9"!]
M"@I4:&ES(&AA;F1L97,@;&ES=',@<W5C:"!A<R![7'1T>WTH86YD7"!!7"!"
M*7TL('M<='1[?2AA;F1<($%<("@N+BXI*7TL(&%N9"!S;R!O;BX*"D5V86QU
M871E(&%L;"!O9B!T:&4@87)G=6UE;G1S('5N=&EL(&]N92!O9B!T:&5M('EI
M96QD<R!A('M<='1[?4Y)3'TL('1H96X*<F5T=7)N('M<='1[?4Y)3'TN("!4
M:&4@<F5M86EN:6YG('!A<F%M971E<G,@87)E(&YO="!E=F%L=6%T960N("!)
M9B!N;VYE"F5V86QU871E<R!T;R![7'1T>WU.24Q]+"!T:&5N('1H92!L87-T
M(&]N92=S(&5V86QU871I;VX@:7,@<F5T=7)N960N"@I<;G=E;F1D;V-S>WU<
M;G=B96=I;F-O9&5[.#1]7'-U8FQA8F5L>TY7979A-RU%=F%(+C0M,7U<;G=M
M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A
M2"XT+3%]?7U<;6]D9&5F>T5V86P@8V(@86YD('!R;W1O?GM<;G=T86=S='EL
M97M]7'-U8G!A9V5R969[3E=E=F$W+45V84@N-"TQ?7U]7&5N9&UO9&1E9@H@
M("`@;&4@*B!E=F%L7V-B7V%N9"@@8V]N<W0@:6YT(&%R9V,L(&QE("H@8G)A
M;F-H("D*7&YW=7-E9'M<7'M.5V5V83<M179A42XS+3%]7%Q[3E=E=F$W+65V
M838N,BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[.#5]7&YW9&]C<W!A
M<@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[.#9]7'-U8FQA8F5L>TY7979A
M-RU%=F%1+C,M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G
M97)E9GM.5V5V83<M179A42XS+3%]?7U<;6]D9&5F>T5V86P@8V(@86YD(&EM
M<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W
M+45V85$N,RTQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU%=F%L(&-B(&%N9"!P
M<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%(+C0M
M,7U]7%)!>WT*("`@(%Q["B`@("`@("`@;&4@*B!T96UP.PH@("`@("`@(&QE
M("H@<F5S=6QT(#T@3E5,3#L*("`@("`@("!I9B`H(6)R86YC:"!\?"!A<F=C
M(#P@,B`I(')E='5R;B@@;&5.97<H(").24PB("DI.PH*("`@("`@("!T96UP
M(#T@8G)A;F-H+3YL:7-T7VYE>'0["B`@("`@("`@=VAI;&4H('1E;7`@*0H@
M("`@("`@(%Q["B`@("`@("`@("`@(&EF*"!R97-U;'0@*2`@;&57:7!E*"!R
M97-U;'0@*3L*"B`@("`@("`@("`@(')E<W5L="`](&5V86QU871E3F]D92AT
M96UP*3L*("`@("`@("`@("`@:68@*')E<W5L="T^9&%T82D*("`@("`@("`@
M("`@7'L*("`@("`@("`@("`@("`@(&EF("@A<W1R8VUP("@@<F5S=6QT+3YD
M871A+"`B3DE,(B`I*0H@("`@("`@("`@("`@("`@7'L*("`@("`@("`@("`@
M("`@("`@("!R971U<FXH(')E<W5L="`I.PH@("`@("`@("`@("`@("`@7'T*
M("`@("`@("`@("`@7'T*("`@("`@("`@("`@=&5M<"`]('1E;7`M/FQI<W1?
M;F5X=#L*("`@("`@("!<?0H@("`@("`@(')E='5R;B@@<F5S=6QT("D["B`@
M("!<?0I<;G=U<V5D>UQ<>TY7979A-RUE=F$V+3%]?5QN=V5N9&-O9&5[?5QN
M=V)E9VEN9&]C<WLX-WU<;G=D;V-S<&%R"@HE)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E"EQS=6)S=6)S96-T:6]N>R!O<B!]"@I%
M=F%L=6%T92!A;&P@;V8@=&AE(&%R9W5M96YT<R!U;G1I;"!O;F4@;V8@=&AE
M;2!Y:65L9',@82!N;VXM>UQT='M]3DE,?2P@=&AE;@IR971U<FX@=&AE:7(@
M=F%L=64N("!4:&4@<F5M86EN:6YG(&%R9W5M96YT<R!A<F4@;F]T(&5V86QU
M871E9"X@($EF(&%L;`IP87)A;65T97)S(&5V86QU871E('1O('M<='1[?4Y)
M3'TL('1H96X@82![7'1T>WU.24Q](&%T;VT@:7,@<F5T=7)N960N"@I<;G=E
M;F1D;V-S>WU<;G=B96=I;F-O9&5[.#A]7'-U8FQA8F5L>TY7979A-RU%=F%'
M+C,M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.
M5V5V83<M179A1RXS+3%]?7U<;6]D9&5F>T5V86P@8V(@;W(@<')O=&]^>UQN
M=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A1RXS+3%]?7U<96YD
M;6]D9&5F"B`@("!L92`J(&5V86Q?8V)?;W(H(&-O;G-T(&EN="!A<F=C+"!L
M92`J(&)R86YC:"`I"EQN=W5S961[7%Q[3E=E=F$W+45V85`N-"TQ?5Q<>TY7
M979A-RUE=F$V+C(M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S@Y?5QN
M=V1O8W-P87(*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>SDP?5QS=6)L86)E
M;'M.5V5V83<M179A4"XT+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=E=F$W+45V85`N-"TQ?7U]7&UO9&1E9GM%=F%L(&-B
M(&]R(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=E=F$W+45V85`N-"TQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU%=F%L(&-B
M(&]R('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V
M84<N,RTQ?7U<4D%[?0H@("`@7'L*("`@("`@("!L92`J('1E;7`["B`@("`@
M("`@;&4@*B!R97-U;'0@/2!.54Q,.PH@("`@("`@(&EF("@A8G)A;F-H('Q\
M(&%R9V,@/"`R("D@<F5T=7)N*"!L94YE=R@@(DY)3"(@*2D["@H@("`@("`@
M('1E;7`@/2!B<F%N8V@M/FQI<W1?;F5X=#L*("`@("`@("!W:&EL92@@=&5M
M<"`I"B`@("`@("`@7'L*("`@("`@("`@("`@:68H(')E<W5L="`I("!L95=I
M<&4H(')E<W5L="`I.PH*("`@("`@("`@("`@<F5S=6QT(#T@979A;'5A=&5.
M;V1E*'1E;7`I.PH@("`@("`@("`@("!I9B`H<F5S=6QT+3YD871A*0H@("`@
M("`@("`@("!<>PH@("`@("`@("`@("`@("`@:68@*'-T<F-M<"`H(')E<W5L
M="T^9&%T82P@(DY)3"(@*2D*("`@("`@("`@("`@("`@(%Q["B`@("`@("`@
M("`@("`@("`@("`@<F5T=7)N*"!R97-U;'0@*3L*("`@("`@("`@("`@("`@
M(%Q]"B`@("`@("`@("`@(%Q]"B`@("`@("`@("`@('1E;7`@/2!T96UP+3YL
M:7-T7VYE>'0["B`@("`@("`@7'T*("`@("`@("!R971U<FXH(')E<W5L="`I
M.PH@("`@7'T*7&YW=7-E9'M<7'M.5V5V83<M979A-BTQ?7U<;G=E;F1C;V1E
M>WU<;G=B96=I;F1O8W-[.3%]7&YW9&]C<W!A<@H*)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<W5B<V5C=&EO;GL@;F]T
M('T*"DEF('1H92!E=F%L=6%T960@<&%R86UE=&5R('EI96QD<R!A('1R=64@
M=F%L=64@*'!E<FAA<',@>UQT='M]5'TI('1H96X@<F5T=7)N"F$@>UQT='M]
M3DE,?2!A=&]M+B`@268@=&AE(&5V86QU871E9"!P87)A;65T97(@>6EE;&1S
M(&$@>UQT='M]3DE,?2P@=&AE;B!W92!R971U<FX*82![7'1T>WU4?2!A=&]M
M+@H*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>SDR?5QS=6)L86)E;'M.5V5V
M83<M179A2"XU+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A
M9V5R969[3E=E=F$W+45V84@N-2TQ?7U]7&UO9&1E9GM%=F%L(&-B(&YO="!P
M<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%(+C4M
M,7U]?5QE;F1M;V1D968*("`@(&QE("H@979A;%]C8E]N;W0H(&-O;G-T(&EN
M="!A<F=C+"!L92`J(&)R86YC:"`I"EQN=W5S961[7%Q[3E=E=F$W+45V85$N
M-"TQ?5Q<>TY7979A-RUE=F$V+C(M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD
M;V-S>SDS?5QN=V1O8W-P87(*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>SDT
M?5QS=6)L86)E;'M.5V5V83<M179A42XT+3%]7&YW;6%R9VEN=&%G>WM<;G=T
M86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85$N-"TQ?7U]7&UO9&1E
M9GM%=F%L(&-B(&YO="!I;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS
M=6)P86=E<F5F>TY7979A-RU%=F%1+C0M,7U]?5QE;F1M;V1D968*("`@(%Q,
M07M]179A;"!C8B!N;W0@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5V5V83<M179A2"XU+3%]?5Q207M]"B`@("!<>PH@("`@("`@(&QE("H@
M<F5S=6QT(#T@3E5,3#L*("`@("`@("!I9B`H(6)R86YC:"!\?"!A<F=C("$]
M(#(@*2!R971U<FXH(&QE3F5W*"`B3DE,(B`I*3L*"B`@("`@("`@<F5S=6QT
M(#T@979A;'5A=&5.;V1E*&)R86YC:"T^;&ES=%]N97AT*3L*"B`@("`@("`@
M:68@*')E<W5L="T^9&%T82D*("`@("`@("!<>PH@("`@("`@("`@("!I9B`H
M(7-T<F-M<"`H<F5S=6QT+3YD871A+"`B3DE,(B`I*0H@("`@("`@("`@("!<
M>PH@("`@("`@("`@("`@("`@;&57:7!E*"!R97-U;'0@*3L*("`@("`@("`@
M("`@("`@(')E='5R;B@@;&5.97<H(")4(B`I("D["B`@("`@("`@("`@(%Q]
M(&5L<V4@7'L*("`@("`@("`@("`@("`@(&QE5VEP92@@<F5S=6QT("D["B`@
M("`@("`@("`@("`@("!R971U<FXH(&QE3F5W*"`B3DE,(B`I("D["B`@("`@
M("`@("`@(%Q]"B`@("`@("`@7'T@96QS92!I9B`H<F5S=6QT+3YB<F%N8V@I
M(%Q["B`@("`@("`@("`@(&QE5VEP92@@<F5S=6QT("D["B`@("`@("`@("`@
M(')E='5R;B@@;&5.97<H(").24PB("D@*3L*("`@("`@("!<?0H@("`@("`@
M(`H@("`@("`@(&QE5VEP92@@<F5S=6QT("D["B`@("`@("`@<F5T=7)N*"!L
M94YE=R@@(E0B("DI.PH@("`@7'T*7&YW=7-E9'M<7'M.5V5V83<M979A-BTQ
M?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[.35]7&YW9&]C<W!A<@H*)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<W5B
M<V5C=&EO;GL@871O;2!]"@I)9B!T:&4@979A;'5A=&5D('!A<F%M971E<B!I
M<R!A(&QI<W0L(')E='5R;B!A('M<='1[?4Y)3'T@871O;2P@;W1H97)W:7-E
M"G)E='5R;B!A('M<='1[?51](&%T;VTN"@I<;G=E;F1D;V-S>WU<;G=B96=I
M;F-O9&5[.39]7'-U8FQA8F5L>TY7979A-RU%=F%)+C0M,7U<;G=M87)G:6YT
M86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A22XT+3%]
M?7U<;6]D9&5F>T5V86P@8V(@871O;2!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS
M=6)P86=E<F5F>TY7979A-RU%=F%)+C0M,7U]?5QE;F1M;V1D968*("`@(&QE
M("H@979A;%]C8E]A=&]M*"!C;VYS="!I;G0@87)G8RP@;&4@*B!B<F%N8V@@
M*0I<;G=U<V5D>UQ<>TY7979A-RU%=F%2+C,M,7U<7'M.5V5V83<M979A-BXR
M+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLY-WU<;G=D;V-S<&%R"EQN
M=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LY.'U<<W5B;&%B96Q[3E=E=F$W+45V
M85(N,RTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F
M>TY7979A-RU%=F%2+C,M,7U]?5QM;V1D969[179A;"!C8B!A=&]M(&EM<&QE
M;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V
M85(N,RTQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU%=F%L(&-B(&%T;VT@<')O
M=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A22XT+3%]
M?5Q207M]"B`@("!<>PH@("`@("`@(&QE("H@<F5S=6QT(#T@3E5,3#L*("`@
M("`@("!I9B`H(6)R86YC:"!\?"!A<F=C("$](#(@*2!R971U<FXH(&QE3F5W
M*"`B3DE,(B`I*3L*"B`@("`@("`@<F5S=6QT(#T@979A;'5A=&5.;V1E*&)R
M86YC:"T^;&ES=%]N97AT*3L*"B`@("`@("`@:68@*&-O=6YT3F]D97,H<F5S
M=6QT*2`]/2`Q*0H@("`@("`@(%Q["B`@("`@("`@("`@(&QE5VEP92@@<F5S
M=6QT("D["B`@("`@("`@("`@(')E='5R;B@@;&5.97<H(")4(B`I("D["B`@
M("`@("`@7'T*("`@("`@("!R971U<FXH(&QE3F5W*"`B3DE,(B`I("D["B`@
M("!<?0I<;G=U<V5D>UQ<>TY7979A-RUE=F$V+3%]?5QN=V5N9&-O9&5[?5QN
M=V)E9VEN9&]C<WLY.7U<;G=D;V-S<&%R"@H*)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<W5B<V5C=&EO;GL@8V%R('T*
M"E)E='5R;B!T:&4@=&]P;6]S="!A=&]M(&]F('1H92!L:7-T('!A<W-E9"!I
M;BX@($EF(&%N(&%T;VT@=V%S('!A<W-E9"!I;BP*=&AE;B!W92!S:6UP;'D@
M<F5T=7)N(&ET+B`@"@I4:&5R92!I<R!S;VUE(&5X=')A(&UA9VEC(&EN(&AE
M<F4@=&\@9&5R969E<F5N8V4@;F5S=&EN9R!B>2!O;F4@;&%Y97(@"G-I;F-E
M('=E)W)E(')E='5R;FEN9R!T:&4@871O;7,@9G)O;2!T:&4@<&%S<V5D(&EN
M(&QI<W0L(')A=&AE<B!T:&%N(`IJ=7-T('-U8FQI<W1S+"!L:6ME('=H870@
M0T12(&1O97,N"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,3`P?5QS=6)L
M86)E;'M.5V5V83<M179A2"XV+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL
M97M]7'-U8G!A9V5R969[3E=E=F$W+45V84@N-BTQ?7U]7&UO9&1E9GM%=F%L
M(&-B(&-A<B!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A
M-RU%=F%(+C8M,7U]?5QE;F1M;V1D968*("`@(&QE("H@979A;%]C8E]C87(H
M(&-O;G-T(&EN="!A<F=C+"!L92`J(&)R86YC:"`I"EQN=W5S961[7%Q[3E=E
M=F$W+45V85$N-2TQ?5Q<>TY7979A-RUE=F$V+C(M,7U]7&YW96YD8V]D97M]
M7&YW8F5G:6YD;V-S>S$P,7U<;G=D;V-S<&%R"EQN=V5N9&1O8W-[?5QN=V)E
M9VEN8V]D97LQ,#)]7'-U8FQA8F5L>TY7979A-RU%=F%1+C4M,7U<;G=M87)G
M:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A42XU
M+3%]?7U<;6]D9&5F>T5V86P@8V(@8V%R(&EM<&QE;65N=&%T:6]N?GM<;G=T
M86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85$N-2TQ?7U]7&5N9&UO
M9&1E9@H@("`@7$Q!>WU%=F%L(&-B(&-A<B!P<F]T;WY[7&YW=&%G<W1Y;&5[
M?5QS=6)P86=E<F5F>TY7979A-RU%=F%(+C8M,7U]7%)!>WT*("`@(%Q["B`@
M("`@("`@;&4@*B!R97-U;'0@/2!.54Q,.PH@("`@("`@(&QE("H@=&5M<"`]
M($Y53$P["B`@("`@("`@:68@*"%B<F%N8V@@?'P@87)G8R`A/2`R("D@<F5T
M=7)N*"!L94YE=R@@(DY)3"(@*2D["@H@("`@("`@(')E<W5L="`](&5V86QU
M871E3F]D92AB<F%N8V@M/FQI<W1?;F5X="D["@H@("`@("`@(&EF*"!R97-U
M;'0@/3T@3E5,3"`I("!R971U<FXH(&QE3F5W*"`B3DE,(B`I("D["@H@("`@
M("`@(&EF("AC;W5N=$YO9&5S*')E<W5L="D@/#T@,2D*("`@("`@("!<>PH@
M("`@("`@("`@("!I9B`H<F5S=6QT+3YB<F%N8V@I"B`@("`@("`@("`@(%Q[
M"B`@("`@("`@("`@("`@("!T96UP(#T@<F5S=6QT.PH@("`@("`@("`@("`@
M("`@<F5S=6QT(#T@<F5S=6QT+3YB<F%N8V@["B`@("`@("`@("`@("`@("!T
M96UP+3YB<F%N8V@@/2!.54Q,.PH@("`@("`@("`@("`@("`@;&57:7!E*"!T
M96UP("D["B`@("`@("`@("`@(%Q]"B`@("`@("`@("`@(')E='5R;B@@<F5S
M=6QT("D["B`@("`@("`@7'T*"B`@("`@("`@<F5S=6QT+3YL:7-T7VYE>'0M
M/FQI<W1?<')E=B`]($Y53$P["B`@("`@("`@;&57:7!E*"!R97-U;'0M/FQI
M<W1?;F5X="`I.PH@("`@("`@(')E<W5L="T^;&ES=%]N97AT(#T@3E5,3#L*
M"B`@("`@("`@:68@*')E<W5L="T^8G)A;F-H*0H@("`@("`@(%Q["B`@("`@
M("`@("`@('1E;7`@/2!R97-U;'0["B`@("`@("`@("`@(')E<W5L="`](')E
M<W5L="T^8G)A;F-H.PH@("`@("`@("`@("!T96UP+3YB<F%N8V@@/2!.54Q,
M.PH@("`@("`@("`@("!L95=I<&4H('1E;7`@*3L*("`@("`@("!<?0H*("`@
M("`@("!R971U<FXH(')E<W5L="`I.PH@("`@7'T*7&YW=7-E9'M<7'M.5V5V
M83<M979A-BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[,3`S?5QN=V1O
M8W-P87(*"B4E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24*7'-U8G-U8G-E8W1I;VY[(&-D<B!]"@I2971U<FX@86QL(&)U="!T:&4@
M=&]P;6]S="!A=&]M(&]F('1H92!P87-S960@:6X@;&ES="!A9G1E<B!I="!H
M87,@8F5E;@IE=F%L=6%T960N("!)9B!T:&4@;&ES="!C;VYT86EN<R!J=7-T
M(&]N92!E;G1R>2P@=V4@:6YS=&5A9"!R971U<FX@80I[7'1T>WU.24Q](&%T
M;VTN"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,3`T?5QS=6)L86)E;'M.
M5V5V83<M179A2"XW+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U
M8G!A9V5R969[3E=E=F$W+45V84@N-RTQ?7U]7&UO9&1E9GM%=F%L(&-B(&-D
M<B!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%(
M+C<M,7U]?5QE;F1M;V1D968*("`@(&QE("H@979A;%]C8E]C9'(H(&-O;G-T
M(&EN="!A<F=C+"!L92`J(&)R86YC:"`I"EQN=W5S961[7%Q[3E=E=F$W+45V
M85$N-BTQ?5Q<>TY7979A-RUE=F$V+C(M,7U]7&YW96YD8V]D97M]7&YW8F5G
M:6YD;V-S>S$P-7U<;G=D;V-S<&%R"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D
M97LQ,#9]7'-U8FQA8F5L>TY7979A-RU%=F%1+C8M,7U<;G=M87)G:6YT86=[
M>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A42XV+3%]?7U<
M;6]D9&5F>T5V86P@8V(@8V1R(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL
M97M]7'-U8G!A9V5R969[3E=E=F$W+45V85$N-BTQ?7U]7&5N9&UO9&1E9@H@
M("`@7$Q!>WU%=F%L(&-B(&-D<B!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P
M86=E<F5F>TY7979A-RU%=F%(+C<M,7U]7%)!>WT*("`@(%Q["B`@("`@("`@
M;&4@*B!R97-U;'0@/2!.54Q,.PH@("`@("`@(&QE("H@=&5M<"`]($Y53$P[
M"B`@("`@("`@:68@*"%B<F%N8V@@?'P@87)G8R`A/2`R("D@<F5T=7)N*"!L
M94YE=R@@(DY)3"(@*2D["@H@("`@("`@(')E<W5L="`](&5V86QU871E3F]D
M92AB<F%N8V@M/FQI<W1?;F5X="D["@H@("`@("`@(&EF*"!R97-U;'0@/3T@
M3E5,3"`I("!R971U<FXH(&QE3F5W*"`B3DE,(B`I("D["@H@("`@("`@(&EF
M("AR97-U;'0@/3T@3E5,3"`@?'P@8V]U;G1.;V1E<RAR97-U;'0I(#T](#$I
M"B`@("`@("`@7'L*("`@("`@("`@("`@<F5T=7)N*"!L94YE=R@@(DY)3"(@
M*2`I.PH@("`@("`@(%Q]"@H@("`@("`@('1E;7`@/2!R97-U;'0["B`@("`@
M("`@=&5M<"T^;&ES=%]N97AT+3YL:7-T7W!R978@/2!.54Q,.PH@("`@("`@
M(')E<W5L="`](')E<W5L="T^;&ES=%]N97AT.PH*("`@("`@("!T96UP+3YL
M:7-T7VYE>'0@/2!.54Q,.PH@("`@("`@(&QE5VEP92@@=&5M<"`I.PH*"B`@
M("`@("`@<F5T=7)N*"!R97-U;'0@*3L*("`@(%Q]"EQN=W5S961[7%Q[3E=E
M=F$W+65V838M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S$P-WU<;G=D
M;V-S<&%R"@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)0I<<W5B<W5B<V5C=&EO;GL@8V]N<R!]"@I%=F%L=6%T92!T:&4@='=O
M('!A<F%M971E<G,L('1H96X@861D('1H92!F:7)S="!P87)A;65T97(L(&%N
M(&%T;VTL(&]N=&\*=&AE('-E8V]N9"!P87)A;65T97(L(&$@;&ES="X@($-O
M;G,@9&]E<R!T:&4@;W!P;W-I=&4@;V8@0T%2(&%N9"!#1%(N"@I<;G=E;F1D
M;V-S>WU<;G=B96=I;F-O9&5[,3`X?5QS=6)L86)E;'M.5V5V83<M179A22XU
M+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E
M=F$W+45V84DN-2TQ?7U]7&UO9&1E9GM%=F%L(&-B(&-O;G,@<')O=&]^>UQN
M=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A22XU+3%]?7U<96YD
M;6]D9&5F"B`@("!L92`J(&5V86Q?8V)?8V]N<R@@8V]N<W0@:6YT(&%R9V,L
M(&QE("H@8G)A;F-H("D*7&YW=7-E9'M<7'M.5V5V83<M179A4BXT+3%]7%Q[
M3E=E=F$W+65V838N,BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[,3`Y
M?5QN=V1O8W-P87(*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S$Q,'U<<W5B
M;&%B96Q[3E=E=F$W+45V85(N-"TQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%2+C0M,7U]?5QM;V1D969[179A
M;"!C8B!C;VYS(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A
M9V5R969[3E=E=F$W+45V85(N-"TQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU%
M=F%L(&-B(&-O;G,@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.
M5V5V83<M179A22XU+3%]?5Q207M]"B`@("!<>PH@("`@("`@(&QE("H@<F5S
M=6QT,2`]($Y53$P["B`@("`@("`@;&4@*B!R97-U;'0R(#T@3E5,3#L*"B`@
M("`@("`@:68@*"%B<F%N8V@@?'P@87)G8R`A/2`S("D@<F5T=7)N*"!L94YE
M=R@@(DY)3"(@*2D["@H@("`@("`@(')E<W5L=#$@/2!E=F%L=6%T94YO9&4H
M8G)A;F-H+3YL:7-T7VYE>'0I.PH@("`@("`@(&EF("@@<F5S=6QT,2`]/2!.
M54Q,("D@<F5T=7)N*"!L94YE=R@@(DY)3"(@*2D["@H@("`@("`@(')E<W5L
M=#(@/2!E=F%L=6%T94YO9&4H8G)A;F-H+3YL:7-T7VYE>'0M/FQI<W1?;F5X
M="D["B`@("`@("`@:68@*"!R97-U;'0R(#T]($Y53$P@*0H@("`@("`@(%Q[
M"B`@("`@("`@("`@(&QE5VEP92@@<F5S=6QT,2`I.PH@("`@("`@("`@("!R
M971U<FXH(&QE3F5W*"`B3DE,(B`I*3L*("`@("`@("!<?0H*("`@("`@("!I
M9B`H(&-O=6YT3F]D97,H<F5S=6QT,2D@/B`Q("D*("`@("`@("!<>PH@("`@
M("`@("`@("!L92`J('1E;7`@/2!L94YE=R@@3E5,3"`I.PH@("`@("`@("`@
M("!T96UP+3YB<F%N8V@@/2!R97-U;'0Q.PH@("`@("`@("`@("!R97-U;'0Q
M(#T@=&5M<#L*("`@("`@("!<?2`*("`@("`@("!R97-U;'0Q+3YL:7-T7VYE
M>'0@/2!R97-U;'0R.PH@("`@("`@(')E<W5L=#(M/FQI<W1?<')E=B`](')E
M<W5L=#$["@H@("`@("`@(')E='5R;B@@<F5S=6QT,2`I.PH@("`@7'T*7&YW
M=7-E9'M<7'M.5V5V83<M979A-BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O
M8W-[,3$Q?5QN=V1O8W-P87(*"B4E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24*7'-U8G-U8G-E8W1I;VY[(&QI<W0@?0H*4F5T=7)N
M(&$@;&ES="!G96YE<F%T960@8GD@:F]I;FEN9R!A;&P@;V8@=&AE('!A<W-E
M9"!I;B!P87)A;65T97)S+`IA9G1E<B!E=F%L=6%T:6YG('1H96TN("!%86-H
M(&]F('1H92!P87)A;65T97)S(&%R92!T<F5A=&5D(&QI:V4@871O;7,*8F5I
M;F<@:F]I;F5D(&EN=&\@=&AE(&9I;F%L(&QI<W0N"@I<;G=E;F1D;V-S>WU<
M;G=B96=I;F-O9&5[,3$R?5QS=6)L86)E;'M.5V5V83<M179A22XV+3%]7&YW
M;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V
M84DN-BTQ?7U]7&UO9&1E9GM%=F%L(&-B(&QI<W0@<')O=&]^>UQN=W1A9W-T
M>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A22XV+3%]?7U<96YD;6]D9&5F
M"B`@("!L92`J(&5V86Q?8V)?;&ES="@@8V]N<W0@:6YT(&%R9V,L(&QE("H@
M8G)A;F-H("D*7&YW=7-E9'M<7'M.5V5V83<M179A4BXU+3%]7%Q[3E=E=F$W
M+65V838N,BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[,3$S?5QN=V1O
M8W-P87(*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S$Q-'U<<W5B;&%B96Q[
M3E=E=F$W+45V85(N-2TQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS
M=6)P86=E<F5F>TY7979A-RU%=F%2+C4M,7U]?5QM;V1D969[179A;"!C8B!L
M:7-T(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=E=F$W+45V85(N-2TQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU%=F%L(&-B
M(&QI<W0@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M
M179A22XV+3%]?5Q207M]"B`@("!<>PH@("`@("`@(&QE("H@8W5R<F5L96UE
M;G0@/2!.54Q,.PH@("`@("`@(&QE("H@9FEN86QT<F5E(#T@3E5,3#L*("`@
M("`@("!L92`J(&QA<W1A9&1E9"`]($Y53$P["B`@("`@("`@;&4@*B!R97-U
M;'0@/2!.54Q,.PH*("`@("`@("!I9B`H(6)R86YC:"D@<F5T=7)N*"!L94YE
M=R@@(DY)3"(@*2D["@H@("`@("`@(&-U<G)E;&5M96YT(#T@8G)A;F-H+3YL
M:7-T7VYE>'0["B`@("`@("`@=VAI;&4@*&-U<G)E;&5M96YT*0H@("`@("`@
M(%Q["B`@("`@("`@("`@(')E<W5L="`](&5V86QU871E3F]D92AC=7)R96QE
M;65N="D["B`@("`@("`@("`@(&EF("@@<F5S=6QT(#T]($Y53$P@*0H@("`@
M("`@("`@("!<>PH@("`@("`@("`@("`@("`@;&57:7!E*"!F:6YA;'1R964@
M*3L*("`@("`@("`@("`@("`@(')E='5R;B@@;&5.97<H(").24PB("DI.PH@
M("`@("`@("`@("!<?0H*("`@("`@("`@("`@:68H(&-O=6YT3F]D97,H<F5S
M=6QT*2`^(#$I"B`@("`@("`@("`@(%Q["B`@("`@("`@("`@("`@("!L92`J
M('1E;7`@/2!L94YE=R@@3E5,3"`I.PH@("`@("`@("`@("`@("`@=&5M<"T^
M8G)A;F-H(#T@<F5S=6QT.PH@("`@("`@("`@("`@("`@<F5S=6QT(#T@=&5M
M<#L*("`@("`@("`@("`@7'T*("`@(`H@("`@("`@("`@("!I9B`H(69I;F%L
M=')E92D*("`@("`@("`@("`@7'L*("`@("`@("`@("`@("`@(&9I;F%L=')E
M92`](')E<W5L=#L*("`@("`@("`@("`@("`@(&QA<W1A9&1E9"`](')E<W5L
M=#L*("`@("`@("`@("`@7'T@96QS92!<>PH@("`@("`@("`@("`@("`@;&%S
M=&%D9&5D+3YL:7-T7VYE>'0@/2!R97-U;'0["B`@("`@("`@("`@("`@("!R
M97-U;'0M/FQI<W1?<')E=B`@("`](&QA<W1A9&1E9#L*("`@("`@("`@("`@
M("`@(&QA<W1A9&1E9"`](')E<W5L=#L*("`@("`@("`@("`@("`@(`H@("`@
M("`@("`@("!<?0H@("`@("`@("`@("`*("`@("`@("`@("`@8W5R<F5L96UE
M;G0@/2!C=7)R96QE;65N="T^;&ES=%]N97AT.PH@("`@("`@(%Q]"@H@("`@
M("`@(&EF("@A9FEN86QT<F5E*0H@("`@("`@(%Q["B`@("`@("`@("`@(')E
M='5R;B@@;&5.97<H(").24PB("DI.PH@("`@("`@(%Q]"B`@("`@("`@<F5T
M=7)N*"!F:6YA;'1R964@*3L*("`@(%Q]"EQN=W5S961[7%Q[3E=E=F$W+65V
M838M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S$Q-7U<;G=D;V-S<&%R
M"@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<
M<W5B<W5B<V5C=&EO;GL@97%U86PZ('-I;6EL87(@;V)J96-T<S\@?0H*5&AI
M<R!I<R!A(&AE;'!E<B!F=6YC=&EO;B!F;W(@=&AE(&9O;&QO=VEN9R![7'1T
M>WUE<75A;'T@8V%L;&)A8VLN"E1H:7,@9V5T<R!R96-U<G-I=F5L>2!C86QL
M960@8GD@:71S96QF+B`@270@8F%S:6-A;&QY('1R879E<G-E<PIT:&4@>UQT
M='M];&ES=#%]('1R964L(&-O;7!A<FEN9R!I="!T;R![7'1T>WUL:7-T,GTL
M(&UA:VEN9R!S=7)E(&ET(&AA<PIT:&4@<V%M92!S=')U8W1U<F4@86YD(&5L
M96UE;G1S(&EN(&ET+B`*"DEF('1H92!L:7-T<R!A<F4@=&AE('-A;64L(&ET
M(')E='5R;G,@82![7'1T>WTQ?2X@($EF('1H97D@9&EF9F5R+"!I="!W:6QL
M"G)E='5R;B!A('M<='1[?3!]+@H*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D
M97LQ,39]7'-U8FQA8F5L>TY7979A-RU%=F%1+C<M,7U<;G=M87)G:6YT86=[
M>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A42XW+3%]?7U<
M;6]D9&5F>T5V86P@8V(@97%U86P@:&5L<&5R('!R;W1O?GM<;G=T86=S='EL
M97M]7'-U8G!A9V5R969[3E=E=F$W+45V85$N-RTQ?7U]7&5N9&UO9&1E9@H@
M("`@:6YT(&5V86Q?8V)?;&ES='-?<V%M92@@;&4@*B!L:7-T,2P@;&4@*B!L
M:7-T,B`I"EQN=W5S961[7%Q[3E=E=F$W+45V85HM,7U<7'M.5V5V83<M979A
M-BXR+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLQ,3=]7&YW9&]C<W!A
M<@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,3$X?5QS=6)L86)E;'M.5V5V
M83<M179A6BTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E
M<F5F>TY7979A-RU%=F%:+3%]?7U<;6]D9&5F>T5V86P@8V(@97%U86P@:&5L
M<&5R(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=E=F$W+45V85HM,7U]?5QE;F1M;V1D968*("`@(%Q,07M]179A;"!C8B!E
M<75A;"!H96QP97(@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.
M5V5V83<M179A42XW+3%]?5Q207M]"B`@("!<>PH@("`@("`@(&EF("@A;&ES
M=#$@)B8@(6QI<W0R*2`@("!R971U<FXH(#$@*3L*"B`@("`@("`@=VAI;&4H
M(&QI<W0Q("D*("`@("`@("!<>PH@("`@("`@("`@("`O*B!I9B!L:7-T,B!E
M;F1E9"!P<F5M871U<F5L>2P@9F%I;"`J+PH@("`@("`@("`@("!I9B`H;&ES
M=#(@/3T@3E5,3"D*("`@("`@("`@("`@7'L*("`@("`@("`@("`@("`@(')E
M='5R;B@@,"`I.PH@("`@("`@("`@("!<?0H*("`@("`@("`@("`@+RH@:68@
M;VYE(&AA<R!D871A(&%N9"!T:&4@;W1H97(@9&]E<VXG="P@9F%I;"`J+PH@
M("`@("`@("`@("!I9B`H("`@*&QI<W0Q+3YD871A("8F("$@;&ES=#(M/F1A
M=&$I"B`@("`@("`@("`@("`@("!\?"`H;&ES=#(M/F1A=&$@)B8@(2!L:7-T
M,2T^9&%T82DI"B`@("`@("`@("`@(%Q["B`@("`@("`@("`@("`@("!R971U
M<FXH(#`@*3L*("`@("`@("`@("`@7'T*"B`@("`@("`@("`@("\J(&EF('1H
M92!D871A(&ES(&1I9F9E<F5N="P@9F%I;"`J+PH@("`@("`@("`@("!I9B`H
M;&ES=#$M/F1A=&$@)B8@;&ES=#(M/F1A=&$I"B`@("`@("`@("`@(%Q["B`@
M("`@("`@("`@("`@("!I9B`H<W1R8VUP*"!L:7-T,2T^9&%T82P@;&ES=#(M
M/F1A=&$@*2D*("`@("`@("`@("`@("`@(%Q["B`@("`@("`@("`@("`@("`@
M("`@<F5T=7)N*"`P("D["B`@("`@("`@("`@("`@("!<?0H@("`@("`@("`@
M("!<?0H*("`@("`@("`@("`@+RH@:68@;VYE(&ES('%U;W1E9"!A;F0@=&AE
M(&]T:&5R(&ES;B=T+"!F86EL("HO"B`@("`@("`@("`@(&EF("AL:7-T,2T^
M<75O=&5D("$](&QI<W0R+3YQ=6]T960I"B`@("`@("`@("`@(%Q["B`@("`@
M("`@("`@("`@("!R971U<FXH(#`@*3L*("`@("`@("`@("`@7'T*"B`@("`@
M("`@("`@("\J(&EF('1H96ER(&)R86YC:&5S(&%R96XG="!T:&4@<V%M92P@
M9F%I;"`J+PH@("`@("`@("`@("!I9B`H(65V86Q?8V)?;&ES='-?<V%M92@@
M;&ES=#$M/F)R86YC:"P@;&ES=#(M/F)R86YC:"`I*0H@("`@("`@("`@("!<
M>PH@("`@("`@("`@("`@("`@<F5T=7)N*"`P("D["B`@("`@("`@("`@(%Q]
M"@H@("`@("`@("`@("`O*B!T<GD@=&AE(&YE>'0@:6X@=&AE(&QI<W0@*B\*
M("`@("`@("`@("`@;&ES=#$@/2!L:7-T,2T^;&ES=%]N97AT.PH@("`@("`@
M("`@("!L:7-T,B`](&QI<W0R+3YL:7-T7VYE>'0["B`@("`@("`@7'T*"B`@
M("`@("`@+RH@:68@;&ES=#(@9V]E<R!O;BP@9F%I;"`J+PH@("`@("`@(&EF
M("AL:7-T,BD*("`@("`@("!<>PH@("`@("`@("`@("!R971U<FXH(#`@*3L*
M("`@("`@("!<?0H*("`@("`@("!R971U<FXH(#$@*3L*("`@(%Q]"EQN=W5S
M961[7%Q[3E=E=F$W+65V838M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S
M>S$Q.7U<;G=D;V-S<&%R"@HE)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E"EQS=6)S=6)S96-T:6]N>R!E<75A;#H@8V]M<&%R92!T
M=V\@;&ES=',@?0H*179A;'5A=&4@=&AE('1W;R!P87)A;65T97)S+"!A;F0@
M8V]M<&%R92!T:&5M('1O('-E92!I9B!T:&5Y(&AA=F4@=&AE"G-A;64@<W1R
M=6-T=7)E(&%N9"!E;&5M96YT<RX@(%=E('=I;&P@:G5S="!C86QL('1H92!A
M8F]V92![7'1T>WTN+BYS86UE*"E]"FUE=&AO9"!W:&EC:"!W:6QL(')E='5R
M;B!A('M<='1[?3%](&EF('1H97D@87)E('1H92!S86UE+@H*5V4@=&AE;B!W
M:6QL(')E='5R;B!A('M<='1[?51](&%T;VT@:68@=&AE>2!W97)E('1H92!S
M86UE+"!A;F0@82![7'1T>WU.24Q]"FEF('1H97D@=V5R92!D:69F97)E;G0N
M"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,3(P?5QS=6)L86)E;'M.5V5V
M83<M179A2BXS+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A
M9V5R969[3E=E=F$W+45V84HN,RTQ?7U]7&UO9&1E9GM%=F%L(&-B(&5Q=6%L
M('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84HN
M,RTQ?7U]7&5N9&UO9&1E9@H@("`@;&4@*B!E=F%L7V-B7V5Q=6%L*"!C;VYS
M="!I;G0@87)G8RP@;&4@*B!B<F%N8V@@*0I<;G=U<V5D>UQ<>TY7979A-RU%
M=F%3+C,M,7U<7'M.5V5V83<M979A-BXR+3%]?5QN=V5N9&-O9&5[?5QN=V)E
M9VEN9&]C<WLQ,C%]7&YW9&]C<W!A<@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O
M9&5[,3(R?5QS=6)L86)E;'M.5V5V83<M179A4RXS+3%]7&YW;6%R9VEN=&%G
M>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85,N,RTQ?7U]
M7&UO9&1E9GM%=F%L(&-B(&5Q=6%L(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S
M='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85,N,RTQ?7U]7&5N9&UO9&1E
M9@H@("`@7$Q!>WU%=F%L(&-B(&5Q=6%L('!R;W1O?GM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=E=F$W+45V84HN,RTQ?7U<4D%[?0H@("`@7'L*("`@
M("`@("!L92`J(&QE=&5M<#L*("`@("`@("!L92`J(&QI<W0Q(#T@3E5,3#L*
M("`@("`@("!L92`J(&QI<W0R(#T@3E5,3#L*("`@("`@("!I;G0@<F5T=F%L
M(#T@,#L*"B`@("`@("`@:68@*"%B<F%N8V@@?'P@87)G8R`A/2`S("D@<F5T
M=7)N*"!L94YE=R@@(DY)3"(@*2`I.PH*("`@("`@("!L:7-T,2`](&5V86QU
M871E3F]D92@@8G)A;F-H+3YL:7-T7VYE>'0@*3L*("`@("`@("!L:7-T,B`]
M(&5V86QU871E3F]D92@@8G)A;F-H+3YL:7-T7VYE>'0M/FQI<W1?;F5X="`I
M.PH*("`@("`@("!R971V86P@/2!E=F%L7V-B7VQI<W1S7W-A;64H(&QI<W0Q
M+"!L:7-T,B`I.PH*("`@("`@("!L95=I<&4H(&QI<W0Q("D["B`@("`@("`@
M;&57:7!E*"!L:7-T,B`I.PH*("`@("`@("!R971U<FXH(&QE3F5W("@@*')E
M='9A;"`]/2`Q*2`_(")4(B`Z(").24PB("D@*3L*("`@(%Q]"EQN=W5S961[
M7%Q[3E=E=F$W+65V838M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S$R
M,WU<;G=D;V-S<&%R"@HE)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E"EQS=6)S=6)S96-T:6]N>R!I9B!]"@I4:&4@<W1A;F1A<F0@
M8V]N9&ET:6]N86PN("`@*&EF("AC;VYD:71I;VYA;"D@*'1H96XM8FQO8VLI
M("AE;'-E+6)L;V-K*2D*"GM<='1[?6EF?2!W:6QL(&5V86QU871E('1H92!F
M:7)S="!P87)A;65T97(N("!)9B!I="!E=F%L=6%T97,@=&\@=&AE('M<='1[
M?51]"F%T;VTL('1H96X@>UQT='M]:69]('=I;&P@=&AE;B!E=F%L=6%T92!T
M:&4@9F]L;&]W:6YG('M<='1[?71H96Y](&)L;V-K+B`@268@"FET('=A<R!N
M;VXM>UQT='M]5'TL('1H96X@:70@=VEL;"!E=F%L=6%T92!T:&4@>UQT='M]
M96QS97T@8FQO8VLN"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,3(T?5QS
M=6)L86)E;'M.5V5V83<M179A1RXT+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S
M='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84<N-"TQ?7U]7&UO9&1E9GM%
M=F%L(&-B(&EF('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E
M=F$W+45V84<N-"TQ?7U]7&5N9&UO9&1E9@H@("`@;&4@*B!E=F%L7V-B7VEF
M*"!C;VYS="!I;G0@87)G8RP@;&4@*B!B<F%N8V@@*0I<;G=U<V5D>UQ<>TY7
M979A-RU%=F%0+C4M,7U<7'M.5V5V83<M979A-BXR+3%]?5QN=V5N9&-O9&5[
M?5QN=V)E9VEN9&]C<WLQ,C5]7&YW9&]C<W!A<@I<;G=E;F1D;V-S>WU<;G=B
M96=I;F-O9&5[,3(V?5QS=6)L86)E;'M.5V5V83<M179A4"XU+3%]7&YW;6%R
M9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85`N
M-2TQ?7U]7&UO9&1E9GM%=F%L(&-B(&EF(&EM<&QE;65N=&%T:6]N?GM<;G=T
M86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85`N-2TQ?7U]7&5N9&UO
M9&1E9@H@("`@7$Q!>WU%=F%L(&-B(&EF('!R;W1O?GM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=E=F$W+45V84<N-"TQ?7U<4D%[?0H@("`@7'L*("`@
M("`@("!L92`J(')E=&-O;F0@/2!.54Q,.PH@("`@("`@(&QE("H@<F5T8FQO
M8VL@/2!.54Q,.PH*("`@("`@("!I9B`H(6)R86YC:"!\?"!A<F=C(#P@,R!\
M?"!A<F=C(#X@-"D@<F5T=7)N*"!L94YE=R@@(DY)3"(@*2D["@H@("`@("`@
M("\J(&EF("HO"B`@("`@("`@<F5T8V]N9"`](&5V86QU871E3F]D92AB<F%N
M8V@M/FQI<W1?;F5X="D["@H@("`@("`@(&EF("@A<W1R8VUP("@@<F5T8V]N
M9"T^9&%T82P@(DY)3"(@*2D*("`@("`@("!<>PH@("`@("`@("`@("`O*B!E
M;'-E("HO"B`@("`@("`@("`@(&EF("AA<F=C(#T](#,I("\J(&YO(&5L<V4@
M*B\*("`@("`@("`@("`@("`@(')E='5R;B@@<F5T8V]N9"`I.PH*("`@("`@
M("`@("`@;&57:7!E*"!R971C;VYD("D["B`@("`@("`@("`@(')E='5R;B@@
M979A;'5A=&5.;V1E*"!B<F%N8V@M/FQI<W1?;F5X="T^;&ES=%]N97AT+3YL
M:7-T7VYE>'0@*2`I.PH@("`@("`@(%Q]"@H@("`@("`@("\J('1H96X@*B\*
M("`@("`@("!L95=I<&4H(')E=&-O;F0@*3L*("`@("`@("!R971U<FXH(&5V
M86QU871E3F]D92AB<F%N8V@M/FQI<W1?;F5X="T^;&ES=%]N97AT*2`I.PH@
M("`@7'T*7&YW=7-E9'M<7'M.5V5V83<M979A-BTQ?7U<;G=E;F1C;V1E>WU<
M;G=B96=I;F1O8W-[,3(W?5QN=V1O8W-P87(*"@HE)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E"EQS=6)S=6)S96-T:6]N>R!W:&5N
M(&%N9"!U;FQE<W,@:&5L<&5R('T*"E1H:7,@=VEL;"!E=F%L=6%T92!T:&4@
M9FER<W0@<&%R86UE=&5R+B`@"@I)9B!I="!E=F%L=6%T97,@=&\@>UQT='M]
M3DE,?2!A;F0@=&AE('M<='1[?7=H:6-H?2!P87)A;65T97(@:7,@<V5T('1O
M"GM<='1[?5=5>UQC:&%R.35]54Y,15-3?2P@($]2(&ET(&5V86QU871E<R!T
M;R!N;VXM>UQT='M]3DE,?2!T:&4@>UQT='M]=VAI8VA]('!A<F%M971E<@II
M<R!S970@=&\@>UQT='M]5U5[7&-H87(Y-7U72$5.?2!T:&5N('1H92!B;V1Y
M(&)L;V-K<R!G970@979A;'5A=&5D+"!O=&AE<G=I<V4@80I[7'1T>WU.24Q]
M(&%T;VT@:7,@<F5T=7)N960N("!4:&4@9FEN86P@8F]D>2!B;&]C:R!T;R!G
M970@979A;'5A=&5D(&AA<PII=',@=F%L=64@<F5T=7)N960N"@I<;G=E;F1D
M;V-S>WU<;G=B96=I;F-O9&5[,3(X?5QS=6)L86)E;'M.5V5V83<M179A5BXT
M+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E
M=F$W+45V858N-"TQ?7U]7&UO9&1E9GM%=F%L(&-B('=H96X@=6YL97-S(&AE
M;'!E<B!E;G5M?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V
M858N-"TQ?7U]7&5N9&UO9&1E9@IE;G5M('=H96YU;FQE<W,@7'L@5U5?5TA%
M3BP@5U5?54Y,15-3(%Q].PI<;G=U<V5D>UQ<>TY7979A-RUE=F$V+C(M,7U]
M7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S$R.7U<;G=D;V-S<&%R"@I<;G=E
M;F1D;V-S>WU<;G=B96=I;F-O9&5[,3,P?5QS=6)L86)E;'M.5V5V83<M179A
M4"XV+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=E=F$W+45V85`N-BTQ?7U]7&UO9&1E9GM%=F%L(&-B('=H96X@=6YL97-S
M('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85`N
M-BTQ?7U]7&5N9&UO9&1E9@H@("`@;&4@*@H@("`@("`@(&5V86Q?8V)?=VAE
M;G5N;&5S<U]H96QP97(H"B`@("`@("`@("`@(&5N=6T@=VAE;G5N;&5S<R!W
M:&EC:"P*("`@("`@("`@("`@8V]N<W0@:6YT(&%R9V,L(`H@("`@("`@("`@
M("!L92`J(&)R86YC:`H@("`@("`@("D*7&YW=7-E9'M<7'M.5V5V83<M179A
M62XR+3%]7%Q[3E=E=F$W+65V838N,BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I
M;F1O8W-[,3,Q?5QN=V1O8W-P87(*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E
M>S$S,GU<<W5B;&%B96Q[3E=E=F$W+45V85DN,BTQ?5QN=VUA<F=I;G1A9WM[
M7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%9+C(M,7U]?5QM
M;V1D969[179A;"!C8B!W:&5N('5N;&5S<R!I;7!L96UE;G1A=&EO;GY[7&YW
M=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%9+C(M,7U]?5QE;F1M
M;V1D968*("`@(%Q,07M]179A;"!C8B!W:&5N('5N;&5S<R!P<F]T;WY[7&YW
M=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%0+C8M,7U]7%)!>WT*
M("`@(%Q["B`@("`@("`@;&4@*B!R971V86P@/2!.54Q,.PH@("`@("`@(&QE
M("H@<F5T8FQO8VL@/2!.54Q,.PH@("`@("`@(&QE("H@=')Y=&AI<R`]($Y5
M3$P["@H@("`@("`@(&EF("@A8G)A;F-H('Q\(&%R9V,@/"`S("D@<F5T=7)N
M*"!L94YE=R@@(DY)3"(@*2D["@H@("`@("`@("\J(&-O;F1I=&EO;F%L("HO
M"B`@("`@("`@<F5T=F%L(#T@979A;'5A=&5.;V1E*&)R86YC:"T^;&ES=%]N
M97AT*3L*"B`@("`@("`@:68@*"!W:&EC:"`]/2!755]53DQ%4U,@*0H@("`@
M("`@(%Q["B`@("`@("`@("`@("\J('5N;&5S<R`M(&ET('=A<VXG="!T<G5E
M+BXN(&)A:6P@*B\*("`@("`@("`@("`@:68@*"!S=')C;7`H(')E='9A;"T^
M9&%T82P@(DY)3"(@*2D*("`@("`@("`@("`@7'L*("`@("`@("`@("`@("`@
M(&QE5VEP92@@<F5T=F%L("D["B`@("`@("`@("`@("`@("!R971U<FXH(&QE
M3F5W*"`B3DE,(B`I("D["B`@("`@("`@("`@(%Q]"B`@("`@("`@7'T@96QS
M92!<>PH@("`@("`@("`@("`O*B!W:&5N.B`@(&ET('=A<VXG="!F86QS92XN
M+B!B86EL("HO"B`@("`@("`@("`@(&EF("@@(7-T<F-M<"@@<F5T=F%L+3YD
M871A+"`B3DE,(B`I*0H@("`@("`@("`@("!<>PH@("`@("`@("`@("`@("`@
M<F5T=7)N*"!R971V86P@*3L*("`@("`@("`@("`@7'T*("`@("`@("!<?0H*
M("`@("`@("!T<GET:&ES(#T@8G)A;F-H+3YL:7-T7VYE>'0M/FQI<W1?;F5X
M=#L*("`@("`@("!W:&EL92@@=')Y=&AI<R`I"B`@("`@("`@7'L*("`@("`@
M("`@("`@:68@*')E='9A;"D@(&QE5VEP92@@<F5T=F%L("D["@H@("`@("`@
M("`@("!R971V86P@/2!E=F%L=6%T94YO9&4H=')Y=&AI<RD["B`@("`@("`@
M("`@('1R>71H:7,@/2!T<GET:&ES+3YL:7-T7VYE>'0["B`@("`@("`@7'T*
M("`@("`@("!R971U<FXH(')E='9A;"`I.PH@("`@7'T*7&YW=7-E9'M<7'M.
M5V5V83<M979A-BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[,3,S?5QN
M=V1O8W-P87(*"@HE)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E"EQS=6)S=6)S96-T:6]N>R!U;FQE<W,@?0H**'5N;&5S<R`H8V]N
M9&ET:6]N86PI("AB;&]C:RD@*&)L;V-K*2`N+BX@*0H*>UQT='M]=6YL97-S
M?2!W:6QL(&5V86QU871E('1H92!F:7)S="!P87)A;65T97(N("!)9B!I="!E
M=F%L=6%T97,@=&\@>UQT='M]3DE,?0IT:&5N('1H92!B;V1Y(&)L;V-K<R!G
M970@979A;'5A=&5D+"!O=&AE<G=I<V4@82![7'1T>WU.24Q](&%T;VT@:7,@
M<F5T=7)N960N"E1H92!F:6YA;"!B;V1Y(&)L;V-K('1O(&=E="!E=F%L=6%T
M960@:&%S(&ET<R!V86QU92!R971U<FYE9"X*"EQN=V5N9&1O8W-[?5QN=V)E
M9VEN8V]D97LQ,S1]7'-U8FQA8F5L>TY7979A-RU%=F%++C,M,7U<;G=M87)G
M:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A2RXS
M+3%]?7U<;6]D9&5F>T5V86P@8V(@=6YL97-S('!R;W1O?GM<;G=T86=S='EL
M97M]7'-U8G!A9V5R969[3E=E=F$W+45V84LN,RTQ?7U]7&5N9&UO9&1E9@H@
M("`@;&4@*B!E=F%L7V-B7W5N;&5S<R@@8V]N<W0@:6YT(&%R9V,L(&QE("H@
M8G)A;F-H("D*7&YW=7-E9'M<7'M.5V5V83<M179A5"XS+3%]7%Q[3E=E=F$W
M+65V838N,BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[,3,U?5QN=V1O
M8W-P87(*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S$S-GU<<W5B;&%B96Q[
M3E=E=F$W+45V850N,RTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS
M=6)P86=E<F5F>TY7979A-RU%=F%4+C,M,7U]?5QM;V1D969[179A;"!C8B!U
M;FQE<W,@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5V5V83<M179A5"XS+3%]?7U<96YD;6]D9&5F"B`@("!<3$%[?45V86P@
M8V(@=6YL97-S('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E
M=F$W+45V84LN,RTQ?7U<4D%[?0H@("`@7'L*("`@("`@("!R971U<FXH(&5V
M86Q?8V)?=VAE;G5N;&5S<U]H96QP97(H"B`@("`@("`@("`@("`@("`@("`@
M("`@(%=57U5.3$534RP*("`@("`@("`@("`@("`@("`@("`@("`@87)G8RP*
M("`@("`@("`@("`@("`@("`@("`@("`@8G)A;F-H("D@*3L*("`@(%Q]"EQN
M=W5S961[7%Q[3E=E=F$W+65V838M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD
M;V-S>S$S-WU<;G=D;V-S<&%R"@H*)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)0I<<W5B<W5B<V5C=&EO;GL@=VAE;B!]"@HH=VAE
M;B`H8V]N9&ET:6]N86PI("AB;&]C:RD@*&)L;V-K*2`N+BX@*0H*>UQT='M]
M=VAE;GT@979A;'5A=&5S('1H92!F:7)S="!P87)A;65T97(N("!)9B!I="!R
M971U<FYS(&$@;F]N+7M<='1[?4Y)3'T@=F%L=64L"G1H96X@=&AE(')E;6%I
M;FEN9R!B;V1Y(&)L;V-K<R!G970@979A;'5A=&5D+"!O=&AE<G=I<V4@:70@
M=VEL;"!R971U<FX*82![7'1T>WU.24Q](&%T;VTN("!4:&4@;&%S="!C;VYD
M:71I;VYA;"=S('9A;'5E(&=E=',@<F5T=7)N960@;W1H97)W:7-E+@H*5&AI
M<R!I<R!B87-I8V%L;'D@=&AE('-A;64@87,@>UQT='M]=6YL97-S?2!B=70@
M=VET:"!A(')E=F5R<V5D(&-O;F1I=&EO;F%L+@I4:&ES(&UI9VAT(&)E(&EN
M=&5G<F%T960@=VET:"!I="!I;G1O(&$@:&5L<&5R(&9U;F-T:6]N(&5V96YT
M=6%L;'DN"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,3,X?5QS=6)L86)E
M;'M.5V5V83<M179A22XW+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=E=F$W+45V84DN-RTQ?7U]7&UO9&1E9GM%=F%L(&-B
M('=H96X@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M
M179A22XW+3%]?7U<96YD;6]D9&5F"B`@("!L92`J(&5V86Q?8V)?=VAE;B@@
M8V]N<W0@:6YT(&%R9V,L(&QE("H@8G)A;F-H("D*7&YW=7-E9'M<7'M.5V5V
M83<M179A4BXV+3%]7%Q[3E=E=F$W+65V838N,BTQ?7U<;G=E;F1C;V1E>WU<
M;G=B96=I;F1O8W-[,3,Y?5QN=V1O8W-P87(*7&YW96YD9&]C<WM]7&YW8F5G
M:6YC;V1E>S$T,'U<<W5B;&%B96Q[3E=E=F$W+45V85(N-BTQ?5QN=VUA<F=I
M;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%2+C8M
M,7U]?5QM;V1D969[179A;"!C8B!W:&5N(&EM<&QE;65N=&%T:6]N?GM<;G=T
M86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85(N-BTQ?7U]7&5N9&UO
M9&1E9@H@("`@7$Q!>WU%=F%L(&-B('=H96X@<')O=&]^>UQN=W1A9W-T>6QE
M>WU<<W5B<&%G97)E9GM.5V5V83<M179A22XW+3%]?5Q207M]"B`@("!<>PH@
M("`@("`@(')E='5R;B@@979A;%]C8E]W:&5N=6YL97-S7VAE;'!E<B@*("`@
M("`@("`@("`@("`@("`@("`@("`@5U5?5TA%3BP*("`@("`@("`@("`@("`@
M("`@("`@("`@87)G8RP*("`@("`@("`@("`@("`@("`@("`@("`@8G)A;F-H
M("D@*3L*("`@(%Q]"EQN=W5S961[7%Q[3E=E=F$W+65V838M,7U]7&YW96YD
M8V]D97M]7&YW8F5G:6YD;V-S>S$T,7U<;G=D;V-S<&%R"@HE)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E"EQS=6)S=6)S96-T:6]N
M>R!C;VYD('T*"BAC;VYD("@H8V]N9&ET:6]N86PI("AB;&]C:RD@+BXN("D*
M("`@("`@*"AC;VYD:71I;VYA;"D@*&)L;V-K*2`N+BX@*0H@("`@("`H*&-O
M;F1I=&EO;F%L*2`H8FQO8VLI("XN+B`I"BD*"GM<='1[?6-O;F1](&-H96-K
M<R!E86-H(&-O;F1I=&EO;F%L(&EN('1U<FXN("!4:&4@9FER<W0@;VYE(')E
M='5R;FEN9PIN;VXM>UQT='M]3DE,?2!G971S(&ET<R!B;V1Y(&)L;V-K<R!E
M=F%L=6%T960N("!4:&4@;&%S="!B;&]C:R!R96QA=&5D('1O"G1H870@8V]N
M9'1I;VYA;"!G971S(&ET<R!V86QU92!R971U<FYE9"X*"DEF('1H92!S=6-C
M965D:6YG(&-O;F1I=&EO;F%L(&AA<R!N;R!B;&]C:RP@=&AE(')E='5R;B!V
M86QU92!O9B!T:&4*8V]N9&ET:6]N86P@:7,@<F5T=7)N960N"@I)9B!N;R!C
M;VYD:71I;VYA;"!S871I<V9I97,@:70L(&$@>UQT='M]3DE,?2!A=&]M('=I
M;&P@8F4@<F5T=7)N960N"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,30R
M?5QS=6)L86)E;'M.5V5V83<M179A22XX+3%]7&YW;6%R9VEN=&%G>WM<;G=T
M86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84DN."TQ?7U]7&UO9&1E
M9GM%=F%L(&-B(&-O;F0@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5V5V83<M179A22XX+3%]?7U<96YD;6]D9&5F"B`@("!L92`J(&5V86Q?
M8V)?8V]N9"@@8V]N<W0@:6YT(&%R9V,L(&QE("H@8G)A;F-H("D*7&YW=7-E
M9'M<7'M.5V5V83<M179A4BXW+3%]7%Q[3E=E=F$W+65V838N,BTQ?7U<;G=E
M;F1C;V1E>WU<;G=B96=I;F1O8W-[,30S?5QN=V1O8W-P87(*7&YW96YD9&]C
M<WM]7&YW8F5G:6YC;V1E>S$T-'U<<W5B;&%B96Q[3E=E=F$W+45V85(N-RTQ
M?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A
M-RU%=F%2+C<M,7U]?5QM;V1D969[179A;"!C8B!C;VYD(&EM<&QE;65N=&%T
M:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85(N-RTQ
M?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU%=F%L(&-B(&-O;F0@<')O=&]^>UQN
M=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A22XX+3%]?5Q207M]
M"B`@("!<>PH@("`@("`@(&QE("H@<F5T=F%L(#T@3E5,3#L*("`@("`@("!L
M92`J(')E=&)L;V-K(#T@3E5,3#L*("`@("`@("!L92`J('1R>71H:7,@/2!.
M54Q,.PH@("`@("`@(&QE("H@=')Y8FQO8VL@/2!.54Q,.PH@("`@("`@(&EN
M="!N97=A<F=C.PH*("`@("`@("!I9B`H(6)R86YC:"!\?"!A<F=C(#P@,B`I
M(')E='5R;B@@;&5.97<H(").24PB("DI.PH*("`@("`@("!T<GET:&ES(#T@
M8G)A;F-H+3YL:7-T7VYE>'0["B`@("`@("`@=VAI;&4@*'1R>71H:7,I"B`@
M("`@("`@7'L*("`@("`@("`@("`@;F5W87)G8R`](&-O=6YT3F]D97,H('1R
M>71H:7,M/F)R86YC:"`I.PH@("`@("`@("`@("!I9B`H;F5W87)G8R`]/2`P
M*2`@8V]N=&EN=64["@H@("`@("`@("`@("`O*B!C;VYD:71I;VYA;"`J+PH@
M("`@("`@("`@("!I9B`H<F5T=F%L*2`@;&57:7!E*')E='9A;"D["B`@("`@
M("`@("`@(')E='9A;"`](&5V86QU871E3F]D92AT<GET:&ES+3YB<F%N8V@I
M.PH*("`@("`@("`@("`@:68@*"!S=')C;7`H<F5T=F%L+3YD871A+"`B3DE,
M(B`I*2`*("`@("`@("`@("`@7'L*("`@("`@("`@("`@("`@(&EF("AN97=A
M<F=C(#T](#$I"B`@("`@("`@("`@("`@("!<>PH@("`@("`@("`@("`@("`@
M("`@(')E='5R;B@@<F5T=F%L("D["B`@("`@("`@("`@("`@("!<?0H*("`@
M("`@("`@("`@("`@('1R>6)L;V-K(#T@=')Y=&AI<RT^8G)A;F-H+3YL:7-T
M7VYE>'0["B`@("`@("`@("`@("`@("!W:&EL92`H=')Y8FQO8VLI"B`@("`@
M("`@("`@("`@("!<>PH@("`@("`@("`@("`@("`@("`@(&EF("AR971B;&]C
M:RD@(&QE5VEP92AR971B;&]C:RD["B`@("`@("`@("`@("`@("`@("`@<F5T
M8FQO8VL@/2!.54Q,.PH*("`@("`@("`@("`@("`@("`@("!R971B;&]C:R`]
M(&5V86QU871E3F]D92AT<GEB;&]C:RD["B`@("`@("`@("`@("`@("`@("`@
M=')Y8FQO8VL@/2!T<GEB;&]C:RT^;&ES=%]N97AT.PH@("`@("`@("`@("`@
M("`@7'T*("`@("`@("`@("`@("`@(')E='5R;B@@<F5T8FQO8VL@*3L*("`@
M("`@("`@("`@7'T*("`@("`@("`@("`@("`@(`H@("`@("`@("`@("!T<GET
M:&ES(#T@=')Y=&AI<RT^;&ES=%]N97AT.PH@("`@("`@(%Q]"B`@("`@("`@
M<F5T=7)N*"!R971V86P@*3L*("`@(%Q]"EQN=W5S961[7%Q[3E=E=F$W+65V
M838M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S$T-7U<;G=D;V-S<&%R
M"@HE)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E"EQS
M=6)S=6)S96-T:6]N>R!S96QE8W0@?0H**'-E;&5C="`H97AP<F5S<VEO;BD*
M("`@("`@("`H=F%L=64Q(#QB;V1Y,3XI"B`@("`@("`@*'9A;'5E,B`\8F]D
M>3(^*2`N+BX*("`@("`@("`H=F%L=65.(#QB;V1Y3CXI"BD*"E1H:7,@86-T
M<R!L:6ME('1H92`G<W=I=&-H)R!O<B`G8V%S92<@<W1A=&5M96YT<R!I;B!O
M=&AE<B!L86YG=6%G97,N("!)=`IW:6QL(&5V86QU871E('1H92!E>'!R97-S
M:6]N+"!T:&5N(&QO;VL@9F]R('1H870@=F%L=64@:6X@=&AE(&QI<W0@;V8@
M:71E;7,*<F5M86EN:6YG+B`@5VAE;B!I="!F:6YD<R!T:&4@<FEG:'0@=F%L
M=64L('1H870@8F]D>2!B;&]C:R!I<R!E>&5C=71E9"X*"DEF('1H97)E(&ES
M(&YO;F4@9F]U;F0L('1H92!V86QU92!F<F]M('1H92!E>'!R97-S:6]N(&ES
M(')E='5R;F5D+@H*5&AE(&QA<W0@<F5T=7)N('9A;'5E(&9R;VT@=&AE(&9R
M;VT@=&AE(&)O9'D@8FQO8VL@9V5T<R!R971U<FYE9"X*"EQN=V5N9&1O8W-[
M?5QN=V)E9VEN8V]D97LQ-#9]7'-U8FQA8F5L>TY7979A-RU%=F%++C0M,7U<
M;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M
M179A2RXT+3%]?7U<;6]D9&5F>T5V86P@8V(@<V5L96-T('!R;W1O?GM<;G=T
M86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84LN-"TQ?7U]7&5N9&UO
M9&1E9@H@("`@;&4@*B!E=F%L7V-B7W-E;&5C="@@8V]N<W0@:6YT(&%R9V,L
M(&QE("H@8G)A;F-H("D*7&YW=7-E9'M<7'M.5V5V83<M179A5"XT+3%]7%Q[
M3E=E=F$W+65V838N,BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[,30W
M?5QN=V1O8W-P87(*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S$T.'U<<W5B
M;&%B96Q[3E=E=F$W+45V850N-"TQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%4+C0M,7U]?5QM;V1D969[179A
M;"!C8B!S96QE8W0@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B
M<&%G97)E9GM.5V5V83<M179A5"XT+3%]?7U<96YD;6]D9&5F"B`@("!<3$%[
M?45V86P@8V(@<V5L96-T('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R
M969[3E=E=F$W+45V84LN-"TQ?7U<4D%[?0H@("`@7'L*("`@("`@("!L92`J
M(')E<W5L=#L*"B`@("`@("`@:68@*&%R9V,@/"`R*2`@<F5T=7)N*"!L94YE
M=R@@(DY)3"(@*2D["@H@("`@("`@(&)R86YC:"`](&)R86YC:"T^;&ES=%]N
M97AT.PH@("`@("`@(')E<W5L="`](&5V86QU871E3F]D92AB<F%N8V@I.PH*
M("`@("`@("!B<F%N8V@@/2!B<F%N8V@M/FQI<W1?;F5X=#L*("`@("`@("!W
M:&EL92@@8G)A;F-H("D*("`@("`@("!<>PH@("`@("`@("`@("!I9B@@8G)A
M;F-H+3YB<F%N8V@@*0H@("`@("`@("`@("!<>PH@("`@("`@("`@("`@("`@
M;&4@*B!C:&5C:R`](&)R86YC:"T^8G)A;F-H.PH@("`@("`@("`@("`@("`@
M:68@*&-H96-K("8F(&-H96-K+3YD871A"B`@("`@("`@("`@("`@("`@("`@
M)B8@*"%S=')C;7`H(&-H96-K+3YD871A+"!R97-U;'0M/F1A=&$@*2DI"B`@
M("`@("`@("`@("`@("!<>PH@("`@("`@("`@("`@("`@("`@("\J('=E)W)E
M(&EN('1H92!R:6=H="!P;&%C92P@979A;'5A=&4@86YD(')E='5R;B`J+PH@
M("`@("`@("`@("`@("`@("`@(&QE("H@8V]M<'5T96QI<W0@/2!C:&5C:RT^
M;&ES=%]N97AT.PH@("`@("`@("`@("`@("`@("`@('=H:6QE*"!C;VUP=71E
M;&ES="`I"B`@("`@("`@("`@("`@("`@("`@7'L*("`@("`@("`@("`@("`@
M("`@("`@("`@;&57:7!E*"!R97-U;'0@*3L*("`@("`@("`@("`@("`@("`@
M("`@("`@<F5S=6QT(#T@979A;'5A=&5.;V1E*"!C;VUP=71E;&ES="`I.PH@
M("`@("`@("`@("`@("`@("`@("`@("!C;VUP=71E;&ES="`](&-O;7!U=&5L
M:7-T+3YL:7-T7VYE>'0["B`@("`@("`@("`@("`@("`@("`@7'T*("`@("`@
M("`@("`@("`@("`@("!R971U<FXH(')E<W5L="`I.PH@("`@("`@("`@("`@
M("`@7'T*("`@("`@("`@("`@7'T*("`@("`@("`@("`@"B`@("`@("`@("`@
M(&)R86YC:"`](&)R86YC:"T^;&ES=%]N97AT.PH@("`@("`@(%Q]"@H@("`@
M("`@(')E='5R;B@@<F5S=6QT("D["B`@("!<?0I<;G=U<V5D>UQ<>TY7979A
M-RUE=F$V+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLQ-#E]7&YW9&]C
M<W!A<@H*"@HE)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E"EQS=6)S=6)S96-T:6]N>R!P<FEN8R!]"@I3:6UP;'D@<')I;G0@=&\@
M<W1A;F1A<F0@;W5T<'5T('1H92!P87)A;65T97)S('!A<W-E9"!I;BX*"EQN
M=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LQ-3!]7'-U8FQA8F5L>TY7979A-RU%
M=F%*+C0M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5V5V83<M179A2BXT+3%]?7U<;6]D9&5F>T5V86P@8V(@<')I;F,@<')O
M=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A2BXT+3%]
M?7U<96YD;6]D9&5F"B`@("!L92`J(&5V86Q?8V)?<')I;F,H(&-O;G-T(&EN
M="!A<F=C+"!L92`J(&)R86YC:"`I"EQN=W5S961[7%Q[3E=E=F$W+45V85,N
M-"TQ?5Q<>TY7979A-RUE=F$V+C(M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD
M;V-S>S$U,7U<;G=D;V-S<&%R"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LQ
M-3)]7'-U8FQA8F5L>TY7979A-RU%=F%3+C0M,7U<;G=M87)G:6YT86=[>UQN
M=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A4RXT+3%]?7U<;6]D
M9&5F>T5V86P@8V(@<')I;F,@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE
M>WU<<W5B<&%G97)E9GM.5V5V83<M179A4RXT+3%]?7U<96YD;6]D9&5F"B`@
M("!<3$%[?45V86P@8V(@<')I;F,@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B
M<&%G97)E9GM.5V5V83<M179A2BXT+3%]?5Q207M]"B`@("!<>PH@("`@("`@
M(&QE("H@=&AI<VYO9&4["B`@("`@("`@;&4@*B!R971B;&]C:R`]($Y53$P[
M"B`@("`@("`@:68@*"%B<F%N8V@@?'P@87)G8R`\(#$@*2!R971U<FXH(&QE
M3F5W*"`B3DE,(B`I*3L*"B`@("`@("`@=&AI<VYO9&4@/2!B<F%N8V@M/FQI
M<W1?;F5X=#L*("`@("`@("!W:&EL92`H=&AI<VYO9&4I"B`@("`@("`@7'L*
M("`@("`@("`@("`@:68@*')E=&)L;V-K*2`@;&57:7!E*"!R971B;&]C:R`I
M.PH@("`@("`@("`@("!R971B;&]C:R`](&5V86QU871E3F]D92AT:&ES;F]D
M92D["B`@("`@("`@("`@(&QE1'5M<%)E9F]R;6%T*'-T9&]U="P@<F5T8FQO
M8VLI.PH*("`@("`@("`@("`@=&AI<VYO9&4@/2!T:&ES;F]D92T^;&ES=%]N
M97AT.PH@("`@("`@(%Q]"B`@("`@("`@<F5T=7)N*"!R971B;&]C:R`I.PH@
M("`@7'T*7&YW=7-E9'M<7'M.5V5V83<M979A-BTQ?7U<;G=E;F1C;V1E>WU<
M;G=B96=I;F1O8W-[,34S?5QN=V1O8W-P87(*"B4E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24*7'-U8G-U8G-E8W1I;VY[('1E<G!R
M:2!]"@I3:6UP;'D@<')I;G0@=&\@<W1A;F1A<F0@;W5T<'5T(&$@;F5W;&EN
M92!C:&%R86-A=&5R+@H*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S$U-'U<
M<W5B;&%B96Q[3E=E=F$W+45V84LN-2TQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G
M<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%++C4M,7U]?5QM;V1D969[
M179A;"!C8B!T97)P<FD@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5V5V83<M179A2RXU+3%]?7U<96YD;6]D9&5F"B`@("!L92`J(&5V86Q?
M8V)?=&5R<')I*"!C;VYS="!I;G0@87)G8RP@;&4@*B!B<F%N8V@@*0I<;G=U
M<V5D>UQ<>TY7979A-RU%=F%4+C4M,7U<7'M.5V5V83<M979A-BXR+3%]?5QN
M=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLQ-35]7&YW9&]C<W!A<@I<;G=E;F1D
M;V-S>WU<;G=B96=I;F-O9&5[,34V?5QS=6)L86)E;'M.5V5V83<M179A5"XU
M+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E
M=F$W+45V850N-2TQ?7U]7&UO9&1E9GM%=F%L(&-B('1E<G!R:2!I;7!L96UE
M;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%4
M+C4M,7U]?5QE;F1M;V1D968*("`@(%Q,07M]179A;"!C8B!T97)P<FD@<')O
M=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A2RXU+3%]
M?5Q207M]"B`@("!<>PH@("`@("`@(&QE("H@=&AI<VYO9&4["B`@("`@("`@
M;&4@*B!R971B;&]C:R`]($Y53$P["B`@("`@("`@:68@*"%B<F%N8V@@?'P@
M87)G8R`A/2`Q("D@<F5T=7)N*"!L94YE=R@@(DY)3"(@*2D["@H@("`@("`@
M('!R:6YT9B@@(EQ<;B(@*3L*("`@("`@("!R971U<FXH(&QE3F5W*"`B3DE,
M(B`I("D["B`@("!<?0I<;G=U<V5D>UQ<>TY7979A-RUE=F$V+3%]?5QN=V5N
M9&-O9&5[?5QN=V)E9VEN9&]C<WLQ-3=]7&YW9&]C<W!A<@H*"B4E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24*7'-U8G-U8G-E8W1I
M;VY[(&5V86P@?0H*>UQT='M]979A;'T@979A;'5A=&5S(&ET<R!P87)A;65T
M97(L(&%N9"!R971U<FYS('1H92!R97-U;'0@9G)O;2!T:&4*979A;'5A=&EO
M;BX@($ET(&UU<W0@8F%S:6-A;&QY(&1O(&$@9&]U8FQE(&5V86QU871I;VX@
M9'5E('1O('1H92!W87D*=&AI;F=S(&%R92!S=&]R960@:6YT97)N86QL>2X*
M"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LQ-3A]7'-U8FQA8F5L>TY7979A
M-RU%=F%)+CDM,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G
M97)E9GM.5V5V83<M179A22XY+3%]?7U<;6]D9&5F>T5V86P@8V(@979A;"!P
M<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%)+CDM
M,7U]?5QE;F1M;V1D968*("`@(&QE("H@979A;%]C8E]E=F%L*"!C;VYS="!I
M;G0@87)G8RP@;&4@*B!B<F%N8V@@*0I<;G=U<V5D>UQ<>TY7979A-RU%=F%2
M+C@M,7U<7'M.5V5V83<M979A-BXR+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN
M9&]C<WLQ-3E]7&YW9&]C<W!A<@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[
M,38P?5QS=6)L86)E;'M.5V5V83<M179A4BXX+3%]7&YW;6%R9VEN=&%G>WM<
M;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85(N."TQ?7U]7&UO
M9&1E9GM%=F%L(&-B(&5V86P@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE
M>WU<<W5B<&%G97)E9GM.5V5V83<M179A4BXX+3%]?7U<96YD;6]D9&5F"B`@
M("!<3$%[?45V86P@8V(@979A;"!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P
M86=E<F5F>TY7979A-RU%=F%)+CDM,7U]7%)!>WT*("`@(%Q["B`@("`@("`@
M;&4@*B!T96UP.PH@("`@("`@(&QE("H@<F5T=F%L.PH@("`@("`@(&EF("@A
M8G)A;F-H('Q\(&%R9V,@(3T@,B`I(')E='5R;B@@;&5.97<H(").24PB("DI
M.PH*("`@("`@("!T96UP(#T@979A;'5A=&5.;V1E*&)R86YC:"T^;&ES=%]N
M97AT*3L*("`@("`@("!R971V86P@/2!E=F%L=6%T94)R86YC:"AT96UP*3L*
M("`@("`@("!L95=I<&4H('1E;7`@*3L*("`@("`@("!R971U<FXH(')E='9A
M;"`I.PH@("`@7'T*7&YW=7-E9'M<7'M.5V5V83<M979A-BTQ?7U<;G=E;F1C
M;V1E>WU<;G=B96=I;F1O8W-[,38Q?5QN=V1O8W-P87(*"B4E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24*7'-U8G-U8G-E8W1I;VY[
M('!R;V=H96QP97(@?0H*4VEN8V4@=&AE(&9U;F-T:6]N<R![7'1T>WUP<F]G
M,7TL('M<='1[?7!R;V<R?2!A;F0@>UQT='M]<')O9VY](&%R92!N96%R;'D@
M:61E;G1I8V%L"FEN(&YA='5R92P@=V4@=VEL;"!U<V4@=&AE(&9O;&QO=VEN
M9R!F=6YC=&EO;B!T;R!D;R!M;W-T(&]F('1H96ER('=O<FLN"E1H92!O;FQY
M(&1I9F9E<F5N8V4@:7,@=&AA="!T:&5R92!I<R!A;B!E>'1R82!P87)A;65T
M97(L('M<='1[?7)E='5R;FET?2X*268@>UQT='M]<F5T=7)N:71](&ES(#$L
M('1H96X@=&AE(&9I<G-T(&-O9&4@8FQO8VLG<R!R97-U;'0@9V5T<R!R971U
M<FYE9"X@(`I)9B![7'1T>WUR971U<FYI='T@:7,@,BP@=&AE;B!T:&4@<V5C
M;VYD(&-O9&4@8FQO8VLG<R!R97-U;'0@9V5T<R!R971U<FYE9"X@(`I)9B![
M7'1T>WUR971U<FYI='T@:7,@;F5G871I=F4L('1H96X@=&AE(&QA<W0@8V]D
M92!B;&]C:R=S(')E<W5L="!G971S(')E='5R;F5D+B`@"@I"87-I8V%L;'DL
M('=E('=I;&P@979A;'5A=&4@86QL(&)O9'D@8FQO8VMS('!A<W-E9"!I;BP@
M86YD(')E='5R;B!T:&4*87!P<F]P<FEA=&4@<F5T=7)N(&QI<W0N"@I<;G=E
M;F1D;V-S>WU<;G=B96=I;F-O9&5[,38R?5QS=6)L86)E;'M.5V5V83<M179A
M22Y!+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=E=F$W+45V84DN02TQ?7U]7&UO9&1E9GM%=F%L(&-B('!R;V<@<')O=&]^
M>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A22Y!+3%]?7U<
M96YD;6]D9&5F"B`@("!L92`J(&5V86Q?8V)?<')O9R@@8V]N<W0@:6YT(&%R
M9V,L(&QE("H@8G)A;F-H+"!I;G0@<F5T=7)N:70@*0I<;G=U<V5D>UQ<>TY7
M979A-RU%=F%2+CDM,7U<7'M.5V5V83<M979A-BXR+3%]?5QN=V5N9&-O9&5[
M?5QN=V)E9VEN9&]C<WLQ-C-]7&YW9&]C<W!A<@I<;G=E;F1D;V-S>WU<;G=B
M96=I;F-O9&5[,38T?5QS=6)L86)E;'M.5V5V83<M179A4BXY+3%]7&YW;6%R
M9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85(N
M.2TQ?7U]7&UO9&1E9GM%=F%L(&-B('!R;V<@:6UP;&5M96YT871I;VY^>UQN
M=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A4BXY+3%]?7U<96YD
M;6]D9&5F"B`@("!<3$%[?45V86P@8V(@<')O9R!P<F]T;WY[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%)+D$M,7U]7%)!>WT*("`@(%Q[
M"B`@("`@("`@;&4@*B!C=7)R.PH@("`@("`@(&QE("H@<F5T=F%L(#T@3E5,
M3#L*("`@("`@("!L92`J('1E;7!V86P@/2!.54Q,.PH@("`@("`@(&EN="!C
M=7)R96YT(#T@,#L*("`@("`@("!I9B`H(6)R86YC:"!\?"!A<F=C(#P@*')E
M='5R;FET("LQ*2`I(')E='5R;B@@;&5.97<H(").24PB("DI.PH*("`@("`@
M("!C=7)R(#T@8G)A;F-H+3YL:7-T7VYE>'0["B`@("`@("`@=VAI;&4@*&-U
M<G(I"B`@("`@("`@7'L*("`@("`@("`@("`@*RMC=7)R96YT.PH*("`@("`@
M("`@("`@:68@*"!T96UP=F%L("D@;&57:7!E("AT96UP=F%L*3L*("`@("`@
M("`@("`@=&5M<'9A;"`](&5V86QU871E3F]D92@@8W5R<B`I.PH*("`@("`@
M("`@("`@:68@*&-U<G)E;G0@/3T@<F5T=7)N:70I"B`@("`@("`@("`@("`@
M("!R971V86P@/2!L941U<"@@=&5M<'9A;"`I.PH@("`@("`@("`@("`*("`@
M("`@("`@("`@8W5R<B`](&-U<G(M/FQI<W1?;F5X=#L*("`@("`@("!<?0H*
M("`@("`@("!I9B`H(7)E='9A;"D@(')E='9A;"`]('1E;7!V86P["@H@("`@
M("`@(')E='5R;B@@<F5T=F%L("D["B`@("!<?0I<;G=U<V5D>UQ<>TY7979A
M-RUE=F$V+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLQ-C5]7&YW9&]C
M<W!A<@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)0I<<W5B<W5B<V5C=&EO;GL@<')O9S$@?0H*57-I;F<@=&AE(&%B;W9E(&AE
M;'!E<BP@=V4@=V%N="!T;R!E=F%L=6%T92!A;&P@8V]D92!B;&]C:W,L(')E
M='5R;FEN9R`*=&AE(')E='5R;B!V86QU92!F<F]M('1H92!F:7)S="!B;&]C
M:RX*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LQ-C9]7'-U8FQA8F5L>TY7
M979A-RU%=F%*+C4M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B
M<&%G97)E9GM.5V5V83<M179A2BXU+3%]?7U<;6]D9&5F>T5V86P@8V(@<')O
M9S$@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A
M2BXU+3%]?7U<96YD;6]D9&5F"B`@("!L92`J(&5V86Q?8V)?<')O9S$H(&-O
M;G-T(&EN="!A<F=C+"!L92`J(&)R86YC:"`I"EQN=W5S961[7%Q[3E=E=F$W
M+45V85,N-2TQ?5Q<>TY7979A-RUE=F$V+C(M,7U]7&YW96YD8V]D97M]7&YW
M8F5G:6YD;V-S>S$V-WU<;G=D;V-S<&%R"EQN=V5N9&1O8W-[?5QN=V)E9VEN
M8V]D97LQ-CA]7'-U8FQA8F5L>TY7979A-RU%=F%3+C4M,7U<;G=M87)G:6YT
M86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A4RXU+3%]
M?7U<;6]D9&5F>T5V86P@8V(@<')O9S$@:6UP;&5M96YT871I;VY^>UQN=W1A
M9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A4RXU+3%]?7U<96YD;6]D
M9&5F"B`@("!<3$%[?45V86P@8V(@<')O9S$@<')O=&]^>UQN=W1A9W-T>6QE
M>WU<<W5B<&%G97)E9GM.5V5V83<M179A2BXU+3%]?5Q207M]"B`@("!<>PH@
M("`@("`@(')E='5R;B@@979A;%]C8E]P<F]G*"!A<F=C+"!B<F%N8V@L(#$@
M*2D["B`@("!<?0I<;G=U<V5D>UQ<>TY7979A-RUE=F$V+3%]?5QN=V5N9&-O
M9&5[?5QN=V)E9VEN9&]C<WLQ-CE]7&YW9&]C<W!A<@H*)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<W5B<V5C=&EO;GL@
M<')O9S(@?0H*57-I;F<@=&AE(&%B;W9E(&AE;'!E<BP@=V4@=V%N="!T;R!E
M=F%L=6%T92!A;&P@8V]D92!B;&]C:W,L(')E='5R;FEN9R`*=&AE(')E='5R
M;B!V86QU92!F<F]M('1H92!S96-O;F0@8FQO8VLN"@I<;G=E;F1D;V-S>WU<
M;G=B96=I;F-O9&5[,3<P?5QS=6)L86)E;'M.5V5V83<M179A2BXV+3%]7&YW
M;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V
M84HN-BTQ?7U]7&UO9&1E9GM%=F%L(&-B('!R;V<R('!R;W1O?GM<;G=T86=S
M='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84HN-BTQ?7U]7&5N9&UO9&1E
M9@H@("`@;&4@*B!E=F%L7V-B7W!R;V<R*"!C;VYS="!I;G0@87)G8RP@;&4@
M*B!B<F%N8V@@*0I<;G=U<V5D>UQ<>TY7979A-RU%=F%3+C8M,7U<7'M.5V5V
M83<M979A-BXR+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLQ-S%]7&YW
M9&]C<W!A<@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,3<R?5QS=6)L86)E
M;'M.5V5V83<M179A4RXV+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=E=F$W+45V85,N-BTQ?7U]7&UO9&1E9GM%=F%L(&-B
M('!R;V<R(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R
M969[3E=E=F$W+45V85,N-BTQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU%=F%L
M(&-B('!R;V<R('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E
M=F$W+45V84HN-BTQ?7U<4D%[?0H@("`@7'L*("`@("`@("!R971U<FXH(&5V
M86Q?8V)?<')O9R@@87)G8RP@8G)A;F-H+"`R("DI.PH@("`@7'T*7&YW=7-E
M9'M<7'M.5V5V83<M979A-BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[
M,3<S?5QN=V1O8W-P87(*"B4E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24*7'-U8G-U8G-E8W1I;VY[('!R;V=N('T*"E5S:6YG('1H
M92!A8F]V92!H96QP97(L('=E('=A;G0@=&\@979A;'5A=&4@86QL(&-O9&4@
M8FQO8VMS+"!R971U<FYI;F<@"G1H92!R971U<FX@=F%L=64@9G)O;2!T:&4@
M9FEN86P@8FQO8VLN"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,3<T?5QS
M=6)L86)E;'M.5V5V83<M179A2BXW+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S
M='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84HN-RTQ?7U]7&UO9&1E9GM%
M=F%L(&-B('!R;V=N('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=E=F$W+45V84HN-RTQ?7U]7&5N9&UO9&1E9@H@("`@;&4@*B!E=F%L7V-B
M7W!R;V=N*"!C;VYS="!I;G0@87)G8RP@;&4@*B!B<F%N8V@@*0I<;G=U<V5D
M>UQ<>TY7979A-RU%=F%3+C<M,7U<7'M.5V5V83<M979A-BXR+3%]?5QN=V5N
M9&-O9&5[?5QN=V)E9VEN9&]C<WLQ-S5]7&YW9&]C<W!A<@I<;G=E;F1D;V-S
M>WU<;G=B96=I;F-O9&5[,3<V?5QS=6)L86)E;'M.5V5V83<M179A4RXW+3%]
M7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W
M+45V85,N-RTQ?7U]7&UO9&1E9GM%=F%L(&-B('!R;V=N(&EM<&QE;65N=&%T
M:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85,N-RTQ
M?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU%=F%L(&-B('!R;V=N('!R;W1O?GM<
M;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84HN-RTQ?7U<4D%[
M?0H@("`@7'L*("`@("`@("!R971U<FXH(&5V86Q?8V)?<')O9R@@87)G8RP@
M8G)A;F-H+"`M,2`I*3L*("`@(%Q]"EQN=W5S961[7%Q[3E=E=F$W+65V838M
M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S$W-WU<;G=D;V-S<&%R"@H*
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B
M<W5B<V5C=&EO;GL@9&5F=6X@?0H*5&AI<R!S=&]R97,@87=A>2!A(&9U;F-T
M:6]N('1O(&)E('5S960@;&%T97(N("!4:&4@9F]R;6%T(&9O<B!T:&ES"FES
M.B`@*&1E9G5N(&9U;F-N86UE("AP87)A;65T97)S*2`H8F]D>6)L;V-K*2D*
M"DYO;F4@;V8@=&AI<R!G971S(&5V86QU871E9"!W:&5N(&ET(&ES(&-A;&QE
M9"!H97)E+B`@270@=VEL;"!G970@"F5V875L871E9"!L871E<B!O;B!I9B!T
M:&5Y(&=E="!C86QL960N("!792!W:6QL(&IU<W0@<W1O<F4@:70@"F%S:61E
M(&9O<B!N;W<N"@I4:&4@9G5N8VYA;64@:7,@<F5T=7)N960@87,@86X@871O
M;2X*"E1H92!P87)A;65T97)S(&9O<B!T:&ES(&9U;F-T:6]N(&%R92!N;W0@
M=&AE('-A;64@87,@=F%R:6%B;&5S(&EN('1H90IS>7-T96TN("!4:&5Y(&%R
M92!L;V-A;"!V87)I86)L97,@;V8@;&]C86P@<V-O<&4L(&%N9"!W:6QL(&]V
M97)R:61E(&%N>0IG;&]B86P@=F%R:6%B;&5S('=H96X@=&AE(&9U;F-T:6]N
M(&ES(&-A;&QE9"!L871E<BX*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LQ
M-SA]7'-U8FQA8F5L>TY7979A-RU%=F%*+C@M,7U<;G=M87)G:6YT86=[>UQN
M=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A2BXX+3%]?7U<;6]D
M9&5F>T5V86P@8V(@9&5F=6X@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G
M97)E9GM.5V5V83<M179A2BXX+3%]?7U<96YD;6]D9&5F"B`@("!L92`J(&5V
M86Q?8V)?9&5F=6XH(&-O;G-T(&EN="!A<F=C+"!L92`J(&)R86YC:"`I"EQN
M=W5S961[7%Q[3E=E=F$W+45V85,N."TQ?5Q<>TY7979A-RUE=F$V+C(M,7U]
M7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S$W.7U<;G=D;V-S<&%R"EQN=V5N
M9&1O8W-[?5QN=V)E9VEN8V]D97LQ.#!]7'-U8FQA8F5L>TY7979A-RU%=F%3
M+C@M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.
M5V5V83<M179A4RXX+3%]?7U<;6]D9&5F>T5V86P@8V(@9&5F=6X@:6UP;&5M
M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A
M4RXX+3%]?7U<96YD;6]D9&5F"B`@("!<3$%[?45V86P@8V(@9&5F=6X@<')O
M=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A2BXX+3%]
M?5Q207M]"B`@("!<>PH@("`@("`@(&QE("H@=&AI<VYO9&4["B`@("`@("`@
M;&4@*B!R971B;&]C:R`]($Y53$P["B`@("`@("`@:68@*"%B<F%N8V@@?'P@
M87)G8R`\(#0@*2!R971U<FXH(&QE3F5W*"`B3DE,(B`I*3L*"B`@("`@("`@
M:68@*"`A8G)A;F-H+3YL:7-T7VYE>'0M/F1A=&$@*2`@<F5T=7)N*"!L94YE
M=R@@(DY)3"(@*2D["@H@("`@("`@(&1E9G5N3&ES="`]('9A<FEA8FQE4V5T
M*"`*("`@("`@("`@("`@("`@("`@("`@("`@9&5F=6Y,:7-T+`H@("`@("`@
M("`@("`@("`@("`@("`@("!B<F%N8V@M/FQI<W1?;F5X="T^9&%T82P*("`@
M("`@("`@("`@("`@("`@("`@("`@8G)A;F-H+3YL:7-T7VYE>'0M/FQI<W1?
M;F5X=`H@("`@("`@("`@("`@("`@("`@("`@("`I.PH*("`@("`@("!R971U
M<FXH(&QE3F5W*"!B<F%N8V@M/FQI<W1?;F5X="T^9&%T82`I*3L*("`@(%Q]
M"EQN=W5S961[7%Q[3E=E=F$W+65V838M,7U]7&YW96YD8V]D97M]7&YW8F5G
M:6YD;V-S>S$X,7U<;G=D;V-S<&%R"@H*"@HE)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24*7'-U
M8G-E8W1I;VX@>U5T:6QI='D@;65T:&]D<WT*7&QA8F5L>W-E8SIU=&EL:71Y
M;65T:&]D<WT*"E=E(&YE960@82!F97<@=71I;&ET>2!F=6YC=&EO;G,@=&\@
M:&5L<"!U<R!D;R!A;&P@;V8@=&AE(&%B;W9E('=O<FLN("!4:&]S90IU=&EL
M:71I97,@9F]L;&]W+B`@5&AE>2!A<F4@>UQT='M]8V]U;G1.;V1E<WTL('M<
M='1[?65V86Q#87-T3&54;TEN='T@86YD"GM<='1[?65V86Q#87-T26YT5&],
M97TN"@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)0I<<W5B<W5B<V5C=&EO;GL@>UQT='M]8V]U;G1.;V1E<R@I?2!]"@I4:&ES
M('-I;7!L>2!T86ME<R!I;B!A(&)R86YC:"!A;F0@<F5T=7)N<R!T:&4@;G5M
M8F5R(&]F('M<='1[?6QE?2!N;V1E<PIA;&]N9R!I=',@<')I;6%R>2!L:7-T
M+B`H5&AR;W5G:"!T:&4@>UQT='M];&ES=%P@;F5X='T@<&]I;G1E<BDN("!%
M;7!T>0IL:7-T<R!W:6QL(')E='5R;B![7'1T>WTP?2X@(%1H:7,@:7,@:G5S
M="!A('-I;7!L92!I=&5R871O<BP@=')A=F5R<VEN9R!T:&4@;&ES="X*"EQN
M=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LQ.#)]7'-U8FQA8F5L>TY7979A-RU%
M=F%1+C@M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5V5V83<M179A42XX+3%]?7U<;6]D9&5F>T5V86P@=71I;&ET>2!C;W5N
M=&5R('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V
M85$N."TQ?7U]7&5N9&UO9&1E9@H@("`@:6YT(&-O=6YT3F]D97,H;&4@*B!B
M<F%N8V@I"EQN=W5S961[7%Q[3E=E=F$W+45V85HN,BTQ?5Q<>TY7979A-RUE
M=F$V+C(M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S$X,WU<;G=D;V-S
M<&%R"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LQ.#1]7'-U8FQA8F5L>TY7
M979A-RU%=F%:+C(M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B
M<&%G97)E9GM.5V5V83<M179A6BXR+3%]?7U<;6]D9&5F>T5V86P@=71I;&ET
M>2!C;W5N=&5R(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A
M9V5R969[3E=E=F$W+45V85HN,BTQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU%
M=F%L('5T:6QI='D@8V]U;G1E<B!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P
M86=E<F5F>TY7979A-RU%=F%1+C@M,7U]7%)!>WT*("`@(%Q["B`@("`@("`@
M:6YT(&-O=6YT(#T@,#L*"B`@("`@("`@=VAI;&4@*&)R86YC:"D*("`@("`@
M("!<>PH@("`@("`@("`@("!C;W5N="LK.PH@("`@("`@("`@("!B<F%N8V@@
M/2!B<F%N8V@M/FQI<W1?;F5X=#L*("`@("`@("!<?0H@("`@("`@(')E='5R
M;B@@8V]U;G0@*3L*("`@(%Q]"EQN=W5S961[7%Q[3E=E=F$W+65V838M,7U]
M7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S$X-7U<;G=D;V-S<&%R"@H*)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B<W5B
M<V5C=&EO;GMC87-T($Q%(%1O($EN='T*"E1H:7,@:7,@82!S:6UP;&4@)V-A
M<W0G(&9U;F-T:6]N('=H:6-H('1A:V5S(&EN(&$@>UQT='M];&5](&%T;VTL
M(&-O;G9E<G1S"FET<R!D871A('1O(&%N(&EN=&5G97(@=7-I;F<@=&AE('-T
M86YD87)D('M<='1[?6%T;VDH*7T@8V%L;"X@(%1H870@=F%L=64*:7,@=&AE
M;B!R971U<FYE9"X*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LQ.#9]7'-U
M8FQA8F5L>TY7979A-RU%=F%0+C<M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T
M>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A4"XW+3%]?7U<;6]D9&5F>T5V
M86P@8V%S="!L92!T;R!I;G0@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G
M97)E9GM.5V5V83<M179A4"XW+3%]?7U<96YD;6]D9&5F"B`@("!I;G0@979A
M;$-A<W1,951O26YT*"!C;VYS="!L92`J(&QE=F%L=64@*0I<;G=U<V5D>UQ<
M>TY7979A-RU%=F%9+C,M,7U<7'M.5V5V83<M979A-BXR+3%]?5QN=V5N9&-O
M9&5[?5QN=V)E9VEN9&]C<WLQ.#=]7&YW9&]C<W!A<@I<;G=E;F1D;V-S>WU<
M;G=B96=I;F-O9&5[,3@X?5QS=6)L86)E;'M.5V5V83<M179A62XS+3%]7&YW
M;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V
M85DN,RTQ?7U]7&UO9&1E9GM%=F%L(&-A<W0@;&4@=&\@:6YT(&EM<&QE;65N
M=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85DN
M,RTQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU%=F%L(&-A<W0@;&4@=&\@:6YT
M('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85`N
M-RTQ?7U<4D%[?0H@("`@7'L*("`@("`@("!I9B`H(6QE=F%L=64I(')E='5R
M;B@@,"`I.PH@("`@("`@(&EF("@A;&5V86QU92T^9&%T82D@<F5T=7)N*"`P
M("D["B`@("`@("`@"B`@("`@("`@<F5T=7)N*"!A=&]I*&QE=F%L=64M/F1A
M=&$I("D["B`@("!<?0I<;G=U<V5D>UQ<>TY7979A-RUE=F$V+3%]?5QN=V5N
M9&-O9&5[?5QN=V)E9VEN9&]C<WLQ.#E]7&YW9&]C<W!A<@H*"B4E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24*7'-U8G-U8G-E8W1I
M;VY[8V%S="!);G0@5&\@3$5]"@I4:&ES(&ES(&$@<VEM<&QE("=C87-T)R!F
M=6YC=&EO;B!W:&EC:"!T86ME<R!I;B!A;B!I;G1E9V5R+"!A;F0@=&AE;@IB
M=6EL9',@82!N97<@>UQT='M];&5](&%T;VT@=7-I;F<@=&AA="!V86QU92!A
M<R!I=',@9&%T82X@(%1H870@;F5W(&%T;VT*:7,@=&AE;B!R971U<FYE9"X*
M"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LQ.3!]7'-U8FQA8F5L>TY7979A
M-RU%=F%0+C@M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T>6QE>WU<<W5B<&%G
M97)E9GM.5V5V83<M179A4"XX+3%]?7U<;6]D9&5F>T5V86P@8V%S="!I;G0@
M=&\@;&4@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M
M179A4"XX+3%]?7U<96YD;6]D9&5F"B`@("!L92`J(&5V86Q#87-T26YT5&],
M92@@:6YT(&EN='9A;'5E("D*7&YW=7-E9'M<7'M.5V5V83<M179A62XT+3%]
M7%Q[3E=E=F$W+65V838N,BTQ?7U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[
M,3DQ?5QN=V1O8W-P87(*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S$Y,GU<
M<W5B;&%B96Q[3E=E=F$W+45V85DN-"TQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G
M<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%9+C0M,7U]?5QM;V1D969[
M179A;"!C87-T(&EN="!T;R!L92!I;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%9+C0M,7U]?5QE;F1M;V1D968*
M("`@(%Q,07M]179A;"!C87-T(&EN="!T;R!L92!P<F]T;WY[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%0+C@M,7U]7%)!>WT*("`@(%Q[
M"B`@("`@("`@8VAA<B!B=69F97);.#!=.PH@("`@("`@('-P<FEN=&8@*&)U
M9F9E<BP@(B5D(BP@:6YT=F%L=64I.PH*("`@("`@("!R971U<FXH(&QE3F5W
M*&)U9F9E<BD@*3L*("`@(%Q]"EQN=W5S961[7%Q[3E=E=F$W+65V838M,7U]
M7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S$Y,WU<;G=D;V-S<&%R"@H*)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E"EQS=6)S96-T:6]N('M%=F%L=6%T;W(@5F%L=F5S?0I<
M;&%B96Q[<V5C.F5V86QU871O<G9A;'9E<WT*"@I4:&5S92!T=V\@9G5N8W1I
M;VYS(&%R92!T:&4@8G)A:6YS(&)E:&EN9"!T:&4@:6YT97)P<F5T97(N("!4
M:&5Y('=I;&P*=')A=F5R<V4@;&ES<"!T<F5E<RP@86YD(')E8W5R<VEV96QY
M(&5V86QU871E(&5A8V@@<&%R="!O9B!T:&5M+B`@5&AE>0IL;V]K('5P('9A
M;'5E<R!I;B!T:&4@=F%R:6%B;&4@;&ES="!W:&5R92!N96-E<W-A<GDN"@H*
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B
M<W5B<V5C=&EO;GME=F%L=6%T94)R86YC:'T*"D5V86QU871E(&)R86YC:"!W
M:6QL(&9O<B!E>&%M<&QE(&5V86QU871E(&%L;"!O9B![7'1T>WTH*UP@,UP@
M02E]+@H*270@9FER<W0@;&]O:W,@=&\@<V5E(&EF('1H92!C=7)R96YT(&5N
M=')Y(&ES(&$@;&ES="X@($EF(&ET(&ES+`II="!W:6QL(&5V86QU871E(&ET
M('1O(&1E=&5R;6EN92!T:&4@:V5Y=V]R9"!T;R!U<V4N("!)="!W:6QL('1H
M96X*=7-E('1H:7,@:V5Y=V]R9"!T;R!L;V]K('5P(&$@8V%L;&)A8VL@:6X@
M=&AE('M<='1[?65V86Q486)L97TN("`*268@:70@=V%S(&9O=6YD+"!I="!W
M:6QL('-I;7!L>2!R971U<FX@=VAA="!T:&4@8V%L;&)A8VL@<F5T=7)N<RX*
M268@;F\@9G5N8W1I;VX@:&%D(&)E96X@8V%L;&5D+"!I="!W:6QL('1R>2!T
M;R!E=F%L=6%T92!T:&4@;F]D92`*=7-I;F<@=&AE('M<='1[?65V86QU871E
M3F]D97T@9G5N8W1I;VX@8F5L;W<N(`H*7&YW96YD9&]C<WM]7&YW8F5G:6YC
M;V1E>S$Y-'U<<W5B;&%B96Q[3E=E=F$W+45V85`N.2TQ?5QN=VUA<F=I;G1A
M9WM[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%0+CDM,7U]
M?5QM;V1D969[179A;"!E=F%L=6%T94)R86YC:"!P<F]T;WY[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%0+CDM,7U]?5QE;F1M;V1D968*
M("`@(&QE("H@979A;'5A=&5"<F%N8V@H;&4@*B!T<GEB<F%N8V@I"EQN=W5S
M961[7%Q[3E=E=F$W+45V85DN-2TQ?5Q<>TY7979A-RUE=F$V+C(M,7U]7&YW
M96YD8V]D97M]7&YW8F5G:6YD;V-S>S$Y-7U<;G=D;V-S<&%R"@I<;G=E;F1D
M;V-S>WU<;G=B96=I;F-O9&5[,3DV?5QS=6)L86)E;'M.5V5V83<M179A62XU
M+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E
M=F$W+45V85DN-2TQ?7U]7&UO9&1E9GM%=F%L(&5V86QU871E0G)A;F-H(&EM
M<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W
M+45V85DN-2TQ?7U]7&5N9&UO9&1E9@H@("`@7$Q!>WU%=F%L(&5V86QU871E
M0G)A;F-H('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W
M+45V85`N.2TQ?7U<4D%[?0H@("`@7'L*("`@("`@("!L92`J(&ME>7=O<F0[
M"B`@("`@("`@:6YT('1R>6ET(#T@,#L*("`@("`@("!I9B`H(71R>6)R86YC
M:"D@<F5T=7)N*"!.54Q,("D["@H@("`@("`@(&EF("AT<GEB<F%N8V@M/F)R
M86YC:"D*("`@("`@("!<>PH@("`@("`@("`@("!K97EW;W)D(#T@979A;'5A
M=&5"<F%N8V@H=')Y8G)A;F-H+3YB<F%N8V@I.PH@("`@("`@(%Q]"B`@("`@
M("`@96QS92`*("`@("`@("`@("`@:V5Y=V]R9"`](&QE3F5W*"!T<GEB<F%N
M8V@M/F1A=&$@*3L*"B`@("`@("`@:68@*"%K97EW;W)D+3YD871A*0H@("`@
M("`@(%Q["B`@("`@("`@("`@(&QE5VEP92@@:V5Y=V]R9"`I.PH@("`@("`@
M("`@("!R971U<FXH(&QE3F5W*"`B3DE,(B`I*3L*("`@("`@("!<?0H*("`@
M("`@("!F;W(@*"!T<GEI=#TP(#L@979A;%1A8FQE6W1R>6ET72YW;W)D(#L@
M=')Y:70K*RD*("`@("`@("!<>PH@("`@("`@("`@("!I9B`H(7-T<F-M<"AE
M=F%L5&%B;&5;=')Y:71=+G=O<F0L(&ME>7=O<F0M/F1A=&$I*0H@("`@("`@
M("`@("!<>PH@("`@("`@("`@("`@("`@;&57:7!E*"!K97EW;W)D("D["B`@
M("`@("`@("`@("`@("!R971U<FXH(&5V86Q486)L95MT<GEI=%TN8V%L;&)A
M8VLH"B`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@(&-O=6YT
M3F]D97,H('1R>6)R86YC:"`I+"`*("`@("`@("`@("`@("`@("`@("`@("`@
M("`@("`@("`@("`@=')Y8G)A;F-H*2`*("`@("`@("`@("`@("`@("`@("`@
M("`@("`@("`@("`I.PH@("`@("`@("`@("!<?0H@("`@("`@(%Q]"@H@("`@
M("`@(&QE5VEP92@@:V5Y=V]R9"`I.PH@("`@("`@(')E='5R;B@@979A;'5A
M=&5.;V1E*"!T<GEB<F%N8V@@*2D["B`@("!<?0I<;G=U<V5D>UQ<>TY7979A
M-RUE=F$V+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLQ.3=]7&YW9&]C
M<W!A<@H*)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)0I<<W5B<W5B<V5C=&EO;GME=F%L=6%T94YO9&5]"@I%=F%L=6%T94YO9&4@
M=VEL;"!F;W(@97AA;7!L92!E=F%L=6%T92!J=7-T('1H92![7'1T>WU!?2!O
M9B![7'1T>WTH*UP@,UP@02E]+@H*270@=VEL;"!L;V]K('1O('-E92!I9B!T
M:&4@;F]D92!H87,@82!B<F%N8V@N("!)9B!I="!D;V5S+"!I="!W:6QL"F5V
M86QU871E(&ET('5S:6YG('1H92!A8F]V92!F=6YC=&EO;BX@($EF(&ET(&AA
M9"!B965N('%U;W1E9"P@=&AE;B!T:&%T"F)R86YC:"!W:6QL(&IU<W0@9V5T
M(')E='5R;F5D+@H*268@:70@:&%S(&YO(&)R86YC:"P@=&AE;B!I="!W:6QL
M(&%T=&5M<'0@=&\@<F5T<FEE=F4@=&AE('9A<FEA8FQE('=I=&@*=&AE(&YA
M;64@<W!E8VEF:65D(&EN('1H92!D871A+B`@268@=&AA="!W87,@=6YS=6-C
M97-S9G5L+"!I="!W:6QL(&IU<W0*<F5T=7)N('1H92!D871A(&ET<V5L9B!A
M<R!A;B!A=&]M+@H*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S$Y.'U<<W5B
M;&%B96Q[3E=E=F$W+45V84XN,BTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%.+C(M,7U]?5QM;V1D969[179A
M;"!E=F%L=6%T94YO9&4@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5V5V83<M179A3BXR+3%]?7U<96YD;6]D9&5F"B`@("!L92`J(&5V86QU
M871E3F]D92AL92`J(&YO9&4I"EQN=W5S961[7%Q[3E=E=F$W+45V85<M,7U<
M7'M.5V5V83<M979A-BXR+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLQ
M.3E]7&YW9&]C<W!A<@H*7&YW96YD9&]C<WM]7&YW8F5G:6YC;V1E>S(P,'U<
M<W5B;&%B96Q[3E=E=F$W+45V85<M,7U<;G=M87)G:6YT86=[>UQN=W1A9W-T
M>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A5RTQ?7U]7&UO9&1E9GM%=F%L
M(&5V86QU871E3F]D92!I;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS
M=6)P86=E<F5F>TY7979A-RU%=F%7+3%]?7U<96YD;6]D9&5F"B`@("!<3$%[
M?45V86P@979A;'5A=&5.;V1E('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A
M9V5R969[3E=E=F$W+45V84XN,BTQ?7U<4D%[?0H@("`@7'L*("`@("`@("!L
M92`J('1E;7`["B`@("`@("`@;&4@*B!V86QU93L*"B`@("`@("`@:68@*&YO
M9&4M/F)R86YC:"D*("`@("`@("!<>PH@("`@("`@("`@("!I9B@@;F]D92T^
M<75O=&5D("D*("`@("`@("`@("`@7'L*("`@("`@("`@("`@("`@('9A;'5E
M(#T@;&5$=7`H(&YO9&4M/F)R86YC:"`I.PH@("`@("`@("`@("!<?2!E;'-E
M(%Q["B`@("`@("`@("`@("`@("!V86QU92`](&5V86QU871E0G)A;F-H*"!N
M;V1E+3YB<F%N8V@@*3L*("`@("`@("`@("`@7'T*("`@("`@("!<?2!E;'-E
M(%Q["B`@("`@("`@("`@('1E;7`@/2!V87)I86)L94=E="@@9&5F=6Y,:7-T
M+"!N;V1E+3YD871A("D["@H@("`@("`@("`@("!I9B`H=&5M<"D*("`@("`@
M("`@("`@7'L*("`@("`@("`@("`@("`@('9A;'5E(#T@979A;'5A=&5$969U
M;B@@=&5M<"P@;F]D92T^;&ES=%]N97AT("D["B`@("`@("`@("`@(%Q](&5L
M<V4@7'L*("`@("`@("`@("`@("`@('1E;7`@/2!V87)I86)L94=E="@@;6%I
M;E9A<DQI<W0L(&YO9&4M/F1A=&$@*3L*"B`@("`@("`@("`@("`@("!I9B`H
M=&5M<"D*("`@("`@("`@("`@("`@(%Q["B`@("`@("`@("`@("`@("`@("`@
M=F%L=64@/2!L941U<"@@=&5M<"`I.PH@("`@("`@("`@("`@("`@7'T@96QS
M92!<>PH*("`@("`@("`@("`@("`@("`@("!V86QU92`](&QE3F5W*"!N;V1E
M+3YD871A("D["B`@("`@("`@("`@("`@("!<?0H@("`@("`@("`@("!<?0H@
M("`@("`@(%Q]"@H@("`@("`@(')E='5R;B@@=F%L=64@*3L*("`@(%Q]"EQN
M=W5S961[7%Q[3E=E=F$W+65V838M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD
M;V-S>S(P,7U<;G=D;V-S<&%R"@H*)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)0I<<W5B<W5B<V5C=&EO;GME=F%L=6%T941E9G5N
M?0H*5&AI<R!I<R!A('1R:6-K>2!O;F4N("!)="!G971S(&-A;&QE9"!W:&5N
M(&$@<')E9&5F:6YE9"!F=6YC=&EO;BP@<V5T"G5P('=I=&@@=&AE(&!@9&5F
M=6XG)R!C;VUM86YD(&5A<FQI97(L(&=E=',@8V%L;&5D(&1U<FEN9PII;G1E
M<G!R971A=&EO;B!T:6UE+@H*5&AI<R!C;W5L9"!B92!D;VYE(&%N>2!N=6UB
M97(@;V8@=V%Y<RP@=7-I;F<@82!S=&%C:R!B87-E9"!S>7-T96T@;W(@=&AE
M(`IL:6ME(&9O<B!V87)I86)L92!L:7-T<RP@8G5T(&EN<W1E860@22!D96-I
M9&5D('1O(&=O('=I=&@@82!M86-R;RUL:6ME"G!R92UP<F]C97-S:6YG(&1E
M<VEG;BX*"D9I<G-T(&)O=&@@;&ES=',@<&%S<V5D(&EN+"!T:&4@9G5N8W1I
M;VX@9&5F:6YI=&EO;B![7'1T>WUF8VY](&%S('=E;&P@87,*=&AE(&QI<W0@
M;V8@;F5W('!A<F%M971E<G,@>UQT='M]<&%R86US?2!A<F4@8F]T:"!N;VXM
M>UQT='M]3E5,3'TL(&%N9`IC;VYT86EN(&%N(&5Q=6%L(&YU;6)E<B!O9B!P
M87)A;65T97)S+B`@268@=&AI<R!I<R!N;W0@=&AE(&-A<V4L('=E"FEN<W1A
M;G1L>2!B86EL(&]U="!A;F0@<F5T=7)N(&$@>UQT='M]3DE,?2!A=&]M+@H*
M3F5X="P@=V4@>UQT='M];&5$=7!]('1H92!F=6YC=&EO;BP@>UQT='M]9F-N
M?2!I;G1O(&$@;F5W('-T<G5C='5R92P@>UQT='M]9G5N8W1I;VY]+@H*3F]W
M+"!W92!M86ME('1W;R!P87-S97,@;W9E<B!T:&ES(&YE=R!S=')U8W1U<F4N
M("!&:7)S="!W92!G;R!T:')O=6=H"F%N9"!T86<@96%C:"!V87)I86)L92!I
M;B![7'1T>WUF=6YC=&EO;GT@87,@9&5F:6YE9"!W:71H(&ET<R!V87)I86)L
M90IL:7-T+B`@5&AE(&9I<G-T('!A<F%M971E<B=S(&]C8W5R<F%N8V4@:6X@
M=&AE('-T<G5C='5R92!G971S('1A9V=E9`IW:71H(&!@>UQT='M],7TG)RP@
M=&AE('-E8V]N9"!W:71H(&!@>UQT='M],GTG)R!A;F0@<V\@;VXN"@I4:&4@
M<V5C;VYD('!A<W,@<F5P;&%C97,@=&AE(&ET96US('1A9V=E9"!A<R!@8'M<
M='1[?3%])R<@=VET:"!T:&4@9FER<W0*<&%R86UE=&5R(&EN('1H92![7'1T
M>WUP87)A;7-](&QI<W0L(&!@>UQT='M],GTG)R!W:71H('1H92!S96-O;F0@
M:6X@=&AE"GM<='1[?7!A<F%M<WT@;&ES="P@86YD('-O(&]N+@H*5&AE;B!A
M;&P@=V4@;F5E9"!T;R!D;R!I<R!T;R!E=F%L=6%T92!T:&4@<F5S=6QT:6YG
M('M<='1[?69U;F-T:6]N?2!L:7-T+`IW:&EC:"!N;W<@:&%S(&%L;"!O9B!I
M=',@;&]C86P@=F%R:6%B;&5S(')E<&QA8V5D('=I=&@@=&AE('!A<W-E9"!I
M;@IP87)A;65T97)S+"!A;F0@<F5T=7)N('1H870@=F%L=64N"@I792!D;R!T
M=V\@<&%S<V5S('1O(&UA:V4@<W5R92!T:&%T(&%N>2!V87)I86)L97,@:6X@
M=&AE('!A<F%M971E<B!L:7-T"F=E="!R97!L86-E9"!A<'!R;W!R:6%T96QY
M+"!I;B!C87-E('1H96ER(&YA;65S(&-L87-H('=I=&@@=&AE(&=L;V)A;`IV
M87)I86)L92!L:7-T(&5N=')I97,N"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O
M9&5[,C`R?5QS=6)L86)E;'M.5V5V83<M179A3RXS+3%]7&YW;6%R9VEN=&%G
M>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84\N,RTQ?7U]
M7&UO9&1E9GM%=F%L(&5V86QU871E1&5F=6X@<')O=&]^>UQN=W1A9W-T>6QE
M>WU<<W5B<&%G97)E9GM.5V5V83<M179A3RXS+3%]?7U<96YD;6]D9&5F"B`@
M("!L92`J(&5V86QU871E1&5F=6XH(&QE("H@9F-N+"!L92`J('!A<F%M<R`I
M"EQN=W5S961[7%Q[3E=E=F$W+45V85@N,BTQ?5Q<>TY7979A-RUE=F$V+C(M
M,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S(P,WU<;G=D;V-S<&%R"@I<
M;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,C`T?5QS=6)L86)E;'M.5V5V83<M
M179A6"XR+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R
M969[3E=E=F$W+45V85@N,BTQ?7U]7&UO9&1E9GM%=F%L(&5V86QU871E1&5F
M=6X@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.
M5V5V83<M179A6"XR+3%]?7U<96YD;6]D9&5F"B`@("!<3$%[?45V86P@979A
M;'5A=&5$969U;B!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7
M979A-RU%=F%/+C,M,7U]7%)!>WT*("`@(%Q["B`@("`@("`@;&4@*B!F=6YC
M=&EO;CL*("`@("`@("!L92`J('1H:7-P87)A;3L*("`@("`@("!L92`J(')E
M<W5L=#L*("`@("`@("!I;G0@8V]U;G0["@H@("`@("`@("\J(&UA:V4@<W5R
M92!B;W1H(&QI<W1S(&5X:7-T("HO"B`@("`@("`@:68@*"%F8VXI("!R971U
M<FXH(&QE3F5W*"`B3DE,(B`I*3L*"B`@("`@("`@+RH@8VAE8VL@9F]R('1H
M92!C;W)R96-T(&YU;6)E<B!O9B!P87)A;65T97)S("HO"B`@("`@("`@:68@
M*&-O=6YT3F]D97,H9F-N+3YB<F%N8V@I(#X@8V]U;G1.;V1E<RAP87)A;7,I
M*0H@("`@("`@("`@("!R971U<FXH(&QE3F5W*"`B3DE,(B`I*3L*"B`@("`@
M("`@+RH@86QL;V-A=&4@86YO=&AE<B!F=6YC=&EO;B!D969I;FET:6]N+"!S
M:6YC92!W92=R92!G;VYN82!H86-K(&ET("HO"B`@("`@("`@9G5N8W1I;VX@
M/2!L941U<"AF8VXI.PH*("`@("`@("`O*B!P87-S(#$Z("!T86<@96%C:"!N
M;V1E('!R;W!E<FQY+B`*("`@("`@("`@("`@("`@("`@("!F;W(@96%C:"!P
M87)A;65T97(Z("AF8VXI"B`@("`@("`@("`@("`@("`@("`@+2!L;V]K(&9O
M<B!I="!I;B!T:&4@=')E92P@=&%G('1H;W-E('=I=&@@=&AE('9A;'5E"B`@
M("`@("`@*B\*("`@("`@("!C;W5N="`](#`["B`@("`@("`@=&AI<W!A<F%M
M(#T@9F-N+3YB<F%N8V@["B`@("`@("`@=VAI;&4@*'1H:7-P87)A;2D*("`@
M("`@("!<>PH@("`@("`@("`@("!L951A9T1A=&$H9G5N8W1I;VXL('1H:7-P
M87)A;2T^9&%T82P@8V]U;G0I.PH@("`@("`@("`@("!T:&ES<&%R86T@/2!T
M:&ES<&%R86TM/FQI<W1?;F5X=#L*("`@("`@("`@("`@8V]U;G0K*SL*("`@
M("`@("!<?0H*("`@("`@("`O*B!P87-S(#(Z("!R97!L86-E"B`@("`@("`@
M("`@("`@("`@("`@9F]R(&5A8V@@<&%R86UE=&5R.B`H<&%R86TI"B`@("`@
M("`@("`@("`@("`@("`@+2!E=F%L=6%T92!T:&4@<&%S<V5D(&EN('9A;'5E
M"B`@("`@("`@("`@("`@("`@("`@+2!R97!L86-E(&ET(&EN('1H92!T<F5E
M"B`@("`@("`@*B\*("`@("`@("!C;W5N="`](#`["B`@("`@("`@=&AI<W!A
M<F%M(#T@<&%R86US.PH@("`@("`@('=H:6QE("AT:&ES<&%R86TI"B`@("`@
M("`@7'L*("`@("`@("`@("`@<F5S=6QT(#T@979A;'5A=&5.;V1E*"!T:&ES
M<&%R86T@*3L*("`@("`@("`@("`@;&5486=297!L86-E*&9U;F-T:6]N+"!C
M;W5N="P@<F5S=6QT*3L*("`@("`@("`@("`@=&AI<W!A<F%M(#T@=&AI<W!A
M<F%M+3YL:7-T7VYE>'0["B`@("`@("`@("`@(&QE5VEP92AR97-U;'0I.PH@
M("`@("`@("`@("!C;W5N="LK.PH@("`@("`@(%Q]"@H@("`@("`@("\J('1H
M96X@979A;'5A=&4@=&AE(')E<W5L=&EN9R!T<F5E("HO"B`@("`@("`@<F5S
M=6QT(#T@979A;'5A=&5"<F%N8V@H(&9U;F-T:6]N+3YL:7-T7VYE>'0@*3L*
M("`@("`@("`*("`@("`@("`O*B!F<F5E(&%N>2!S<&%C92!A;&QO8V%T960@
M*B\*("`@("`@("!L95=I<&4H(&9U;F-T:6]N("D["@H@("`@("`@("\J(')E
M='5R;B!T:&4@979A;'5A=&EO;B`J+PH@("`@("`@(')E='5R;B@@<F5S=6QT
M("D["B`@("!<?0I<;G=U<V5D>UQ<>TY7979A-RUE=F$V+3%]?5QN=V5N9&-O
M9&5[?5QN=V)E9VEN9&]C<WLR,#5]7&YW9&]C<W!A<@H*"B4E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)0I<<W5B<V5C=&EO;B![979A;"YC?0I<;&%B96Q[979A;&1O=&-]"@I(
M97)E('=E(&)U:6QD('5P(&%L;"!O9B!T:&4@86)O=F4@8FQO8VMS(&EN=&\@
M=&AE("YC(&9I;&4N"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,C`V?5QS
M=6)L86)E;'M.5V5V83<M979A-BTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7979A-RUE=F$V+3%]?7U<;6]D9&5F>V5V86PN
M8WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RUE=F$V+3%]?7U<
M96YD;6]D9&5F"B-I;F-L=61E(#QS=&1I;RYH/@HC:6YC;'5D92`\<W1D;&EB
M+F@^"B-I;F-L=61E(#QS=')I;F<N:#X*(VEN8VQU9&4@(F5V86PN:"(*(VEN
M8VQU9&4@(G9A<G,N:"(*"EQ,07M]179A;"!L;V]K=7`@=&%B;&5^>UQN=W1A
M9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A2"TQ?7U<4D%[?0H*7$Q!
M>WU%=F%L(&5V86QU871E0G)A;F-H(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S
M='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85DN-2TQ?7U<4D%[?0I<3$%[
M?45V86P@979A;'5A=&5.;V1E(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL
M97M]7'-U8G!A9V5R969[3E=E=F$W+45V85<M,7U]7%)!>WT*7$Q!>WU%=F%L
M(&5V86QU871E1&5F=6X@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<
M<W5B<&%G97)E9GM.5V5V83<M179A6"XR+3%]?5Q207M]"@I<3$%[?45V86P@
M=71I;&ET>2!C;W5N=&5R(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=E=F$W+45V85HN,BTQ?7U<4D%[?0H*7$Q!>WU%=F%L
M(&-A<W0@;&4@=&\@:6YT(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=E=F$W+45V85DN,RTQ?7U<4D%[?0I<3$%[?45V86P@
M8V%S="!I;G0@=&\@;&4@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<
M<W5B<&%G97)E9GM.5V5V83<M179A62XT+3%]?5Q207M]"@I<3$%[?65V86P@
M8V(@;F]T:&EN9R!I;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P
M86=E<F5F>TY7979A-RUE=F%5+3%]?5Q207M]"EQ,07M]179A;"!C8B!C=6UE
M(&AE;'!E<B!I;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E
M<F5F>TY7979A-RU%=F%9+3%]?5Q207M]"EQ,07M]179A;"!C8B!A9&0@:6UP
M;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M
M179A42XR+3%]?5Q207M]"EQ,07M]179A;"!C8B!S=6)T<F%C="!I;7!L96UE
M;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%6
M+3%]?5Q207M]"EQ,07M]179A;"!C8B!M=6QT:7!L>2!I;7!L96UE;G1A=&EO
M;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%6+C(M,7U]
M7%)!>WT*7$Q!>WU%=F%L(&-B(&1I=FED92!I;7!L96UE;G1A=&EO;GY[7&YW
M=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%4+3%]?5Q207M]"EQ,
M07M]179A;"!C8B!O;F5P;'5S(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL
M97M]7'-U8G!A9V5R969[3E=E=F$W+45V854M,7U]7%)!>WT*7$Q!>WU%=F%L
M(&-B(&]N96UI;G5S(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U
M8G!A9V5R969[3E=E=F$W+45V858N,RTQ?7U<4D%[?0I<3$%[?45V86P@8V(@
M;6]D=6QU<R!I;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E
M<F5F>TY7979A-RU%=F%5+C(M,7U]7%)!>WT*"EQ,07M]179A;"!C8B!L="!I
M;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A
M-RU%=F%0+C(M,7U]7%)!>WT*7$Q!>WU%=F%L(&-B(&QT(&5Q(&EM<&QE;65N
M=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85,M
M,7U]7%)!>WT*7$Q!>WU%=F%L(&-B(&=T(&EM<&QE;65N=&%T:6]N?GM<;G=T
M86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85`N,RTQ?7U<4D%[?0I<
M3$%[?45V86P@8V(@9W0@97$@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE
M>WU<<W5B<&%G97)E9GM.5V5V83<M179A4RXR+3%]?5Q207M]"EQ,07M]179A
M;"!C8B!E<7-I9VX@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B
M<&%G97)E9GM.5V5V83<M179A5"XR+3%]?5Q207M]"@I<3$%[?45V86P@8V(@
M86YD(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=E=F$W+45V85$N,RTQ?7U<4D%[?0I<3$%[?45V86P@8V(@;W(@:6UP;&5M
M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A
M4"XT+3%]?5Q207M]"EQ,07M]179A;"!C8B!N;W0@:6UP;&5M96YT871I;VY^
M>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A42XT+3%]?5Q2
M07M]"@I<3$%[?45V86P@8V(@871O;2!I;7!L96UE;G1A=&EO;GY[7&YW=&%G
M<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%2+C,M,7U]7%)!>WT*7$Q!
M>WU%=F%L(&-B(&-A<B!I;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS
M=6)P86=E<F5F>TY7979A-RU%=F%1+C4M,7U]7%)!>WT*7$Q!>WU%=F%L(&-B
M(&-D<B!I;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F
M>TY7979A-RU%=F%1+C8M,7U]7%)!>WT*7$Q!>WU%=F%L(&-B(&-O;G,@:6UP
M;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M
M179A4BXT+3%]?5Q207M]"EQ,07M]179A;"!C8B!L:7-T(&EM<&QE;65N=&%T
M:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85(N-2TQ
M?7U<4D%[?0I<3$%[?45V86P@8V(@97%U86P@:&5L<&5R(&EM<&QE;65N=&%T
M:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85HM,7U]
M7%)!>WT*7$Q!>WU%=F%L(&-B(&5Q=6%L(&EM<&QE;65N=&%T:6]N?GM<;G=T
M86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85,N,RTQ?7U<4D%[?0H*
M7$Q!>WU%=F%L(&-B(&EF(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=E=F$W+45V85`N-2TQ?7U<4D%[?0I<3$%[?45V86P@
M8V(@=VAE;B!U;FQE<W,@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<
M<W5B<&%G97)E9GM.5V5V83<M179A62XR+3%]?5Q207M]"EQ,07M]179A;"!C
M8B!U;FQE<W,@:6UP;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G
M97)E9GM.5V5V83<M179A5"XS+3%]?5Q207M]"EQ,07M]179A;"!C8B!W:&5N
M(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E
M=F$W+45V85(N-BTQ?7U<4D%[?0I<3$%[?45V86P@8V(@8V]N9"!I;7!L96UE
M;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%2
M+C<M,7U]7%)!>WT*7$Q!>WU%=F%L(&-B('-E;&5C="!I;7!L96UE;G1A=&EO
M;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%4+C0M,7U]
M7%)!>WT*"EQ,07M]179A;"!C8B!P<FEN8R!I;7!L96UE;G1A=&EO;GY[7&YW
M=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%3+C0M,7U]7%)!>WT*
M7$Q!>WU%=F%L(&-B('1E<G!R:2!I;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%4+C4M,7U]7%)!>WT*"EQ,07M]
M179A;"!C8B!E=F%L(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U
M8G!A9V5R969[3E=E=F$W+45V85(N."TQ?7U<4D%[?0I<3$%[?45V86P@8V(@
M<')O9R!I;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F
M>TY7979A-RU%=F%2+CDM,7U]7%)!>WT*7$Q!>WU%=F%L(&-B('!R;V<Q(&EM
M<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W
M+45V85,N-2TQ?7U<4D%[?0I<3$%[?45V86P@8V(@<')O9S(@:6UP;&5M96YT
M871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A4RXV
M+3%]?5Q207M]"EQ,07M]179A;"!C8B!P<F]G;B!I;7!L96UE;G1A=&EO;GY[
M7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%3+C<M,7U]7%)!
M>WT*"EQ,07M]179A;"!C8B!S970@:&5L<&5R(&EM<&QE;65N=&%T:6]N?GM<
M;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V85@M,7U]7%)!>WT*
M7$Q!>WU%=F%L(&-B('-E="!I;7!L96UE;G1A=&EO;GY[7&YW=&%G<W1Y;&5[
M?5QS=6)P86=E<F5F>TY7979A-RU%=F%1+3%]?5Q207M]"EQ,07M]179A;"!C
M8B!S971Q(&EM<&QE;65N=&%T:6]N?GM<;G=T86=S='EL97M]7'-U8G!A9V5R
M969[3E=E=F$W+45V85(M,7U]7%)!>WT*7$Q!>WU%=F%L(&-B(&5N=6T@:6UP
M;&5M96YT871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M
M179A4BXR+3%]?5Q207M]"@I<3$%[?45V86P@8V(@9&5F=6X@:6UP;&5M96YT
M871I;VY^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A4RXX
M+3%]?5Q207M]"EQN=VYO='5S961[979A;"YC?5QN=V5N9&-O9&5[?5QN=V)E
M9VEN9&]C<WLR,#=]7&YW9&]C<W!A<@H*"B4E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<<W5B
M<V5C=&EO;B![979A;"YH?0I<;&%B96Q[979A;&1O=&A]"@I!;F0@=V4@;F5E
M9"!T;R!D;R!T:&4@<V%M92!F;W(@=&AE(&AE861E<B!F:6QE(&%S('=E;&PN
M"@I<;G=E;F1D;V-S>WU<;G=B96=I;F-O9&5[,C`X?5QS=6)L86)E;'M.5V5V
M83<M979A-BXR+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A
M9V5R969[3E=E=F$W+65V838N,BTQ?7U]7&UO9&1E9GME=F%L+FA^>UQN=W1A
M9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M979A-BXR+3%]?7U<96YD;6]D
M9&5F"B-I;F-L=61E(")L:7-T<RYH(@H*7$Q!>WU%=F%L(&-A;&QB86-K('1Y
M<&5D969^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A3"TQ
M?7U<4D%[?0I<3$%[?45V86P@;&]O:W5P('-T<G5C='Y[7&YW=&%G<W1Y;&5[
M?5QS=6)P86=E<F5F>TY7979A-RU%=F%)+3%]?5Q207M]"@I<3$%[?45V86P@
M979A;'5A=&5"<F%N8V@@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5V5V83<M179A4"XY+3%]?5Q207M].PI<3$%[?45V86P@979A;'5A=&5.
M;V1E('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V
M84XN,BTQ?7U<4D%[?3L*7$Q!>WU%=F%L(&5V86QU871E1&5F=6X@<')O=&]^
M>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A3RXS+3%]?5Q2
M07M].PH*7$Q!>WU%=F%L('5T:6QI='D@8V]U;G1E<B!P<F]T;WY[7&YW=&%G
M<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%1+C@M,7U]7%)!>WT["@I<
M3$%[?45V86P@8V%S="!L92!T;R!I;G0@<')O=&]^>UQN=W1A9W-T>6QE>WU<
M<W5B<&%G97)E9GM.5V5V83<M179A4"XW+3%]?5Q207M].PI<3$%[?45V86P@
M8V%S="!I;G0@=&\@;&4@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5V5V83<M179A4"XX+3%]?5Q207M].PH*7$Q!>WUE=F%L(&-B(&YO=&AI
M;F<@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M979A
M3"TQ?7U<4D%[?3L*"EQ,07M]179A;"!C8B!C=6UE(&AE;'!E<B!E;G5M?GM<
M;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84\N,BTQ?7U<4D%[
M?0I<3$%[?45V86P@8V(@8W5M92!H96QP97(@<')O=&]^>UQN=W1A9W-T>6QE
M>WU<<W5B<&%G97)E9GM.5V5V83<M179A4"TQ?7U<4D%[?3L*7$Q!>WU%=F%L
M(&-B(&%D9"!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A
M-RU%=F%(+C,M,7U]7%)!>WT["EQ,07M]179A;"!C8B!S=6)T<F%C="!P<F]T
M;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%-+3%]?5Q2
M07M].PI<3$%[?45V86P@8V(@;75L=&EP;'D@<')O=&]^>UQN=W1A9W-T>6QE
M>WU<<W5B<&%G97)E9GM.5V5V83<M179A32XR+3%]?5Q207M].PI<3$%[?45V
M86P@8V(@9&EV:61E('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=E=F$W+45V84LM,7U]7%)!>WT["EQ,07M]179A;"!C8B!O;F5P;'5S('!R
M;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84PN,BTQ
M?7U<4D%[?3L*7$Q!>WU%=F%L(&-B(&]N96UI;G5S('!R;W1O?GM<;G=T86=S
M='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84TN,RTQ?7U<4D%[?3L*7$Q!
M>WU%=F%L(&-B(&UO9'5L=7,@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G
M97)E9GM.5V5V83<M179A3"XS+3%]?5Q207M].PH*7$Q!>WU%=F%L(&-B(&QT
M('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84<M
M,7U]7%)!>WT["EQ,07M]179A;"!C8B!L="!E<2!P<F]T;WY[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%*+3%]?5Q207M].PI<3$%[?45V
M86P@8V(@9W0@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V
M83<M179A1RXR+3%]?5Q207M].PI<3$%[?45V86P@8V(@9W0@97$@<')O=&]^
M>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A2BXR+3%]?5Q2
M07M].PI<3$%[?45V86P@8V(@97%S:6=N('!R;W1O?GM<;G=T86=S='EL97M]
M7'-U8G!A9V5R969[3E=E=F$W+45V84LN,BTQ?7U<4D%[?3L*"EQ,07M]179A
M;"!C8B!A;F0@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V
M83<M179A2"XT+3%]?5Q207M].PI<3$%[?45V86P@8V(@;W(@<')O=&]^>UQN
M=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A1RXS+3%]?5Q207M]
M.PI<3$%[?45V86P@8V(@;F]T('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A
M9V5R969[3E=E=F$W+45V84@N-2TQ?7U<4D%[?3L*"EQ,07M]179A;"!C8B!A
M=&]M('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V
M84DN-"TQ?7U<4D%[?3L*7$Q!>WU%=F%L(&-B(&-A<B!P<F]T;WY[7&YW=&%G
M<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%(+C8M,7U]7%)!>WT["EQ,
M07M]179A;"!C8B!C9'(@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E
M9GM.5V5V83<M179A2"XW+3%]?5Q207M].PI<3$%[?45V86P@8V(@8V]N<R!P
M<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%=F%)+C4M
M,7U]7%)!>WT["EQ,07M]179A;"!C8B!L:7-T('!R;W1O?GM<;G=T86=S='EL
M97M]7'-U8G!A9V5R969[3E=E=F$W+45V84DN-BTQ?7U<4D%[?3L*7$Q!>WU%
M=F%L(&-B(&5Q=6%L(&AE;'!E<B!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P
M86=E<F5F>TY7979A-RU%=F%1+C<M,7U]7%)!>WT["EQ,07M]179A;"!C8B!E
M<75A;"!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A-RU%
M=F%*+C,M,7U]7%)!>WT["@H*7$Q!>WU%=F%L(&-B(&EF('!R;W1O?GM<;G=T
M86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84<N-"TQ?7U<4D%[?3L*
M7$Q!>WU%=F%L(&-B('=H96X@=6YL97-S(&AE;'!E<B!E;G5M?GM<;G=T86=S
M='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V858N-"TQ?7U<4D%[?0I<3$%[
M?45V86P@8V(@=VAE;B!U;FQE<W,@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B
M<&%G97)E9GM.5V5V83<M179A4"XV+3%]?5Q207M].PI<3$%[?45V86P@8V(@
M=6YL97-S('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W
M+45V84LN,RTQ?7U<4D%[?3L*7$Q!>WU%=F%L(&-B('=H96X@<')O=&]^>UQN
M=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A22XW+3%]?5Q207M]
M.PI<3$%[?45V86P@8V(@8V]N9"!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P
M86=E<F5F>TY7979A-RU%=F%)+C@M,7U]7%)!>WT["EQ,07M]179A;"!C8B!S
M96QE8W0@<')O=&]^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M
M179A2RXT+3%]?5Q207M].PH*7$Q!>WU%=F%L(&-B('!R:6YC('!R;W1O?GM<
M;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84HN-"TQ?7U<4D%[
M?3L*7$Q!>WU%=F%L(&-B('1E<G!R:2!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS
M=6)P86=E<F5F>TY7979A-RU%=F%++C4M,7U]7%)!>WT["@I<3$%[?45V86P@
M8V(@979A;"!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A
M-RU%=F%)+CDM,7U]7%)!>WT["EQ,07M]179A;"!C8B!P<F]G('!R;W1O?GM<
M;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84DN02TQ?7U<4D%[
M?3L*7$Q!>WU%=F%L(&-B('!R;V<Q('!R;W1O?GM<;G=T86=S='EL97M]7'-U
M8G!A9V5R969[3E=E=F$W+45V84HN-2TQ?7U<4D%[?3L*7$Q!>WU%=F%L(&-B
M('!R;V<R('!R;W1O?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W
M+45V84HN-BTQ?7U<4D%[?3L*7$Q!>WU%=F%L(&-B('!R;V=N('!R;W1O?GM<
M;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84HN-RTQ?7U<4D%[
M?3L*"EQ,07M]179A;"!C8B!S970@:&5L<&5R(&5N=6U^>UQN=W1A9W-T>6QE
M>WU<<W5B<&%G97)E9GM.5V5V83<M179A3BTQ?7U<4D%[?0I<3$%[?45V86P@
M8V(@<V5T(&AE;'!E<B!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F
M>TY7979A-RU%=F%/+3%]?5Q207M].PI<3$%[?45V86P@8V(@<V5T('!R;W1O
M?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=E=F$W+45V84@N,BTQ?7U<
M4D%[?3L*7$Q!>WU%=F%L(&-B('-E='$@<')O=&]^>UQN=W1A9W-T>6QE>WU<
M<W5B<&%G97)E9GM.5V5V83<M179A22XR+3%]?5Q207M].PI<3$%[?45V86P@
M8V(@96YU;2!P<F]T;WY[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7979A
M-RU%=F%)+C,M,7U]7%)!>WT["@I<3$%[?45V86P@8V(@9&5F=6X@<')O=&]^
M>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5V5V83<M179A2BXX+3%]?5Q2
M07M].PI<;G=N;W1U<V5D>V5V86PN:'U<;G=E;F1C;V1E>WU<;G=B96=I;F1O
M8W-[,C`Y?5QN=V1O8W-P87(*7&YW96YD9&]C<WM]7&YW9FEL96YA;65[<V%M
M<&QE<RYN=WU<;G=B96=I;F1O8W-[,'U<;G=E;F1D;V-S>WU<;G=B96=I;F1O
M8W-[,7U<;G=D;V-S<&%R"EQS96-T:6]N>U-A;7!L92!F:6QE<WT*7&QA8F5L
M>W-E8SIS86UP;&5S?0H*5&AI<R!I<R!A(&)U;F-H(&]F('-A;7!L92!F:6QE
M<R!T;R!T97-T('1H92!S>7-T96T@=VET:"X*"@HE)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24*
M7'-U8G-E8W1I;VX@>U-A;7!L92`P,7T*"EQN=V5N9&1O8W-[?5QN=V)E9VEN
M8V]D97LR?5QS=6)L86)E;'M.5W-A;4$M<V%M0RTQ?5QN=VUA<F=I;G1A9WM[
M7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7<V%M02US86U#+3%]?7U<;6]D
M9&5F>W-A;7!L93`Q+FQS<'Y[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7
M<V%M02US86U#+3%]?7U<96YD;6]D9&5F"BAS971Q('=O<FQD(")W;W)L9"(@
M:&D@(DAE;&QO(B!C;VUM82`B+"(@97AC;&%M871I;VX@(B$B*0HH;&ES="!H
M:2!C;VUM82!W;W)L9"!E>&-L86UA=&EO;BD*"EQN=VYO='5S961[<V%M<&QE
M,#$N;'-P?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLS?5QN=V1O8W-P87(*
M"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LT?5QS=6)L86)E;'M.5W-A;4$M
M<V%M0RXR+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R
M969[3E=S86U!+7-A;4,N,BTQ?7U]7&UO9&1E9GMS86UP;&4P-"YL<W!^>UQN
M=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5W-A;4$M<V%M0RXR+3%]?7U<96YD
M;6]D9&5F"BAS971Q('=O<FQD(")W;W)L9"(@:&D@(DAE;&QO(B!C;VUM82`B
M+"(@97AC;&%M871I;VX@(B$B*0HH;&ES="!H:2!C;VUM82!W;W)L9"!E>&-L
M86UA=&EO;BD*"EQN=VYO='5S961[<V%M<&QE,#0N;'-P?5QN=V5N9&-O9&5[
M?5QN=V)E9VEN9&]C<WLU?5QN=V1O8W-P87(*"B4E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)0I<
M<W5B<V5C=&EO;B![4V%M<&QE(#`R?0H*7&YW96YD9&]C<WM]7&YW8F5G:6YC
M;V1E>S9]7'-U8FQA8F5L>TY7<V%M02US86U#+C,M,7U<;G=M87)G:6YT86=[
M>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5W-A;4$M<V%M0RXS+3%]?7U<
M;6]D9&5F>W-A;7!L93`R+FQS<'Y[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F
M>TY7<V%M02US86U#+C,M,7U]?5QE;F1M;V1D968*.SL@=&AI<R!I<R!A('1E
M<W0*.R!T:&ES('-H;W5L9"!B92!A(&-O;6UE;G0@"CL@*"L@-"`U*0H*.R!F
M:7)S="!S;VUE('-I;7!L92!M871H(&9U;F-T:6]N<PHH*R`S(#(I"B@M(#0@
M-2D**"H@-"`Y*0HH+R`Q,#`@,C`I"@H[('-O;64@;F5S=',@86YD('!A<F5N
M('1E<W1I;F<N"B@K("@M(#0@-2D@*"`K(#,@-"D@,3`I"B@@*B`H("L@,R`T
M("@@+2`Q,"`W*2`Y*2`Q-RD**"H@*"`K(#,@-"`H("T@,3`@-RD@.2D@,3<I
M"B@J*"L@,R`T*"T@,3`@-RDY*3$W*0HH+2`T*0I<;G=N;W1U<V5D>W-A;7!L
M93`R+FQS<'U<;G=E;F1C;V1E>WU<;G=B96=I;F1O8W-[-WU<;G=D;V-S<&%R
M"@HE)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24*7'-U8G-E8W1I;VX@>U-A;7!L92`P,WT*"EQN
M=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LX?5QS=6)L86)E;'M.5W-A;4$M<V%M
M0RXT+3%]7&YW;6%R9VEN=&%G>WM<;G=T86=S='EL97M]7'-U8G!A9V5R969[
M3E=S86U!+7-A;4,N-"TQ?7U]7&UO9&1E9GMS86UP;&4P,RYL<W!^>UQN=W1A
M9W-T>6QE>WU<<W5B<&%G97)E9GM.5W-A;4$M<V%M0RXT+3%]?7U<96YD;6]D
M9&5F"CL@=&AI<R!I<R!A(&)U;F-H(&]F('-U<'!O<G1E9"!S='5F9BX@(&ET
M)W,@9V]O9"!R96=R97-S:6]N('1E<W1I;F<@;6%T97)I86PN+BX*.R!U;F-O
M;6UE;G0@=&AE('!A<G0@>6]U('=A;G0@=&\@=')Y+BXN"CL@*"L@-"`U*0H*
M.R!S;VUE('-I;7!L92!M871H(&9U;F-T:6]N<PHH*R`T(#,@,BD**"T@,3`@
M-"D**"T@,RD**"T@*"T@,2`Q,"D@*0HH*B`T(#DI"B@O(#$P,"`R,"D*"CLH
M,2L@,S`I"CLH,2T@,S`I"@H[*#$K("@K(#(P(#,P*2D*.R@Q+2`H*R`R,"`S
M,"DI"CLH)2`R,#`Q(#0I"CLH)2`T(#(P,#$I"@H[*#0I"CLH+30I"CLT"@H[
M*&%N9"`H/"`Q,#`@*'-E='$@82`Q*2D@*#X@,S`P("AS971Q(&$@,BDI("AS
M971Q(&$@,RD@*0H[*&$I"CLH86YD("@^(#$P,"`H<V5T<2!A(#$I*2`H/B`S
M,#`@*'-E='$@82`R*2D@*'-E='$@82`S*2`I"CLH82D*.RAA;F0@*#X@,3`P
M("AS971Q(&$@,2DI("@^(#,P,"`H<V5T<2!A(#(I*2`H<V5T<2!A(#0P,"D@
M*0H[*&$I"CLH86YD("@^(#$P,"`H<V5T<2!A(#$I*2`H/B`S,#`@*'-E='$@
M82`R*2D@*0H[*&$I"@HH;W(@*#P@,3`P("AS971Q(&$@,2DI("@\(#,P,"`H
M<V5T<2!A(#(I*2!.24PI"BAA*0H*.R@\(#$P,"`U*0H[*#P@-2`Q,#`I"CLH
M/"`U(#4I"@H[*#P](#$P,"`U*0H[*#P](#4@,3`P*0H[*#P](#4@-2D*"CLH
M/B`Q,#`@-2D*.R@^(#4@,3`P*0H[*#X@-2`U*0H*.R@^/2`Q,#`@-2D*.R@^
M/2`U(#$P,"D*.R@^/2`U(#4I"@H[*#T@,3`P(#4I"CLH/2`U(#$P,"D*.R@]
M(#4@-2D*"CLH;F]T("@](#$P,"`U*2D*.RAN;W0@*#T@-2`Q,#`I*0H[*&YO
M="`H/2`U(#4I*0H*.RAS971Q(&AE;&QO("<H,"`Q(#$@,R`T*2D*.RAH96QL
M;RD*.RAA=&]M(&AE;&QO*0H*.RAA=&]M("AS971Q(&9O;R`@*"L@,B`S*2DI
M"CLH871O;2`H<V5T<2!B87(@)R@K(#(@,RDI*0H[*&%T;VT@)V$I"CLH871O
M;2`X*0H[*&%T;VT@)RAA(&(@8RDI"@H*.RAS971Q(&AI('%U;W1E("A(($4@
M3"!,($\I*0H[*'-E='$@:&DR("<H2"!%($P@3"!/*2D*"CLH<V5T<2!F;&]O
M<"!G;V\I"BAS971Q(&-H965S92`B8VAE97-E(&ES('%U:71E('EU;6UY(BD*
M.RAS971Q(&8@,S0I"CLH<V5T<2!G("<H*R`T(#,I*0H[*'-E='$@<2`S*0H[
M*'-E='$@=R`G,RD*.RAS971Q(&4@)R@S*2D@("`@.R!T:&5S92!D;VXG="!C
M=7)R96YT;'D@9V5T(&AA;F1L960@<')O<&5R;'D@:6X@979A;`H[*'-E='$@
M<B`G*"@S*2DI("`[('1H97-E(&1O;B=T(&-U<G)E;G1L>2!G970@:&%N9&QE
M9"!P<F]P97)L>2!I;B!E=F%L"CLH<V5T<2!T("<H*"DI*2`@(#L@=&AE<V4@
M9&]N)W0@8W5R<F5N=&QY(&=E="!H86YD;&5D('!R;W!E<FQY(&EN(&5V86P*
M.RAS971Q(&<@*"L@.2`R*2D*.RAS971Q(&9O;R`G*"L@*"T@,R`T(#4I("@J
M(#(@,R`T*2DI"CLH<V5T<2!B87(@*"L@*"T@,R`T(#4I("@J(#(@,R`T*2DI
M"CLH*R`R("AS971Q('`@*"L@-2`S*2DI"@H[*"L@9B!G('`I"@H[*"L@,B`H
M<V5T<2!X("@J(#,@-"DI*0H[*"L@,"!X*0H**'-E='$@>"`U*0HH<V5T<2!Y
M("@Q*R@K(#`@>"DI*0HH>"D@*'DI"@H[*"L@-"`G*"L@,R`T("<U(#8@-RDI
M"CLH*R`T('%U;W1E("@K(#,@-"`G-2`V(#<I*0H*.RAS971Q(&UU9"`B9&ER
M="(@<VUO9R`B<VUO:V4B*0H*"CLH8V%R("<H82!B(&,I*0H[*&-D<B`G*&$@
M8B!C*2D*.RAS971Q('@@)RAA(&(@8RDI"CLH8V%R('@I"CLH8V1R('@I"@H[
M*&-D<B`G*"DI"CLH8V%R("<H*2D*.RAC9'(@)RAA*2D*.RAC87(@)RAA*2D*
M"CLH8V%R("<H*&$@8BDI*0H[*&-A<B`H8V%R("<H*&$@8BDI*2D*.RAC9'(@
M)R@H82!B*2`H8R!D*2DI*0H*.RAC9'(@)RAA(&(I*0H[*&-A<B`H8V1R("<H
M82!B(&,@9"!E*2DI"CLH8V%R("<H("AA(&(@8RD@*&0@92!F*2`H9R!H(&DI
M("D@*0H[*&-D<B`G*"`H82!B(&,I("AD(&4@9BD@*&<@:"!I*2`I("D*"CLH
M8V%R("AC9'(@)R@H82!B*2`H8R!D*2D@*2D*.RAC9'(@*&-A<B`G*"AA(&(I
M("AC(&0I*2`I*0H*.RAA=&]M("AC9'(@)R@H82!B*2`H8R!D*2D@*2D*.PH[
M*&-D<B`H8V%R("<H*&$@8BD@*&,@9"DI*2D*.SL*.RAC9'(@*&-A<B`G*"AA
M(&(@8RD@*&0@92!F*2DI*0H[*&-A<B`H8V%R("<H*&$@8B!C*2`H9"!E(&8I
M*2DI"CLH8V%R("AC9'(@)R@H82!B(&,I("AD(&4@9BDI*2D*.RAC87(@*&-A
M<B`H8V1R("<H*&$@8B!C*2`H9"!E(&8I*2DI*0HH8V1R("AC87(@*&-D<B`G
M*"AA(&(@8RD@*&0@92!F*2DI*2D**&-A<B`H8V1R("AC87(@*&-D<B`G*"AA
M(&(@8RD@*&0@92!F*2DI*2DI"@H[*&-O;G,@)V$@)RAB(&,I*0H[*'-E='$@
M>"`H8V]N<R`G82`G*&(@8RDI*0H[*&-A<B!X*0H[*&-D<B!X*0H[*&-O;G,@
M)V$@)RAB*2D*.RAC;VYS("<H82!B*2`G*&,@9"DI"CLH8V]N<R`G82`H8V]N
M<R`G8B`G*&,@9"DI*0H*.RAS971Q('@@)RAA(&(I*0H[*&-O;G,@*&-A<B!X
M*2`H8V]N<R`H8V%R("AC9'(@>"DI("<H8R!D*2D@*0H*.RAS971Q('@@)V$I
M"CLH<V5T<2!Y("<H8B!C*2D*.RAC;VYS('@@>2D*.RAX*0H[*'DI"CLH8V%R
M("AS971Q('@@)RAA(&(@8RDI*0H[*&-A<B`G*'-E='$@>"`G*&$@8B!C*2DI
M"@HH;&ES="`G82`G8B`G8RD**&QI<W0@)V$@)RAB(&,I("=D*0HH;&ES="`G
M82`G8B`G8R`G9"D*.RAL:7-T("=A*0H[*&QI<W0I"@HH<V5T<2!R97-U;'0@
M*&EF("@\(#,@-"D@*'-E='$@82`G*'0@<B!O(&\I*2`H<V5T<2!B("<H9B!A
M(&P@92!S*2DI("D**&$I*&(I*')E<W5L="D**'-E='$@<F5S=6QT("AI9B`H
M/B`S(#0I("AS971Q(&,@)RAT('(@;R!O*2D@*'-E='$@9"`G*&8@82!L(&4@
M<RDI*2`I"BAC*2AD*2AR97-U;'0I"@H[*'-E='$@<F5S=6QT("AI9B`H/"`S
M(#0I("AS971Q(&$@)RAT('(@;R!O*2D@*2`I"CLH82DH8BDH<F5S=6QT*0H[
M*'-E='$@<F5S=6QT("AI9B`H/B`S(#0I("AS971Q(&,@)RAT('(@;R!O*2D@
M*2`I"CLH8RDH9"DH<F5S=6QT*0H*.RAU;FQE<W,@*#P@,R`T*2`H<V5T<2!X
M("@K(#,@-"DI("AS971Q('D@)R@K(#D@."DI("D*.RAU;FQE<W,@*#X@,R`T
M*2`H<V5T<2!W("@K(#,@-"DI("AS971Q('H@)R@K(#D@."DI("D*.PH[*'=H
M96X@*#P@,R`T*2`H<V5T<2!A("@K(#,@-"DI("AS971Q(&0@)R@K(#D@."DI
M("D*.RAW:&5N("@^(#,@-"D@*'-E='$@<R`H*R`S(#0I*2`H<V5T<2!F("<H
M*R`Y(#@I*2`I"@H[*&-O;F0@*"`H/B`S(#0I("AS971Q(&$@)V]N93$I("AS
M971Q(&(@)V]N93(I("D*.R`@("`@("@@*#T@,R`T*2`H<V5T<2!C("=T=V\Q
M*2`H<V5T<2!D("=T=V\R*2`I"CL@("`@("`H("@\(#,@-"D@*'-E='$@92`G
M=&AR964Q*2`H<V5T<2!F("=T:')E93(I("D*.RD*.PH[*&-O;F0@*"`H/B`S
M(#0I("AS971Q(&<@)V]N93$I("AS971Q(&@@)V]N93(I("D*.R`@("`@("@@
M*#T@,R`T*2`H<V5T<2!I("=T=V\Q*2`H<V5T<2!J("=T=V\R*2`I"CL@("`@
M("`H("@\(#,@-"D@*0H[*0H*.RAP<FEN8R`G(FAE;&QO('=O<FQD(BD*.RAT
M97)P<FDI"CLH<')I;F,@(G1H:7,@:7,@86QS;R!A('1E<W0B*3L*"CLH<V5T
M<2!A("=B*0H[*'-E='$@8B`G8RD*.RAA*0H[*&(I"CLH979A;"!A*0H["CLH
M979A;"`H8V]N<R`G*R`G*#(@,RDI*0H*.RAP<F]G,2`H8V%R("<H82!B(&,I
M*2`H8V1R("<H82!B(&,I*2`H8V1R("<H9"!E(&8I*2`H8V1R("<H9R!H(&DI
M*2D*.RAP<F]G,B`H8V%R("<H82!B(&,I*2`H8V1R("<H82!B(&,I*2`H8V1R
M("<H9"!E(&8I*2`H8V1R("<H9R!H(&DI*2D*.RAP<F]G;B`H8V%R("<H82!B
M(&,I*2`H8V1R("<H82!B(&,I*2`H8V1R("<H9"!E(&8I*2`H8V1R("<H9R!H
M(&DI*2D*"CLH<V5T<2!H96QL;R`G*#`@,2`Q(#,@-"DI"CLH:&5L;&\I"CLH
M871O;2!H96QL;RD*"CLH<V5T<2!A("<H9B`P(&\I*0H[*'-E='$@8B`H*R`S
M(#0I*0H[*'-E='$@8R`H*R`S(#0I(&0@*#$K(&(I(&4@)R@T(#4@-BDI"CLH
M<V5T<2!F("@K(#,@-"D@9R`H,2L@8BD@:"D*"CLH<V5T<2!G("<H82!B(&,@
M9"DI"CLH<V5T("=B("<H82!B(&,@9"DI"CL*.RAS970@*&-A<B!G*2`H8V1R
M(&<I*0H*.RAS971Q('@@)RAA(&(@8RDI"CLH<V5T<2!Y("AC9'(@>"DI"CLH
M<V5T<2!Z("<H8B!C*2D*.PH[*&5Q=6%L("AC9'(@>"D@>2D*.RAE<75A;"!Y
M('HI"CLH97%U86P@>B!Z*0H[*&5Q=6%L('@@>BD*.RAE<75A;"!X("<H82!B
M(&,I*0H*.RAD969U;B!A9&1T:')E92`H>"D@*"L@>"`S*2D*.PH[*&1E9G5N
M(&%D9'1W;W1O,R`H>"!Y*2`H*R!X('D@,RDI"CL*.RAA9&1T=V]T;S,@,B`S
M*0H[*&%D9'1W;W1O,R`R(#,@-"D*.PHH861D=&AR964@,RD*.RAA9&1T:')E
M92`S(#4@-RD*.PH[*&%D9'1H<F5E("@J(#0@*#$M(#<I*2D*.PH[*&1E9G5N
M(&%V97)A9V4@*'@@>2D@*"\@*"L@>"!Y*2`R*2D*.RAA=F5R86=E(#<@*&-A
M<B`G*#(Q(#,@-"`U*2DI"CLH879E<F%G92`Y(#,Q*0H["CLH<V5T<2!F;V\@
M("<H-R`R,2`S-"`R,B`Y.2DI"CLH8V%R(&9O;RD@*&-A<B`H8V1R(&9O;RDI
M"CLH+R`H*R`H8V%R(&9O;RD@*&-A<B`H8V1R(&9O;RDI*2`R*0H["CLH9&5F
M=6X@879E<F%G96P@*'@I("@O("@K("AC87(@>"D@*&-A<B`H8V1R('@I*2D@
M,BDI"CLH879E<F%G96P@)R@W(#(Q(#,T(#(R(#DY*2D*.RAA=F5R86=E;"`G
M*#D@,S$@,S0@,C(@.3DI*0H["BAD969U;B!T:')E92`H>"D@*"L@,B`Q*2D*
M*'1H<F5E(#0I"CLH<V5T<2!X("@K(#0@-2DI"CLH<V5T<2!X("@Q*R!X*2D*
M.RAD969U;B!A9&1T:')E92`H>"D@*"L@>"`S*2D*.PH[*&%D9'1H<F5E(#0I
M"CLH861D=&AR964@*#4I*0H["CLH861D=&AR964@-"D*.RAA9&1T:')E92`U
M(#(I"CLH9&5F=6X@<V5V96X@*"D@)R@W*2D*.RAD969U;B!S979E;C(@*"D@
M*#<I*0H["CLH<V5V96XI"CLH<V5V96XR("@I*0H*.RAE;G5M(&$@8B!C(&0@
M92D*.RAE;G5M*0H[*&5N=6T@*"DI"CLH96YU;2!Z('D@*&4@<B!T('DI('@I
M"CLH96YU;2!A82!B8B!A82!C8RD*"CL@*&=C*0H[("AP<2D*"CLH<V5T<2!X
M(#0I"CL*.RAS96QE8W0I"CLH<V5L96-T("@K('@@,2D@"CL@("`@("`@*#,@
M*'-E='$@82`G=&AR964I*2`*.R`@("`@("`H-"`H<V5T<2!A("=F;W5R*2D@
M"CL@("`@("`@*#D@*'-E='$@82`G9FEV92DI(`H[("`@("`@("@V("AS971Q
M(&$@)W-I>"DI"CL[*0H["CLH<V5L96-T("@K('@@,2D@"CL@("`@("`@*#4@
M*'-E='$@8B`G9FEV92DI(`H[("`@("`@("@V("AS971Q(&(@)W-I>"DI"CLI
M"CL*.RAS96QE8W0@*"L@>"`Q*2`*.R`@("`@("`H-B`H<V5T<2!B("=S:7@I
M*0H[*0H["CLH<V5L96-T("@K('@@,2D@"CLI"EQN=VYO='5S961[<V%M<&QE
M,#,N;'-P?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLY?5QN=V1O8W-P87(*
M7&YW96YD9&]C<WM]7&YW9FEL96YA;65[=F5R<VEO;BYN=WU<;G=B96=I;F1O
M8W-[,'U<;G=E;F1D;V-S>WU<;G=B96=I;F1O8W-[,7U<;G=D;V-S<&%R"EQS
M96-T:6]N>U9E<G-I;VX@:6YF;W)M871I;VY]"EQL86)E;'MS96,Z=F5R<VEO
M;GT*"B4E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E"@I<;G=E;F1D;V-S>WU<;G=B96=I
M;F-O9&5[,GU<<W5B;&%B96Q[3E=V97)!+79E<DPM,7U<;G=M87)G:6YT86=[
M>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5W9E<D$M=F5R3"TQ?7U]7&UO
M9&1E9GMV97)S:6]N(&)U:6QD('9E<G-I;VY^>UQN=W1A9W-T>6QE>WU<<W5B
M<&%G97)E9GM.5W9E<D$M=F5R3"TQ?7U]7&5N9&UO9&1E9@HB,"XV(@I<;G=U
M<V5D>UQ<>TY7=F5R02UV97(Y+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C
M<WLS?5QN=V1O8W-P87(*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LT?5QS
M=6)L86)E;'M.5W9E<D$M=F5R22TQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y
M;&5[?5QS=6)P86=E<F5F>TY7=F5R02UV97))+3%]?7U<;6]D9&5F>W9E<G-I
M;VX@8G5I;&0@9&%T97Y[7&YW=&%G<W1Y;&5[?5QS=6)P86=E<F5F>TY7=F5R
M02UV97))+3%]?7U<96YD;6]D9&5F"B(R,#`Q+3$P+3$V(@I<;G=U<V5D>UQ<
M>TY7=F5R02UV97(Y+3%]?5QN=V5N9&-O9&5[?5QN=V)E9VEN9&]C<WLU?5QN
M=V1O8W-P87(*"EQN=V5N9&1O8W-[?5QN=V)E9VEN8V]D97LV?5QS=6)L86)E
M;'M.5W9E<D$M=F5R2BTQ?5QN=VUA<F=I;G1A9WM[7&YW=&%G<W1Y;&5[?5QS
M=6)P86=E<F5F>TY7=F5R02UV97)*+3%]?7U<;6]D9&5F>W9E<G-I;VX@8G5I
M;&0@='!O=&-^>UQN=W1A9W-T>6QE>WU<<W5B<&%G97)E9GM.5W9E<D$M=F5R
M2BTQ?7U]7&5N9&UO9&1E9@HB0F%L;V\B"EQN=W5S961[7%Q[3E=V97)!+79E
M<CDM,7U]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>S=]7&YW9&]C<W!A<@H*
M,C`P,2TQ,"TQ-B`B0F%L;V\B(#`N,#8*7&)E9VEN>VET96UI>F5]"EQI=&5M
M('-E="!A;F0@<V5T<2!C;VUB:6YE9"!T;R!O;F4@:&5L<&5R(&9U;F-T:6]N
M('1O(')E9'5C92!C;V1E('-I>F4*7&ET96T@9FEX960@<VEN9VQE('!A<F%M
M971E<B!D969U;B!C86QL<R`*7&ET96T@9FEX960@<&%R<VEN9R!O=F5R('1A
M8G,@"EQI=&5M(&YE=SH@9V,L(&=A<F)A9V4M8V]L;&5C="`@*')E='5R;B`B
M5"(I"EQI=&5M(&YE=SH@96YU;2P@<V5L96-T"EQI=&5M(&%D9&5D(&$@:&5L
M;&\L('=O<FQD('1O('1H92!S86UP;&4N("`H='EP92`G;6%K92!T97-T)RD*
M7&ET96T@861D960@=F5R<VEO;B!I;F9O<FUA=&EO;B!I;G1O(&UA:6XN;G<*
M7&5N9'MI=&5M:7IE?0H*,C`P,2TQ,"TQ,"`B4W1O<FTB(#`N-0I<8F5G:6Y[
M:71E;6EZ97T*7&ET96T@("!#:&%N9V5D('1H92!P87)S97(@=&\@=7-E(&$@
M<&%I<B!O9B!C86QL8F%C:W,N("AM;W)E(&9L97AI8FQE*0I<96YD>VET96UI
M>F5]"@H*,C`P,2TQ,"TQ,"`B5')E8G5C:&5T(B`P+C0*7&)E9VEN>VET96UI
M>F5]"EQI=&5M("`@;F5W.B!D969U;@I<:71E;2`@($QI<W0@=&%G9VEN9R!F
M=6YC=&EO;G,@*&QI<W0N;G<I(&%D9&5D(&9O<B!T:&4@86)O=F4*7&5N9'MI
M=&5M:7IE?0H*,C`P,2TQ,"TP.2`B0V]L;&%S<&EN9R(@,"XS"EQB96=I;GMI
M=&5M:7IE?0I<:71E;2`@(&YE=SH@<V5T+"!S971F+"!S971Q("AN97<@=F5R
M<VEO;BD*7&ET96T@("!N97<Z(&5Q=6%L"EQI=&5M("`@;VQD.B!Q=6]T90I<
M96YD>VET96UI>F5]"@HR,#`Q+3$P+3`X(")586MT:2(@,"XR"EQB96=I;GMI
M=&5M:7IE?0I<:71E;2`@(%!H:6QI<"!';&%S<R!A;&)U;2P@86YD($)R87II
M;&QI86X@8F%N9`I<:71E;2`@(&%D9&5D("=Q=6]T92<@<&%R<VEN9PI<:71E
M;2`@(&-O;G9E<G1E9"!O=F5R('1O(&9U;&P@;&ES="!P87-S:6YG("AS971Q
M(&AE;&QO("<H,"`Q(#$@,R`T*2D@=V]R:W,*7&ET96T@("!F:7AE9"!T:&4@
M979A;'5A=&EO;B!O9B!A('9A<FEA8FQE(&YA;64@87,@82!R971U<FX@=F%L
M=44*7&ET96T@("!N97<Z(&%N9"P@;W(L(&YO="P@;G5L;"P@871O;2P@8V%R
M+"!C9'(L(&-O;G,L(&QI<W0*7&ET96T@("!N97<Z(&EF+"!U;FQE<W,L('=H
M96XL(&-O;F0*7&ET96T@("!N97<Z(&5V86PL('!R;V<Q+"!P<F]G,BP@<')O
M9VX*7&ET96T@("!N97<Z('!R:6YT8RP@=&5R<')I"EQE;F1[:71E;6EZ97T*
M"C(P,#$M,3`M,#<@(DEN(%1H92!7:6YD;W<B"EQB96=I;GMI=&5M:7IE?0I<
M:71E;2`@(&)A<VEC<R!O9B!S971Q(&1O;F4N("!I;G1E9W)A=&5D(&%N9"!D
M96)U9V=E9"!T:&4@=F%R:6%B;&4@;65C:&%N:7-M"EQI=&5M("`@:70@9&]E
M<R!N;W0@>65T(&1O('1H:6YG<R!L:6ME.B`@*'-E='$@:&5L;&\@)R@P(#$@
M,2`S(#0I*0I<96YD>VET96UI>F5]"B`@("`@("`@(`HR,#`Q+3$P+3`S(")"
M=6EL9&EN9R!!(%=A;&PB(#`N,0I<8F5G:6Y[:71E;6EZ97T*7&ET96T@("!/
M<F)I=&%L("T@(DEL;'5M:6YA=&4B"EQI=&5M("`@:6YI=&EA;"!F:6QE('!A
M<G-E<@I<:71E;2`@(&EN:71I86P@=')E92!B=6EL9&5R"EQI=&5M("`@=F%R
M:6%B;&4@;&ES="!T;V]L<PI<:71E;2`@(&)E9VEN;FEN9W,@;V8@=&AE(&5V
M86QU871O<@I<:71E;2`@(&%D9"P@<W5B=')A8W0L(&UU;'1I<&QY+"!D:79I
M9&4@861D960*7&5N9'MI=&5M:7IE?0H*)24E)24E)24E)24E)24E)24E)24E
M)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24E)24*
M7'-U8G-E8W1I;VY[5&AE(%-O=7)C92!&:6QE('M<='1[?79E<G-I;VXN:'U]
M"EQL86)E;'MS96,Z=F5R<VEO;BYH?0H*7&YW96YD9&]C<WM]7&YW8F5G:6YC
M;V1E>SA]7'-U8FQA8F5L>TY7=F5R02UV97(Y+3%]7&YW;6%R9VEN=&%G>WM<
M;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=V97)!+79E<CDM,7U]?5QM;V1D
M969[=F5R<VEO;BYH?GM<;G=T86=S='EL97M]7'-U8G!A9V5R969[3E=V97)!
M+79E<CDM,7U]?5QE;F1M;V1D968*"B-D969I;F4@5D527T)524Q$7T1!5$4@
M(%Q,07M]=F5R<VEO;B!B=6EL9"!D871E?GM<;G=T86=S='EL97M]7'-U8G!A
M9V5R969[3E=V97)!+79E<DDM,7U]7%)!>WT*(V1E9FEN92!615)?0E5)3$1?
M5D52("`@7$Q!>WUV97)S:6]N(&)U:6QD('9E<G-I;VY^>UQN=W1A9W-T>6QE
M>WU<<W5B<&%G97)E9GM.5W9E<D$M=F5R3"TQ?7U<4D%[?0HC9&5F:6YE(%9%
M4E]"54E,1%]44$]40R!<3$%[?79E<G-I;VX@8G5I;&0@='!O=&-^>UQN=W1A
M9W-T>6QE>WU<<W5B<&%G97)E9GM.5W9E<D$M=F5R2BTQ?7U<4D%[?0H*7&YW
M;F]T=7-E9'MV97)S:6]N+FA]7&YW96YD8V]D97M]7&YW8F5G:6YD;V-S>SE]
M7&YW9&]C<W!A<@I<;G=E;F1D;V-S>WT*"EQN=VEX;&]G<V]R=&5D>V-]>WM$
M969U;B!L:7-T(&1E9FEN:71I;VY]>TY7=F%R-RU$969,+3%]>UQN=VEX9'M.
M5W9A<C<M1&5F3"TQ?5QN=VEX=7M.5W9A<C<M=F%R-BXR+3%]?7TE"EQN=VEX
M;&]G<V]R=&5D>V-]>WM$969U;B!L:7-T(&EN:71I86QI>F%T:6]N?7M.5W9A
M<C<M1&5F4"TQ?7M<;G=I>&1[3E=V87(W+41E9E`M,7U<;G=I>'5[3E=V87(W
M+79A<C8M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@8V%L;&)A8VL@
M='EP961E9GU[3E=E=F$W+45V84PM,7U[7&YW:7AD>TY7979A-RU%=F%,+3%]
M7&YW:7AU>TY7979A-RUE=F$V+C(M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[
M>T5V86P@8V%S="!I;G0@=&\@;&4@:6UP;&5M96YT871I;VY]>TY7979A-RU%
M=F%9+C0M,7U[7&YW:7AD>TY7979A-RU%=F%9+C0M,7U<;G=I>'5[3E=E=F$W
M+65V838M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@8V%S="!I;G0@
M=&\@;&4@<')O=&]]>TY7979A-RU%=F%0+C@M,7U[7&YW:7AD>TY7979A-RU%
M=F%0+C@M,7U<;G=I>'5[3E=E=F$W+45V85DN-"TQ?5QN=VEX=7M.5V5V83<M
M979A-BXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L(&-A<W0@;&4@
M=&\@:6YT(&EM<&QE;65N=&%T:6]N?7M.5V5V83<M179A62XS+3%]>UQN=VEX
M9'M.5V5V83<M179A62XS+3%]7&YW:7AU>TY7979A-RUE=F$V+3%]?7TE"EQN
M=VEX;&]G<V]R=&5D>V-]>WM%=F%L(&-A<W0@;&4@=&\@:6YT('!R;W1O?7M.
M5V5V83<M179A4"XW+3%]>UQN=VEX9'M.5V5V83<M179A4"XW+3%]7&YW:7AU
M>TY7979A-RU%=F%9+C,M,7U<;G=I>'5[3E=E=F$W+65V838N,BTQ?7U])0I<
M;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C8B!A9&0@:6UP;&5M96YT871I;VY]
M>TY7979A-RU%=F%1+C(M,7U[7&YW:7AD>TY7979A-RU%=F%1+C(M,7U<;G=I
M>'5[3E=E=F$W+65V838M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@
M8V(@861D('!R;W1O?7M.5V5V83<M179A2"XS+3%]>UQN=VEX9'M.5V5V83<M
M179A2"XS+3%]7&YW:7AU>TY7979A-RU%=F%1+C(M,7U<;G=I>'5[3E=E=F$W
M+65V838N,BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C8B!A;F0@
M:6UP;&5M96YT871I;VY]>TY7979A-RU%=F%1+C,M,7U[7&YW:7AD>TY7979A
M-RU%=F%1+C,M,7U<;G=I>'5[3E=E=F$W+65V838M,7U]?24*7&YW:7AL;V=S
M;W)T961[8WU[>T5V86P@8V(@86YD('!R;W1O?7M.5V5V83<M179A2"XT+3%]
M>UQN=VEX9'M.5V5V83<M179A2"XT+3%]7&YW:7AU>TY7979A-RU%=F%1+C,M
M,7U<;G=I>'5[3E=E=F$W+65V838N,BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC
M?7M[179A;"!C8B!A=&]M(&EM<&QE;65N=&%T:6]N?7M.5V5V83<M179A4BXS
M+3%]>UQN=VEX9'M.5V5V83<M179A4BXS+3%]7&YW:7AU>TY7979A-RUE=F$V
M+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L(&-B(&%T;VT@<')O=&]]
M>TY7979A-RU%=F%)+C0M,7U[7&YW:7AD>TY7979A-RU%=F%)+C0M,7U<;G=I
M>'5[3E=E=F$W+45V85(N,RTQ?5QN=VEX=7M.5V5V83<M979A-BXR+3%]?7TE
M"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L(&-B(&-A<B!I;7!L96UE;G1A=&EO
M;GU[3E=E=F$W+45V85$N-2TQ?7M<;G=I>&1[3E=E=F$W+45V85$N-2TQ?5QN
M=VEX=7M.5V5V83<M979A-BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A
M;"!C8B!C87(@<')O=&]]>TY7979A-RU%=F%(+C8M,7U[7&YW:7AD>TY7979A
M-RU%=F%(+C8M,7U<;G=I>'5[3E=E=F$W+45V85$N-2TQ?5QN=VEX=7M.5V5V
M83<M979A-BXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L(&-B(&-D
M<B!I;7!L96UE;G1A=&EO;GU[3E=E=F$W+45V85$N-BTQ?7M<;G=I>&1[3E=E
M=F$W+45V85$N-BTQ?5QN=VEX=7M.5V5V83<M979A-BTQ?7U])0I<;G=I>&QO
M9W-O<G1E9'MC?7M[179A;"!C8B!C9'(@<')O=&]]>TY7979A-RU%=F%(+C<M
M,7U[7&YW:7AD>TY7979A-RU%=F%(+C<M,7U<;G=I>'5[3E=E=F$W+45V85$N
M-BTQ?5QN=VEX=7M.5V5V83<M979A-BXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D
M>V-]>WM%=F%L(&-B(&-O;F0@:6UP;&5M96YT871I;VY]>TY7979A-RU%=F%2
M+C<M,7U[7&YW:7AD>TY7979A-RU%=F%2+C<M,7U<;G=I>'5[3E=E=F$W+65V
M838M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@8V(@8V]N9"!P<F]T
M;WU[3E=E=F$W+45V84DN."TQ?7M<;G=I>&1[3E=E=F$W+45V84DN."TQ?5QN
M=VEX=7M.5V5V83<M179A4BXW+3%]7&YW:7AU>TY7979A-RUE=F$V+C(M,7U]
M?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@8V(@8V]N<R!I;7!L96UE;G1A
M=&EO;GU[3E=E=F$W+45V85(N-"TQ?7M<;G=I>&1[3E=E=F$W+45V85(N-"TQ
M?5QN=VEX=7M.5V5V83<M979A-BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[
M179A;"!C8B!C;VYS('!R;W1O?7M.5V5V83<M179A22XU+3%]>UQN=VEX9'M.
M5V5V83<M179A22XU+3%]7&YW:7AU>TY7979A-RU%=F%2+C0M,7U<;G=I>'5[
M3E=E=F$W+65V838N,BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C
M8B!C=6UE(&AE;'!E<B!E;G5M?7M.5V5V83<M179A3RXR+3%]>UQN=VEX9'M.
M5V5V83<M179A3RXR+3%]7&YW:7AU>TY7979A-RUE=F$V+C(M,7U]?24*7&YW
M:7AL;V=S;W)T961[8WU[>T5V86P@8V(@8W5M92!H96QP97(@:6UP;&5M96YT
M871I;VY]>TY7979A-RU%=F%9+3%]>UQN=VEX9'M.5V5V83<M179A62TQ?5QN
M=VEX=7M.5V5V83<M979A-BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A
M;"!C8B!C=6UE(&AE;'!E<B!P<F]T;WU[3E=E=F$W+45V85`M,7U[7&YW:7AD
M>TY7979A-RU%=F%0+3%]7&YW:7AU>TY7979A-RU%=F%9+3%]7&YW:7AU>TY7
M979A-RUE=F$V+C(M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@8V(@
M9&5F=6X@:6UP;&5M96YT871I;VY]>TY7979A-RU%=F%3+C@M,7U[7&YW:7AD
M>TY7979A-RU%=F%3+C@M,7U<;G=I>'5[3E=E=F$W+65V838M,7U]?24*7&YW
M:7AL;V=S;W)T961[8WU[>T5V86P@8V(@9&5F=6X@<')O=&]]>TY7979A-RU%
M=F%*+C@M,7U[7&YW:7AD>TY7979A-RU%=F%*+C@M,7U<;G=I>'5[3E=E=F$W
M+45V85,N."TQ?5QN=VEX=7M.5V5V83<M979A-BXR+3%]?7TE"EQN=VEX;&]G
M<V]R=&5D>V-]>WM%=F%L(&-B(&1I=FED92!I;7!L96UE;G1A=&EO;GU[3E=E
M=F$W+45V850M,7U[7&YW:7AD>TY7979A-RU%=F%4+3%]7&YW:7AU>TY7979A
M-RUE=F$V+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L(&-B(&1I=FED
M92!P<F]T;WU[3E=E=F$W+45V84LM,7U[7&YW:7AD>TY7979A-RU%=F%++3%]
M7&YW:7AU>TY7979A-RU%=F%4+3%]7&YW:7AU>TY7979A-RUE=F$V+C(M,7U]
M?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@8V(@96YU;2!I;7!L96UE;G1A
M=&EO;GU[3E=E=F$W+45V85(N,BTQ?7M<;G=I>&1[3E=E=F$W+45V85(N,BTQ
M?5QN=VEX=7M.5V5V83<M979A-BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[
M179A;"!C8B!E;G5M('!R;W1O?7M.5V5V83<M179A22XS+3%]>UQN=VEX9'M.
M5V5V83<M179A22XS+3%]7&YW:7AU>TY7979A-RU%=F%2+C(M,7U<;G=I>'5[
M3E=E=F$W+65V838N,BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C
M8B!E<7-I9VX@:6UP;&5M96YT871I;VY]>TY7979A-RU%=F%4+C(M,7U[7&YW
M:7AD>TY7979A-RU%=F%4+C(M,7U<;G=I>'5[3E=E=F$W+65V838M,7U]?24*
M7&YW:7AL;V=S;W)T961[8WU[>T5V86P@8V(@97%S:6=N('!R;W1O?7M.5V5V
M83<M179A2RXR+3%]>UQN=VEX9'M.5V5V83<M179A2RXR+3%]7&YW:7AU>TY7
M979A-RU%=F%4+C(M,7U<;G=I>'5[3E=E=F$W+65V838N,BTQ?7U])0I<;G=I
M>&QO9W-O<G1E9'MC?7M[179A;"!C8B!E<75A;"!H96QP97(@:6UP;&5M96YT
M871I;VY]>TY7979A-RU%=F%:+3%]>UQN=VEX9'M.5V5V83<M179A6BTQ?5QN
M=VEX=7M.5V5V83<M979A-BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A
M;"!C8B!E<75A;"!H96QP97(@<')O=&]]>TY7979A-RU%=F%1+C<M,7U[7&YW
M:7AD>TY7979A-RU%=F%1+C<M,7U<;G=I>'5[3E=E=F$W+45V85HM,7U<;G=I
M>'5[3E=E=F$W+65V838N,BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A
M;"!C8B!E<75A;"!I;7!L96UE;G1A=&EO;GU[3E=E=F$W+45V85,N,RTQ?7M<
M;G=I>&1[3E=E=F$W+45V85,N,RTQ?5QN=VEX=7M.5V5V83<M979A-BTQ?7U]
M)0I<;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C8B!E<75A;"!P<F]T;WU[3E=E
M=F$W+45V84HN,RTQ?7M<;G=I>&1[3E=E=F$W+45V84HN,RTQ?5QN=VEX=7M.
M5V5V83<M179A4RXS+3%]7&YW:7AU>TY7979A-RUE=F$V+C(M,7U]?24*7&YW
M:7AL;V=S;W)T961[8WU[>T5V86P@8V(@979A;"!I;7!L96UE;G1A=&EO;GU[
M3E=E=F$W+45V85(N."TQ?7M<;G=I>&1[3E=E=F$W+45V85(N."TQ?5QN=VEX
M=7M.5V5V83<M979A-BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C
M8B!E=F%L('!R;W1O?7M.5V5V83<M179A22XY+3%]>UQN=VEX9'M.5V5V83<M
M179A22XY+3%]7&YW:7AU>TY7979A-RU%=F%2+C@M,7U<;G=I>'5[3E=E=F$W
M+65V838N,BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C8B!G="!E
M<2!I;7!L96UE;G1A=&EO;GU[3E=E=F$W+45V85,N,BTQ?7M<;G=I>&1[3E=E
M=F$W+45V85,N,BTQ?5QN=VEX=7M.5V5V83<M979A-BTQ?7U])0I<;G=I>&QO
M9W-O<G1E9'MC?7M[179A;"!C8B!G="!E<2!P<F]T;WU[3E=E=F$W+45V84HN
M,BTQ?7M<;G=I>&1[3E=E=F$W+45V84HN,BTQ?5QN=VEX=7M.5V5V83<M179A
M4RXR+3%]7&YW:7AU>TY7979A-RUE=F$V+C(M,7U]?24*7&YW:7AL;V=S;W)T
M961[8WU[>T5V86P@8V(@9W0@:6UP;&5M96YT871I;VY]>TY7979A-RU%=F%0
M+C,M,7U[7&YW:7AD>TY7979A-RU%=F%0+C,M,7U<;G=I>'5[3E=E=F$W+65V
M838M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@8V(@9W0@<')O=&]]
M>TY7979A-RU%=F%'+C(M,7U[7&YW:7AD>TY7979A-RU%=F%'+C(M,7U<;G=I
M>'5[3E=E=F$W+45V85`N,RTQ?5QN=VEX=7M.5V5V83<M979A-BXR+3%]?7TE
M"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L(&-B(&EF(&EM<&QE;65N=&%T:6]N
M?7M.5V5V83<M179A4"XU+3%]>UQN=VEX9'M.5V5V83<M179A4"XU+3%]7&YW
M:7AU>TY7979A-RUE=F$V+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L
M(&-B(&EF('!R;W1O?7M.5V5V83<M179A1RXT+3%]>UQN=VEX9'M.5V5V83<M
M179A1RXT+3%]7&YW:7AU>TY7979A-RU%=F%0+C4M,7U<;G=I>'5[3E=E=F$W
M+65V838N,BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C8B!L:7-T
M(&EM<&QE;65N=&%T:6]N?7M.5V5V83<M179A4BXU+3%]>UQN=VEX9'M.5V5V
M83<M179A4BXU+3%]7&YW:7AU>TY7979A-RUE=F$V+3%]?7TE"EQN=VEX;&]G
M<V]R=&5D>V-]>WM%=F%L(&-B(&QI<W0@<')O=&]]>TY7979A-RU%=F%)+C8M
M,7U[7&YW:7AD>TY7979A-RU%=F%)+C8M,7U<;G=I>'5[3E=E=F$W+45V85(N
M-2TQ?5QN=VEX=7M.5V5V83<M979A-BXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D
M>V-]>WM%=F%L(&-B(&QT(&5Q(&EM<&QE;65N=&%T:6]N?7M.5V5V83<M179A
M4RTQ?7M<;G=I>&1[3E=E=F$W+45V85,M,7U<;G=I>'5[3E=E=F$W+65V838M
M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@8V(@;'0@97$@<')O=&]]
M>TY7979A-RU%=F%*+3%]>UQN=VEX9'M.5V5V83<M179A2BTQ?5QN=VEX=7M.
M5V5V83<M179A4RTQ?5QN=VEX=7M.5V5V83<M979A-BXR+3%]?7TE"EQN=VEX
M;&]G<V]R=&5D>V-]>WM%=F%L(&-B(&QT(&EM<&QE;65N=&%T:6]N?7M.5V5V
M83<M179A4"XR+3%]>UQN=VEX9'M.5V5V83<M179A4"XR+3%]7&YW:7AU>TY7
M979A-RUE=F$V+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L(&-B(&QT
M('!R;W1O?7M.5V5V83<M179A1RTQ?7M<;G=I>&1[3E=E=F$W+45V84<M,7U<
M;G=I>'5[3E=E=F$W+45V85`N,BTQ?5QN=VEX=7M.5V5V83<M979A-BXR+3%]
M?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L(&-B(&UO9'5L=7,@:6UP;&5M
M96YT871I;VY]>TY7979A-RU%=F%5+C(M,7U[7&YW:7AD>TY7979A-RU%=F%5
M+C(M,7U<;G=I>'5[3E=E=F$W+65V838M,7U]?24*7&YW:7AL;V=S;W)T961[
M8WU[>T5V86P@8V(@;6]D=6QU<R!P<F]T;WU[3E=E=F$W+45V84PN,RTQ?7M<
M;G=I>&1[3E=E=F$W+45V84PN,RTQ?5QN=VEX=7M.5V5V83<M179A52XR+3%]
M7&YW:7AU>TY7979A-RUE=F$V+C(M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[
M>T5V86P@8V(@;75L=&EP;'D@:6UP;&5M96YT871I;VY]>TY7979A-RU%=F%6
M+C(M,7U[7&YW:7AD>TY7979A-RU%=F%6+C(M,7U<;G=I>'5[3E=E=F$W+65V
M838M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@8V(@;75L=&EP;'D@
M<')O=&]]>TY7979A-RU%=F%-+C(M,7U[7&YW:7AD>TY7979A-RU%=F%-+C(M
M,7U<;G=I>'5[3E=E=F$W+45V858N,BTQ?5QN=VEX=7M.5V5V83<M979A-BXR
M+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L(&-B(&YO="!I;7!L96UE
M;G1A=&EO;GU[3E=E=F$W+45V85$N-"TQ?7M<;G=I>&1[3E=E=F$W+45V85$N
M-"TQ?5QN=VEX=7M.5V5V83<M979A-BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC
M?7M[179A;"!C8B!N;W0@<')O=&]]>TY7979A-RU%=F%(+C4M,7U[7&YW:7AD
M>TY7979A-RU%=F%(+C4M,7U<;G=I>'5[3E=E=F$W+45V85$N-"TQ?5QN=VEX
M=7M.5V5V83<M979A-BXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L
M(&-B(&]N96UI;G5S(&EM<&QE;65N=&%T:6]N?7M.5V5V83<M179A5BXS+3%]
M>UQN=VEX9'M.5V5V83<M179A5BXS+3%]7&YW:7AU>TY7979A-RUE=F$V+3%]
M?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L(&-B(&]N96UI;G5S('!R;W1O
M?7M.5V5V83<M179A32XS+3%]>UQN=VEX9'M.5V5V83<M179A32XS+3%]7&YW
M:7AU>TY7979A-RU%=F%6+C,M,7U<;G=I>'5[3E=E=F$W+65V838N,BTQ?7U]
M)0I<;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C8B!O;F5P;'5S(&EM<&QE;65N
M=&%T:6]N?7M.5V5V83<M179A52TQ?7M<;G=I>&1[3E=E=F$W+45V854M,7U<
M;G=I>'5[3E=E=F$W+65V838M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V
M86P@8V(@;VYE<&QU<R!P<F]T;WU[3E=E=F$W+45V84PN,BTQ?7M<;G=I>&1[
M3E=E=F$W+45V84PN,BTQ?5QN=VEX=7M.5V5V83<M179A52TQ?5QN=VEX=7M.
M5V5V83<M979A-BXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L(&-B
M(&]R(&EM<&QE;65N=&%T:6]N?7M.5V5V83<M179A4"XT+3%]>UQN=VEX9'M.
M5V5V83<M179A4"XT+3%]7&YW:7AU>TY7979A-RUE=F$V+3%]?7TE"EQN=VEX
M;&]G<V]R=&5D>V-]>WM%=F%L(&-B(&]R('!R;W1O?7M.5V5V83<M179A1RXS
M+3%]>UQN=VEX9'M.5V5V83<M179A1RXS+3%]7&YW:7AU>TY7979A-RU%=F%0
M+C0M,7U<;G=I>'5[3E=E=F$W+65V838N,BTQ?7U])0I<;G=I>&QO9W-O<G1E
M9'MC?7M[179A;"!C8B!P<FEN8R!I;7!L96UE;G1A=&EO;GU[3E=E=F$W+45V
M85,N-"TQ?7M<;G=I>&1[3E=E=F$W+45V85,N-"TQ?5QN=VEX=7M.5V5V83<M
M979A-BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C8B!P<FEN8R!P
M<F]T;WU[3E=E=F$W+45V84HN-"TQ?7M<;G=I>&1[3E=E=F$W+45V84HN-"TQ
M?5QN=VEX=7M.5V5V83<M179A4RXT+3%]7&YW:7AU>TY7979A-RUE=F$V+C(M
M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@8V(@<')O9R!I;7!L96UE
M;G1A=&EO;GU[3E=E=F$W+45V85(N.2TQ?7M<;G=I>&1[3E=E=F$W+45V85(N
M.2TQ?5QN=VEX=7M.5V5V83<M979A-BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC
M?7M[179A;"!C8B!P<F]G,2!I;7!L96UE;G1A=&EO;GU[3E=E=F$W+45V85,N
M-2TQ?7M<;G=I>&1[3E=E=F$W+45V85,N-2TQ?5QN=VEX=7M.5V5V83<M979A
M-BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C8B!P<F]G,B!I;7!L
M96UE;G1A=&EO;GU[3E=E=F$W+45V85,N-BTQ?7M<;G=I>&1[3E=E=F$W+45V
M85,N-BTQ?5QN=VEX=7M.5V5V83<M979A-BTQ?7U])0I<;G=I>&QO9W-O<G1E
M9'MC?7M[179A;"!C8B!P<F]G('!R;W1O?7M.5V5V83<M179A22Y!+3%]>UQN
M=VEX9'M.5V5V83<M179A22Y!+3%]7&YW:7AU>TY7979A-RU%=F%2+CDM,7U<
M;G=I>'5[3E=E=F$W+65V838N,BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[
M179A;"!C8B!P<F]G,2!P<F]T;WU[3E=E=F$W+45V84HN-2TQ?7M<;G=I>&1[
M3E=E=F$W+45V84HN-2TQ?5QN=VEX=7M.5V5V83<M179A4RXU+3%]7&YW:7AU
M>TY7979A-RUE=F$V+C(M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@
M8V(@<')O9S(@<')O=&]]>TY7979A-RU%=F%*+C8M,7U[7&YW:7AD>TY7979A
M-RU%=F%*+C8M,7U<;G=I>'5[3E=E=F$W+45V85,N-BTQ?5QN=VEX=7M.5V5V
M83<M979A-BXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L(&-B('!R
M;V=N(&EM<&QE;65N=&%T:6]N?7M.5V5V83<M179A4RXW+3%]>UQN=VEX9'M.
M5V5V83<M179A4RXW+3%]7&YW:7AU>TY7979A-RUE=F$V+3%]?7TE"EQN=VEX
M;&]G<V]R=&5D>V-]>WM%=F%L(&-B('!R;V=N('!R;W1O?7M.5V5V83<M179A
M2BXW+3%]>UQN=VEX9'M.5V5V83<M179A2BXW+3%]7&YW:7AU>TY7979A-RU%
M=F%3+C<M,7U<;G=I>'5[3E=E=F$W+65V838N,BTQ?7U])0I<;G=I>&QO9W-O
M<G1E9'MC?7M[179A;"!C8B!S96QE8W0@:6UP;&5M96YT871I;VY]>TY7979A
M-RU%=F%4+C0M,7U[7&YW:7AD>TY7979A-RU%=F%4+C0M,7U<;G=I>'5[3E=E
M=F$W+65V838M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@8V(@<V5L
M96-T('!R;W1O?7M.5V5V83<M179A2RXT+3%]>UQN=VEX9'M.5V5V83<M179A
M2RXT+3%]7&YW:7AU>TY7979A-RU%=F%4+C0M,7U<;G=I>'5[3E=E=F$W+65V
M838N,BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C8B!S970@:&5L
M<&5R(&5N=6U]>TY7979A-RU%=F%.+3%]>UQN=VEX9'M.5V5V83<M179A3BTQ
M?5QN=VEX=7M.5V5V83<M979A-BXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]
M>WM%=F%L(&-B('-E="!H96QP97(@:6UP;&5M96YT871I;VY]>TY7979A-RU%
M=F%8+3%]>UQN=VEX9'M.5V5V83<M179A6"TQ?5QN=VEX=7M.5V5V83<M979A
M-BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C8B!S970@:&5L<&5R
M('!R;W1O?7M.5V5V83<M179A3RTQ?7M<;G=I>&1[3E=E=F$W+45V84\M,7U<
M;G=I>'5[3E=E=F$W+45V85@M,7U<;G=I>'5[3E=E=F$W+65V838N,BTQ?7U]
M)0I<;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C8B!S970@:6UP;&5M96YT871I
M;VY]>TY7979A-RU%=F%1+3%]>UQN=VEX9'M.5V5V83<M179A42TQ?5QN=VEX
M=7M.5V5V83<M979A-BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C
M8B!S970@<')O=&]]>TY7979A-RU%=F%(+C(M,7U[7&YW:7AD>TY7979A-RU%
M=F%(+C(M,7U<;G=I>'5[3E=E=F$W+45V85$M,7U<;G=I>'5[3E=E=F$W+65V
M838N,BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C8B!S971Q(&EM
M<&QE;65N=&%T:6]N?7M.5V5V83<M179A4BTQ?7M<;G=I>&1[3E=E=F$W+45V
M85(M,7U<;G=I>'5[3E=E=F$W+65V838M,7U]?24*7&YW:7AL;V=S;W)T961[
M8WU[>T5V86P@8V(@<V5T<2!P<F]T;WU[3E=E=F$W+45V84DN,BTQ?7M<;G=I
M>&1[3E=E=F$W+45V84DN,BTQ?5QN=VEX=7M.5V5V83<M179A4BTQ?5QN=VEX
M=7M.5V5V83<M979A-BXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L
M(&-B('-U8G1R86-T(&EM<&QE;65N=&%T:6]N?7M.5V5V83<M179A5BTQ?7M<
M;G=I>&1[3E=E=F$W+45V858M,7U<;G=I>'5[3E=E=F$W+65V838M,7U]?24*
M7&YW:7AL;V=S;W)T961[8WU[>T5V86P@8V(@<W5B=')A8W0@<')O=&]]>TY7
M979A-RU%=F%-+3%]>UQN=VEX9'M.5V5V83<M179A32TQ?5QN=VEX=7M.5V5V
M83<M179A5BTQ?5QN=VEX=7M.5V5V83<M979A-BXR+3%]?7TE"EQN=VEX;&]G
M<V]R=&5D>V-]>WM%=F%L(&-B('1E<G!R:2!I;7!L96UE;G1A=&EO;GU[3E=E
M=F$W+45V850N-2TQ?7M<;G=I>&1[3E=E=F$W+45V850N-2TQ?5QN=VEX=7M.
M5V5V83<M979A-BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C8B!T
M97)P<FD@<')O=&]]>TY7979A-RU%=F%++C4M,7U[7&YW:7AD>TY7979A-RU%
M=F%++C4M,7U<;G=I>'5[3E=E=F$W+45V850N-2TQ?5QN=VEX=7M.5V5V83<M
M979A-BXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L(&-B('5N;&5S
M<R!I;7!L96UE;G1A=&EO;GU[3E=E=F$W+45V850N,RTQ?7M<;G=I>&1[3E=E
M=F$W+45V850N,RTQ?5QN=VEX=7M.5V5V83<M979A-BTQ?7U])0I<;G=I>&QO
M9W-O<G1E9'MC?7M[179A;"!C8B!U;FQE<W,@<')O=&]]>TY7979A-RU%=F%+
M+C,M,7U[7&YW:7AD>TY7979A-RU%=F%++C,M,7U<;G=I>'5[3E=E=F$W+45V
M850N,RTQ?5QN=VEX=7M.5V5V83<M979A-BXR+3%]?7TE"EQN=VEX;&]G<V]R
M=&5D>V-]>WM%=F%L(&-B('=H96X@:6UP;&5M96YT871I;VY]>TY7979A-RU%
M=F%2+C8M,7U[7&YW:7AD>TY7979A-RU%=F%2+C8M,7U<;G=I>'5[3E=E=F$W
M+65V838M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@8V(@=VAE;B!P
M<F]T;WU[3E=E=F$W+45V84DN-RTQ?7M<;G=I>&1[3E=E=F$W+45V84DN-RTQ
M?5QN=VEX=7M.5V5V83<M179A4BXV+3%]7&YW:7AU>TY7979A-RUE=F$V+C(M
M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@8V(@=VAE;B!U;FQE<W,@
M:&5L<&5R(&5N=6U]>TY7979A-RU%=F%6+C0M,7U[7&YW:7AD>TY7979A-RU%
M=F%6+C0M,7U<;G=I>'5[3E=E=F$W+65V838N,BTQ?7U])0I<;G=I>&QO9W-O
M<G1E9'MC?7M[179A;"!C8B!W:&5N('5N;&5S<R!I;7!L96UE;G1A=&EO;GU[
M3E=E=F$W+45V85DN,BTQ?7M<;G=I>&1[3E=E=F$W+45V85DN,BTQ?5QN=VEX
M=7M.5V5V83<M979A-BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[179A;"!C
M8B!W:&5N('5N;&5S<R!P<F]T;WU[3E=E=F$W+45V85`N-BTQ?7M<;G=I>&1[
M3E=E=F$W+45V85`N-BTQ?5QN=VEX=7M.5V5V83<M179A62XR+3%]7&YW:7AU
M>TY7979A-RUE=F$V+C(M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@
M979A;'5A=&5"<F%N8V@@:6UP;&5M96YT871I;VY]>TY7979A-RU%=F%9+C4M
M,7U[7&YW:7AD>TY7979A-RU%=F%9+C4M,7U<;G=I>'5[3E=E=F$W+65V838M
M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@979A;'5A=&5"<F%N8V@@
M<')O=&]]>TY7979A-RU%=F%0+CDM,7U[7&YW:7AD>TY7979A-RU%=F%0+CDM
M,7U<;G=I>'5[3E=E=F$W+45V85DN-2TQ?5QN=VEX=7M.5V5V83<M979A-BXR
M+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L(&5V86QU871E1&5F=6X@
M:6UP;&5M96YT871I;VY]>TY7979A-RU%=F%8+C(M,7U[7&YW:7AD>TY7979A
M-RU%=F%8+C(M,7U<;G=I>'5[3E=E=F$W+65V838M,7U]?24*7&YW:7AL;V=S
M;W)T961[8WU[>T5V86P@979A;'5A=&5$969U;B!P<F]T;WU[3E=E=F$W+45V
M84\N,RTQ?7M<;G=I>&1[3E=E=F$W+45V84\N,RTQ?5QN=VEX=7M.5V5V83<M
M179A6"XR+3%]7&YW:7AU>TY7979A-RUE=F$V+C(M,7U]?24*7&YW:7AL;V=S
M;W)T961[8WU[>T5V86P@979A;'5A=&5.;V1E(&EM<&QE;65N=&%T:6]N?7M.
M5V5V83<M179A5RTQ?7M<;G=I>&1[3E=E=F$W+45V85<M,7U<;G=I>'5[3E=E
M=F$W+65V838M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@979A;'5A
M=&5.;V1E('!R;W1O?7M.5V5V83<M179A3BXR+3%]>UQN=VEX9'M.5V5V83<M
M179A3BXR+3%]7&YW:7AU>TY7979A-RU%=F%7+3%]7&YW:7AU>TY7979A-RUE
M=F$V+C(M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V86P@;&]O:W5P('-T
M<G5C='U[3E=E=F$W+45V84DM,7U[7&YW:7AD>TY7979A-RU%=F%)+3%]7&YW
M:7AU>TY7979A-RUE=F$V+C(M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>T5V
M86P@;&]O:W5P('1A8FQE?7M.5V5V83<M179A2"TQ?7M<;G=I>&1[3E=E=F$W
M+45V84@M,7U<;G=I>'5[3E=E=F$W+65V838M,7U]?24*7&YW:7AL;V=S;W)T
M961[8WU[>T5V86P@=71I;&ET>2!C;W5N=&5R(&EM<&QE;65N=&%T:6]N?7M.
M5V5V83<M179A6BXR+3%]>UQN=VEX9'M.5V5V83<M179A6BXR+3%]7&YW:7AU
M>TY7979A-RUE=F$V+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM%=F%L('5T
M:6QI='D@8V]U;G1E<B!P<F]T;WU[3E=E=F$W+45V85$N."TQ?7M<;G=I>&1[
M3E=E=F$W+45V85$N."TQ?5QN=VEX=7M.5V5V83<M179A6BXR+3%]7&YW:7AU
M>TY7979A-RUE=F$V+C(M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>TQI<W0@
M4W1R=6-T=7)E?7M.5VQI<S@M3&ES12TQ?7M<;G=I>&1[3E=L:7,X+4QI<T4M
M,7U<;G=I>'5[3E=L:7,X+6QI<S<N,BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC
M?7M[3&ES="!A9&0@8G)A;F-H(&EM<&QE;65N=&%T:6]N?7M.5VQI<S@M3&ES
M52TQ?7M<;G=I>&1[3E=L:7,X+4QI<U4M,7U<;G=I>'5[3E=L:7,X+6QI<S<M
M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>TQI<W0@861D(&)R86YC:"!P<F]T
M;WU[3E=L:7,X+4QI<TPM,7U[7&YW:7AD>TY7;&ES."U,:7-,+3%]7&YW:7AU
M>TY7;&ES."U,:7-5+3%]7&YW:7AU>TY7;&ES."UL:7,W+C(M,7U]?24*7&YW
M:7AL;V=S;W)T961[8WU[>TQI<W0@861D(&1A=&$@:6UP;&5M96YT871I;VY]
M>TY7;&ES."U,:7-3+C,M,7U[7&YW:7AD>TY7;&ES."U,:7-3+C,M,7U<;G=I
M>'5[3E=L:7,X+6QI<S<M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>TQI<W0@
M861D(&1A=&$@<')O=&]]>TY7;&ES."U,:7-*+C,M,7U[7&YW:7AD>TY7;&ES
M."U,:7-*+C,M,7U<;G=I>'5[3E=L:7,X+4QI<U,N,RTQ?5QN=VEX=7M.5VQI
M<S@M;&ES-RXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM,:7-T(&%D9"!H
M96%D(&EM<&QE;65N=&%T:6]N?7M.5VQI<S@M3&ES4RTQ?7M<;G=I>&1[3E=L
M:7,X+4QI<U,M,7U<;G=I>'5[3E=L:7,X+6QI<S<M,7U]?24*7&YW:7AL;V=S
M;W)T961[8WU[>TQI<W0@861D(&AE860@<')O=&]]>TY7;&ES."U,:7-*+3%]
M>UQN=VEX9'M.5VQI<S@M3&ES2BTQ?5QN=VEX=7M.5VQI<S@M3&ES4RTQ?5QN
M=VEX=7M.5VQI<S@M;&ES-RXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM,
M:7-T(&%D9"!T86EL(&EM<&QE;65N=&%T:6]N?7M.5VQI<S@M3&ES4RXR+3%]
M>UQN=VEX9'M.5VQI<S@M3&ES4RXR+3%]7&YW:7AU>TY7;&ES."UL:7,W+3%]
M?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM,:7-T(&%D9"!T86EL('!R;W1O?7M.
M5VQI<S@M3&ES2BXR+3%]>UQN=VEX9'M.5VQI<S@M3&ES2BXR+3%]7&YW:7AU
M>TY7;&ES."U,:7-3+C(M,7U<;G=I>'5[3E=L:7,X+6QI<S<N,BTQ?7U])0I<
M;G=I>&QO9W-O<G1E9'MC?7M[3&ES="!D96QE=&4@:6UP;&5M96YT871I;VY]
M>TY7;&ES."U,:7-1+3%]>UQN=VEX9'M.5VQI<S@M3&ES42TQ?5QN=VEX=7M.
M5VQI<S@M;&ES-RTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[3&ES="!D96QE
M=&4@<')O=&]]>TY7;&ES."U,:7-(+3%]>UQN=VEX9'M.5VQI<S@M3&ES2"TQ
M?5QN=VEX=7M.5VQI<S@M3&ES42TQ?5QN=VEX=7M.5VQI<S@M;&ES-RXR+3%]
M?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM,:7-T(&1U;7`@979A;"!I;7!L96UE
M;G1A=&EO;GU[3E=L:7,X+4QI<U0N,BTQ?7M<;G=I>&1[3E=L:7,X+4QI<U0N
M,BTQ?5QN=VEX=7M.5VQI<S@M;&ES-RTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC
M?7M[3&ES="!D=6UP(&5V86P@<')O=&]]>TY7;&ES."U,:7-++C(M,7U[7&YW
M:7AD>TY7;&ES."U,:7-++C(M,7U<;G=I>'5[3E=L:7,X+4QI<U0N,BTQ?5QN
M=VEX=7M.5VQI<S@M;&ES-RXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM,
M:7-T(&1U;7`@979A;"!T<F5E(&EM<&QE;65N=&%T:6]N?7M.5VQI<S@M3&ES
M62TQ?7M<;G=I>&1[3E=L:7,X+4QI<UDM,7U<;G=I>'5[3E=L:7,X+6QI<S<M
M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>TQI<W0@9'5M<"!E=F%L('1R964@
M<')O=&]]>TY7;&ES."U,:7-0+3%]>UQN=VEX9'M.5VQI<S@M3&ES4"TQ?5QN
M=VEX=7M.5VQI<S@M3&ES62TQ?5QN=VEX=7M.5VQI<S@M;&ES-RXR+3%]?7TE
M"EQN=VEX;&]G<V]R=&5D>V-]>WM,:7-T(&1U;7`@:6UP;&5M96YT871I;VY]
M>TY7;&ES."U,:7-/+C(M,7U[7&YW:7AD>TY7;&ES."U,:7-/+C(M,7U<;G=I
M>'5[3E=L:7,X+6QI<S<M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>TQI<W0@
M9'5M<"!P<F]T;WU[3E=L:7,X+4QI<T8N,BTQ?7M<;G=I>&1[3E=L:7,X+4QI
M<T8N,BTQ?5QN=VEX=7M.5VQI<S@M3&ES3RXR+3%]7&YW:7AU>TY7;&ES."UL
M:7,W+C(M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>TQI<W0@9'5M<"!R969O
M<FUA="!I;7!L96UE;G1A=&EO;GU[3E=L:7,X+4QI<U@M,7U[7&YW:7AD>TY7
M;&ES."U,:7-8+3%]7&YW:7AU>TY7;&ES."UL:7,W+3%]?7TE"EQN=VEX;&]G
M<V]R=&5D>V-]>WM,:7-T(&1U;7`@<F5F;W)M870@<')O=&]]>TY7;&ES."U,
M:7-/+C,M,7U[7&YW:7AD>TY7;&ES."U,:7-/+C,M,7U<;G=I>'5[3E=L:7,X
M+4QI<U@M,7U<;G=I>'5[3E=L:7,X+6QI<S<N,BTQ?7U])0I<;G=I>&QO9W-O
M<G1E9'MC?7M[3&ES="!D=7`@:6UP;&5M96YT871I;VY]>TY7;&ES."U,:7-.
M+C(M,7U[7&YW:7AD>TY7;&ES."U,:7-.+C(M,7U<;G=I>'5[3E=L:7,X+6QI
M<S<M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>TQI<W0@9'5P('!R;W1O?7M.
M5VQI<S@M3&ES12XS+3%]>UQN=VEX9'M.5VQI<S@M3&ES12XS+3%]7&YW:7AU
M>TY7;&ES."U,:7-.+C(M,7U<;G=I>'5[3E=L:7,X+6QI<S<N,BTQ?7U])0I<
M;G=I>&QO9W-O<G1E9'MC?7M[3&ES="!N97<@:6UP;&5M96YT871I;VY]>TY7
M;&ES."U,:7-.+3%]>UQN=VEX9'M.5VQI<S@M3&ES3BTQ?5QN=VEX=7M.5VQI
M<S@M;&ES-RTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[3&ES="!N97<@<')O
M=&]]>TY7;&ES."U,:7-%+C(M,7U[7&YW:7AD>TY7;&ES."U,:7-%+C(M,7U<
M;G=I>'5[3E=L:7,X+4QI<TXM,7U<;G=I>'5[3E=L:7,X+6QI<S<N,BTQ?7U]
M)0I<;G=I>&QO9W-O<G1E9'MC?7M[3&ES="!T86<@8VQE87(@:6UP;&5M96YT
M871I;VY]>TY7;&ES."U,:7-4+3%]>UQN=VEX9'M.5VQI<S@M3&ES5"TQ?5QN
M=VEX=7M.5VQI<S@M;&ES-RTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[3&ES
M="!T86<@8VQE87(@<')O=&]]>TY7;&ES."U,:7-++3%]>UQN=VEX9'M.5VQI
M<S@M3&ES2RTQ?5QN=VEX=7M.5VQI<S@M3&ES5"TQ?5QN=VEX=7M.5VQI<S@M
M;&ES-RXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM,:7-T('1A9R!D871A
M(&EM<&QE;65N=&%T:6]N?7M.5VQI<S@M3&ES4RXT+3%]>UQN=VEX9'M.5VQI
M<S@M3&ES4RXT+3%]7&YW:7AU>TY7;&ES."UL:7,W+3%]?7TE"EQN=VEX;&]G
M<V]R=&5D>V-]>WM,:7-T('1A9R!D871A('!R;W1O?7M.5VQI<S@M3&ES2BXT
M+3%]>UQN=VEX9'M.5VQI<S@M3&ES2BXT+3%]7&YW:7AU>TY7;&ES."U,:7-3
M+C0M,7U<;G=I>'5[3E=L:7,X+6QI<S<N,BTQ?7U])0I<;G=I>&QO9W-O<G1E
M9'MC?7M[3&ES="!T86<@<F5P;&%C92!I;7!L96UE;G1A=&EO;GU[3E=L:7,X
M+4QI<U8M,7U[7&YW:7AD>TY7;&ES."U,:7-6+3%]7&YW:7AU>TY7;&ES."UL
M:7,W+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM,:7-T('1A9R!R97!L86-E
M('!R;W1O?7M.5VQI<S@M3&ES32TQ?7M<;G=I>&1[3E=L:7,X+4QI<TTM,7U<
M;G=I>'5[3E=L:7,X+4QI<U8M,7U<;G=I>'5[3E=L:7,X+6QI<S<N,BTQ?7U]
M)0I<;G=I>&QO9W-O<G1E9'MC?7M[3&ES="!W:7!E(&EM<&QE;65N=&%T:6]N
M?7M.5VQI<S@M3&ES3RTQ?7M<;G=I>&1[3E=L:7,X+4QI<T\M,7U<;G=I>'5[
M3E=L:7,X+6QI<S<M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>TQI<W0@=VEP
M92!P<F]T;WU[3E=L:7,X+4QI<T8M,7U[7&YW:7AD>TY7;&ES."U,:7-&+3%]
M7&YW:7AU>TY7;&ES."U,:7-/+3%]7&YW:7AU>TY7;&ES."UL:7,W+C(M,7U]
M?24*7&YW:7AL;V=S;W)T961[8WU[>U!A<G-E(&=E="!C:&%R86-T97(@8V%L
M;&)A8VL@='EP961E9GU[3E=P87(Y+5!A<F$M,7U[7&YW:7AD>TY7<&%R.2U0
M87)A+3%]7&YW:7AU>TY7<&%R.2UP87(X+C(M,7U]?24*7&YW:7AL;V=S;W)T
M961[8WU[>U!A<G-E(&EN(&9I;&4@:6UP;&5M96YT871I;VY]>TY7<&%R.2U0
M87)3+3%]>UQN=VEX9'M.5W!A<CDM4&%R4RTQ?5QN=VEX=7M.5W!A<CDM<&%R
M."TQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[4&%R<V4@:6X@9FEL92!P<F]T
M;WU[3E=P87(Y+5!A<DHM,7U[7&YW:7AD>TY7<&%R.2U087)*+3%]7&YW:7AU
M>TY7<&%R.2U087)3+3%]7&YW:7AU>TY7<&%R.2UP87(X+C(M,7U]?24*7&YW
M:7AL;V=S;W)T961[8WU[>U!A<G-E('-N86<@82!T;VME;B!I;7!L96UE;G1A
M=&EO;GU[3E=P87(Y+5!A<E@M,7U[7&YW:7AD>TY7<&%R.2U087)8+3%]7&YW
M:7AU>TY7<&%R.2UP87(X+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM087)S
M92!S;F%G(&$@=&]K96X@<')O=&]]>TY7<&%R.2U087)/+3%]>UQN=VEX9'M.
M5W!A<CDM4&%R3RTQ?5QN=VEX=7M.5W!A<CDM4&%R6"TQ?5QN=VEX=7M.5W!A
M<CDM<&%R."XR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM087)S92!T;VME
M;B!E;G5M?7M.5W!A<CDM4&%R1RTQ?7M<;G=I>&1[3E=P87(Y+5!A<D<M,7U<
M;G=I>'5[3E=P87(Y+7!A<C@N,BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[
M4&%R<V4@=6YG970@8VAA<F%C=&5R(&-A;&QB86-K('1Y<&5D969]>TY7<&%R
M.2U087)C+3%]>UQN=VEX9'M.5W!A<CDM4&%R8RTQ?5QN=VEX=7M.5W!A<CDM
M<&%R."XR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM687)I86)L92!D=6UP
M($EM<&QE;65N=&%T:6]N?7M.5W9A<C<M5F%R4RXS+3%]>UQN=VEX9'M.5W9A
M<C<M5F%R4RXS+3%]7&YW:7AU>TY7=F%R-RUV87(V+3%]?7TE"EQN=VEX;&]G
M<V]R=&5D>V-]>WM687)I86)L92!D=6UP('!R;W1O?7M.5W9A<C<M5F%R2BXS
M+3%]>UQN=VEX9'M.5W9A<C<M5F%R2BXS+3%]7&YW:7AU>TY7=F%R-RU687)3
M+C,M,7U<;G=I>'5[3E=V87(W+79A<C8N,BTQ?7U])0I<;G=I>&QO9W-O<G1E
M9'MC?7M[5F%R:6%B;&4@9FEN9"!I;7!L96UE;G1A=&EO;GU[3E=V87(W+59A
M<E,N,BTQ?7M<;G=I>&1[3E=V87(W+59A<E,N,BTQ?5QN=VEX=7M.5W9A<C<M
M=F%R-BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[5F%R:6%B;&4@9FEN9"!P
M<F]T;WU[3E=V87(W+59A<DHM,7U[7&YW:7AD>TY7=F%R-RU687)*+3%]7&YW
M:7AU>TY7=F%R-RU687)3+C(M,7U<;G=I>'5[3E=V87(W+79A<C8N,BTQ?7U]
M)0I<;G=I>&QO9W-O<G1E9'MC?7M[5F%R:6%B;&4@9G)E92!M86-R;WU[3E=V
M87(W+59A<DHN,BTQ?7M<;G=I>&1[3E=V87(W+59A<DHN,BTQ?5QN=VEX=7M.
M5W9A<C<M=F%R-BXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM687)I86)L
M92!G970@26UP;&5M96YT871I;VY]>TY7=F%R-RU687)2+C(M,7U[7&YW:7AD
M>TY7=F%R-RU687)2+C(M,7U<;G=I>'5[3E=V87(W+79A<C8M,7U]?24*7&YW
M:7AL;V=S;W)T961[8WU[>U9A<FEA8FQE(&=E="!P<F]T;WU[3E=V87(W+59A
M<DDN,BTQ?7M<;G=I>&1[3E=V87(W+59A<DDN,BTQ?5QN=VEX=7M.5W9A<C<M
M5F%R4BXR+3%]7&YW:7AU>TY7=F%R-RUV87(V+C(M,7U]?24*7&YW:7AL;V=S
M;W)T961[8WU[>U9A<FEA8FQE(&=E="!S=')I;F<@26UP;&5M96YT871I;VY]
M>TY7=F%R-RU687)9+C(M,7U[7&YW:7AD>TY7=F%R-RU687)9+C(M,7U<;G=I
M>'5[3E=V87(W+79A<C8M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>U9A<FEA
M8FQE(&=E="!S=')I;F<@<')O=&]]>TY7=F%R-RU687)0+C(M,7U[7&YW:7AD
M>TY7=F%R-RU687)0+C(M,7U<;G=I>'5[3E=V87(W+59A<EDN,BTQ?5QN=VEX
M=7M.5W9A<C<M=F%R-BXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM687)I
M86)L92!L:7-T(&1E9FEN:71I;VY]>TY7=F%R-RU687)/+3%]>UQN=VEX9'M.
M5W9A<C<M5F%R3RTQ?5QN=VEX=7M.5W9A<C<M=F%R-BXR+3%]?7TE"EQN=VEX
M;&]G<V]R=&5D>V-]>WM687)I86)L92!L:7-T(&EN:71I86QI>F%T:6]N?7M.
M5W9A<C<M5F%R4RTQ?7M<;G=I>&1[3E=V87(W+59A<E,M,7U<;G=I>'5[3E=V
M87(W+79A<C8M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>U9A<FEA8FQE('-E
M="!);7!L96UE;G1A=&EO;GU[3E=V87(W+59A<E(M,7U[7&YW:7AD>TY7=F%R
M-RU687)2+3%]7&YW:7AU>TY7=F%R-RUV87(V+3%]?7TE"EQN=VEX;&]G<V]R
M=&5D>V-]>WM687)I86)L92!S970@<')O=&]]>TY7=F%R-RU687))+3%]>UQN
M=VEX9'M.5W9A<C<M5F%R22TQ?5QN=VEX=7M.5W9A<C<M5F%R4BTQ?5QN=VEX
M=7M.5W9A<C<M=F%R-BXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WM687)I
M86)L92!S970@<W1R:6YG($EM<&QE;65N=&%T:6]N?7M.5W9A<C<M5F%R62TQ
M?7M<;G=I>&1[3E=V87(W+59A<EDM,7U<;G=I>'5[3E=V87(W+79A<C8M,7U]
M?24*7&YW:7AL;V=S;W)T961[8WU[>U9A<FEA8FQE('-E="!S=')I;F<@<')O
M=&]]>TY7=F%R-RU687)0+3%]>UQN=VEX9'M.5W9A<C<M5F%R4"TQ?5QN=VEX
M=7M.5W9A<C<M5F%R62TQ?5QN=VEX=7M.5W9A<C<M=F%R-BXR+3%]?7TE"EQN
M=VEX;&]G<V]R=&5D>V-]>WME=F%L(&-B(&YO=&AI;F<@:6UP;&5M96YT871I
M;VY]>TY7979A-RUE=F%5+3%]>UQN=VEX9'M.5V5V83<M979A52TQ?5QN=VEX
M=7M.5V5V83<M979A-BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[979A;"!C
M8B!N;W1H:6YG('!R;W1O?7M.5V5V83<M979A3"TQ?7M<;G=I>&1[3E=E=F$W
M+65V84PM,7U<;G=I>'5[3E=E=F$W+65V854M,7U<;G=I>'5[3E=E=F$W+65V
M838N,BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[979A;"YC?7M.5V5V83<M
M979A-BTQ?7M<;G=I>&1[3E=E=F$W+65V838M,7U]?24*7&YW:7AL;V=S;W)T
M961[8WU[>V5V86PN:'U[3E=E=F$W+65V838N,BTQ?7M<;G=I>&1[3E=E=F$W
M+65V838N,BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[;&ES=',N8WU[3E=L
M:7,X+6QI<S<M,7U[7&YW:7AD>TY7;&ES."UL:7,W+3%]?7TE"EQN=VEX;&]G
M<V]R=&5D>V-]>WML:7-T<RYH?7M.5VQI<S@M;&ES-RXR+3%]>UQN=VEX9'M.
M5VQI<S@M;&ES-RXR+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WMM86EN(&-H
M96-K(&-O;6UA;F1L:6YE?7M.5VUA:3<M;6%I32TQ?7M<;G=I>&1[3E=M86DW
M+6UA:4TM,7U<;G=I>'5[3E=M86DW+6UA:38M,WU]?24*7&YW:7AL;V=S;W)T
M961[8WU[>VUA:6X@9G5N8W1I;VX@8F]D>7U[3E=M86DW+6UA:4DM,7U[7&YW
M:7AD>TY7;6%I-RUM86E)+3%]7&YW:7AU>TY7;6%I-RUM86DV+3-]?7TE"EQN
M=VEX;&]G<V]R=&5D>V-]>WMM86EN(&9U;F-T:6]N('9A<FEA8FQE<WU[3E=M
M86DW+6UA:4XM,7U[7&YW:7AD>TY7;6%I-RUM86E.+3%]7&YW:7AU>TY7;6%I
M-RUM86DV+3-]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WMM86EN('!A<G-E<B!G
M971C(&-A;&QB86-K(&EM<&QE;65N=&%T:6]N?7M.5VUA:3<M;6%I92TQ?7M<
M;G=I>&1[3E=M86DW+6UA:64M,7U<;G=I>'5[3E=M86DW+6UA:38M,GU]?24*
M7&YW:7AL;V=S;W)T961[8WU[>VUA:6X@<&%R<V5R(&=E=&,@8V%L;&)A8VL@
M<')O=&]]>TY7;6%I-RUM86E6+3%]>UQN=VEX9'M.5VUA:3<M;6%I5BTQ?5QN
M=VEX=7M.5VUA:3<M;6%I92TQ?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[;6%I
M;B!P87)S97(@9VQO8F%L<WU[3E=M86DW+6UA:4HM,7U[7&YW:7AD>TY7;6%I
M-RUM86E*+3%]7&YW:7AU>TY7;6%I-RUM86DV+3)]?7TE"EQN=VEX;&]G<V]R
M=&5D>V-]>WMM86EN('!A<G-E<B!U;F=E=&,@8V%L;&)A8VL@:6UP;&5M96YT
M871I;VY]>TY7;6%I-RUM86EG+3%]>UQN=VEX9'M.5VUA:3<M;6%I9RTQ?5QN
M=VEX=7M.5VUA:3<M;6%I-BTR?7U])0I<;G=I>&QO9W-O<G1E9'MC?7M[;6%I
M;B!P87)S97(@=6YG971C(&-A;&QB86-K('!R;W1O?7M.5VUA:3<M;6%I6"TQ
M?7M<;G=I>&1[3E=M86DW+6UA:5@M,7U<;G=I>'5[3E=M86DW+6UA:6<M,7U]
M?24*7&YW:7AL;V=S;W)T961[8WU[>VUA:6XN8WU[3E=M86DW+6UA:38M,7U[
M7&YW:7AD>TY7;6%I-RUM86DV+3%]7&YW:7AD>TY7;6%I-RUM86DV+3)]7&YW
M:7AD>TY7;6%I-RUM86DV+3-]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WMP87)S
M97(N8WU[3E=P87(Y+7!A<C@M,7U[7&YW:7AD>TY7<&%R.2UP87(X+3%]?7TE
M"EQN=VEX;&]G<V]R=&5D>V-]>WMP87)S97(N:'U[3E=P87(Y+7!A<C@N,BTQ
M?7M<;G=I>&1[3E=P87(Y+7!A<C@N,BTQ?7U])0I<;G=I>&QO9W-O<G1E9'MC
M?7M[<V%M<&QE,#$N;'-P?7M.5W-A;4$M<V%M0RTQ?7M<;G=I>&1[3E=S86U!
M+7-A;4,M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>W-A;7!L93`R+FQS<'U[
M3E=S86U!+7-A;4,N,RTQ?7M<;G=I>&1[3E=S86U!+7-A;4,N,RTQ?7U])0I<
M;G=I>&QO9W-O<G1E9'MC?7M[<V%M<&QE,#,N;'-P?7M.5W-A;4$M<V%M0RXT
M+3%]>UQN=VEX9'M.5W-A;4$M<V%M0RXT+3%]?7TE"EQN=VEX;&]G<V]R=&5D
M>V-]>WMS86UP;&4P-"YL<W!]>TY7<V%M02US86U#+C(M,7U[7&YW:7AD>TY7
M<V%M02US86U#+C(M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>W9A<G,N8WU[
M3E=V87(W+79A<C8M,7U[7&YW:7AD>TY7=F%R-RUV87(V+3%]?7TE"EQN=VEX
M;&]G<V]R=&5D>V-]>WMV87)S+FA]>TY7=F%R-RUV87(V+C(M,7U[7&YW:7AD
M>TY7=F%R-RUV87(V+C(M,7U]?24*7&YW:7AL;V=S;W)T961[8WU[>W9E<G-I
M;VX@8G5I;&0@9&%T97U[3E=V97)!+79E<DDM,7U[7&YW:7AD>TY7=F5R02UV
M97))+3%]7&YW:7AU>TY7=F5R02UV97(Y+3%]?7TE"EQN=VEX;&]G<V]R=&5D
M>V-]>WMV97)S:6]N(&)U:6QD('1P;W1C?7M.5W9E<D$M=F5R2BTQ?7M<;G=I
M>&1[3E=V97)!+79E<DHM,7U<;G=I>'5[3E=V97)!+79E<CDM,7U]?24*7&YW
M:7AL;V=S;W)T961[8WU[>W9E<G-I;VX@8G5I;&0@=F5R<VEO;GU[3E=V97)!
M+79E<DPM,7U[7&YW:7AD>TY7=F5R02UV97),+3%]7&YW:7AU>TY7=F5R02UV
M97(Y+3%]?7TE"EQN=VEX;&]G<V]R=&5D>V-]>WMV97)S:6]N+FA]>TY7=F5R
M02UV97(Y+3%]>UQN=VEX9'M.5W9E<D$M=F5R.2TQ?7U])0I<96YD>V1O8W5M
&96YT?0H*
`
end
SHAR_EOF
  (set 20 10 08 31 13 07 00 'c/doc/lithp.tex'; eval "$shar_touch") &&
  chmod 0644 'c/doc/lithp.tex'
if test $? -ne 0
then ${echo} 'restore of c/doc/lithp.tex failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/doc/lithp.tex: MD5 check failed'
       ) << SHAR_EOF
7811d2cd83c16cd18d127501e327df53  c/doc/lithp.tex
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/doc/lithp.tex'` -ne 181626 && \
  ${echo} 'restoration warning:  size of c/doc/lithp.tex is not 181626'
  fi
fi
# ============= c/samples/sample01.lsp ==============
if test ! -d 'c/samples'; then
  mkdir 'c/samples'
if test $? -eq 0
then ${echo} 'x - created directory `c/samples'\''.'
else ${echo} 'x - failed to create directory `c/samples'\''.'
  exit 1
fi
fi
if test -f 'c/samples/sample01.lsp' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/samples/sample01.lsp (file already exists)'
else
${echo} 'x - extracting c/samples/sample01.lsp (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c/samples/sample01.lsp' &&
#line 12 "samples.nw"
(setq world "world" hi "Hello" comma "," exclamation "!")
(list hi comma world exclamation)
X
SHAR_EOF
  (set 20 10 08 31 12 48 08 'c/samples/sample01.lsp'; eval "$shar_touch") &&
  chmod 0444 'c/samples/sample01.lsp'
if test $? -ne 0
then ${echo} 'restore of c/samples/sample01.lsp failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/samples/sample01.lsp: MD5 check failed'
       ) << SHAR_EOF
4d6ff1f6a64731fd3a344c1a6cf8e80d  c/samples/sample01.lsp
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/samples/sample01.lsp'` -ne 115 && \
  ${echo} 'restoration warning:  size of c/samples/sample01.lsp is not 115'
  fi
fi
# ============= c/samples/sample02.lsp ==============
if test ! -d 'c/samples'; then
  mkdir 'c/samples'
if test $? -eq 0
then ${echo} 'x - created directory `c/samples'\''.'
else ${echo} 'x - failed to create directory `c/samples'\''.'
  exit 1
fi
fi
if test -f 'c/samples/sample02.lsp' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/samples/sample02.lsp (file already exists)'
else
${echo} 'x - extracting c/samples/sample02.lsp (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c/samples/sample02.lsp' &&
#line 27 "samples.nw"
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
SHAR_EOF
  (set 20 10 08 31 12 48 08 'c/samples/sample02.lsp'; eval "$shar_touch") &&
  chmod 0444 'c/samples/sample02.lsp'
if test $? -ne 0
then ${echo} 'restore of c/samples/sample02.lsp failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/samples/sample02.lsp: MD5 check failed'
       ) << SHAR_EOF
46086d6946a947c88c1015e5be0548e4  c/samples/sample02.lsp
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/samples/sample02.lsp'` -ne 291 && \
  ${echo} 'restoration warning:  size of c/samples/sample02.lsp is not 291'
  fi
fi
# ============= c/samples/sample03.lsp ==============
if test -f 'c/samples/sample03.lsp' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/samples/sample03.lsp (file already exists)'
else
${echo} 'x - extracting c/samples/sample03.lsp (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c/samples/sample03.lsp' &&
#line 49 "samples.nw"
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
SHAR_EOF
  (set 20 10 08 31 12 48 08 'c/samples/sample03.lsp'; eval "$shar_touch") &&
  chmod 0444 'c/samples/sample03.lsp'
if test $? -ne 0
then ${echo} 'restore of c/samples/sample03.lsp failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/samples/sample03.lsp: MD5 check failed'
       ) << SHAR_EOF
7c41c06b54bbf8744661f05a7bd90b7e  c/samples/sample03.lsp
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/samples/sample03.lsp'` -ne 5224 && \
  ${echo} 'restoration warning:  size of c/samples/sample03.lsp is not 5224'
  fi
fi
# ============= c/c_src/eval.c ==============
if test ! -d 'c/c_src'; then
  mkdir 'c/c_src'
if test $? -eq 0
then ${echo} 'x - created directory `c/c_src'\''.'
else ${echo} 'x - failed to create directory `c/c_src'\''.'
  exit 1
fi
fi
if test -f 'c/c_src/eval.c' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/c_src/eval.c (file already exists)'
else
${echo} 'x - extracting c/c_src/eval.c (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c/c_src/eval.c' &&
#line 1995 "eval.nw"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "eval.h"
#include "vars.h"
X
#line 79 "eval.nw"
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
X
#line 1799 "eval.nw"
X    
#line 1795 "eval.nw"
X    le * evaluateBranch(le * trybranch)
#line 1800 "eval.nw"
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
#line 1853 "eval.nw"
X    
#line 1849 "eval.nw"
X    le * evaluateNode(le * node)
#line 1854 "eval.nw"
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
#line 1930 "eval.nw"
X    
#line 1926 "eval.nw"
X    le * evaluateDefun( le * fcn, le * params )
#line 1931 "eval.nw"
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
X
#line 1716 "eval.nw"
X    
#line 1713 "eval.nw"
X    int countNodes(le * branch)
#line 1717 "eval.nw"
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
X
#line 1741 "eval.nw"
X    
#line 1738 "eval.nw"
X    int evalCastLeToInt( const le * levalue )
#line 1742 "eval.nw"
X    {
X	if (!levalue) return( 0 );
X	if (!levalue->data) return( 0 );
X	
X	return( atoi(levalue->data) );
X    }
#line 1762 "eval.nw"
X    
#line 1759 "eval.nw"
X    le * evalCastIntToLe( int intvalue )
#line 1763 "eval.nw"
X    {
X	char buffer[80];
X	sprintf (buffer, "%d", intvalue);
X
X	return( leNew(buffer) );
X    }
X
#line 157 "eval.nw"
X    
#line 154 "eval.nw"
X    le * eval_cb_nothing( const int argc, le * branch )
#line 158 "eval.nw"
X    {
X	return( leNew( "T" ));
X    }
#line 342 "eval.nw"
X    
#line 328 "eval.nw"
X    int
X    eval_cume_helper(
X	    enum cumefcn function,
X	    int value,
X	    le * branch
X    ) 
#line 343 "eval.nw"
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
#line 394 "eval.nw"
X    
#line 391 "eval.nw"
X    le * eval_cb_add( const int argc, le * branch )
#line 395 "eval.nw"
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
#line 427 "eval.nw"
X    
#line 424 "eval.nw"
X    le * eval_cb_subtract( const int argc, le * branch )
#line 428 "eval.nw"
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
#line 470 "eval.nw"
X    
#line 467 "eval.nw"
X    le * eval_cb_multiply( const int argc, le * branch )
#line 471 "eval.nw"
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
#line 505 "eval.nw"
X    
#line 502 "eval.nw"
X    le * eval_cb_divide( const int argc, le * branch )
#line 506 "eval.nw"
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
#line 538 "eval.nw"
X    
#line 535 "eval.nw"
X    le * eval_cb_oneplus( const int argc, le * branch )
#line 539 "eval.nw"
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
#line 566 "eval.nw"
X    
#line 563 "eval.nw"
X    le * eval_cb_oneminus( const int argc, le * branch )
#line 567 "eval.nw"
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
#line 595 "eval.nw"
X    
#line 592 "eval.nw"
X    le * eval_cb_modulus( const int argc, le * branch )
#line 596 "eval.nw"
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
X
#line 627 "eval.nw"
X    
#line 624 "eval.nw"
X    le * eval_cb_lt( const int argc, le * branch )
#line 628 "eval.nw"
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
#line 659 "eval.nw"
X    
#line 656 "eval.nw"
X    le * eval_cb_lt_eq( const int argc, le * branch )
#line 660 "eval.nw"
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
#line 691 "eval.nw"
X    
#line 688 "eval.nw"
X    le * eval_cb_gt( const int argc, le * branch )
#line 692 "eval.nw"
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
#line 723 "eval.nw"
X    
#line 720 "eval.nw"
X    le * eval_cb_gt_eq( const int argc, le * branch )
#line 724 "eval.nw"
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
#line 755 "eval.nw"
X    
#line 752 "eval.nw"
X    le * eval_cb_eqsign( const int argc, le * branch )
#line 756 "eval.nw"
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
X
#line 787 "eval.nw"
X    
#line 784 "eval.nw"
X    le * eval_cb_and( const int argc, le * branch )
#line 788 "eval.nw"
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
#line 823 "eval.nw"
X    
#line 820 "eval.nw"
X    le * eval_cb_or( const int argc, le * branch )
#line 824 "eval.nw"
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
#line 859 "eval.nw"
X    
#line 856 "eval.nw"
X    le * eval_cb_not( const int argc, le * branch )
#line 860 "eval.nw"
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
X
#line 896 "eval.nw"
X    
#line 893 "eval.nw"
X    le * eval_cb_atom( const int argc, le * branch )
#line 897 "eval.nw"
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
#line 927 "eval.nw"
X    
#line 924 "eval.nw"
X    le * eval_cb_car( const int argc, le * branch )
#line 928 "eval.nw"
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
#line 976 "eval.nw"
X    
#line 973 "eval.nw"
X    le * eval_cb_cdr( const int argc, le * branch )
#line 977 "eval.nw"
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
#line 1014 "eval.nw"
X    
#line 1011 "eval.nw"
X    le * eval_cb_cons( const int argc, le * branch )
#line 1015 "eval.nw"
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
#line 1055 "eval.nw"
X    
#line 1052 "eval.nw"
X    le * eval_cb_list( const int argc, le * branch )
#line 1056 "eval.nw"
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
#line 1120 "eval.nw"
X    
#line 1117 "eval.nw"
X    int eval_cb_lists_same( le * list1, le * list2 )
#line 1121 "eval.nw"
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
#line 1189 "eval.nw"
X    
#line 1186 "eval.nw"
X    le * eval_cb_equal( const int argc, le * branch )
#line 1190 "eval.nw"
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
X
#line 1223 "eval.nw"
X    
#line 1220 "eval.nw"
X    le * eval_cb_if( const int argc, le * branch )
#line 1224 "eval.nw"
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
#line 1274 "eval.nw"
X    
#line 1266 "eval.nw"
X    le *
X	eval_cb_whenunless_helper(
X	    enum whenunless which,
X	    const int argc, 
X	    le * branch
X	)
#line 1275 "eval.nw"
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
#line 1327 "eval.nw"
X    
#line 1324 "eval.nw"
X    le * eval_cb_unless( const int argc, le * branch )
#line 1328 "eval.nw"
X    {
X	return( eval_cb_whenunless_helper(
X			WU_UNLESS,
X			argc,
X			branch ) );
X    }
#line 1353 "eval.nw"
X    
#line 1350 "eval.nw"
X    le * eval_cb_when( const int argc, le * branch )
#line 1354 "eval.nw"
X    {
X	return( eval_cb_whenunless_helper(
X			WU_WHEN,
X			argc,
X			branch ) );
X    }
#line 1383 "eval.nw"
X    
#line 1380 "eval.nw"
X    le * eval_cb_cond( const int argc, le * branch )
#line 1384 "eval.nw"
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
#line 1449 "eval.nw"
X    
#line 1446 "eval.nw"
X    le * eval_cb_select( const int argc, le * branch )
#line 1450 "eval.nw"
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
X
#line 1497 "eval.nw"
X    
#line 1494 "eval.nw"
X    le * eval_cb_princ( const int argc, le * branch )
#line 1498 "eval.nw"
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
#line 1525 "eval.nw"
X    
#line 1522 "eval.nw"
X    le * eval_cb_terpri( const int argc, le * branch )
#line 1526 "eval.nw"
X    {
X	le * thisnode;
X	le * retblock = NULL;
X	if (!branch || argc != 1 ) return( leNew( "NIL" ));
X
X	printf( "\n" );
X	return( leNew( "NIL" ) );
X    }
X
#line 1548 "eval.nw"
X    
#line 1545 "eval.nw"
X    le * eval_cb_eval( const int argc, le * branch )
#line 1549 "eval.nw"
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
#line 1578 "eval.nw"
X    
#line 1575 "eval.nw"
X    le * eval_cb_prog( const int argc, le * branch, int returnit )
#line 1579 "eval.nw"
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
#line 1616 "eval.nw"
X    
#line 1613 "eval.nw"
X    le * eval_cb_prog1( const int argc, le * branch )
#line 1617 "eval.nw"
X    {
X	return( eval_cb_prog( argc, branch, 1 ));
X    }
#line 1632 "eval.nw"
X    
#line 1629 "eval.nw"
X    le * eval_cb_prog2( const int argc, le * branch )
#line 1633 "eval.nw"
X    {
X	return( eval_cb_prog( argc, branch, 2 ));
X    }
#line 1648 "eval.nw"
X    
#line 1645 "eval.nw"
X    le * eval_cb_progn( const int argc, le * branch )
#line 1649 "eval.nw"
X    {
X	return( eval_cb_prog( argc, branch, -1 ));
X    }
X
#line 183 "eval.nw"
X    
#line 176 "eval.nw"
X    le * eval_cb_set_helper( 
X		enum setfcn function,
X		const int argc, 
X		le * branch
X		)
#line 184 "eval.nw"
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
#line 235 "eval.nw"
X    
#line 232 "eval.nw"
X    le * eval_cb_set( const int argc, le * branch )
#line 236 "eval.nw"
X    {
X	return( eval_cb_set_helper( S_SET, argc, branch ) );
X    }
#line 254 "eval.nw"
X    
#line 251 "eval.nw"
X    le * eval_cb_setq( const int argc, le * branch )
#line 255 "eval.nw"
X    {
X	return( eval_cb_set_helper( S_SETQ, argc, branch ) );
X    }
#line 275 "eval.nw"
X    
#line 272 "eval.nw"
X    le * eval_cb_enum( const int argc, le * branch )
#line 276 "eval.nw"
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
X
#line 1675 "eval.nw"
X    
#line 1672 "eval.nw"
X    le * eval_cb_defun( const int argc, le * branch )
#line 1676 "eval.nw"
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
SHAR_EOF
  (set 20 10 08 31 12 47 34 'c/c_src/eval.c'; eval "$shar_touch") &&
  chmod 0444 'c/c_src/eval.c'
if test $? -ne 0
then ${echo} 'restore of c/c_src/eval.c failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/c_src/eval.c: MD5 check failed'
       ) << SHAR_EOF
3f85f99b7898dc5d5afe3b3b88191ea9  c/c_src/eval.c
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/c_src/eval.c'` -ne 25615 && \
  ${echo} 'restoration warning:  size of c/c_src/eval.c is not 25615'
  fi
fi
# ============= c/c_src/lists.c ==============
if test ! -d 'c/c_src'; then
  mkdir 'c/c_src'
if test $? -eq 0
then ${echo} 'x - created directory `c/c_src'\''.'
else ${echo} 'x - failed to create directory `c/c_src'\''.'
  exit 1
fi
fi
if test -f 'c/c_src/lists.c' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/c_src/lists.c (file already exists)'
else
${echo} 'x - extracting c/c_src/lists.c (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c/c_src/lists.c' &&
#line 569 "lists.nw"
#include "lists.h"
#include "eval.h"
#include <string.h>
X
#line 70 "lists.nw"
X    
#line 66 "lists.nw"
X    le * leNew(char * text)
#line 71 "lists.nw"
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
#line 102 "lists.nw"
X    
#line 98 "lists.nw"
X    void leDelete(le * element)
#line 103 "lists.nw"
X    {
X	if (element)
X	{
X	    if (element->data) free( element->data );
X	    free(element);
X	}
X    }
#line 127 "lists.nw"
X    
#line 123 "lists.nw"
X    void leWipe(le * list)
#line 128 "lists.nw"
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
X
#line 166 "lists.nw"
X    
#line 162 "lists.nw"
X    le * leAddHead(le * list, le * element)
#line 167 "lists.nw"
X    {
X	if (!element)  return( list );
X
X	element->list_next = list;
X	if (list) list->list_prev = element;
X	return( element );
X    }
#line 192 "lists.nw"
X    
#line 188 "lists.nw"
X    le * leAddTail(le * list, le * element)
#line 193 "lists.nw"
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
X
#line 236 "lists.nw"
X    
#line 232 "lists.nw"
X    le * leAddBranchElement( le * list, le * branch, int quoted )
#line 237 "lists.nw"
X    {
X	le * temp = leNew(NULL);
X	temp->branch = branch;
X	temp->quoted = quoted;
X	return leAddTail(list, temp);
X    }
#line 258 "lists.nw"
X    
#line 254 "lists.nw"
X    le * leAddDataElement( le * list, char * data, int quoted )
#line 259 "lists.nw"
X    {
X	le * newdata = leNew(data);
X	if (newdata)
X	{
X	    newdata->quoted = quoted;
X	    return leAddTail(list, newdata);
X	}
X    }
#line 284 "lists.nw"
X    
#line 280 "lists.nw"
X    le * leDup( le * list )
#line 285 "lists.nw"
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
X
#line 321 "lists.nw"
X    
#line 317 "lists.nw"
X    void leClearTag( le * list )
#line 322 "lists.nw"
X    {
X	if (!list) return;
X	list->tag = -1;
X	leClearTag( list->branch );
X	leClearTag( list->list_next );
X    }
#line 339 "lists.nw"
X    
#line 336 "lists.nw"
X    void leTagData(le * list, char * data, int tagval)
#line 340 "lists.nw"
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
#line 370 "lists.nw"
X    
#line 367 "lists.nw"
X    void leTagReplace(le * list, int tagval, le * newinfo)
#line 371 "lists.nw"
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
X
#line 422 "lists.nw"
X    
#line 418 "lists.nw"
X    void leDump( le * list, int indent )
#line 423 "lists.nw"
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
#line 456 "lists.nw"
X    
#line 452 "lists.nw"
X    void leDumpEvalTree( le * list, int indent )
#line 457 "lists.nw"
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
#line 495 "lists.nw"
X    
#line 491 "lists.nw"
X    void leDumpEval( le * list, int indent )
#line 496 "lists.nw"
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
#line 532 "lists.nw"
X    
#line 528 "lists.nw"
X    void leDumpReformat(FILE * of, le * tree)
#line 533 "lists.nw"
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
SHAR_EOF
  (set 20 10 08 31 12 47 34 'c/c_src/lists.c'; eval "$shar_touch") &&
  chmod 0444 'c/c_src/lists.c'
if test $? -ne 0
then ${echo} 'restore of c/c_src/lists.c failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/c_src/lists.c: MD5 check failed'
       ) << SHAR_EOF
382d225db72f25274201f530de47d26b  c/c_src/lists.c
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/c_src/lists.c'` -ne 5842 && \
  ${echo} 'restoration warning:  size of c/c_src/lists.c is not 5842'
  fi
fi
# ============= c/c_src/main.c ==============
if test -f 'c/c_src/main.c' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/c_src/main.c (file already exists)'
else
${echo} 'x - extracting c/c_src/main.c (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c/c_src/main.c' &&
#line 120 "main.nw"
#include <stdio.h>
#include "parser.h"
#include "version.h"
#include "vars.h"
#line 21 "main.nw"
X    FILE * fp = NULL;
X
#line 43 "main.nw"
X    
#line 40 "main.nw"
X    void myungetc( int c )
#line 44 "main.nw"
X    {
X	ungetc( c, fp );
X    }
#line 30 "main.nw"
X    
#line 27 "main.nw"
X    int mygetc( void )
#line 31 "main.nw"
X    {
X	return( getc( fp ) );
X    }
#line 137 "main.nw"
int
main( int argc, char* argv[] )
{
X    
#line 55 "main.nw"
X    int fileno;
X    int lineno;
X    struct le * list = NULL;
X
#line 142 "main.nw"
X    printf( "lithp sample executable by jsl.lithp@absynth.com\n" );
X    printf( "Version " VER_BUILD_VER 
X		" "    VER_BUILD_DATE 
X		" \""  VER_BUILD_TPOTC
X		"\"\n" );
X    
#line 61 "main.nw"
X    if (argc <= 1)
X    {
X	fprintf(stderr, "ERROR: You must specify a .lsp file!\n");
X	return __LINE__;
X    }
#line 148 "main.nw"
X    
#line 80 "main.nw"
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
#line 149 "main.nw"
X    return 0;
}
SHAR_EOF
  (set 20 10 08 31 12 47 34 'c/c_src/main.c'; eval "$shar_touch") &&
  chmod 0444 'c/c_src/main.c'
if test $? -ne 0
then ${echo} 'restore of c/c_src/main.c failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/c_src/main.c: MD5 check failed'
       ) << SHAR_EOF
d6280603a53c4ac172b148bd18c66b3b  c/c_src/main.c
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/c_src/main.c'` -ne 1635 && \
  ${echo} 'restoration warning:  size of c/c_src/main.c is not 1635'
  fi
fi
# ============= c/c_src/parser.c ==============
if test -f 'c/c_src/parser.c' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/c_src/parser.c (file already exists)'
else
${echo} 'x - extracting c/c_src/parser.c (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c/c_src/parser.c' &&
#line 283 "parser.nw"
#include "parser.h"
#include <string.h>
X
#line 53 "parser.nw"
X    
#line 43 "parser.nw"
X    struct le *
X    parseInFile(
X	    getcCallback getachar,
X	    ungetcCallback ungetachar,
X	    struct le * list,
X	    int * line
X    )
#line 54 "parser.nw"
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
#line 146 "parser.nw"
X    
#line 137 "parser.nw"
X    char *
X    snagAToken(
X	getcCallback getachar,
X	ungetcCallback ungetachar,
X	enum tokenname * tokenid
X    )
#line 147 "parser.nw"
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
SHAR_EOF
  (set 20 10 08 31 12 47 34 'c/c_src/parser.c'; eval "$shar_touch") &&
  chmod 0444 'c/c_src/parser.c'
if test $? -ne 0
then ${echo} 'restore of c/c_src/parser.c failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/c_src/parser.c: MD5 check failed'
       ) << SHAR_EOF
d1f9636f030b2a6e414fd7134010b1c3  c/c_src/parser.c
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/c_src/parser.c'` -ne 3093 && \
  ${echo} 'restoration warning:  size of c/c_src/parser.c is not 3093'
  fi
fi
# ============= c/c_src/vars.c ==============
if test -f 'c/c_src/vars.c' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/c_src/vars.c (file already exists)'
else
${echo} 'x - extracting c/c_src/vars.c (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c/c_src/vars.c' &&
#line 250 "vars.nw"
#include "vars.h"
#include <string.h>
X
#line 28 "vars.nw"
le * mainVarList = NULL;
#line 39 "vars.nw"
le * defunList = NULL;
X
#line 64 "vars.nw"
X    
#line 60 "vars.nw"
X    le * variableFind( le * varlist, char * key )
#line 65 "vars.nw"
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
X
#line 116 "vars.nw"
X    
#line 112 "vars.nw"
X    le * variableSet( le * varlist, char * key, le * value )
#line 117 "vars.nw"
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
#line 149 "vars.nw"
X    
#line 145 "vars.nw"
X    le * variableSetString( le * varlist, char * key, char * value )
#line 150 "vars.nw"
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
#line 178 "vars.nw"
X    
#line 174 "vars.nw"
X    le * variableGet( le * varlist, char * key )
#line 179 "vars.nw"
X    {
X	le * temp = variableFind(varlist, key);
X	if (temp && temp->branch)
X	    return( temp->branch );
X	return( NULL );
X    }
#line 200 "vars.nw"
X    
#line 196 "vars.nw"
X    char * variableGetString( le * varlist, char * key )
#line 201 "vars.nw"
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
X
#line 226 "vars.nw"
X    
#line 222 "vars.nw"
X    void variableDump( le * varlist )
#line 227 "vars.nw"
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
SHAR_EOF
  (set 20 10 08 31 12 47 34 'c/c_src/vars.c'; eval "$shar_touch") &&
  chmod 0444 'c/c_src/vars.c'
if test $? -ne 0
then ${echo} 'restore of c/c_src/vars.c failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/c_src/vars.c: MD5 check failed'
       ) << SHAR_EOF
bce71dd7b2ff42293fb718ac6ee594b1  c/c_src/vars.c
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/c_src/vars.c'` -ne 2165 && \
  ${echo} 'restoration warning:  size of c/c_src/vars.c is not 2165'
  fi
fi
# ============= c/c_src/eval.h ==============
if test -f 'c/c_src/eval.h' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/c_src/eval.h (file already exists)'
else
${echo} 'x - extracting c/c_src/eval.h (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c/c_src/eval.h' &&
#include "lists.h"
X
X    typedef
X    le *
X    (*eval_cb)
X        (
X            const int argc,
X            le * branch
X        );
X    typedef struct evalLookupNode {
X        char    * word;
X        eval_cb   callback;
X    } evalLookupNode;
X
X    le * evaluateBranch(le * trybranch);
X    le * evaluateNode(le * node);
X    le * evaluateDefun( le * fcn, le * params );
X
X    int countNodes(le * branch);
X
X    int evalCastLeToInt( const le * levalue );
X    le * evalCastIntToLe( int intvalue );
X
X    le * eval_cb_nothing( const int argc, le * branch );
X
enum cumefcn { C_NONE, C_ADD, C_SUBTRACT, C_MULTIPLY, C_DIVIDE };
X    int
X    eval_cume_helper(
X            enum cumefcn function,
X            int value,
X            le * branch
X    ) ;
X    le * eval_cb_add( const int argc, le * branch );
X    le * eval_cb_subtract( const int argc, le * branch );
X    le * eval_cb_multiply( const int argc, le * branch );
X    le * eval_cb_divide( const int argc, le * branch );
X    le * eval_cb_oneplus( const int argc, le * branch );
X    le * eval_cb_oneminus( const int argc, le * branch );
X    le * eval_cb_modulus( const int argc, le * branch );
X
X    le * eval_cb_lt( const int argc, le * branch );
X    le * eval_cb_lt_eq( const int argc, le * branch );
X    le * eval_cb_gt( const int argc, le * branch );
X    le * eval_cb_gt_eq( const int argc, le * branch );
X    le * eval_cb_eqsign( const int argc, le * branch );
X
X    le * eval_cb_and( const int argc, le * branch );
X    le * eval_cb_or( const int argc, le * branch );
X    le * eval_cb_not( const int argc, le * branch );
X
X    le * eval_cb_atom( const int argc, le * branch );
X    le * eval_cb_car( const int argc, le * branch );
X    le * eval_cb_cdr( const int argc, le * branch );
X    le * eval_cb_cons( const int argc, le * branch );
X    le * eval_cb_list( const int argc, le * branch );
X    int eval_cb_lists_same( le * list1, le * list2 );
X    le * eval_cb_equal( const int argc, le * branch );
X
X
X    le * eval_cb_if( const int argc, le * branch );
enum whenunless { WU_WHEN, WU_UNLESS };
X    le *
X        eval_cb_whenunless_helper(
X            enum whenunless which,
X            const int argc, 
X            le * branch
X        );
X    le * eval_cb_unless( const int argc, le * branch );
X    le * eval_cb_when( const int argc, le * branch );
X    le * eval_cb_cond( const int argc, le * branch );
X    le * eval_cb_select( const int argc, le * branch );
X
X    le * eval_cb_princ( const int argc, le * branch );
X    le * eval_cb_terpri( const int argc, le * branch );
X
X    le * eval_cb_eval( const int argc, le * branch );
X    le * eval_cb_prog( const int argc, le * branch, int returnit );
X    le * eval_cb_prog1( const int argc, le * branch );
X    le * eval_cb_prog2( const int argc, le * branch );
X    le * eval_cb_progn( const int argc, le * branch );
X
enum setfcn { S_SET, S_SETQ };
X    le * eval_cb_set_helper( 
X                enum setfcn function,
X                const int argc, 
X                le * branch
X                );
X    le * eval_cb_set( const int argc, le * branch );
X    le * eval_cb_setq( const int argc, le * branch );
X    le * eval_cb_enum( const int argc, le * branch );
X
X    le * eval_cb_defun( const int argc, le * branch );
SHAR_EOF
  (set 20 10 08 31 12 47 34 'c/c_src/eval.h'; eval "$shar_touch") &&
  chmod 0444 'c/c_src/eval.h'
if test $? -ne 0
then ${echo} 'restore of c/c_src/eval.h failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/c_src/eval.h: MD5 check failed'
       ) << SHAR_EOF
c05ffbc691eb909c49b020c6fe542168  c/c_src/eval.h
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/c_src/eval.h'` -ne 3192 && \
  ${echo} 'restoration warning:  size of c/c_src/eval.h is not 3192'
  fi
fi
# ============= c/c_src/lists.h ==============
if test -f 'c/c_src/lists.h' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/c_src/lists.h (file already exists)'
else
${echo} 'x - extracting c/c_src/lists.h (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c/c_src/lists.h' &&
#ifndef __LISTS_H__
#define __LISTS_H__
X
#include <stdio.h>
X
X    typedef struct le{
X        /* either data or a branch */
X        struct le * branch;
X        char * data;
X        int quoted;
X        int tag;
X
X        /* for the next in the list in the current parenlevel */
X        struct le * list_prev;
X        struct le * list_next;
X    } le;
X
X    le * leNew(char * text);
X    void leDelete(le * element);
X    void leWipe(le * list);
X
X    le * leAddHead(le * list, le * element);
X    le * leAddTail(le * list, le * element);
X
X    le * leAddBranchElement( le * list, le * branch, int quoted );
X    le * leAddDataElement( le * list, char * data, int quoted );
X    le * leDup( le * list );
X
X    void leClearTag( le * list );
X    void leTagData(le * list, char * data, int tagval);
X    void leTagReplace(le * list, int tagval, le * newinfo);
X
X    void leDump( le * list, int indent );
X    void leDumpEval( le * list, int indent );
X    void leDumpEvalTree( le * list, int indent );
X    void leDumpReformat(FILE * of, le * tree);
#endif
SHAR_EOF
  (set 20 10 08 31 12 47 34 'c/c_src/lists.h'; eval "$shar_touch") &&
  chmod 0444 'c/c_src/lists.h'
if test $? -ne 0
then ${echo} 'restore of c/c_src/lists.h failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/c_src/lists.h: MD5 check failed'
       ) << SHAR_EOF
5e6e348830510e1f1dd40d6300e2d09e  c/c_src/lists.h
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/c_src/lists.h'` -ne 1034 && \
  ${echo} 'restoration warning:  size of c/c_src/lists.h is not 1034'
  fi
fi
# ============= c/c_src/parser.h ==============
if test -f 'c/c_src/parser.h' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/c_src/parser.h (file already exists)'
else
${echo} 'x - extracting c/c_src/parser.h (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c/c_src/parser.h' &&
#include <stdio.h>
#include "lists.h"
X
enum tokenname { 
X        T_NONE, 
X        T_CLOSEPAREN, 
X        T_OPENPAREN, 
X        T_NEWLINE, 
X        T_QUOTE,
X        T_WORD, 
X        T_EOF
};
X
X    typedef int 
X    (*getcCallback)
X        (
X            void
X        );
X    typedef void
X    (*ungetcCallback)
X        (
X            int c
X        );
X
X    char *
X    snagAToken(
X        getcCallback getachar,
X        ungetcCallback ungetachar,
X        enum tokenname * tokenid
X    );
X    struct le *
X    parseInFile(
X            getcCallback getachar,
X            ungetcCallback ungetachar,
X            struct le * list,
X            int * line
X    );
SHAR_EOF
  (set 20 10 08 31 12 47 34 'c/c_src/parser.h'; eval "$shar_touch") &&
  chmod 0444 'c/c_src/parser.h'
if test $? -ne 0
then ${echo} 'restore of c/c_src/parser.h failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/c_src/parser.h: MD5 check failed'
       ) << SHAR_EOF
a344cd4b54e774903605dc4c9ef904dd  c/c_src/parser.h
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/c_src/parser.h'` -ne 645 && \
  ${echo} 'restoration warning:  size of c/c_src/parser.h is not 645'
  fi
fi
# ============= c/c_src/vars.h ==============
if test -f 'c/c_src/vars.h' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/c_src/vars.h (file already exists)'
else
${echo} 'x - extracting c/c_src/vars.h (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c/c_src/vars.h' &&
#include <stdio.h>
#include "lists.h"
X
extern le * mainVarList;
extern le * defunList;
X
X    le * variableFind( le * varlist, char * key );
#define variableFree( L ) \
X                leWipe( (L) );
X
X    le * variableSet( le * varlist, char * key, le * value );
X    le * variableSetString( le * varlist, char * key, char * value );
X    le * variableGet( le * varlist, char * key );
X    char * variableGetString( le * varlist, char * key );
X
X    void variableDump( le * varlist );
SHAR_EOF
  (set 20 10 08 31 12 47 34 'c/c_src/vars.h'; eval "$shar_touch") &&
  chmod 0444 'c/c_src/vars.h'
if test $? -ne 0
then ${echo} 'restore of c/c_src/vars.h failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/c_src/vars.h: MD5 check failed'
       ) << SHAR_EOF
596a6b49eea09367797ca61f66fefecf  c/c_src/vars.h
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/c_src/vars.h'` -ne 479 && \
  ${echo} 'restoration warning:  size of c/c_src/vars.h is not 479'
  fi
fi
# ============= c/c_src/version.h ==============
if test -f 'c/c_src/version.h' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/c_src/version.h (file already exists)'
else
${echo} 'x - extracting c/c_src/version.h (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c/c_src/version.h' &&
X
#define VER_BUILD_DATE  "2001-10-16"
#define VER_BUILD_VER   "0.6"
#define VER_BUILD_TPOTC "Baloo"
X
SHAR_EOF
  (set 20 10 08 31 12 47 34 'c/c_src/version.h'; eval "$shar_touch") &&
  chmod 0444 'c/c_src/version.h'
if test $? -ne 0
then ${echo} 'restore of c/c_src/version.h failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/c_src/version.h: MD5 check failed'
       ) << SHAR_EOF
6d633cb5808c3d0be80067d71ab5a428  c/c_src/version.h
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/c_src/version.h'` -ne 101 && \
  ${echo} 'restoration warning:  size of c/c_src/version.h is not 101'
  fi
fi
# ============= c/c_src/Makefile ==============
if test -f 'c/c_src/Makefile' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/c_src/Makefile (file already exists)'
else
${echo} 'x - extracting c/c_src/Makefile (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c/c_src/Makefile' &&
TGT = lithp
X
all:
X	cc -o $(TGT) *.c
X
clean:
X	rm $(TGT)
SHAR_EOF
  (set 20 10 08 31 12 54 58 'c/c_src/Makefile'; eval "$shar_touch") &&
  chmod 0644 'c/c_src/Makefile'
if test $? -ne 0
then ${echo} 'restore of c/c_src/Makefile failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/c_src/Makefile: MD5 check failed'
       ) << SHAR_EOF
6c725918b2ac07f2d9555a88264798e0  c/c_src/Makefile
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/c_src/Makefile'` -ne 55 && \
  ${echo} 'restoration warning:  size of c/c_src/Makefile is not 55'
  fi
fi
# ============= c/c_src/lithp ==============
if test -f 'c/c_src/lithp' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c/c_src/lithp (file already exists)'
else
${echo} 'x - extracting c/c_src/lithp (binary)'
  sed 's/^X//' << 'SHAR_EOF' | uudecode &&
begin 600 c/c_src/lithp
M?T5,1@(!`0````````````(`/@`!````$`E```````!``````````'A-````
M`````````$``.``(`$``'@`;``8````%````0`````````!``$```````$``
M0```````P`$```````#``0````````@``````````P````0``````@``````
M```"0`````````)````````:`````````!H``````````0`````````!````
M!0````````````````!``````````$```````!1'````````%$<`````````
M`"````````$````&````&$<````````81V```````!A'8```````.`4`````
M``!X!0``````````(````````@````8```!`1P```````$!'8```````0$=@
M``````"@`0```````*`!````````"``````````$````!````!P"````````
M'`)````````<`D```````"``````````(``````````$`````````%#E=&0$
M````V#H```````#8.D```````-@Z0```````;`(```````!L`@````````0`
M````````4>5T9`8`````````````````````````````````````````````
M````````````"``````````O;&EB+VQD+6QI;G5X+7@X-BTV-"YS;RXR````
M!````!`````!````1TY5```````"````!@```!(`````````$0```!4`````
M`````````!0````0`````P````L````/````!P````@`````````$0```!,`
M```*````#0```!(````"````#@```````````````````````````````0``
M``4`````````````````````````"0````8`````````````````````````
M#`````0```````````````(````3`````0````8``````0````$0`A,````4
M````*1V,'#GRBQP```````````````````````````````!R````$@``````
M```````````````````!````(``````````````````````````H````$@``
M```````````````````````M````$@````````````````````````!7````
M$@`````````````````````````B````$@````````````````````````")
M````$@`````````````````````````\````$@``````````````````````
M``!*````$@````````````````````````";````$@``````````````````
M``````!Y````$@`````````````````````````:````$@``````````````
M``````````!L````$@`````````````````````````U````$@``````````
M``````````````""````$@````````````````````````!0````$@``````
M``````````````````!E````$@````````````````````````!Q````$@``
M``````````````````````!#````$0`9`&!,8```````"`````````!>````
M$0`9`%!,8```````"```````````7U]G;6]N7W-T87)T7U\`;&EB8RYS;RXV
M`'-P<FEN=&8`9F]P96X`<'5T<P!P=71C:&%R`'-T<F1U<`!U;F=E=&,`<W1D
M;W5T`&9P=71C`&9C;&]S90!M86QL;V,`<W1D97)R`&9W<FET90!A=&]I`&9P
M<FEN=&8`7TE/7V=E=&,`<W1R8VUP`%]?;&EB8U]S=&%R=%]M86EN`&9R964`
M1TQ)0D-?,BXR+C4````"`````@`"``(``@`"``(``@`"``(``@`"``(``@`"
M``(``@`"``(````!``$`$````!``````````=1II"0```@"@`````````.!(
M8```````!@````(``````````````%!,8```````!0```!0`````````````
M`&!,8```````!0```!,```````````````!)8```````!P````$`````````
M``````A)8```````!P````,``````````````!!)8```````!P````0`````
M`````````!A)8```````!P````4``````````````"!)8```````!P````8`
M`````````````"A)8```````!P````<``````````````#!)8```````!P``
M``@``````````````#A)8```````!P````D``````````````$!)8```````
M!P````H``````````````$A)8```````!P````L``````````````%!)8```
M````!P````P``````````````%A)8```````!P````T``````````````&!)
M8```````!P````X``````````````&A)8```````!P````\`````````````
M`'!)8```````!P```!```````````````'A)8```````!P```!$`````````
M`````(!)8```````!P```!(``````````````$B#[`CH6P$``.CJ`0``Z)4P
M``!(@\0(P_\U^D`@`/\E_$`@``\?0`#_)?I`(`!H`````.G@_____R7R0"``
M:`$```#IT/____\EZD`@`&@"````Z<#_____)>)`(`!H`P```.FP_____R7:
M0"``:`0```#IH/____\ETD`@`&@%````Z9#_____)<I`(`!H!@```.F`____
M_R7"0"``:`<```#I</____\END`@`&@(````Z6#_____);)`(`!H"0```.E0
M_____R6J0"``:`H```#I0/____\EHD`@`&@+````Z3#_____)9I`(`!H#```
M`.D@_____R620"``:`T```#I$/____\EBD`@`&@.````Z0#_____)8)`(`!H
M#P```.GP_O___R5Z0"``:!````#IX/[__S'M28G17DB)XDB#Y/!05$G'P'`X
M0`!(Q\'@-T``2,?'<B]``.@7____])"02(/L"$B+!9D_(`!(A<!T`O_02(/$
M",.0D)"0D)"0D)"0D)"054B)Y5-(@^P(@#WX0B```'5+NS!'8`!(BP7R0B``
M2('K*$=@`$C!^P-(@^L!2#G8<R1F#Q]$``!(@\`!2(D%S4(@`/\4Q2A'8`!(
MBP6_0B``2#G8<N+&!:M"(``!2(/$"%O)PV9F9BX/'X0``````$B#/6`](```
M54B)Y702N`````!(A<!T"+\X1V``R?_@R<.0D%5(B>532(/L*$B)?=C'1>0`
M````2(-]V`!U"K@`````Z?H```!(BT782(L`2(7`=!5(BT782(L`2(G'Z,#_
M__](B47HZQ1(BT782(M`"$B)Q^BB'```2(E%Z$B+1>A(BT`(2(7`=1M(BT7H
M2(G'Z$4=``"_@#E``.A['```Z9T```#'1>0`````ZV5(BT7H2(M0"(M%Y$B8
M2,'@!$@%P$E@`$B+`$B)UDB)Q^@L_O__A<!U.$B+1>A(B<?H^!P``(M%Y$B8
M2,'@!$@%P$E@`$B+6`A(BT782(G'Z%T"``!(BU782(G6B<?_T^LS@T7D`8M%
MY$B82,'@!$@%P$E@`$B+`$B%P'6$2(M%Z$B)Q^BE'```2(M%V$B)Q^@'````
M2(/$*%O)PU5(B>5(@^P@2(E]Z$B+1>A(BP!(A<!T.TB+1>B+0!"%P'082(M%
MZ$B+`$B)Q^CY'0``2(E%^.FE````2(M%Z$B+`$B)Q^B0_O__2(E%^.F-````
M2(M%Z$B+4`A(BP4,02``2(G62(G'Z`,K``!(B47P2(-]\`!T'4B+1>A(BU`@
M2(M%\$B)UDB)Q^A7````2(E%^.M+2(M%Z$B+4`A(BP7"0"``2(G62(G'Z,$J
M``!(B47P2(-]\`!T$DB+1?!(B<?H91T``$B)1?CK%$B+1>A(BT`(2(G'Z/8:
M``!(B47X2(M%^,G#54B)Y5-(@^PX2(E]R$B)=<!(@WW(`'4/OX`Y0`#HRAH`
M`.D"`0``2(M%R$B+`$B)Q^CZ````B<-(BT7`2(G'Z.P````YPWX/OX`Y0`#H
MFAH``.G2````2(M%R$B)Q^CB'```2(E%V,=%Y`````!(BT7(2(L`2(E%Z.LJ
M2(M%Z$B+2`B+5>1(BT782(G.2(G'Z'$=``!(BT7H2(M`($B)1>B#1>0!2(-]
MZ`!US\=%Y`````!(BT7`2(E%Z.M!2(M%Z$B)Q^A1_O__2(E%T$B+5="+3>1(
MBT78B<Y(B<?HJAT``$B+1>A(BT`@2(E%Z$B+1=!(B<?HLAH``(-%Y`%(@WWH
M`'6X2(M%V$B+0"!(B<?HW_S__TB)1=!(BT782(G'Z(<:``!(BT702(/$.%O)
MPU5(B>5(B7WHQT7\`````.L0@T7\`4B+1>A(BT`@2(E%Z$B#?>@`=>F+1?S)
MPU5(B>5(@^P02(E]^$B#??@`=0>X`````.LD2(M%^$B+0`A(A<!U![@`````
MZQ!(BT7X2(M`"$B)Q^@5^___R<-52(GE2(/L8(E]K+F$.4``BU6L2(U%L$B)
MSDB)Q[@`````Z-SZ__](C46P2(G'Z!P9``#)PU5(B>5(@^P0B7W\2(EU\+^'
M.4``Z`$9``#)PU5(B>5(@^PPB7W<B7782(E5T,=%]`````#'1?`!````2(M%
MT$B)1?A(@WW0``^%C````+@`````Z9````!(BT7X2(G'Z.3\__](B47H2(M%
MZ$B)Q^@7____B47T2(M%Z$B)Q^A7&0``BT7<@_@"=""#^`)W!X/X`70.ZS>#
M^`-T%X/X!'0>ZRN+1?0!1=CK(XM%]"E%V.L;BT78#Z]%](E%V.L/BT78B<+!
M^A_W??2)1=B02(M%^$B+0"!(B47X2(-]^``/A7/___^+1=C)PU5(B>5(@^P@
MB7WL2(EUX$C'1?@`````2(-]X`!T!H-][`%_#+^`.4``Z`(8``#K(4B+1>!(
MBT`@2(G"O@````"_`0```.CG_O__B<?HD/[__\G#54B)Y4B#["")?>Q(B77@
MQT7\`````$B#?>``=`:#?>P!?PR_@#E``.BP%P``ZV5(BT7@2(M`($B)Q^C,
M^___2(E%\$B+1?!(B<?H__W__XE%_$B+1?!(B<?H/Q@``(-][`)U#HM%_/?8
MB<?H'O[__^LB2(M%X$B+0"!(BU`@BT7\B<:_`@```.A1_O__B<?H^OW__\G#
M54B)Y4B#[!")??Q(B77P2(-]\`!T!H-]_`%_#+^`.4``Z"$7``#K(4B+1?!(
MBT`@2(G"O@$```"_`P```.@&_O__B<?HK_W__\G#54B)Y4B#["")?>Q(B77@
MQT7\`````$B#?>``=`:#?>P!?PR_@#E``.C/%@``ZU%(BT7@2(M`($B)Q^CK
M^O__2(E%\$B+1?!(B<?H'OW__XE%_$B+1?!(B<?H7A<``$B+1>!(BT`@2(M0
M((M%_(G&OP0```#HA/W__XG'Z"W]___)PU5(B>5(@^P@B7WL2(EUX$B#?>``
M=`:#?>P!?PR_@#E``.A4%@``ZSQ(BT7@2(M`($B)Q^AP^O__2(E%^$B+1?A(
MB<?HH_S__XE%]$B+1?A(B<?HXQ8``(M%](/``8G'Z,?\___)PU5(B>5(@^P@
MB7WL2(EUX$B#?>``=`:#?>P!?PR_@#E``.CN%0``ZSQ(BT7@2(M`($B)Q^@*
M^O__2(E%^$B+1?A(B<?H/?S__XE%]$B+1?A(B<?H?18``(M%](/H`8G'Z&'\
M___)PU5(B>5(@^P@B7WL2(EUX$B#?>``=`:#?>P#=`R_@#E``.B(%0``ZW9(
MBT7@2(M`($B)Q^BD^?__2(E%^$B+1?A(B<?HU_O__XE%]$B+1?A(B<?H%Q8`
M`$B+1>!(BT`@2(M`($B)Q^AQ^?__2(E%^$B+1?A(B<?HI/O__XE%\$B+1?A(
MB<?HY!4``(M%](G"P?H?]WWPB=")Q^C!^___R<-52(GE2(/L((E][$B)=>!(
M@WW@`'0&@WWL`W0,OX`Y0`#HZ!0``.M^2(M%X$B+0"!(B<?H!/G__TB)1?A(
MBT7X2(G'Z#?[__^)1?1(BT7X2(G'Z'<5``!(BT7@2(M`($B+0"!(B<?HT?C_
M_TB)1?A(BT7X2(G'Z`3[__^)1?!(BT7X2(G'Z$05``"+1?0[1?!]![B'.4``
MZP6X@#E``$B)Q^AH%```R<-52(GE2(/L((E][$B)=>!(@WW@`'0&@WWL`W0,
MOX`Y0`#H0!0``.M^2(M%X$B+0"!(B<?H7/C__TB)1?A(BT7X2(G'Z(_Z__^)
M1?1(BT7X2(G'Z,\4``!(BT7@2(M`($B+0"!(B<?H*?C__TB)1?A(BT7X2(G'
MZ%SZ__^)1?!(BT7X2(G'Z)P4``"+1?0[1?!_![B'.4``ZP6X@#E``$B)Q^C`
M$P``R<-52(GE2(/L((E][$B)=>!(@WW@`'0&@WWL`W0,OX`Y0`#HF!,``.M^
M2(M%X$B+0"!(B<?HM/?__TB)1?A(BT7X2(G'Z.?Y__^)1?1(BT7X2(G'Z"<4
M``!(BT7@2(M`($B+0"!(B<?H@??__TB)1?A(BT7X2(G'Z+3Y__^)1?!(BT7X
M2(G'Z/03``"+1?0[1?!^![B'.4``ZP6X@#E``$B)Q^@8$P``R<-52(GE2(/L
M((E][$B)=>!(@WW@`'0&@WWL`W0,OX`Y0`#H\!(``.M^2(M%X$B+0"!(B<?H
M#/?__TB)1?A(BT7X2(G'Z#_Y__^)1?1(BT7X2(G'Z'\3``!(BT7@2(M`($B+
M0"!(B<?HV?;__TB)1?A(BT7X2(G'Z`SY__^)1?!(BT7X2(G'Z$P3``"+1?0[
M1?!\![B'.4``ZP6X@#E``$B)Q^AP$@``R<-52(GE2(/L((E][$B)=>!(@WW@
M`'0&@WWL`W0,OX`Y0`#H2!(``.M^2(M%X$B+0"!(B<?H9/;__TB)1?A(BT7X
M2(G'Z)?X__^)1?1(BT7X2(G'Z-<2``!(BT7@2(M`($B+0"!(B<?H,?;__TB)
M1?A(BT7X2(G'Z&3X__^)1?!(BT7X2(G'Z*02``"+1?0[1?!U![B'.4``ZP6X
M@#E``$B)Q^C($0``R<-52(GE2(/L((E][$B)=>!(QT7P`````$B#?>``=`:#
M?>P!?PR_@#E``.B8$0``ZW1(BT7@2(M`($B)1?CK6TB#??``=`Q(BT7P2(G'
MZ#42``!(BT7X2(G'Z)?U__](B47P2(M%\$B+0`A(A<!T'TB+1?!(BT`(OH`Y
M0`!(B<?H)_/__X7`=09(BT7PZQ=(BT7X2(M`($B)1?A(@WWX`'6>2(M%\,G#
M54B)Y4B#["")?>Q(B77@2,=%\`````!(@WW@`'0&@WWL`7\,OX`Y0`#H\A``
M`.MT2(M%X$B+0"!(B47XZUM(@WWP`'0,2(M%\$B)Q^B/$0``2(M%^$B)Q^CQ
M]/__2(E%\$B+1?!(BT`(2(7`=!](BT7P2(M`"+Z`.4``2(G'Z('R__^%P'0&
M2(M%\.L72(M%^$B+0"!(B47X2(-]^`!UGDB+1?#)PU5(B>5(@^P@B7WL2(EU
MX$C'1?@`````2(-]X`!T!H-][`)T#[^`.4``Z$P0``#II````$B+1>!(BT`@
M2(G'Z&7T__](B47X2(M%^$B+0`A(A<!T24B+1?A(BT`(OH`Y0`!(B<?H]?'_
M_X7`=1A(BT7X2(G'Z,$0``"_ASE``.CW#P``ZU)(BT7X2(G'Z*D0``"_@#E`
M`.C?#P``ZSI(BT7X2(L`2(7`=!A(BT7X2(G'Z(40``"_@#E``.B[#P``ZQ9(
MBT7X2(G'Z&T0``"_ASE``.BC#P``R<-52(GE2(/L((E][$B)=>!(QT7X````
M`$B#?>``=`:#?>P"=`R_@#E``.AS#P``ZT=(BT7@2(M`($B)Q^B/\___2(E%
M^$B+1?A(B<?HE?7__X/X`7482(M%^$B)Q^@`$```OX<Y0`#H-@\``.L*OX`Y
M0`#H*@\``,G#54B)Y4B#["")?>Q(B77@2,=%^`````!(QT7P`````$B#?>``
M=`:#?>P"=`^_@#E``.CR#@``Z=T```!(BT7@2(M`($B)Q^@+\___2(E%^$B#
M??@`=0^_@#E``.C(#@``Z;,```!(BT7X2(G'Z/OT__^#^`%_/$B+1?A(BP!(
MA<!T*DB+1?A(B47P2(M%^$B+`$B)1?A(BT7P2,<``````$B+1?!(B<?H/`\`
M`$B+1?CK9DB+1?A(BT`@2,=`&`````!(BT7X2(M`($B)Q^@6#P``2(M%^$C'
M0"``````2(M%^$B+`$B%P'0J2(M%^$B)1?!(BT7X2(L`2(E%^$B+1?!(QP``
M````2(M%\$B)Q^C4#@``2(M%^,G#54B)Y4B#["")?>Q(B77@2,=%^`````!(
MQT7P`````$B#?>``=`:#?>P"=`^_@#E``.C8#0``Z8L```!(BT7@2(M`($B)
MQ^CQ\?__2(E%^$B#??@`=0R_@#E``.BN#0``ZV1(@WWX`'012(M%^$B)Q^C=
M\___@_@!=0R_@#E``.B*#0``ZT!(BT7X2(E%\$B+1?!(BT`@2,=`&`````!(
MBT7X2(M`($B)1?A(BT7P2,=`(`````!(BT7P2(G'Z`P.``!(BT7XR<-52(GE
M2(/L,(E]W$B)==!(QT7X`````$C'1?``````2(-]T`!T!H-]W`-T#[^`.4``
MZ!`-``#IKP```$B+1=!(BT`@2(G'Z"GQ__](B47X2(-]^`!U#[^`.4``Z.8,
M``#IA0```$B+1=!(BT`@2(M`($B)Q^C[\/__2(E%\$B#??``=1A(BT7X2(G'
MZ'8-``"_@#E``.BL#```ZTY(BT7X2(G'Z.+R__^#^`%^(;\`````Z(\,``!(
MB47H2(M%Z$B+5?A(B1!(BT7H2(E%^$B+1?A(BU7P2(E0($B+1?!(BU7X2(E0
M&$B+1?C)PU5(B>5(@^Q`B7W,2(EUP$C'1?@`````2,=%\`````!(QT7H````
M`$C'1>``````2(-]P`!U#[^`.4``Z!H,``#IW````$B+1<!(BT`@2(E%^.FI
M````2(M%^$B)Q^@F\/__2(E%X$B#?>``=1M(BT7P2(G'Z*$,``"_@#E``.C7
M"P``Z9D```!(BT7@2(G'Z`KR__^#^`%^(;\`````Z+<+``!(B4782(M%V$B+
M5>!(B1!(BT782(E%X$B#??``=1)(BT7@2(E%\$B+1>!(B47HZR!(BT7H2(M5
MX$B)4"!(BT7@2(M5Z$B)4!A(BT7@2(E%Z$B+1?A(BT`@2(E%^$B#??@`#X5,
M____2(-]\`!U#+^`.4``Z#\+``#K!$B+1?#)PU5(B>5(@^P02(E]^$B)=?!(
M@WWX``^%^0```$B#??``#X7N````N`$```#I`@$``$B#??``=0JX`````.GQ
M````2(M%^$B+0`A(A<!T#4B+1?!(BT`(2(7`=!I(BT7P2(M`"$B%P'072(M%
M^$B+0`A(A<!U"K@`````Z;,```!(BT7X2(M`"$B%P'0S2(M%\$B+0`A(A<!T
M)DB+1?!(BU`(2(M%^$B+0`A(B=9(B<?H9^S__X7`=`>X`````.MS2(M%^(M0
M$$B+1?"+0!`YPG0'N`````#K6DB+1?!(BQ!(BT7X2(L`2(G62(G'Z`____^%
MP'4'N`````#K-DB+1?A(BT`@2(E%^$B+1?!(BT`@2(E%\$B#??@`#X41____
M2(-]\`!T![@`````ZP6X`0```,G#54B)Y4B#[#")?=Q(B7702,=%^`````!(
MQT7P`````,=%[`````!(@WW0`'0&@WW<`W0,OX`Y0`#HQ@D``.MT2(M%T$B+
M0"!(B<?HXNW__TB)1?A(BT702(M`($B+0"!(B<?HRNW__TB)1?!(BU7P2(M%
M^$B)UDB)Q^A._O__B47L2(M%^$B)Q^@V"@``2(M%\$B)Q^@J"@``@WWL`74'
MN(<Y0`#K!;B`.4``2(G'Z%`)``#)PU5(B>5(@^P@B7WL2(EUX$C'1?@`````
M2,=%\`````!(@WW@`'0,@WWL`GX&@WWL!'X,OX`Y0`#H$@D``.M_2(M%X$B+
M0"!(B<?H+NW__TB)1?A(BT7X2(M`"+Z`.4``2(G'Z,OJ__^%P'4R@WWL`W4&
M2(M%^.M&2(M%^$B)Q^B+"0``2(M%X$B+0"!(BT`@2(M`($B)Q^CA[/__ZR!(
MBT7X2(G'Z&4)``!(BT7@2(M`($B+0"!(B<?HO^S__\G#54B)Y4B#[#")?=R)
M==A(B5702,=%^`````!(QT7H`````$C'1?``````2(-]T`!T!H-]V`)_#[^`
M.4``Z$X(``#IM@```$B+1=!(BT`@2(G'Z&?L__](B47X@WW<`74Q2(M%^$B+
M0`B^@#E``$B)Q^C^Z?__A<!T-TB+1?A(B<?HR@@``+^`.4``Z``(``#K:TB+
M1?A(BT`(OH`Y0`!(B<?HS>G__X7`=09(BT7XZTQ(BT702(M`($B+0"!(B47P
MZR](@WWX`'0,2(M%^$B)Q^AZ"```2(M%\$B)Q^C<Z___2(E%^$B+1?!(BT`@
M2(E%\$B#??``=<I(BT7XR<-52(GE2(/L$(E]_$B)=?!(BU7PBT7\B<:_`0``
M`.C@_O__R<-52(GE2(/L$(E]_$B)=?!(BU7PBT7\B<:_`````.B\_O__R<-5
M2(GE2(/L0(E]S$B)=<!(QT7X`````$C'1?``````2,=%Z`````!(QT7@````
M`$B#?<``=`:#?<P!?P^_@#E``.@#!P``Z>L```!(BT7`2(M`($B)1>CIRP``
M`$B+1>A(BP!(B<?H(NW__XE%W(-]W``/A*X```!(@WWX`'0,2(M%^$B)Q^A^
M!P``2(M%Z$B+`$B)Q^C=ZO__2(E%^$B+1?A(BT`(OH`Y0`!(B<?H>NC__X7`
M=&&#?=P!=09(BT7XZW-(BT7H2(L`2(M`($B)1>#K-TB#??``=`Q(BT7P2(G'
MZ"('``!(QT7P`````$B+1>!(B<?H?.K__TB)1?!(BT7@2(M`($B)1>!(@WW@
M`'7"2(M%\.L>2(M%Z$B+0"!(B47HZP&02(-]Z``/A2K___](BT7XR<-52(GE
M2(/L,(E]W$B)=="#?=P!?P^_@#E``.CR!0``Z=D```!(BT702(M`($B)1=!(
MBT702(G'Z`/J__](B47X2(M%T$B+0"!(B470Z9T```!(BT702(L`2(7`#X2!
M````2(M%T$B+`$B)1>A(@WWH`'1O2(M%Z$B+0`A(A<!T8DB+1?A(BU`(2(M%
MZ$B+0`A(B=9(B<?H6N?__X7`=4-(BT7H2(M`($B)1?#K*$B+1?A(B<?H&`8`
M`$B+1?!(B<?H>NG__TB)1?A(BT7P2(M`($B)1?!(@WWP`'712(M%^.L;2(M%
MT$B+0"!(B4702(-]T``/A5C___](BT7XR<-52(GE2(/L((E][$B)=>!(QT7P
M`````$B#?>``=`:#?>P`?PR_@#E``.CD!```ZUY(BT7@2(M`($B)1?CK14B#
M??``=`Q(BT7P2(G'Z($%``!(BT7X2(G'Z./H__](B47P2(L%'BH@`$B+5?!(
MB=9(B<?HW`L``$B+1?A(BT`@2(E%^$B#??@`=;1(BT7PR<-52(GE2(/L((E]
M[$B)=>!(QT7X`````$B#?>``=`:#?>P!=`R_@#E``.A4!```ZQ2_"@```.A\
MY?__OX`Y0`#H/@0``,G#54B)Y4B#["")?>Q(B77@2(-]X`!T!H-][`)T#+^`
M.4``Z!8$``#K-$B+1>!(BT`@2(G'Z#+H__](B47X2(M%^$B)Q^C\YO__2(E%
M\$B+1?A(B<?HI`0``$B+1?#)PU5(B>5(@^Q`B7W<2(EUT(E5S$C'1?``````
M2,=%Z`````#'1>0`````2(-]T`!T"XM%S(/``3M%W'X,OX`Y0`#HF0,``.MS
M2(M%T$B+0"!(B47XZTN#1>0!2(-]Z`!T#$B+1>A(B<?H,@0``$B+1?A(B<?H
ME.?__TB)1>B+1>0[1<QU$$B+1>A(B<?HIP4``$B)1?!(BT7X2(M`($B)1?A(
M@WWX`'6N2(-]\`!U"$B+1>A(B47P2(M%\,G#54B)Y4B#[!")??Q(B77P2(M-
M\(M%_+H!````2(G.B<?H'____\G#54B)Y4B#[!")??Q(B77P2(M-\(M%_+H"
M````2(G.B<?H^/[__\G#54B)Y4B#[!")??Q(B77P2(M-\(M%_+K_____2(G.
MB<?HT?[__\G#54B)Y4B#[#")?=R)==A(B5702(-]T`!T!H-]V`)_#[^`.4``
MZ(0"``#IW0```$B+1=!(BT`@2(E%Z.FU````2(M%Z$B+0"!(A<!U$+^`.4``
MZ%<"``!(B47PZQ1(BT7H2(M`($B)Q^AOYO__2(E%\(-]W`!U$$B+1>A(B<?H
M6>;__TB)1?B#?=P`=0I(BT7X2(M`".L(2(M%Z$B+0`A(BPV<)R``2(M5\$B)
MQDB)S^B%$```2(D%AB<@`(-]W`!U#$B+1?A(B<?HH`(``$B+1>A(BT`@2(7`
M=0I(QT7H`````.L02(M%Z$B+0"!(BT`@2(E%Z$B#?>@`#X5`____2(M%\$B)
MQ^C[`P``R<-52(GE2(/L$(E]_$B)=?!(BU7PBT7\B<:_`````.C1_O__R<-5
M2(GE2(/L$(E]_$B)=?!(BU7PBT7\B<:_`0```.BM_O__R<-52(GE2(/L,(E]
MW$B)==#'1?3_____2(-]T`!T!H-]W`%_#[^`.4``Z"L!``#ICP```$B+1=!(
MBT`@2(E%^.M>2(M%^$B+0`A(A<!T18-%]`&YA#E``(M5]$B-1>!(B<Y(B<>X
M`````.B?XO__2(M%^$B+2`A(BP5P)B``2(U5X$B)SDB)Q^@&$```2(D%6B8@
M`$B+1?A(BT`@2(E%^$B#??@`=9N#??3_=0R_@#E``.BC````ZPJ+1?2)Q^A(
MY___R<-52(GE2(/L((E][$B)=>!(QT7X`````$B#?>``=`:#?>P#?PR_@#E`
M`.AG````ZV)(BT7@2(M`($B+0`A(A<!U#+^`.4``Z$H```#K14B+1>!(BT`@
M2(M0($B+1>!(BT`@2(M("$B+!<4E(`!(B<Y(B<?HJ@X``$B)!;,E(`!(BT7@
M2(M`($B+0`A(B<?H`P```,G#D%5(B>5(@^P@2(E]Z+\H````Z"[A__](B47X
M2(-]^`!T6TB+1?A(QP``````2(-]Z`!T#DB+1>A(B<?HE>'__^L%N`````!(
MBU7X2(E""$B+1?C'0!``````2(M%^,=`%/____](BT7X2,=`&`````!(BT7X
M2,=`(`````!(BT7XR<-52(GE2(/L$$B)??A(@WWX`'0I2(M%^$B+0`A(A<!T
M$$B+1?A(BT`(2(G'Z.+@__](BT7X2(G'Z-;@___)PU5(B>5(@^P02(E]^$B#
M??@`=$A(BT7X2(L`2(G'Z-[___](BT7X2(M`($B)Q^C.____2(M%^$B+0`A(
MA<!T$$B+1?A(BT`(2(G'Z(7@__](BT7X2(G'Z'G@___)PU5(B>5(B7WX2(EU
M\$B#??``=09(BT7XZR-(BT7P2(M5^$B)4"!(@WWX`'0,2(M%^$B+5?!(B5`8
M2(M%\,G#54B)Y4B)?>A(B77@2(M%Z$B)1?A(@WW@`'4&2(M%Z.M%2(-]Z`!U
M%$B+1>#K.$B+1?A(BT`@2(E%^.L!D$B+1?A(BT`@2(7`=>1(BT7X2(M5X$B)
M4"!(BT7@2(M5^$B)4!A(BT7HR<-52(GE2(/L,$B)?>A(B77@B57<OP````#H
M(/[__TB)1?A(BT7X2(M5X$B)$$B+1?B+5=R)4!!(BU7X2(M%Z$B)UDB)Q^A/
M____R<-52(GE2(/L,$B)?>A(B77@B57<2(M%X$B)Q^C3_?__2(E%^$B#??@`
M=!](BT7XBU7<B5`02(M5^$B+1>A(B=9(B<?H!O___^L`R<-52(GE2(/L($B)
M?>A(@WWH`'4'N`````#K8TB+1>A(BT`(2(G'Z'W]__](B47X2(M%Z$B+`$B)
MQ^C#____2(M5^$B)`DB+1>A(BT`@2(G'Z*S___](BU7X2(E"($B+1?A(BT`@
M2(7`=!!(BT7X2(M`($B+5?A(B5`82(M%^,G#54B)Y4B#[!!(B7WX2(-]^`!T
M+$B+1?C'0!3_____2(M%^$B+`$B)Q^C3____2(M%^$B+0"!(B<?HP____^L!
MD,G#54B)Y4B#["!(B7WX2(EU\(E5[$B#??``=&E(@WWX`'59ZV%(BT7X2(M`
M"$B%P'0E2(M%^$B+0`A(BU7P2(G62(G'Z(/>__^%P'4*2(M%^(M5[(E0%$B+
M1?A(BP"+5>Q(BTWP2(G.2(G'Z)+___](BT7X2(M`($B)1?A(@WWX`'6BZP&0
MR<-52(GE2(/L($B)??B)=?1(B57H2(-]^``/A-L```!(@WWH``^%PP```.G,
M````2(M%^(M`%#M%]`^%B@```$B+1?A(BT`(2(7`=!Q(BT7X2(M`"$B)Q^B9
MW?__2(M%^$C'0`@`````2(M%Z$B+0"!(A<!U#$B+1>A(BP!(A<!T($B+1>A(
MB<?H+?[__TB+5?A(B0)(BT7XQT`0`0```.LH2(M%Z$B+0`A(A<!T&TB+1>A(
MBT`(2(G'Z'?=__](B<)(BT7X2(E0"$B+1?A(BP!(BU7HBTWTB<Y(B<?H(/__
M_TB+1?A(BT`@2(E%^$B#??@`#X4W____ZP&0R<-52(GE4TB#["A(B7W8B774
M2(M%V$B)1>#IB0```$B+1>!(BT`(2(7`=%G'1>P`````ZPZ_(````.A;W/__
M@T7L`8M%[#M%U'SJ2(M%X(M`$(/X`74'N(DY0`#K!;B0.4``2(M5X$B+6@BY
MD3E``$B)PDB)WDB)S[@`````Z/?;___K%XM%U(U0!$B+1>!(BP")UDB)Q^AF
M____2(M%X$B+0"!(B47@2(-]X``/A6S___](@\0H6\G#54B)Y5-(@^PX2(E]
MR(EUQ$B+1<A(B47@Z?<```#'1>P`````ZPZ_(````.BPV___@T7L`8M%[#M%
MQ'SJ2(M%X$B+0`A(A<!T/4B+1>"+0!"#^`%U![B).4``ZP6XD#E``$B+5>!(
MBUH(N9$Y0`!(B<)(B=Y(B<^X`````.@_V___Z8(```!(BT7@2(L`2(G'Z!_=
M__](B4782(M%X(M`$(7`=`>XF#E``.L%N)`Y0`"ZH#E``$B)QDB)U[@`````
MZ/O:__](BP54'R``2(M5V$B)UDB)Q^@2`0``OPH```#H^]K__TB+1=A(B<?H
M>_K__XM%Q(U0!$B+1>!(BP")UDB)Q^A`_O__2(M%X$B+0"!(B47@2(-]X``/
MA?[^__](@\0X6\G#54B)Y4B#["!(B7WHB77D2(M%Z$B)1?A(QT7P`````.F,
M````2(M%^$B+`$B%P'1TOPH```#H@-K__TB+1?A(BQ!(BP6R'B``2(G62(G'
MZ'0```"XICE``$B)Q[@`````Z#7:__](BT7X2(L`2(G'Z!K<__](B47P2(L%
M>QX@`$B+5?!(B=9(B<?H.0```$B+1?!(B<?HK/G__[\*````Z!;:__](BT7X
M2(M`($B)1?A(@WWX``^%:?___[^L.4``Z.79___)PU5(B>532(/L*$B)?=A(
MB7702(M%T$B)1>C'1>0`````2(-]T``/A-P```!(BT782(G&OR@```#H!]K_
M_^FH````2(M%Z$B+0`A(A<!T.DB+1>A(BU`(@WWD`'0'N+0Y0`#K!;B0.4``
MOK8Y0`!(BUW82(G12(G"2(G?N`````#H3]K__X-%Y`%(BT7H2(L`2(7`=$E(
MBT7HBT`0A<!T![B[.4``ZP6XD#E``+N].4``2(M-V$B)PDB)WDB)S[@`````
MZ`S:__](BT7H2(L02(M%V$B)UDB)Q^@C____2(M%Z$B+0"!(B47H2(-]Z``/
MA4W___](BT782(G&ORD```#H/MG__^L!D$B#Q"A;R<-52(GE2(/L$(E]_$B+
M%2H=(`"+1?Q(B=:)Q^@%V?__R<-52(GE2(L%$!T@`$B)Q^@@V?__R<-52(GE
M2(/L,(E]W$B)==!(QT7P`````+_(.4``Z'W8__^_`#I``.ASV/__@WW<`7\N
M2(L%IAP@`$B)PK@@.D``2(G1NB4```"^`0```$B)Q^@IV?__N$````#I:@$`
M`,=%_`````#I2@$``(M%_$B82(/``4C!X`-(`T702(L0N$8Z0`"+3?R)SDB)
MQ[@`````Z/C7__^Z6CI``(M%_$B82(/``4C!X`-(`T702(L`2(G62(G'Z!38
M__](B05%'"``2(L%/AP@`$B%P'4UBT7\2)A(@\`!2,'@`T@#1=!(BQ"Y7#I`
M`$B+!?$;(`!(B<Y(B<>X`````.B1V/__Z:\```#'1>P`````2(U5[$B+1?!(
MB=%(B<*^/"]``+]=+T``Z*@```!(B47P2(L%U1L@`$B)Q^@UV/__2,<%PAL@
M``````!(BT7PO@````!(B<?HG_S__TB+1?!(B<?HV?;__[]X.D``Z#/7__](
MBP6<&R``2(G'Z&P&``!(BP6-&R``2(G'Z+'V__^_@SI``.@+U___2(L%?!L@
M`$B)Q^A$!@``2(L%;1L@`$B)Q^B)]O__@T7\`8M%W(/H`3M%_`^/I_[__[@`
M````R<.0D)!52(GE4TB#[$A(B7W(2(EUP$B)5;A(B4VP2,=%X`````#'1=P`
M````QT7L`````$B#?<@`=`=(@WW``'4.N`````#IV0```)#K`9!(C57<2(M-
MP$B+1<A(B<Y(B<?HQ0```$B)1>"+1=R#^`9WV8G`2(L$Q9`Z0`#_X,=%[`$`
M``#IE0```$B+5;!(BUW`2(M%R$B)T;H`````2(G>2(G'Z%O___](B<&+5>Q(
MBT6X2(G.2(G'Z+7V__](B46XQT7L`````.M4QT7L`````$B+1;"+`(U0`4B+
M1;")$.L\BU7L2(M-X$B+1;A(B<Y(B<?HQ?;__TB)1;A(BT7@2(G'Z#O6___'
M1>P`````ZPW'1>P`````2(M%N.L%Z2O___](@\1(6\G#54B)Y4B![+````!(
MB;UH____2(FU8/___TB)E5C____'1?P`````QT7T`````$B+A5C____'``8`
M``!(@[UH____`'0*2(.]8/___P!U'DB+A5C____'``8```"X`````.E``@``
MD.L$D.L!D$B+A6C_____T(E%^(-]^"-T!H-]^#MU$DB+A6C_____T(E%^(-]
M^`IU[H-]^"AT*H-]^"ET)(-]^`IT'H-]^")T&(-]^"=T$H-]^/]T#(-]^"U_
M!H-]^'I_GX-]^"!TG(-]^`ETF8-]^"AU%TB+A5C____'``(```"X`````.FV
M`0``@WWX*7472(N%6/___\<``0```+@`````Z9D!``"#??@G=1=(BX58____
MQP`$````N`````#I?`$``(-]^`IU%TB+A5C____'``,```"X`````.E?`0``
M@WWX_W472(N%6/___\<`!@```+@`````Z4(!``"#??@B=1/'1?0!````2(N%
M:/_____0B47XBT7XB<*+1?R(E`5P____@T7\`8-]]``/A9\```"#??@I="Z#
M??@H="B#??@[="*#??@C=!R#??@@=!:#??@*=!"#??@-=`J#??C_#X7'````
MBT7X2(N58/___XG'_]*+1?R#Z`&)P,:$!7#___\`2(V%</___[[(.D``2(G'
MZ&G4__^%P'472(N%6/___\<`!````+@`````Z8L```!(BX58____QP`%````
M2(V%</___TB)Q^@BU/__ZVV+1?B#^`IT&(/X"G\'@_C_=`[K2(/X#70'@_@B
M=!#K/(M%^$B+E6#___^)Q__2BT7\@^@!B<#&A`5P____`$B+A5C____'``4`
M``!(C85P____2(G'Z,;3___K$4B+A6C_____T(E%^.G7_O__R<.054B)Y4B#
M["!(B7WH2(EUX$B+1>A(B47X2(-]Z`!T!TB#?>``=32X`````.LY2(M%^$B+
M4`A(BT7@2(G62(G'Z'S3__^%P'4&2(M%^.L82(M%^$B+0"!(B47X2(-]^`!U
MS+@`````R<-52(GE2(/L,$B)?>A(B77@2(E5V$B#?>``=`=(@WW8`'4)2(M%
MZ.F`````2(M5X$B+1>A(B=9(B<?H6O___TB)1?A(@WWX`'0D2(M%^$B+`$B)
MQ^C<\?__2(M%V$B)Q^AI\___2(M5^$B)`NLZ2(M%X$B)Q^C[\/__2(E%^$B+
M1=A(B<?H1//__TB+5?A(B0)(BU7X2(M%Z$B)UDB)Q^CN\?__2(E%Z$B+1>C)
MPU5(B>5(@^PP2(E]Z$B)=>!(B5782(-]X`!T!TB#?=@`=09(BT7HZSM(BT78
M2(G'Z)/P__](B47X2(M5^$B+3>!(BT7H2(G.2(G'Z`3___](B47H2(M%^$B)
MQ^@H\?__2(M%Z,G#54B)Y4B#["!(B7WH2(EUX$B+5>!(BT7H2(G62(G'Z&/^
M__](B47X2(-]^`!T%4B+1?A(BP!(A<!T"4B+1?A(BP#K!;@`````R<-52(GE
M2(/L($B)?>A(B77@2(M5X$B+1>A(B=9(B<?H&?[__TB)1?A(@WWX`'1*2(M%
M^$B+`$B%P'0^2(M%^$B+`$B+0`A(A<!T+DB+1?A(BP!(B<>X`````.C^U?__
M@_@!=15(BT7X2(L`2(M`"$B)Q^AVT?__ZPJ_SCI``.AJT?__R<-52(GE2(/L
M($B)?>A(BT7H2(E%^.ME2(M%^$B+`$B%P'1-2(M%^$B+0`A(A<!T0$B+1?A(
MBU`(N-$Z0`!(B=9(B<>X`````.A<T/__2(M%^$B+$$B+!:X4(`!(B=9(B<?H
M</;__[\*````Z%G0__](BT7X2(M`($B)1?A(@WWX`'64R<.0D)"02(EL)-A,
MB60DX$B-+2,/(`!,C24<#R``3(EL).A,B70D\$R)?"3X2(E<)-!(@^PX3"GE
M08G]28GV2,']`TF)U^BSS___2(7M=!PQVP\?0`!,B?I,B?9$B>]!_Q3<2(/#
M`4@YZW+J2(M<)`A(BVPD$$R+9"083(ML)"!,BW0D*$R+?"0P2(/$.,,/'X``
M````\\.0D)"0D)"0D)"0D)"0D%5(B>532(/L"$B+!8@.(`!(@_C_=!F[&$=@
M``\?1```2(/K"/_02(L#2(/X_W7Q2(/$"%O)PY"02(/L".B?T/__2(/$",,`
M``$``@`K`"T`*@`O`#$K`#$M`"4`/``\/0`^`#X]`#T`86YD`&]R`&YO=`!N
M=6QL`&%T;VT`8V%R`&-D<@!C;VYS`&QI<W0`97%U86P`:68`=6YL97-S`'=H
M96X`8V]N9`!S96QE8W0`<')I;F,`=&5R<')I`&5V86P`<')O9S$`<')O9S(`
M<')O9VX`<V5T`'-E='$`<V5T9@!E;G5M`&1E9G5N`&=C`&=A<F)A9V4M8V]L
M;&5C=`!.24P`)60`5`!Q=6]T960``"5S("5S"@!Q=6]T960@`$(Z("5S``H]
M/3X@`#T]/3T]/3T`(``E<R5S`"<`("5S``````````!L:71H<"!S86UP;&4@
M97AE8W5T86)L92!B>2!J<VPN;&ET:'!`86)S>6YT:"YC;VT``````````%9E
M<G-I;VX@,"XV(#(P,#$M,3`M,38@(D)A;&]O(@``15)23U(Z(%EO=2!M=7-T
M('-P96-I9GD@82`N;'-P(&9I;&4A"@`]/3T]($9I;&4@)3`R9#H@)7,*`'(`
M15)23U(Z($-O=6QD;B=T(&]P96X@(B5S(BX*`%9A<FEA8FQE<SH`9&5F=6XG
M<SH``````(HQ0```````3C)```````#&,4````````<R0```````NC%`````
M```?,D```````$XR0```````<75O=&4`+3$`)7,@"0````$;`SML`@``3```
M`!S/__^(`@``0M#__[`"```HT?__T`(``%C2___X`@``A=+__Q@#``#%TO__
M.`,``/K2__]8`P``%=/__W@#``#DT___F`,``#?4__^X`P``S=3__]@#```8
MU?__^`,``)K5__\8!````-;__S@$``!FUO__6`0```;7__]X!```KM?__Y@$
M``!6V/__N`0``/[8___8!```IMG___@$``!.VO__&`4``/3:__\X!0``FMO_
M_U@%``!SW/__>`4``.S<__^8!0``!M[__[@%``#.WO__V`4``+K?___X!0``
MW>#__Q@&```1XO__.`8``,;B__]8!@``A>/__W@&``"#Y/__F`8``*?D__^X
M!@``R^3__]@&```#YO__^`8```+G__\8!P``DN?__S@'``#8Y___6`<``#;H
M__]X!P``\NC__Y@'```9Z?__N`<``$#I___8!P``9^G___@'``!TZO__&`@`
M`)CJ__\X"```O.K__U@(``!_Z___>`@``!3L__^8"```ENS__[@(``#4[/__
MV`@``#'M___X"```;^W__Q@)``#7[?__.`D``"+N__]8"0``;>[__W@)``#L
M[O__F`D``"[O__^X"0``M.___]@)``"P\/__^`D``&CQ__\@"@``CO+__T@*
M``!5\___:`H``&3T__^0"@``A?3__[`*``":]/__T`H``&CV___P"@``C_?_
M_Q@+```X^O__.`L``*#Z__]8"P``3?O__W@+``"R^___F`L``/S[__^X"P``
M@/S__]@+```(_?__^`L``)C]__\@#````````!0``````````7I2``%X$`$;
M#`<(D`$``"0````<````C,S__R8!````00X00X8"#097@P,#"@$,!P@`````
M```<````1````(K-___F`````$$.$$.&`@T&`N$,!P@``"0```!D````4,[_
M_S`!````00X00X8"#094@P,#%P$,!P@````````<````C````%C/__\M````
M`$$.$$.&`@T&:`P'"````!P```"L````9<___T``````00X00X8"#09[#`<(
M````'````,P```"%S___-0````!!#A!#A@(-!G`,!P@````<````[````)K/
M__\;`````$$.$$.&`@T&5@P'"````!P````,`0``E<___\\`````00X00X8"
M#08"R@P'"```'````"P!``!$T/__4P````!!#A!#A@(-!@).#`<(```<````
M3`$``'?0__^6`````$$.$$.&`@T&`I$,!P@``!P```!L`0``[=#__TL`````
M00X00X8"#08"1@P'"```'````(P!```8T?__@@````!!#A!#A@(-!@)]#`<(
M```<````K`$``'K1__]F`````$$.$$.&`@T&`F$,!P@``!P```#,`0``P-'_
M_V8`````00X00X8"#08"80P'"```'````.P!```&TO__H`````!!#A!#A@(-
M!@*;#`<(```<````#`(``(;2__^H`````$$.$$.&`@T&`J,,!P@``!P````L
M`@``#M/__Z@`````00X00X8"#08"HPP'"```'````$P"``"6T___J`````!!
M#A!#A@(-!@*C#`<(```<````;`(``![4__^H`````$$.$$.&`@T&`J,,!P@`
M`!P```",`@``IM3__Z@`````00X00X8"#08"HPP'"```'````*P"```NU?__
MI@````!!#A!#A@(-!@*A#`<(```<````S`(``+35__^F`````$$.$$.&`@T&
M`J$,!P@``!P```#L`@``.M;__]D`````00X00X8"#08"U`P'"```'`````P#
M``#SUO__>0````!!#A!#A@(-!@)T#`<(```<````+`,``$S7__\:`0```$$.
M$$.&`@T&`Q4!#`<(`!P```!,`P``1MC__\@`````00X00X8"#08"PPP'"```
M'````&P#``#NV/__[`````!!#A!#A@(-!@+G#`<(```<````C`,``+K9__\C
M`0```$$.$$.&`@T&`QX!#`<(`!P```"L`P``O=K__S0!````00X00X8"#08#
M+P$,!P@`'````,P#``#1V___M0````!!#A!#A@(-!@*P#`<(```<````[`,`
M`&;<__^_`````$$.$$.&`@T&`KH,!P@``!P````,!```!=W___X`````00X0
M0X8"#08"^0P'"```'````"P$``#CW?__)`````!!#A!#A@(-!E\,!P@````<
M````3`0``.?=__\D`````$$.$$.&`@T&7PP'"````!P```!L!```Z]W__S@!
M````00X00X8"#08#,P$,!P@`'````(P$```#W____P````!!#A!#A@(-!@+Z
M#`<(```<````K`0``.+?__^0`````$$.$$.&`@T&`HL,!P@``!P```#,!```
M4N#__T8`````00X00X8"#08"00P'"```'````.P$``!XX/__7@````!!#A!#
MA@(-!@)9#`<(```<````#`4``+;@__^\`````$$.$$.&`@T&`K<,!P@``!P`
M```L!0``4N'__R<`````00X00X8"#09B#`<(````'````$P%``!9X?__)P``
M``!!#A!#A@(-!F(,!P@````<````;`4``&#A__\G`````$$.$$.&`@T&8@P'
M"````!P```",!0``9^'__PT!````00X00X8"#08#"`$,!P@`'````*P%``!4
MXO__)`````!!#A!#A@(-!E\,!P@````<````S`4``%CB__\D`````$$.$$.&
M`@T&7PP'"````!P```#L!0``7.+__\,`````00X00X8"#08"O@P'"```'```
M``P&``#_XO__E`````!!#A!#A@(-!@*/#`<(```<````+`8``'3C__^"````
M`$$.$$.&`@T&`GT,!P@``!P```!,!@``UN/__SX`````00X00X8"#09Y#`<(
M````'````&P&``#TX___70````!!#A!#A@(-!@)8#`<(```<````C`8``#'D
M__\^`````$$.$$.&`@T&>0P'"````!P```"L!@``3^3__V@`````00X00X8"
M#08"8PP'"```'````,P&``"7Y/__2P````!!#A!#A@(-!@)&#`<(```<````
M[`8``,+D__]+`````$$.$$.&`@T&`D8,!P@``!P````,!P``[>3__W\`````
M00X00X8"#08">@P'"```'````"P'``!,Y?__0@````!!#A!#A@(-!GT,!P@`
M```<````3`<``&[E__^&`````$$.$$.&`@T&`H$,!P@``!P```!L!P``U.7_
M__P`````00X00X8"#08"]PP'"```)````(P'``"PYO__N`````!!#A!#A@(-
M!EF#`P*:#`<(`````````"0```"T!P``0.?__R8!````00X00X8"#099@P,#
M"`$,!P@````````<````W`<``#[H___'`````$$.$$.&`@T&`L(,!P@``"0`
M``#\!P``Y>C__P\!````00X00X8"#09G@P,"XPP'"``````````<````)`@`
M`,SI__\A`````$$.$$.&`@T&7`P'"````!P```!$"```S>G__Q4`````00X0
M0X8"#090#`<(````'````&0(``#"Z?__RP$```!!#A!#A@(-!@/&`0P'"``D
M````A`@``'#K__\G`0```$$.$$.&`@T&<H,#`O`,!P@`````````'````*P(
M``!O[/__J`(```!!#A!#A@(-!@.C`@P'"``<````S`@``/CN__]H`````$$.
M$$.&`@T&`F,,!P@``!P```#L"```0.___ZT`````00X00X8"#08"J`P'"```
M'`````P)``#-[___90````!!#A!#A@(-!@)@#`<(```<````+`D``!+P__]*
M`````$$.$$.&`@T&`D4,!P@``!P```!,"0``//#__X0`````00X00X8"#08"
M?PP'"```'````&P)``"@\/__A`````!!#A!#A@(-!@)_#`<(```D````C`D`
M``CQ__^)`````%&,!88&7PY`1H,'CP*.`XT$`E(."```%````+0)``!P\?__
M`@````````````````````````#__________P``````````__________\`
M`````````````````````0`````````0``````````P`````````V`=`````
M```-`````````+@X0```````!`````````!``D```````/7^_V\`````X`)`
M```````%```````````%0```````!@`````````(`T````````H`````````
MK``````````+`````````!@`````````%0````````````````````,`````
M````Z$A@```````"`````````)@!````````%``````````'`````````!<`
M````````0`9````````'`````````/@%0```````"`````````!(````````
M``D`````````&`````````#^__]O`````-@%0```````____;P`````!````
M`````/#__V\`````K`5`````````````````````````````````````````
M````````````````````````````````````````````````````````````
M`````````````````````````````````````````````$!'8```````````
M``````````````````8(0```````%@A````````F"$```````#8(0```````
M1@A```````!6"$```````&8(0```````=@A```````"&"$```````)8(0```
M````I@A```````"V"$```````,8(0```````U@A```````#F"$```````/8(
M0```````!@E`````````````````````````````````````````````````
M`````````````````````````````````,PX0```````O`Y```````#..$``
M``````\/0```````T#A```````"E#T```````-(X0```````\`]```````#4
M.$```````'(00```````USA```````#8$$```````-HX0```````/A%`````
M``#<.$```````-X10```````WCA```````"&$D```````.$X0```````+A-`
M``````#C.$```````-830```````YCA```````!^%$```````.@X0```````
M)A5```````#L.$```````,P50```````[SA```````!R%D```````/,X0```
M````<A9```````#X.$```````$L70```````_3A```````#$%T````````$Y
M0```````WAA````````%.4```````*890```````"CE```````"2&D``````
M``\Y0```````Z1Q````````5.4```````)X=0```````&#E```````!;'T``
M`````!\Y0```````?Q]````````D.4```````*,?0```````*3E```````#;
M($```````#`Y0```````VB%````````V.4```````&HB0```````/3E`````
M``"P(D```````$(Y0```````RB-```````!(.4```````/$C0```````3CE`
M```````8)$```````%0Y0```````3"5```````!8.4```````'`E0```````
M73E```````!P)4```````&(Y0```````E"5```````!G.4```````%<F0```
M````;3E```````#2#4```````'`Y0```````T@U`````````````````````
M````````1T-#.B`H1TY5*2`T+C4N,"`R,#$P,#8Q,"`H<')E<F5L96%S92D`
M1T-#.B`H1TY5*2`T+C4N,0``+G-Y;71A8@`N<W1R=&%B`"YS:'-T<G1A8@`N
M:6YT97)P`"YN;W1E+D%"22UT86<`+F=N=2YH87-H`"YD>6YS>6T`+F1Y;G-T
M<@`N9VYU+G9E<G-I;VX`+F=N=2YV97)S:6]N7W(`+G)E;&$N9'EN`"YR96QA
M+G!L=``N:6YI=``N=&5X=``N9FEN:0`N<F]D871A`"YE:%]F<F%M95]H9'(`
M+F5H7V9R86UE`"YC=&]R<P`N9'1O<G,`+FIC<@`N9'EN86UI8P`N9V]T`"YG
M;W0N<&QT`"YD871A`"YB<W,`+F-O;6UE;G0`````````````````````````
M````````````````````````````````````````````````````````````
M````````&P````$````"```````````"0`````````(````````:````````
M`````````````0```````````````````",````'`````@`````````<`D``
M`````!P"````````(`````````````````````0````````````````````U
M````!0````(`````````0`)```````!``@```````*``````````!0``````
M```(``````````0`````````,0```/;__V\"`````````.`"0```````X`(`
M```````H``````````4`````````"````````````````````#L````+````
M`@`````````(`T````````@#````````^`$````````&`````0````@`````
M````&`````````!#`````P````(```````````5`````````!0```````*P`
M```````````````````!````````````````````2P```/___V\"````````
M`*P%0```````K`4````````J``````````4``````````@`````````"````
M`````%@```#^__]O`@````````#8!4```````-@%````````(``````````&
M`````0````@```````````````````!G````!`````(`````````^`5`````
M``#X!0```````$@`````````!0`````````(`````````!@`````````<0``
M``0````"`````````$`&0```````0`8```````"8`0````````4````,````
M"``````````8`````````'L````!````!@````````#8!T```````-@'````
M````&`````````````````````0```````````````````!V`````0````8`
M````````\`=```````#P!P```````"`!```````````````````$````````
M`!``````````@0````$````&`````````!`)0```````$`D```````"H+P``
M````````````````$````````````````````(<````!````!@````````"X
M.$```````+@X````````#@````````````````````0`````````````````
M``"-`````0````(`````````R#A```````#(.`````````X"````````````
M```````(````````````````````E0````$````"`````````-@Z0```````
MV#H```````!L`@``````````````````!````````````````````*,````!
M`````@````````!(/4```````$@]````````S`D```````````````````@`
M``````````````````"M`````0````,`````````&$=@```````81P``````
M`!`````````````````````(````````````````````M`````$````#````
M`````"A'8```````*$<````````0````````````````````"```````````
M`````````+L````!`````P`````````X1V```````#A'````````"```````
M``````````````@```````````````````#`````!@````,`````````0$=@
M``````!`1P```````*`!````````!@`````````(`````````!``````````
MR0````$````#`````````.!(8```````X$@````````(````````````````
M````"``````````(`````````,X````!`````P````````#H2&```````.A(
M````````H`````````````````````@`````````"`````````#7`````0``
M``,`````````H$E@``````"@20```````+`"```````````````````@````
M````````````````W0````@````#`````````%!,8```````4$P```````!`
M````````````````````$````````````````````.(````!````,```````
M`````````````%!,````````.`````````````````````$``````````0``
M```````1`````P````````````````````````"(3````````.L`````````
M```````````!`````````````````````0````(`````````````````````
M````^%0```````!X#P```````!T````U````"``````````8``````````D`
M```#`````````````````````````'!D````````9P<`````````````````
M``$`````````````````````````````````````````````````````````
M`P`!```"0````````````````````````P`"`!P"0```````````````````
M`````P`#`$`"0````````````````````````P`$`.`"0```````````````
M`````````P`%``@#0````````````````````````P`&```%0```````````
M`````````````P`'`*P%0````````````````````````P`(`-@%0```````
M`````````````````P`)`/@%0````````````````````````P`*`$`&0```
M`````````````````````P`+`-@'0````````````````````````P`,`/`'
M0````````````````````````P`-`!`)0````````````````````````P`.
M`+@X0````````````````````````P`/`,@X0```````````````````````
M`P`0`-@Z0````````````````````````P`1`$@]0```````````````````
M`````P`2`!A'8````````````````````````P`3`"A'8```````````````
M`````````P`4`#A'8````````````````````````P`5`$!'8```````````
M`````````````P`6`.!(8````````````````````````P`7`.A(8```````
M`````````````````P`8`*!)8````````````````````````P`9`%!,8```
M`````````````````````P`:```````````````````````!````!`#Q_P``
M```````````````````(````!`#Q_P`````````````````````3`````@`-
M`#P)0``````````````````C````!`#Q_P`````````````````````N````
M`0`2`!A'8``````````````````\`````0`3`"A'8`````````````````!*
M`````0`4`#A'8`````````````````!7`````@`-`&`)0```````````````
M``!M`````0`9`&A,8````````0````````!\`````0`9`'!,8```````"```
M``````"*`````@`-`-`)0``````````````````C````!`#Q_P``````````
M``````````"6`````0`2`"!'8`````````````````"C`````0`1`!!'0```
M``````````````"Q`````0`4`#A'8`````````````````"]`````@`-`(`X
M0``````````````````(````!`#Q_P````````````````````#3````!`#Q
M_P````````````````````#:````!`#Q_P````````````````````#B````
M!`#Q_P````````````````````#I````!`#Q_P````````````````````#R
M````!`#Q_P````````````````````#Y`````0(7`.A(8```````````````
M```/`0````(2`!1'8``````````````````@`0````(2`!1'8```````````
M```````S`0```0(5`$!'8``````````````````\`0``$@`-`)X=0```````
MOP````````!'`0``(``8`*!)8`````````````````!2`0``$@`-`.PF0```
M````@@````````!8`0``$@`-`.T-0```````SP````````!I`0``$@``````
M``````````````````!]`0``$@`-`'`X0````````@````````"-`0``$@`-
M`,P50```````I@````````"8`0``$@`-`!`)0`````````````````"?`0``
M$@`-`-@00```````9@````````"P`0``$@`-`$PE0```````)`````````"\
M`0``$@`-`*,?0```````.`$```````#)`0``$@`-`#PO0```````(0``````
M``#2`0``$@`-`"X30```````J`````````#=`0``$@`-`*PG0```````70``
M``````#D`0``(`````````````````````````#S`0``(```````````````
M```````````'`@``$@`````````````````````````9`@``$@`-`!H+0```
M````Y@`````````F`@``$@`-`"TN0```````#P$````````U`@``$@`.`+@X
M0``````````````````[`@``$@`-`(HV0```````2@````````!'`@``$@``
M``````````````````````!<`@``$@`-`%T>0```````_@````````!V`@``
M$@`-`$<H0```````:`````````"``@``$@`-`&HB0```````1@````````"/
M`@``$@`-`-X80```````R`````````";`@``$@``````````````````````
M``"O`@``$@````````````````````````#"`@``$@``````````````````
M``````#A`@``$@`-`&<R0```````J`(```````#L`@``$@`-`#`-0```````
M+0````````#W`@``$@`-`*890```````[``````````$`P``$@`-`%<F0```
M````E``````````2`P``$@`-`/HH0```````2P`````````C`P``$0`8`,!)
M8```````D`(````````M`P``$@`-`)T-0```````-0`````````]`P``$0`/
M`,@X0```````!`````````!,`P``$@````````````````````````!@`P``
M$@````````````````````````!S`P``$@````````````````````````"%
M`P``$@````````````````````````";`P``$0`9`(!,8```````"```````
M``"G`P``$``8`*!)8`````````````````"T`P``$@`-`'(60```````V0``
M``````#``P``$@`-`"850```````I@````````#,`P``$@`-`/`/0```````
M@@````````#;`P``$0`9`'A,8```````"`````````#>`P``$@`-`'`E0```
M````)`````````#K`P``$@`-`!`U0```````:`````````#X`P``$@``````
M```````````````````-!```$@`-`-(-0```````&P`````````=!```$@`-
M`,HC0```````)P`````````K!```$@`-`(PJ0```````_``````````X!```
M$@`-`+`B0```````7@````````!%!```$@`-`$L70```````>0````````!2
M!```$@`-`%L?0```````)`````````!A!```$@`-`)0E0```````PP``````
M``!N!```$@`-`%T-0```````0`````````!^!```$@`-`$4I0```````?P``
M``````"$!```$@`-`+4;0```````-`$```````"7!```$@`-`(@K0```````
MN`````````">!```$@`-```,0```````,`$```````"L!```$@`-`-830```
M````J`````````"Z!```$0(8`*A)8`````````````````#'!```$@`-`/0)
M0```````)@$```````#6!```$@`-`-HA0```````D`````````#D!```$0(3
M`#!'8`````````````````#Q!```$@`-`%@W0```````A`````````#^!```
M$@`-`.`W0```````B0`````````.!0``$@`````````````````````````@
M!0``$@`-`,0I0```````0@`````````K!0``$@`-`(820```````J```````
M```Y!0``$@`-`'(00```````9@````````!)!0``$@`-`*\H0```````2P``
M``````!<!0``$@`-`%TO0```````%0````````!C!0``$@`-`'X40```````
MJ`````````!R!0``$@`-`$`L0```````)@$```````"!!0``$@``````````
M``````````````"5!0``$`#Q_U!,8`````````````````"A!0``$@`-`.D<
M0```````M0````````"O!0``$@`-`,070```````&@$```````"[!0``$@`-
M`/$C0```````)P````````#)!0``$@`-`"4V0```````90````````#;!0``
M$@`-`+P.0```````4P````````#G!0``$@````````````````````````#[
M!0``$@`-`'\?0```````)``````````(!@``$@`-`&XG0```````/@``````
M```1!@``$@`-``XC0```````O``````````>!@``$@`-`-L@0```````_P``
M```````M!@``$@`-`#X10```````H``````````]!@``$`#Q_Y!,8```````
M``````````!"!@``$@````````````````````````!6!@``$@`-`'@U0```
M````K0````````!B!@``$0`9`(A,8```````"`````````!L!@``$@`-`*4/
M0```````2P````````!]!@``$@`-`-0V0```````A`````````"/!@``$0`9
M`%!,8```````"`````````"C!@``$@````````````````````````"W!@``
M$@`-`-X10```````J`````````#"!@``$@`-``DH0```````/@````````#,
M!@``$@`-`)(:0```````(P$```````#9!@``$@`-``8J0```````A@``````
M``#C!@``$`#Q_U!,8`````````````````#J!@``$@``````````````````
M``````#_!@``$@`-`!@D0```````)P`````````-!P``$@`-``\/0```````
ME@`````````>!P``$@`-`$`Q0```````)P$````````J!P``$@`-`#\D0```
M````#0$````````]!P``$@`-`&8M0```````QP````````!(!P``$0`9`&!,
M8```````"`````````!<!P``$@`-`'(O0```````RP$```````!A!P``$@`+
M`-@'0```````````````````:6YI="YC`&EN:71F:6YI+F,`8V%L;%]G;6]N
M7W-T87)T`&-R='-T=69F+F,`7U]#5$]27TQ)4U1?7P!?7T143U)?3$E35%]?
M`%]?2D-27TQ)4U1?7P!?7V1O7V=L;V)A;%]D=&]R<U]A=7@`8V]M<&QE=&5D
M+C4X,S``9'1O<E]I9'@N-3@S,@!F<F%M95]D=6UM>0!?7T-43U)?14Y$7U\`
M7U]&4D%-15]%3D1?7P!?7TI#4E]%3D1?7P!?7V1O7V=L;V)A;%]C=&]R<U]A
M=7@`979A;"YC`&QI<W1S+F,`;6%I;BYC`'!A<G-E<BYC`'9A<G,N8P!?1TQ/
M0D%,7T]&1E-%5%]404),15\`7U]I;FET7V%R<F%Y7V5N9`!?7VEN:71?87)R
M87E?<W1A<G0`7T193D%-24,`979A;%]C8E]I9@!D871A7W-T87)T`&QE3F5W
M`&5V86Q?8W5M95]H96QP97(`<')I;G1F0$!'3$E"0U\R+C(N-0!?7VQI8F-?
M8W-U7V9I;FD`979A;%]C8E]O<@!?<W1A<G0`979A;%]C8E]O;F5M:6YU<P!E
M=F%L7V-B7W-E=`!E=F%L7V-B7V-O;F0`;7EU;F=E=&,`979A;%]C8E]G=`!L
M95=I<&4`7U]G;6]N7W-T87)T7U\`7TIV7U)E9VES=&5R0VQA<W-E<P!P=71S
M0$!'3$E"0U\R+C(N-0!E=F%L=6%T94YO9&4`;&5$=6UP4F5F;W)M870`7V9I
M;FD`=F%R:6%B;&5'970`<'5T8VAA<D!`1TQ)0D-?,BXR+C4`979A;%]C8E]W
M:&5N=6YL97-S7VAE;'!E<@!L94%D9%1A:6P`979A;%]C8E]T97)P<FD`979A
M;%]C8E]C9'(`;6%L;&]C0$!'3$E"0U\R+C(N-0!F;W!E;D!`1TQ)0D-?,BXR
M+C4`7U]L:6)C7W-T87)T7VUA:6Y`0$=,24)#7S(N,BXU`'-N86=!5&]K96X`
M8V]U;G1.;V1E<P!E=F%L7V-B7V-O;G,`979A;%]C8E]D969U;@!L94%D9$1A
M=&%%;&5M96YT`&5V86Q486)L90!E=F%L0V%S=$EN=%1O3&4`7TE/7W-T9&EN
M7W5S960`=6YG971C0$!'3$E"0U\R+C(N-0!F<'5T8T!`1TQ)0D-?,BXR+C4`
M9G)E94!`1TQ)0D-?,BXR+C4`7TE/7V=E=&-`0$=,24)#7S(N,BXU`&UA:6Y6
M87),:7-T`%]?9&%T85]S=&%R=`!E=F%L7V-B7VYO=`!E=F%L7V-B7V%N9`!E
M=F%L7V-B7V1I=FED90!F<`!E=F%L7V-B7W-E='$`=F%R:6%B;&5&:6YD`'-P
M<FEN=&9`0$=,24)#7S(N,BXU`&5V86Q?8V)?;F]T:&EN9P!E=F%L7V-B7W!R
M;V<Q`&QE5&%G4F5P;&%C90!E=F%L7V-B7V5V86P`979A;%]C8E]A=&]M`&5V
M86Q?8V)?=6YL97-S`&5V86Q?8V)?96YU;0!E=F%L0V%S=$QE5&]);G0`;&5$
M=7``979A;%]C8E]L:7-T<U]S86UE`&QE1'5M<`!E=F%L=6%T941E9G5N`&5V
M86Q?8V)?9W1?97$`7U]D<V]?:&%N9&QE`&5V86QU871E0G)A;F-H`&5V86Q?
M8V)?<')I;F,`7U]$5$]27T5.1%]?`'9A<FEA8FQE1'5M<`!?7VQI8F-?8W-U
M7VEN:70`871O:4!`1TQ)0D-?,BXR+C4`;&5#;&5A<E1A9P!E=F%L7V-B7VQT
M7V5Q`&5V86Q?8V)?;VYE<&QU<P!L94%D9$)R86YC:$5L96UE;G0`;7EG971C
M`&5V86Q?8V)?97%S:6=N`&QE1'5M<$5V86Q4<F5E`'-T<F1U<$!`1TQ)0D-?
M,BXR+C4`7U]B<W-?<W1A<G0`979A;%]C8E]E<75A;`!E=F%L7V-B7V-A<@!E
M=F%L7V-B7W!R;V<R`'9A<FEA8FQE4V5T4W1R:6YG`&5V86Q?8V)?861D`'-T
M<F-M<$!`1TQ)0D-?,BXR+C4`979A;%]C8E]W:&5N`&QE1&5L971E`&5V86Q?
M8V)?<')O9P!E=F%L7V-B7W-E;&5C=`!E=F%L7V-B7VUO9'5L=7,`7V5N9`!F
M8VQO<V5`0$=,24)#7S(N,BXU`'9A<FEA8FQE4V5T`&1E9G5N3&ES=`!E=F%L
M7V-B7VUU;'1I<&QY`'9A<FEA8FQE1V5T4W1R:6YG`'-T9&5R<D!`1TQ)0D-?
M,BXR+C4`9G=R:71E0$!'3$E"0U\R+C(N-0!E=F%L7V-B7VQT`&QE061D2&5A
M9`!E=F%L7V-B7VQI<W0`;&5486=$871A`%]E9&%T80!F<')I;G1F0$!'3$E"
M0U\R+C(N-0!E=F%L7V-B7W!R;V=N`&5V86Q?8V)?<W5B=')A8W0`<&%R<V5)
M;D9I;&4`979A;%]C8E]S971?:&5L<&5R`&QE1'5M<$5V86P`<W1D;W5T0$!'
63$E"0U\R+C(N-0!M86EN`%]I;FET`&5R
`
end
SHAR_EOF
  (set 20 10 08 31 13 05 30 'c/c_src/lithp'; eval "$shar_touch") &&
  chmod 0755 'c/c_src/lithp'
if test $? -ne 0
then ${echo} 'restore of c/c_src/lithp failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c/c_src/lithp: MD5 check failed'
       ) << SHAR_EOF
4249bf6bf31e648b9b271e57074d25b7  c/c_src/lithp
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c/c_src/lithp'` -ne 27607 && \
  ${echo} 'restoration warning:  size of c/c_src/lithp is not 27607'
  fi
fi
if rm -fr ${lock_dir}
then ${echo} 'x - removed lock directory `'${lock_dir}\''.'
else ${echo} 'x - failed to remove lock directory `'${lock_dir}\''.'
  exit 1
fi
exit 0
