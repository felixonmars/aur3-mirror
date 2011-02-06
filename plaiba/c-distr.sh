#!/bin/sh
# This is a shell archive (produced by GNU sharutils 4.6.3).
# To extract the files from this archive, save it to some FILE, remove
# everything before the `#!/bin/sh' line above, then type `sh FILE'.
#
lock_dir=_sh06188
# Made on 2010-12-08 20:30 UTC by <ying@althonx4>.
# Source directory was `/mnt/rd1/plaiba'.
#
# Existing files will *not* be overwritten, unless `-c' is specified.
#
# This shar contains:
# length mode       name
# ------ ---------- ------------------------------------------
#   1289 -rw-r--r-- c-distr/Makefile
#  12288 -rw-r--r-- c-distr/.Makefile.swp
#   4484 -rw-r--r-- c-distr/code.apl.out
#    329 -rw-r--r-- c-distr/code.ch1.out
#  29009 -rw-r--r-- c-distr/smalltalk.c
#  28300 -rw-r--r-- c-distr/scheme.c
#  29599 -rw-r--r-- c-distr/sasl.c
#  27798 -rw-r--r-- c-distr/prolog.c
#  27320 -rw-r--r-- c-distr/lisp.c
#   3400 -rw-r--r-- c-distr/code2.pro
#   4310 -rw-r--r-- c-distr/code1.pro
#    514 -rw-r--r-- c-distr/code2.pro.out
#  11957 -rw-r--r-- c-distr/code.ssl
#   1578 -rw-r--r-- c-distr/code1.pro.out
#  23032 -rw-r--r-- c-distr/code.smt
#   3037 -rw-r--r-- c-distr/code.ssl.out
#  14352 -rw-r--r-- c-distr/code.sch
#   4142 -rw-r--r-- c-distr/code.smt.out
#  18116 -rw-r--r-- c-distr/code.lsp
#   6606 -rw-r--r-- c-distr/code.sch.out
#   9561 -rw-r--r-- c-distr/code.clu
#   3328 -rw-r--r-- c-distr/code.lsp.out
#    768 -rw-r--r-- c-distr/code.ch1
#   1557 -rw-r--r-- c-distr/code.clu.out
#   5305 -rw-r--r-- c-distr/code.apl
#  29384 -rw-r--r-- c-distr/clu.c
#  21293 -rw-r--r-- c-distr/chap1.c
#  41193 -rw-r--r-- c-distr/apl.c
#   4149 -rw-r--r-- c-distr/README
#   1298 -rw-r--r-- c-distr/out1
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
# ============= c-distr/Makefile ==============
if test ! -d 'c-distr'; then
  mkdir 'c-distr'
if test $? -eq 0
then ${echo} 'x - created directory `c-distr'\''.'
else ${echo} 'x - failed to create directory `c-distr'\''.'
  exit 1
fi
fi
if test -f 'c-distr/Makefile' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/Makefile (file already exists)'
else
${echo} 'x - extracting c-distr/Makefile (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/Makefile' &&
X
X
CFLAGS	=-I.
LIBS	= -lp2c
X
GOALS	= chap1 lisp apl sasl scheme clu smalltalk prolog
X
goal:	$(GOALS)
X	@echo done
X
clean:
X	rm -f $(GOALS) *.o test.*.out 
X
chap1: chap1.c 
X	$(CC) $(CFLAGS) -o chap1 chap1.c $(LIBS)
X	./$@ < code.ch1 > test.ch1.out
X	diff -c test.ch1.out code.ch1.out
X	rm -f test.*.out
X
lisp: lisp.c 
X	$(CC) $(CFLAGS) -o lisp lisp.c $(LIBS)
X	./$@ ./lisp < code.lsp > test.lsp.out
X	diff -c test.lsp.out code.lsp.out
X	rm -f test.*.out
X
apl: apl.c 
X	$(CC) $(CFLAGS) -o apl apl.c $(LIBS)
X	./$@ < code.apl > test.apl.out
X	diff -c test.apl.out code.apl.out
X	rm -f test.*.out
X
clu: clu.c
X	$(CC) $(CFLAGS) -o clu clu.c $(LIBS)
X	./$@ < code.clu > test.clu.out
X	diff -c test.clu.out code.clu.out
X	rm -f test.*.out
X
scheme: scheme.c
X	$(CC) $(CFLAGS) -o scheme scheme.c $(LIBS)
X	./$@ < code.sch > test.sch.out
X	diff -c test.sch.out code.sch.out
X	rm -f test.*.out
X
smalltalk: smalltalk.c
X	$(CC) $(CFLAGS) -o smalltalk smalltalk.c $(LIBS)
X	./$@ < code.smt > test.smt.out
X	diff -c test.smt.out code.smt.out
X	rm -f test.*.out
X
sasl: sasl.c
X	$(CC) $(CFLAGS) -o sasl sasl.c $(LIBS)
X	./$@ < code.ssl > test.ssl.out
X	diff -c test.ssl.out code.ssl.out
X	rm -f test.*.out
X
prolog: prolog.c 
X	$(CC) $(CFLAGS) -o prolog prolog.c $(LIBS)
X	./$@ < code1.pro > test.pro.out
X	./$@ < code2.pro > test.pro.out
X
SHAR_EOF
  (set 20 10 08 31 16 49 43 'c-distr/Makefile'; eval "$shar_touch") &&
  chmod 0644 'c-distr/Makefile'
if test $? -ne 0
then ${echo} 'restore of c-distr/Makefile failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/Makefile: MD5 check failed'
       ) << SHAR_EOF
e9b061b0e1aa1bf8bfaf20d095454259  c-distr/Makefile
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/Makefile'` -ne 1289 && \
  ${echo} 'restoration warning:  size of c-distr/Makefile is not 1289'
  fi
fi
# ============= c-distr/.Makefile.swp ==============
if test ! -d 'c-distr'; then
  mkdir 'c-distr'
if test $? -eq 0
then ${echo} 'x - created directory `c-distr'\''.'
else ${echo} 'x - failed to create directory `c-distr'\''.'
  exit 1
fi
fi
if test -f 'c-distr/.Makefile.swp' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/.Makefile.swp (file already exists)'
else
${echo} 'x - extracting c-distr/.Makefile.swp (binary)'
  sed 's/^X//' << 'SHAR_EOF' | uudecode &&
begin 600 c-distr/.Makefile.swp
M8C!624T@-RXR`````!```.`N?4Q-J```5EP``'EI;F<`````````````````
M``````````````````````````````!A;'1H;VYX-```````````````````
M````````````````````````+VUN="]R9#$O0RUD:7-T<B]-86ME9FEL90``
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M``````````````!U=&8M.`T`,S(Q,``````C(B$@$Q)5````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M`'1P`0!_`````@`````````_``````````$``````````0``````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M``!A9```@PD``)L*````$```/P````````#_#P``_@\``/(/``#E#P``Y`\`
M`*P/``"K#P``G`\``)`/``"/#P``B`\``&@/``!G#P``5P\``"T/```-#P``
MZ@X``-@.``#7#@``R0X``*$.``!Z#@``5PX``$4.``!$#@``.`X``!(.``#R
M#0``SPT``+T-``"\#0``L0T``(L-``!K#0``2`T``#8-```U#0``)`T``/@,
M``#8#```M0P``*,,``"B#```BPP``%D,```Y#```%@P```0,```##```]@L`
M`,X+``"N"P``BPL``'D+``!X"P``9@L``#H+```9"P``]0H``-(*``"N"@``
MG`H``)L*``"9"@``F`H``&<*``!""@``+0H``!<*```,"@``Z@D``-()``#,
M"0``CPD`````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M```````````````````````````)<#)C("0J"7`R8R`D*@EP,F,@)"H)<#)C
M("0J+@EP,F,@)"HN"7`R8R`D*BX)<#)C("0J"7`R8R`D*BX)<#)C("0)<#)C
M("0J+G````ER;2`M9@`)<FT@+68`"7)M("UF('1E<W0N*BYO=70`"61I9F8@
M+6,@=&5S="YP``ER;2`M9B!T97,`"7)M("UF('1E<W0N*BYO=70`"61I``ER
M;2`M9B!T97-T+BHN;W5T``ED``ER;2`M9B!T97-T+BHN;W5T``ED:69F("UC
M('1E<W0N<')O+@`)<FT@+68@=&5S``D`"7)M("T`"0`)<FT`"0`)<FT`"7)M
M("UF('0`"7)M("UF('1E<W0`"7)M("UF('1E<W0N*BYO=70`"61I9F8@+6,@
M=&5S="YP<F\N;W5T(&-O9&4R+G!R;RYO=70`"7!R;VQO9R`\(&-O9&4R+G!R
M;R`^('1E<W0N<')O+F]U=``)9&EF9B`M8R!T97-T+G!R;RYO=70@8V]D93$N
M<')O+F]U=``)+B\D0"`\(&-O9&4Q+G!R;R`^('1E<W0N<')O+F]U=``))"A#
M0RD@)"A#1DQ!1U,I("UO('!R;VQO9R!P<F]L;V<N8R`D*$Q)0E,I`'!R;VQO
M9SH@<')O;&]G+F,@```)<FT@+68@=&5S="XJ+F]U=``)9&EF9B`M8R!T97-T
M+G-S;"YO=70@8V]D92YS<VPN;W5T``DN+R1`(#P@8V]D92YS<VP@/B!T97-T
M+G-S;"YO=70`"20H0T,I("0H0T9,04=3*2`M;R!S87-L('-A<VPN8R`D*$Q)
M0E,I`'-A<VPZ('-A<VPN8P``"7)M("UF('1E<W0N*BYO=70`"61I9F8@+6,@
M=&5S="YS;70N;W5T(&-O9&4N<VUT+F]U=``)+B\D0"`\(&-O9&4N<VUT(#X@
M=&5S="YS;70N;W5T``DD*$-#*2`D*$-&3$%'4RD@+6\@<VUA;&QT86QK('-M
M86QL=&%L:RYC("0H3$E"4RD`<VUA;&QT86QK.B!S;6%L;'1A;&LN8P``"7)M
M("UF('1E<W0N*BYO=70`"61I9F8@+6,@=&5S="YS8V@N;W5T(&-O9&4N<V-H
M+F]U=``)+B\D0"`\(&-O9&4N<V-H(#X@=&5S="YS8V@N;W5T``DD*$-#*2`D
M*$-&3$%'4RD@+6\@<V-H96UE('-C:&5M92YC("0H3$E"4RD`<V-H96UE.B!S
M8VAE;64N8P``"7)M("UF('1E<W0N*BYO=70`"61I9F8@+6,@=&5S="YC;'4N
M;W5T(&-O9&4N8VQU+F]U=``)+B\D0"`\(&-O9&4N8VQU(#X@=&5S="YC;'4N
M;W5T``DD*$-#*2`D*$-&3$%'4RD@+6\@8VQU(&-L=2YC("0H3$E"4RD`8VQU
M.B!C;'4N8P``"7)M("UF('1E<W0N*BYO=70`"61I9F8@+6,@=&5S="YA<&PN
M;W5T(&-O9&4N87!L+F]U=``)+B\D0"`\(&-O9&4N87!L(#X@=&5S="YA<&PN
M;W5T``DD*$-#*2`D*$-&3$%'4RD@+6\@87!L(&%P;"YC("0H3$E"4RD`87!L
M.B!A<&PN8R````ER;2`M9B!T97-T+BHN;W5T``ED:69F("UC('1E<W0N;'-P
M+F]U="!C;V1E+FQS<"YO=70`"2XO)$`@+B]L:7-P(#P@8V]D92YL<W`@/B!T
M97-T+FQS<"YO=70`"20H0T,I("0H0T9,04=3*2`M;R!L:7-P(&QI<W`N8R`D
M*$Q)0E,I`&QI<W`Z(&QI<W`N8R````ER;2`M9B!T97-T+BHN;W5T``ED:69F
M("UC('1E<W0N8V@Q+F]U="!C;V1E+F-H,2YO=70`"2XO)$`@/"!C;V1E+F-H
M,2`^('1E<W0N8V@Q+F]U=``))"A#0RD@)"A#1DQ!1U,I("UO(&-H87`Q(&-H
M87`Q+F,@)"A,24)3*0!C:&%P,3H@8VAA<#$N8R````ER;2`M9B`D*$=/04Q3
M*2`J+F\@=&5S="XJ+F]U="``8VQE86XZ```)0&5C:&\@9&]N90!G;V%L.@DD
M*$=/04Q3*0``1T]!3%,)/2!C:&%P,2!L:7-P(&%P;"!S87-L('-C:&5M92!C
M;'4@<VUA;&QT86QK('!R;VQO9P``3$E"4PD]("UL<#)C`$-&3$%'4PD]+4DN
#````
`
end
SHAR_EOF
  (set 20 10 08 31 16 33 40 'c-distr/.Makefile.swp'; eval "$shar_touch") &&
  chmod 0644 'c-distr/.Makefile.swp'
if test $? -ne 0
then ${echo} 'restore of c-distr/.Makefile.swp failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/.Makefile.swp: MD5 check failed'
       ) << SHAR_EOF
f87e33aea53807fd8ef382c56dd6c164  c-distr/.Makefile.swp
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/.Makefile.swp'` -ne 12288 && \
  ${echo} 'restoration warning:  size of c-distr/.Makefile.swp is not 12288'
  fi
fi
# ============= c-distr/code.apl.out ==============
if test -f 'c-distr/code.apl.out' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code.apl.out (file already exists)'
else
${echo} 'x - extracting c-distr/code.apl.out (binary)'
  sed 's/^X//' << 'SHAR_EOF' | uudecode &&
begin 600 c-distr/code.apl.out
M+3X@+3X@*S$*+3X@/#T*+3X@+3X@9F%C"BT^("`@("`R-"`*"@HM/B`@("`@
M,C0@"@H*+3X@879G"BT^("`@("`@-"`*"@HM/B`@("`@(#0@"@H*+3X@;F5G
M"BT^("`@("`M,R`@("`@(#4@("`@("`X(`H*"BT^("`@("`M,R`@("`@(#4@
M("`@("`X(`H*"BT^(&UI;@HM/B`@("`@(#0@"@H*+3X@("`@("`T(`H*"BT^
M("`@("`@,B`@("`@(#,@("`@("`V("`@("`@-"`*"@HM/B`@("`@(#(@("`@
M("`S("`@("`@-B`@("`@(#0@"@H*+3X@;6EN+PHM/B`@("`@(#,@"@H*+3X@
M("`@("`S(`H*"BT^(&UO9`HM/B`@("`@(#`@("`@("`Q("`@("`@,B`@("`@
M(#,@"@H*+3X@("`@("`P("`@("`@,2`@("`@(#(@("`@("`S(`H*"BT^("`@
M("`@,"`@("`@(#`@("`@("`R("`@("`Q,"`*"@HM/B`@("`@(#`@("`@("`P
M("`@("`@,B`@("`@,3`@"@H*+3X@979E;C\*+3X@("`@("`P("`@("`@,2`@
M("`@(#`@("`@("`Q("`@("`@,"`*"@HM/B`@("`@(#`@("`@("`Q("`@("`@
M,"`@("`@(#$@("`@("`P(`H*"BT^(&5V96XM<W5M"BT^("`@("`@-B`*"@HM
M/B`@("`@(#8@"@H*+3X@;F]T/0HM/B`@("`@(#$@"@H*+3X@("`@("`Q(`H*
M"BT^("`@("`@,"`*"@HM/B`@("`@(#`@"@H*+3X@;F]T"BT^(#P^"BT^("`@
M("`@,"`@("`@(#$@("`@("`Q(`H*"BT^("`@("`@,"`@("`@(#$@("`@("`Q
M(`H*"BT^(#X@/B`^(')E=F5R<V4*+3X@("`@("`Q("`@("`@,2`@("`@(#`@
M("`@("`P(`H@("`@(#`@("`@("`Q("`@("`@,2`@("`@(#`@"B`@("`@,"`@
M("`@(#`@("`@("`Q("`@("`@,2`*("`@("`P("`@("`@,"`@("`@(#`@("`@
M("`Q(`H*"BT^("`@("`@,2`@("`@(#$@("`@("`P("`@("`@,"`*"@HM/B`@
M("`@(#`@("`@("`Q("`@("`@,2`@("`@(#`@"@H*+3X@("`@("`P("`@("`@
M,"`@("`@(#$@("`@("`Q(`H*"BT^("`@("`@,"`@("`@(#`@("`@("`P("`@
M("`@,2`*"@HM/B`@("`@(#`@("`@("`P("`@("`@,"`@("`@(#$@"B`@("`@
M,"`@("`@(#`@("`@("`Q("`@("`@,2`*("`@("`P("`@("`@,2`@("`@(#$@
M("`@("`P(`H@("`@(#$@("`@("`Q("`@("`@,"`@("`@(#`@"@H*+3X@("`@
M("`P("`@("`@,"`@("`@(#`@("`@("`Q(`H*"BT^("`@("`@,"`@("`@(#`@
M("`@("`Q("`@("`@,2`*"@HM/B`@("`@(#`@("`@("`Q("`@("`@,2`@("`@
M(#`@"@H*+3X@("`@("`Q("`@("`@,2`@("`@(#`@("`@("`P(`H*"BT^(#X@
M<F5V97)S90HM/B`@("`@(#`@("`@("`P("`@("`@,"`@("`@(#$@"B`@("`@
M,"`@("`@(#`@("`@("`Q("`@("`@,2`*("`@("`P("`@("`@,2`@("`@(#$@
M("`@("`P(`H@("`@(#$@("`@("`Q("`@("`@,"`@("`@(#`@"@H*+3X@("`@
M("`P("`@("`@,"`@("`@(#`@("`@("`Q(`H*"BT^("`@("`@,"`@("`@(#`@
M("`@("`Q("`@("`@,2`*"@HM/B`@("`@(#`@("`@("`Q("`@("`@,2`@("`@
M(#`@"@H*+3X@("`@("`Q("`@("`@,2`@("`@(#`@("`@("`P(`H*"BT^('-I
M9VYU;0HM/B!A8G,*+3X@9FEN9`HM/B`@("`@(#0@"@H*+3X@("`@("`T(`H*
M"BT^(#X@/B`^(&9I;F0M8VQO<V5S=`HM/B`@("`@(#(@"@H*+3X@("`@("`R
M(`H*"BT^('-Q<@HM/B!V87)I86YC90HM/B`@("`@,S$@"@H*+3X@("`@(#,Q
M(`H*"BT^(#X@/B`^(#X@/B`^(&)I;F]M"BT^(#X@<')I;64*+3X@9')O<&5N
M9`HM/B`^(#X@*UP*+3X@("`@("`Q("`@("`@-"`@("`@(#D@("`@(#$V(`H*
M"BT^("`@("`@,2`@("`@(#0@("`@("`Y("`@("`Q-B`*"@HM/B`^(#X@87-S
M:6=N"BT^("`@("`@,2`@("`@(#(@("`@("`V("`@("`@-"`@("`@(#4@"@H*
M+3X@("`@("`Q("`@("`@,B`@("`@(#8@("`@("`T("`@("`@-2`*"@HM/B!D
M<F]P,0HM/B`^(#X@/B!V96-A<W-I9VX*+3X@("`@(#$Q("`@("`R,"`@("`@
M(#<@("`@(#0P("`@("`@.2`*"@HM/B`@("`@,3$@("`@(#(P("`@("`@-R`@
M("`@-#`@("`@("`Y(`H*"BT^(#X@/B`^(&9I;&QZ97)O<PHM/B`@("`@(#`@
M("`@("`P("`@("`@,2`@("`@(#$@("`@("`P("`@("`@,"`@("`@(#`@("`@
M("`Q("`@("`@,"`@("`@(#$@"@H*+3X@("`@("`P("`@("`@,"`@("`@(#$@
M("`@("`Q("`@("`@,"`@("`@(#`@("`@("`P("`@("`@,2`@("`@(#`@("`@
M("`Q(`H*"BT^(#X@/B!M;V0M;W5T97(M<')O9`HM/B`@("`@(#`@("`@("`Q
M("`@("`@,2`@("`@(#$@("`@("`Q("`@("`@,2`@("`@(#$@"B`@("`@,"`@
M("`@(#`@("`@("`R("`@("`@,B`@("`@(#(@("`@("`R("`@("`@,B`*("`@
M("`P("`@("`@,2`@("`@(#`@("`@("`S("`@("`@,R`@("`@(#,@("`@("`S
M(`H@("`@(#`@("`@("`P("`@("`@,2`@("`@(#`@("`@("`T("`@("`@-"`@
M("`@(#0@"@H*+3X@("`@("`P("`@("`@,2`@("`@(#$@("`@("`Q("`@("`@
M,2`@("`@(#$@("`@("`Q(`H*"BT^("`@("`@,"`@("`@(#`@("`@("`R("`@
M("`@,B`@("`@(#(@("`@("`R("`@("`@,B`*"@HM/B`@("`@(#`@("`@("`Q
M("`@("`@,"`@("`@(#,@("`@("`S("`@("`@,R`@("`@(#,@"@H*+3X@("`@
M("`P("`@("`@,"`@("`@(#$@("`@("`P("`@("`@-"`@("`@(#0@("`@("`T
M(`H*"BT^(#X@/B!P<FEM97,\/0HM/B`@("`@(#(@("`@("`S("`@("`@-2`@
M("`@(#<@"@H*+3X@("`@("`R("`@("`@,R`@("`@(#4@("`@("`W(`H*"BT^
M("T^(#X@9'5P+6-O;',*+3X@/B!D=7`M<F]W<PHM/B`^(#X@/B`^(#X@9G)E
M<79E8PHM/B!C=6UF<F5Q=F5C"BT^(')A;F=E"BT^(&UO9&4*+3X@/B!M961I
M86X*+3X@/B`^(&%D9&5L=`HM/B`^(#X@861D<F]W"BT^(#X@861D8V]L"BT^
M(#X@/B`^(#X@/B`^(#X@:&ES=&\*+3X@/B`^(#X@/B`^(#X@9W)A<&@*+3X@
M("`@("TR("`@("`@,2`@("`@+3$@("`@("`P("`@("`@,"`@("`@(#(@("`@
M("`Q("`@("`@,2`*"@HM/B`@("`@(#$@("`@("`Q("`@("`@,B`@("`@(#,@
M("`@("`Q(`H*"BT^("`@("`@,2`@("`@(#$@("`@("`R("`@("`@,R`@("`@
M(#$@"@H*+3X@("`@("`Q("`@("`@,B`@("`@(#0@("`@("`W("`@("`@."`*
M"@HM/B`@("`@(#$@("`@("`R("`@("`@-"`@("`@(#<@("`@("`X(`H*"BT^
M("`@("`M,B`@("`@(#(@"@H*+3X@("`@("TR("`@("`@,B`*"@HM/B`@("`@
M(#$@"@H*+3X@("`@("`Q(`H*"BT^("`@("`@,"`*"@HM/B`@("`@(#`@"@H*
M+3X@("`@("TR("`@("`@,2`@("`@(#`@("`@("`P(`H@("`@+3$@("`@("`Q
M("`@("`@,"`@("`@(#`@"B`@("`@,"`@("`@(#$@("`@("`Q("`@("`@,"`*
M("`@("`Q("`@("`@,2`@("`@(#$@("`@("`Q(`H@("`@(#(@("`@("`Q("`@
M("`@,"`@("`@(#`@"@H*+3X@("`@("TR("`@("`@,2`@("`@(#`@("`@("`P
M(`H*"BT^("`@("`M,2`@("`@(#$@("`@("`P("`@("`@,"`*"@HM/B`@("`@
M(#`@("`@("`Q("`@("`@,2`@("`@(#`@"@H*+3X@("`@("`Q("`@("`@,2`@
M("`@(#$@("`@("`Q(`H*"BT^("`@("`@,B`@("`@(#$@("`@("`P("`@("`@
M,"`*"@HM/B`@("`@(#`@("`@("`P("`@("`@,"`@("`@(#$@("`@("`P(`H@
M("`@(#`@("`@("`P("`@("`@,2`@("`@(#`@("`@("`P(`H@("`@(#$@("`@
M("`Q("`@("`@,"`@("`@(#`@("`@("`Q(`H@("`@+3(@("`@("TQ("`@("`@
M,"`@("`@(#$@("`@("`R(`H*"BT^("`@("`@,"`@("`@(#`@("`@("`P("`@
M("`@,2`@("`@(#`@"@H*+3X@("`@("`P("`@("`@,"`@("`@(#$@("`@("`P
M("`@("`@,"`*"@HM/B`@("`@(#$@("`@("`Q("`@("`@,"`@("`@(#`@("`@
M("`Q(`H*"BT^("`@("`M,B`@("`@+3$@("`@("`P("`@("`@,2`@("`@(#(@
M"@H*+3X@("`@("`P("`@("`@,"`@("`@(#`@("`@("`P("`@("`@,2`*("`@
M("`P("`@("`@,"`@("`@(#`@("`@("`Q("`@("`@,"`*("`@("`P("`@("`@
M,"`@("`@(#`@("`@("`P("`@("`@,"`*("`@("`P("`@("`@,"`@("`@(#`@
M("`@("`P("`@("`@,"`*("`@("`P("`@("`@,"`@("`@(#$@("`@("`P("`@
M("`@,"`*("`@("`P("`@("`@,"`@("`@(#`@("`@("`P("`@("`@,"`*("`@
M("`P("`@("`@,2`@("`@(#`@("`@("`P("`@("`@,"`*("`@("`Q("`@("`@
M,"`@("`@(#`@("`@("`P("`@("`@,"`*("`@("TR("`@("`M,2`@("`@(#`@
M("`@("`Q("`@("`@,B`*"@HM/B`@("`@(#`@("`@("`P("`@("`@,"`@("`@
M(#`@("`@("`Q(`H*"BT^("`@("`@,"`@("`@(#`@("`@("`P("`@("`@,2`@
M("`@(#`@"@H*+3X@("`@("`P("`@("`@,"`@("`@(#`@("`@("`P("`@("`@
M,"`*"@HM/B`@("`@(#`@("`@("`P("`@("`@,"`@("`@(#`@("`@("`P(`H*
M"BT^("`@("`@,"`@("`@(#`@("`@("`Q("`@("`@,"`@("`@(#`@"@H*+3X@
M("`@("`P("`@("`@,"`@("`@(#`@("`@("`P("`@("`@,"`*"@HM/B`@("`@
M(#`@("`@("`Q("`@("`@,"`@("`@(#`@("`@("`P(`H*"BT^("`@("`@,2`@
M("`@(#`@("`@("`P("`@("`@,"`@("`@(#`@"@H*+3X@("`@("TR("`@("`M
=,2`@("`@(#`@("`@("`Q("`@("`@,B`*"@HM/B`*
`
end
SHAR_EOF
  (set 19 90 01 05 18 00 24 'c-distr/code.apl.out'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code.apl.out'
if test $? -ne 0
then ${echo} 'restore of c-distr/code.apl.out failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code.apl.out: MD5 check failed'
       ) << SHAR_EOF
a9ae5ad5e1fe7a3154c7e2eff2d2cacd  c-distr/code.apl.out
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code.apl.out'` -ne 4484 && \
  ${echo} 'restoration warning:  size of c-distr/code.apl.out is not 4484'
  fi
fi
# ============= c-distr/code.ch1.out ==============
if test -f 'c-distr/code.ch1.out' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code.ch1.out (file already exists)'
else
${echo} 'x - extracting c-distr/code.ch1.out (binary)'
  sed 's/^X//' << 'SHAR_EOF' | uudecode &&
begin 600 c-distr/code.ch1.out
M+3X@,PH*+3X@,PH*+3X@,3$*"BT^(#$Q"@HM/B`T"@HM/B`T"@HM/B`X"@HM
M/B`X"@HM/B`T"C0*"BT^(#0*"BT^(#0*"BT^(#4*"BT^(#4*"BT^(#0*-0HR
M,`H*+3X@-`H*+3X@-0H*+3X@,C`*"BT^(#4*"BT^(#4*"BT^(#X@,`H*+3X@
M,`H*+3X@,3(X"@HM/B`Q,C@*"BT^("LQ"BT^(#4*"BT^(#4*"BT^(&1O=6)L
M90HM/B`X"@HM/B`X"@HM/B`Q,C@*"BT^(#$R.`H*+3X@<V5T>`HM/B`Q,CD*
M"BT^(#$R.0H*+3X@,3(X"@HM/B`Q,C@*"BT^(&YO=`HM/B`\/@HM/B!M;V0*
M+3X@/B`^(#X@/B`^(#X@/B`^(&=C9`HM/B`S"@HM/B`S"@HM/B`^(&=C9`HM
X./B`S"@HM/B`S"@HM/B`@
`
end
SHAR_EOF
  (set 19 90 01 05 18 00 24 'c-distr/code.ch1.out'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code.ch1.out'
if test $? -ne 0
then ${echo} 'restore of c-distr/code.ch1.out failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code.ch1.out: MD5 check failed'
       ) << SHAR_EOF
7fc525c3cc93025731e6b5d1ce7ff229  c-distr/code.ch1.out
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code.ch1.out'` -ne 329 && \
  ${echo} 'restoration warning:  size of c-distr/code.ch1.out is not 329'
  fi
fi
# ============= c-distr/smalltalk.c ==============
if test -f 'c-distr/smalltalk.c' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/smalltalk.c (file already exists)'
else
${echo} 'x - extracting c-distr/smalltalk.c (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/smalltalk.c' &&
/* Output from p2c, the Pascal-to-C translator */
/* From input file "smalltalk.p" */
X
X
/*****************************************************************
X *                     DECLARATIONS                              *
X *****************************************************************/
X
#include <p2c/p2c.h>
X
X
#define NAMELENG        30   /* Maximum length of a name */
#define MAXNAMES        300   /* Maximum number of different names */
#define MAXINPUT        5000   /* Maximum length of an input */
X
#define PROMPT          "-> "
#define PROMPT2         "> "
#define COMMENTCHAR     ";"
X
#define TABCODE         9   /* in ASCII */
X
X
typedef Char NAMESTRING[NAMELENG];
X
/* a NAME is an index in printNames */
X
typedef enum {
X  IFOP, WHILEOP, SETOP, BEGINOP, NEWOP, PLUSOP, MINUSOP, TIMESOP, DIVOP, EQOP,
X  LTOP, GTOP, PRINTOP
} BUILTINOP;
X
X
typedef enum {
X  INT, SYM, USER
} STVALUETYPE;
X
typedef struct STVALUEREC {
X  struct CLASSREC *owner;
X  STVALUETYPE vtype;
X  union {
X    long intval;
X    short symval;
X    struct ENVREC *userval;
X  } UU;
} STVALUEREC;
X
typedef enum {
X  VALEXP, VAREXP, APEXP
} EXPTYPE;
X
typedef struct EXPREC {
X  EXPTYPE etype;
X  union {
X    STVALUEREC *valu;
X    short varble;
X    struct {
X      short optr;
X      struct EXPLISTREC *args;
X    } U2;
X  } UU;
} EXPREC;
X
typedef struct EXPLISTREC {
X  EXPREC *head;
X  struct EXPLISTREC *tail;
} EXPLISTREC;
X
typedef struct VALUELISTREC {
X  STVALUEREC *head;
X  struct VALUELISTREC *tail;
} VALUELISTREC;
X
typedef struct NAMELISTREC {
X  short head;
X  struct NAMELISTREC *tail;
} NAMELISTREC;
X
typedef struct ENVREC {
X  NAMELISTREC *vars;
X  VALUELISTREC *values;
} ENVREC;
X
typedef struct FUNDEFREC {
X  short funname;
X  NAMELISTREC *formals;
X  EXPREC *body;
X  struct FUNDEFREC *nextfundef;
} FUNDEFREC;
X
typedef struct CLASSREC {
X  short clname;
X  struct CLASSREC *clsuper;
X  NAMELISTREC *clrep;
X  FUNDEFREC *exported;
X  struct CLASSREC *nextclass;
} CLASSREC;
X
X
Static FUNDEFREC *fundefs;
Static CLASSREC *classes;
X
Static ENVREC *globalEnv;
X
Static EXPREC *currentExp;
X
Static Char userinput[MAXINPUT];
Static short inputleng, pos_;
X
Static NAMESTRING printNames[MAXNAMES];
Static short numNames, numBuiltins, numCtrlOps;
X
Static short SELF;
X
Static CLASSREC *OBJECTCLASS;
Static STVALUEREC *objectInst;
X
Static STVALUEREC *trueValue, *falseValue;
X
Static boolean quittingtime;
X
X
/*****************************************************************
X *                     DATA STRUCTURE OP'S                       *
X *****************************************************************/
X
/* mkVALEXP - return an EXP of type VALEXP with valu v           */
Static EXPREC *mkVALEXP(v)
STVALUEREC *v;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = VALEXP;
X  e->UU.valu = v;
X  return e;
}  /* mkVALEXP */
X
X
/* mkVAREXP - return an EXP of type VAREXP with varble nm        */
Static EXPREC *mkVAREXP(nm)
short nm;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = VAREXP;
X  e->UU.varble = nm;
X  return e;
}  /* mkVAREXP */
X
X
/* mkAPEXP - return EXP of type APEXP w/ optr op and args el     */
Static EXPREC *mkAPEXP(op, el)
short op;
EXPLISTREC *el;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = APEXP;
X  e->UU.U2.optr = op;
X  e->UU.U2.args = el;
X  return e;
}  /* mkAPEXP */
X
X
/* mkINT - return an STVALUE with integer value n                */
Static STVALUEREC *mkINT(n)
long n;
{
X  STVALUEREC *newval;
X
X  newval = (STVALUEREC *)Malloc(sizeof(STVALUEREC));
X  newval->owner = OBJECTCLASS;
X  newval->vtype = INT;
X  newval->UU.intval = n;
X  return newval;
}  /* mkINT */
X
X
/* mkSYM - return an STVALUE with symbol value s                 */
Static STVALUEREC *mkSYM(s)
short s;
{
X  STVALUEREC *newval;
X
X  newval = (STVALUEREC *)Malloc(sizeof(STVALUEREC));
X  newval->owner = OBJECTCLASS;
X  newval->vtype = SYM;
X  newval->UU.symval = s;
X  return newval;
}  /* mkSYM */
X
X
/* mkUSER - return a USER-type STVALUE                           */
Static STVALUEREC *mkUSER(rho, ownr)
ENVREC *rho;
CLASSREC *ownr;
{
X  STVALUEREC *newval;
X
X  newval = (STVALUEREC *)Malloc(sizeof(STVALUEREC));
X  newval->vtype = USER;
X  newval->UU.userval = rho;
X  newval->owner = ownr;
X  return newval;
}  /* mkUSER */
X
X
/* mkExplist - return an EXPLIST with head e and tail el         */
Static EXPLISTREC *mkExplist(e, el)
EXPREC *e;
EXPLISTREC *el;
{
X  EXPLISTREC *newel;
X
X  newel = (EXPLISTREC *)Malloc(sizeof(EXPLISTREC));
X  newel->head = e;
X  newel->tail = el;
X  return newel;
}  /* mkExplist */
X
X
/* mkNamelist - return a NAMELIST with head n and tail nl        */
Static NAMELISTREC *mkNamelist(nm, nl)
short nm;
NAMELISTREC *nl;
{
X  NAMELISTREC *newnl;
X
X  newnl = (NAMELISTREC *)Malloc(sizeof(NAMELISTREC));
X  newnl->head = nm;
X  newnl->tail = nl;
X  return newnl;
}  /* mkNamelist */
X
X
/* mkValuelist - return an VALUELIST with head v and tail vl     */
Static VALUELISTREC *mkValuelist(v, vl)
STVALUEREC *v;
VALUELISTREC *vl;
{
X  VALUELISTREC *newvl;
X
X  newvl = (VALUELISTREC *)Malloc(sizeof(VALUELISTREC));
X  newvl->head = v;
X  newvl->tail = vl;
X  return newvl;
}  /* mkValuelist */
X
X
/* mkEnv - return an ENV with vars nl and values vl              */
Static ENVREC *mkEnv(nl, vl)
NAMELISTREC *nl;
VALUELISTREC *vl;
{
X  ENVREC *rho;
X
X  rho = (ENVREC *)Malloc(sizeof(ENVREC));
X  rho->vars = nl;
X  rho->values = vl;
X  return rho;
}  /* mkEnv */
X
X
/* lengthVL - return length of VALUELIST vl                      */
Static long lengthVL(vl)
VALUELISTREC *vl;
{
X  long i;
X
X  i = 0;
X  while (vl != NULL) {
X    i++;
X    vl = vl->tail;
X  }
X  return i;
}  /* lengthVL */
X
X
/* lengthNL - return length of NAMELIST nl                       */
Static long lengthNL(nl)
NAMELISTREC *nl;
{
X  long i;
X
X  i = 0;
X  while (nl != NULL) {
X    i++;
X    nl = nl->tail;
X  }
X  return i;
}  /* lengthNL */
X
X
/*****************************************************************
X *                     NAME MANAGEMENT                           *
X *****************************************************************/
X
/* fetchClass - get class definition of NAME cname               */
Static CLASSREC *fetchClass(cname)
short cname;
{
X  CLASSREC *cl;
X  boolean found;
X
X  found = false;
X  cl = classes;
X  while (cl != NULL && !found) {
X    if (cl->clname == cname)
X      found = true;
X    else
X      cl = cl->nextclass;
X  }
X  return cl;
}  /* fetchClass */
X
X
/* newClass - add new class cname to classes                     */
Static CLASSREC *newClass(cname, super)
short cname;
CLASSREC *super;
{
X  CLASSREC *cl;
X
X  cl = fetchClass(cname);
X  if (cl == NULL) {   /* cname not yet defined as class */
X    cl = (CLASSREC *)Malloc(sizeof(CLASSREC));
X    cl->clname = cname;
X    cl->nextclass = classes;   /* place new CLASSREC */
X    classes = cl;   /* on classes list */
X  }
X  cl->clsuper = super;
X  return cl;
}  /* newClass */
X
X
/* fetchFun - get function definition of NAME fname from fenv    */
Static FUNDEFREC *fetchFun(fname, fenv)
short fname;
FUNDEFREC *fenv;
{
X  boolean found;
X
X  found = false;
X  while (fenv != NULL && !found) {
X    if (fenv->funname == fname)
X      found = true;
X    else
X      fenv = fenv->nextfundef;
X  }
X  return fenv;
}  /* fetchFun */
X
X
/* newFunDef - add new function fname to fenv                    */
Static FUNDEFREC *newFunDef(fname, fenv)
short fname;
FUNDEFREC **fenv;
{
X  FUNDEFREC *f;
X
X  f = fetchFun(fname, *fenv);
X  if (f != NULL)   /* fname not yet defined as a function */
X    return f;
X  f = (FUNDEFREC *)Malloc(sizeof(FUNDEFREC));
X  f->funname = fname;
X  f->nextfundef = *fenv;   /* place new FUNDEFREC */
X  *fenv = f;   /* on fenv list */
X  return f;
}  /* newFunDef */
X
X
/* initNames - place all pre-defined names into printNames       */
Static Void initNames()
{
X  long i;
X
X  fundefs = NULL;
X  i = 1;
X  memcpy(printNames[i - 1], "if                            ",
X	 sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "while                         ",
X	 sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "set                           ",
X	 sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "begin                         ",
X	 sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "new                           ",
X	 sizeof(NAMESTRING));
X  i++;
X  numCtrlOps = i - 1;
X  memcpy(printNames[i - 1], "+                             ",
X	 sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "-                             ",
X	 sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "*                             ",
X	 sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "/                             ",
X	 sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "=                             ",
X	 sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "<                             ",
X	 sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], ">                             ",
X	 sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "print                         ",
X	 sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "self                          ",
X	 sizeof(NAMESTRING));
X  SELF = i;
X  numNames = i;
X  numBuiltins = i - 1;
}  /* initNames */
X
X
Static jmp_buf _JL99;
X
X
/* install - insert new name into printNames                     */
Static short install(nm)
Char *nm;
{
X  long i;
X  boolean found;
X
X  i = 1;
X  found = false;
X  while (i <= numNames && !found) {
X    if (!memcmp(nm, printNames[i - 1], sizeof(NAMESTRING)))
X      found = true;
X    else
X      i++;
X  }
X  if (found)
X    return i;
X  if (i > MAXNAMES) {
X    printf("No more room for names\n");
X    longjmp(_JL99, 1);
X  }
X  numNames = i;
X  memcpy(printNames[i - 1], nm, sizeof(NAMESTRING));
X  return i;
}  /* install */
X
X
/* prName - print name nm                                        */
Static Void prName(nm)
short nm;
{
X  long i;
X
X  i = 1;
X  while (i <= NAMELENG) {
X    if (printNames[nm - 1][i - 1] != ' ') {
X      putchar(printNames[nm - 1][i - 1]);
X      i++;
X    } else
X      i = NAMELENG + 1;
X  }
}  /* prName */
X
X
/* primOp - translate NAME optr to corresponding BUILTINOP       */
Static BUILTINOP primOp(optr)
short optr;
{
X  BUILTINOP op;
X  long i;
X
X  op = IFOP;   /* N.B. IFOP is first value in BUILTINOPS */
X  for (i = 1; i < optr; i++)
X    op = (BUILTINOP)((long)op + 1);
X  return op;
}  /* primOp */
X
X
/*****************************************************************
X *                        INPUT                                  *
X *****************************************************************/
X
/* isDelim - check if c is a delimiter                           */
Static boolean isDelim(c)
Char c;
{
X  return (c == ';' || c == ' ' || c == ')' || c == '(');
}  /* isDelim */
X
X
/* skipblanks - return next non-blank position in userinput      */
Static long skipblanks(p)
long p;
{
X  while (userinput[p - 1] == ' ')
X    p++;
X  return p;
}  /* skipblanks */
X
X
/* matches - check if string nm matches userinput[s .. s+leng]   */
Static boolean matches(s, leng, nm)
long s;
char leng;
Char *nm;
{
X  boolean match;
X  long i;
X
X  match = true;
X  i = 1;
X  while (match && i <= leng) {
X    if (userinput[s - 1] != nm[i - 1])
X      match = false;
X    i++;
X    s++;
X  }
X  if (!isDelim(userinput[s - 1]))
X    match = false;
X  return match;
}  /* matches */
X
X
/* nextchar - read next char - filter tabs and comments          */
Local Void nextchar(c)
Char *c;
{
X  Char STR1[256];
X
X  *c = getchar();
X  if (*c == '\n')
X    *c = ' ';
X  if (*c == (Char)TABCODE) {
X    *c = ' ';
X    return;
X  }
X  sprintf(STR1, "%c", *c);
X  if (strcmp(STR1, COMMENTCHAR))
X    return;
X  while (!P_eoln(stdin)) {
X    *c = getchar();
X    if (*c == '\n')
X      *c = ' ';
X  }
X  *c = ' ';
}  /* nextchar */
X
/* readParens - read char's, ignoring newlines, to matching ')'  */
Local Void readParens()
{
X  long parencnt;   /* current depth of parentheses */
X  Char c;
X
X  parencnt = 1;   /* '(' just read */
X  do {
X    if (P_eoln(stdin))
X      fputs(PROMPT2, stdout);
X    nextchar(&c);
X    pos_++;
X    if (pos_ == MAXINPUT) {
X      printf("User input too long\n");
X      longjmp(_JL99, 1);
X    }
X    userinput[pos_ - 1] = c;
X    if (c == '(')
X      parencnt++;
X    if (c == ')')
X      parencnt--;
X  } while (parencnt != 0);   /* readParens */
}
X
Local Void readInput()
{
X  Char c;
X
X  fputs(PROMPT, stdout);
X  pos_ = 0;
X  do {
X    pos_++;
X    if (pos_ == MAXINPUT) {
X      printf("User input too long\n");
X      longjmp(_JL99, 1);
X    }
X    nextchar(&c);
X    userinput[pos_ - 1] = c;
X    if (userinput[pos_ - 1] == '(')
X      readParens();
X  } while (!P_eoln(stdin));
X  inputleng = pos_;
X  userinput[pos_] = ';';   /* sentinel */
}  /* readInput */
X
X
/* reader - read char's into userinput; be sure input not blank  */
Static Void reader()
{
X
X  /* readInput - read char's into userinput                        */
X  do {
X    readInput();
X    pos_ = skipblanks(1L);   /* ignore blank lines */
X  } while (pos_ > inputleng);   /* reader */
}
X
X
/* parseName - return (installed) NAME starting at userinput[pos]*/
Static short parseName()
{
X  NAMESTRING nm;   /* array to accumulate characters */
X  char leng;   /* length of name */
X
X  leng = 0;
X  while ((pos_ <= inputleng) & (!isDelim(userinput[pos_ - 1]))) {
X    if (leng == NAMELENG) {
X      printf("Name too long, begins: %.*s\n", NAMELENG, nm);
X      longjmp(_JL99, 1);
X    }
X    leng++;
X    nm[leng - 1] = userinput[pos_ - 1];
X    pos_++;
X  }
X  if (leng == 0) {
X    printf("Error: expected name, instead read: %c\n", userinput[pos_ - 1]);
X    longjmp(_JL99, 1);
X  }
X  for (; leng < NAMELENG; leng++)
X    nm[leng] = ' ';
X  pos_ = skipblanks((long)pos_);   /* skip blanks after name */
X  return (install(nm));
}  /* parseName */
X
X
Local boolean isDigits(pos)
long pos;
{
X  boolean Result;
X
X  if (!isdigit(userinput[pos - 1]))
X    return false;
X  Result = true;
X  while (isdigit(userinput[pos - 1]))
X    pos++;
X  if (!isDelim(userinput[pos - 1]))
X    return false;
X  return Result;
}  /* isDigits */
X
Local boolean isNumber(pos)
long pos;
{
X
X  /* isDigits - check if sequence of digits begins at pos          */
X  return (isDigits(pos) | ((userinput[pos - 1] == '-') & isDigits(pos + 1)));
}  /* isNumber */
X
X
/* isValue - check if a number or quoted const begins at pos     */
Static boolean isValue(pos)
long pos;
{
X
X  /* isNumber - check if a number begins at pos                    */
X  return ((userinput[pos - 1] == '#') | isNumber(pos));
}  /* isValue */
X
X
Local long parseInt()
{
X  long n, sign;
X
X  n = 0;
X  sign = 1;
X  if (userinput[pos_ - 1] == '-') {
X    sign = -1;
X    pos_++;
X  }
X  while (isdigit(userinput[pos_ - 1])) {
X    n = n * 10 + userinput[pos_ - 1] - '0';
X    pos_++;
X  }
X  pos_ = skipblanks((long)pos_);   /* skip blanks after number */
X  return (n * sign);
}  /* parseInt */
X
X
/* parseVal - return primitive value starting at userinput[pos]  */
Static STVALUEREC *parseVal()
{
X
X  /* parseInt - return number starting at userinput[pos]           */
X  if (userinput[pos_ - 1] == '#') {
X    pos_++;
X    return (mkSYM(parseName()));
X  } else
X    return (mkINT(parseInt()));
}  /* parseVal */
X
X
Static EXPLISTREC *parseEL PV();
X
X
/* parseExp - return EXP starting at userinput[pos]              */
Static EXPREC *parseExp()
{
X  short nm;
X  EXPLISTREC *el;
X
X  if (userinput[pos_ - 1] == '(') {  /* APEXP */
X    pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X    nm = parseName();
X    el = parseEL();
X    return (mkAPEXP(nm, el));
X  } else if (isValue((long)pos_))
X    return (mkVALEXP(parseVal()));   /* VALEXP */
X  else
X    return (mkVAREXP(parseName()));   /* VAREXP */
}  /* parseExp */
X
X
/* parseEL - return EXPLIST starting at userinput[pos]           */
Static EXPLISTREC *parseEL()
{
X  EXPREC *e;
X  EXPLISTREC *el;
X
X  if (userinput[pos_ - 1] == ')') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X    return NULL;
X  } else {
X    e = parseExp();
X    el = parseEL();
X    return (mkExplist(e, el));
X  }
}  /* parseEL */
X
X
/* parseNL - return NAMELIST starting at userinput[pos]          */
Static NAMELISTREC *parseNL()
{
X  short nm;
X  NAMELISTREC *nl;
X
X  if (userinput[pos_ - 1] == ')') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X    return NULL;
X  } else {
X    nm = parseName();
X    nl = parseNL();
X    return (mkNamelist(nm, nl));
X  }
}  /* parseNL */
X
X
/* parseDef - parse function definition at userinput[pos]        */
Static short parseDef(fenv)
FUNDEFREC **fenv;
{
X  short fname;   /* function name */
X  FUNDEFREC *newfun;   /* new FUNDEFREC */
X
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X  pos_ = skipblanks(pos_ + 6L);   /* skip 'define ..' */
X  fname = parseName();
X  newfun = newFunDef(fname, fenv);
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X  newfun->formals = parseNL();
X  newfun->body = parseExp();
X  pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X  return fname;
}  /* parseDef */
X
X
/* parseClass - parse class definition at userinput[pos]         */
Static short parseClass()
{
X  short cname, sname, fname;
X  CLASSREC *thisclass, *superclass;
X  NAMELISTREC *rep;
X  FUNDEFREC *cenv;
X
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X  pos_ = skipblanks(pos_ + 5L);   /* skip 'class ...' */
X  cname = parseName();
X  sname = parseName();
X  superclass = fetchClass(sname);
X  if (superclass == NULL) {
X    printf("Undefined superclass: ");
X    prName(sname);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  thisclass = newClass(cname, superclass);
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ...' */
X  rep = parseNL();   /* component names */
X  cenv = NULL;
X  while (userinput[pos_ - 1] == '(') {
X    fname = parseDef(&cenv);
X    prName(fname);
X    putchar('\n');
X  }
X  thisclass->exported = cenv;
X  if (rep == NULL)
X    thisclass->clrep = superclass->clrep;
X  else {
X    thisclass->clrep = rep;
X    while (rep->tail != NULL)
X      rep = rep->tail;
X    rep->tail = superclass->clrep;
X  }
X  pos_ = skipblanks(pos_ + 1L);   /* skip ' ..)' */
X  return cname;
}  /* parseClass */
X
X
/*****************************************************************
X *                     ENVIRONMENTS                              *
X *****************************************************************/
X
/* emptyEnv - return an environment with no bindings             */
Static ENVREC *emptyEnv()
{
X  return (mkEnv(NULL, NULL));
}  /* emptyEnv */
X
X
/* bindVar - bind variable nm to value n in environment rho      */
Static Void bindVar(nm, v, rho)
short nm;
STVALUEREC *v;
ENVREC *rho;
{
X  rho->vars = mkNamelist(nm, rho->vars);
X  rho->values = mkValuelist(v, rho->values);
}  /* bindVar */
X
X
/* findVar - look up nm in rho                                   */
Static VALUELISTREC *findVar(nm, rho)
short nm;
ENVREC *rho;
{
X  NAMELISTREC *nl;
X  VALUELISTREC *vl;
X  boolean found;
X
X  found = false;
X  nl = rho->vars;
X  vl = rho->values;
X  while (nl != NULL && !found) {
X    if (nl->head == nm)
X      found = true;
X    else {
X      nl = nl->tail;
X      vl = vl->tail;
X    }
X  }
X  return vl;
}  /* findVar */
X
X
/* assign - assign value n to variable nm in rho                 */
Static Void assign(nm, v, rho)
short nm;
STVALUEREC *v;
ENVREC *rho;
{
X  VALUELISTREC *varloc;
X
X  varloc = findVar(nm, rho);
X  varloc->head = v;
}  /* assign */
X
X
/* fetch - return number bound to nm in rho                      */
Static STVALUEREC *fetch(nm, rho)
short nm;
ENVREC *rho;
{
X  VALUELISTREC *vl;
X
X  vl = findVar(nm, rho);
X  return (vl->head);
}  /* fetch */
X
X
/* isBound - check if nm is bound in rho                         */
Static boolean isBound(nm, rho)
short nm;
ENVREC *rho;
{
X  return (findVar(nm, rho) != NULL);
}  /* isBound */
X
X
/*****************************************************************
X *                           VALUES                              *
X *****************************************************************/
X
/* prValue - print value v                                       */
Static Void prValue(v)
STVALUEREC *v;
{
X  if (v->vtype == INT) {
X    printf("%ld", v->UU.intval);
X    return;
X  }
X  if (v->vtype == SYM)
X    prName(v->UU.symval);
X  else
X    printf("<userval>");
}  /* prValue */
X
X
/* isTrueVal - return true if v is true (non-zero) value         */
Static boolean isTrueVal(v)
STVALUEREC *v;
{
X  if (v->vtype == USER || v->vtype == SYM)
X    return true;
X  else
X    return (v->UU.intval != 0);
}  /* isTrueVal */
X
X
/* arity - return number of arguments expected by op             */
Local long arity(op)
BUILTINOP op;
{
X  if (((1L << ((long)op)) & ((1 << ((long)GTOP + 1)) - (1 << ((long)PLUSOP)))) != 0)
X    return 2;
X  else
X    return 1;
}  /* arity */
X
X
/* applyValueOp - apply VALUEOP op to arguments in VALUELIST vl  */
Static STVALUEREC *applyValueOp(op, vl)
BUILTINOP op;
VALUELISTREC *vl;
{
X  long n, n1, n2;
X  STVALUEREC *s1, *s2;
X
X  if (arity(op) != lengthVL(vl)) {
X    printf("Wrong number of arguments to ");
X    prName((int)op + 1);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  s1 = vl->head;   /* 1st actual */
X  if (arity(op) == 2)   /* 2nd actual */
X    s2 = vl->tail->head;
X  if (op == PRINTOP) {
X    prValue(s1);
X    putchar('\n');
X    return s1;
X  } else if (op == EQOP) {
X    if (s1->vtype == s2->vtype) {
X      if (s1->vtype == INT && s1->UU.intval == s2->UU.intval ||
X	  s1->vtype == SYM && s1->UU.symval == s2->UU.symval)
X	return trueValue;
X      else
X	return falseValue;
X    } else
X      return falseValue;
X  } else {
X    if (s1->vtype != INT || s2->vtype != INT) {
X      printf("Arguments to numeric op not integer: ");
X      prName((int)op+1);
X      putchar('\n');
X      longjmp(_JL99, 1);
X    }
X    n1 = s1->UU.intval;
X    n2 = s2->UU.intval;
X    switch (op) {
X
X    case PLUSOP:
X      n = n1 + n2;
X      break;
X
X    case MINUSOP:
X      n = n1 - n2;
X      break;
X
X    case TIMESOP:
X      n = n1 * n2;
X      break;
X
X    case DIVOP:
X      n = n1 / n2;
X      break;
X
X    case LTOP:
X      if (n1 < n2)
X	n = 1;
X      else
X	n = 0;
X      break;
X
X    case GTOP:
X      if (n1 > n2)
X	n = 1;
X      else
X	n = 0;
X      break;
X    }/* case */
X    return (mkINT(n));
X  }
}  /* applyValueOp */
X
X
Static STVALUEREC *eval PP((EXPREC *e, ENVREC *rho, STVALUEREC *rcvr));
X
/* Local variables for eval: */
struct LOC_eval {
X  ENVREC *rho;
X  STVALUEREC *rcvr;
} ;
X
/* evalList - evaluate each expression in el                     */
Local VALUELISTREC *evalList(el, LINK)
EXPLISTREC *el;
struct LOC_eval *LINK;
{
X  STVALUEREC *h;
X  VALUELISTREC *t;
X
X  if (el == NULL)
X    return NULL;
X  else {
X    h = eval(el->head, LINK->rho, LINK->rcvr);
X    t = evalList(el->tail, LINK);
X    return (mkValuelist(h, t));
X  }
}  /* evalList */
X
/* applyGlobalFun - apply function defined at top level          */
Local STVALUEREC *applyGlobalFun(optr, actuals, LINK)
short optr;
VALUELISTREC *actuals;
struct LOC_eval *LINK;
{
X  FUNDEFREC *f;
X  ENVREC *rho;
X
X  f = fetchFun(optr, fundefs);
X  if (f == NULL) {
X    printf("Undefined function: ");
X    prName(optr);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  if (lengthNL(f->formals) != lengthVL(actuals)) {
X    printf("Wrong number of arguments to: ");
X    prName(f->funname);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  rho = mkEnv(f->formals, actuals);
X  return (eval(f->body, rho, LINK->rcvr));   /* with */
}  /* applyGlobalFun */
X
/* methodSearch - find class of optr, if any, starting at cl     */
Local FUNDEFREC *methodSearch(optr, cl, LINK)
short optr;
CLASSREC *cl;
struct LOC_eval *LINK;
{
X  FUNDEFREC *f;
X
X  f = NULL;
X  while (f == NULL && cl != NULL) {
X    f = fetchFun(optr, cl->exported);
X    if (f == NULL)
X      cl = cl->clsuper;
X  }
X  return f;
}  /* methodSearch */
X
/* applyMethod - apply method f to actuals                       */
Local STVALUEREC *applyMethod(f, actuals, LINK)
FUNDEFREC *f;
VALUELISTREC *actuals;
struct LOC_eval *LINK;
{
X  ENVREC *rho;
X
X  if (lengthNL(f->formals) != lengthVL(actuals) - 1) {
X    printf("Wrong number of arguments to: ");
X    prName(f->funname);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  rho = mkEnv(f->formals, actuals->tail);
X  return (eval(f->body, rho, actuals->head));
}  /* applyMethod */
X
/* mkRepFor - make list of all zeros of same length as nl        */
Local VALUELISTREC *mkRepFor(nl)
NAMELISTREC *nl;
{
X  if (nl == NULL)
X    return NULL;
X  else
X    return (mkValuelist(falseValue, mkRepFor(nl->tail)));
}  /* mkRepFor */
X
/* applyCtrlOp - apply CONTROLOP op to args in rho               */
Local STVALUEREC *applyCtrlOp(op, args, LINK)
BUILTINOP op;
EXPLISTREC *args;
struct LOC_eval *LINK;
{
X  STVALUEREC *Result, *v;
X  CLASSREC *cl;
X  STVALUEREC *newval;
X  EXPLISTREC *WITH;
X
X  WITH = args;
X  switch (op) {
X
X  case IFOP:
X    if (isTrueVal(eval(WITH->head, LINK->rho, LINK->rcvr)))
X      Result = eval(WITH->tail->head, LINK->rho, LINK->rcvr);
X    else
X      Result = eval(WITH->tail->tail->head, LINK->rho, LINK->rcvr);
X    break;
X
X  case WHILEOP:
X    v = eval(WITH->head, LINK->rho, LINK->rcvr);
X    while (isTrueVal(v)) {
X      v = eval(WITH->tail->head, LINK->rho, LINK->rcvr);
X      v = eval(WITH->head, LINK->rho, LINK->rcvr);
X    }
X    Result = v;
X    break;
X
X  case SETOP:
X    v = eval(WITH->tail->head, LINK->rho, LINK->rcvr);
X    if (isBound(WITH->head->UU.varble, LINK->rho))
X      assign(WITH->head->UU.varble, v, LINK->rho);
X    else if (isBound(WITH->head->UU.varble, LINK->rcvr->UU.userval))
X      assign(WITH->head->UU.varble, v, LINK->rcvr->UU.userval);
X    else if (isBound(WITH->head->UU.varble, globalEnv))
X      assign(WITH->head->UU.varble, v, globalEnv);
X    else
X      bindVar(WITH->head->UU.varble, v, globalEnv);
X    Result = v;
X    break;
X
X  case BEGINOP:
X    while (args->tail != NULL) {
X      v = eval(args->head, LINK->rho, LINK->rcvr);
X      args = args->tail;
X    }
X    Result = eval(args->head, LINK->rho, LINK->rcvr);
X    break;
X
X  case NEWOP:
X    /* Argument is a VAREXP with the name of a class */
X    cl = fetchClass(args->head->UU.varble);
X    newval = mkUSER(mkEnv(cl->clrep, mkRepFor(cl->clrep)), cl);
X    assign(SELF, newval, newval->UU.userval);
X    Result = newval;
X    break;
X  }/* case and with */
X  return Result;
}  /* applyCtrlOp */
X
X
/*****************************************************************
X *                     EVALUATION                                *
X *****************************************************************/
/* eval - return value of e in environment rho, receiver rcvr    */
Static STVALUEREC *eval(e, rho_, rcvr_)
EXPREC *e;
ENVREC *rho_;
STVALUEREC *rcvr_;
{
X  struct LOC_eval V;
X  STVALUEREC *Result;
X  VALUELISTREC *vl;
X  FUNDEFREC *f;
X
X  V.rho = rho_;
X  V.rcvr = rcvr_;
X  switch (e->etype) {
X
X  case VALEXP:
X    Result = e->UU.valu;
X    break;
X
X  case VAREXP:
X    if (isBound(e->UU.varble, V.rho))
X      Result = fetch(e->UU.varble, V.rho);
X    else if (isBound(e->UU.varble, V.rcvr->UU.userval))
X      Result = fetch(e->UU.varble, V.rcvr->UU.userval);
X    else if (isBound(e->UU.varble, globalEnv))
X      Result = fetch(e->UU.varble, globalEnv);
X    else {
X      printf("Undefined variable: ");
X      prName(e->UU.varble);
X      putchar('\n');
X      longjmp(_JL99, 1);
X    }
X    break;
X
X  case APEXP:
X    if (e->UU.U2.optr <= numCtrlOps)
X      Result = applyCtrlOp(primOp(e->UU.U2.optr), e->UU.U2.args, &V);
X    else {
X      vl = evalList(e->UU.U2.args, &V);
X      if (lengthVL(vl) == 0)
X	Result = applyGlobalFun(e->UU.U2.optr, vl, &V);
X      else {
X	f = methodSearch(e->UU.U2.optr, vl->head->owner, &V);
X	if (f != NULL)
X	  Result = applyMethod(f, vl, &V);
X	else if (e->UU.U2.optr <= numBuiltins)
X	  Result = applyValueOp(primOp(e->UU.U2.optr), vl);
X	else
X	  Result = applyGlobalFun(e->UU.U2.optr, vl, &V);
X      }
X    }
X    break;
X  }/* case and with */
X  return Result;
}  /* eval */
X
X
/*****************************************************************
X *                     READ-EVAL-PRINT LOOP                      *
X *****************************************************************/
X
/* initHierarchy - allocate class Object and create an instance  */
Static Void initHierarchy()
{
X  classes = NULL;
X  OBJECTCLASS = newClass(install("Object                        "), NULL);
X  OBJECTCLASS->exported = NULL;
X  OBJECTCLASS->clrep = mkNamelist(SELF, NULL);
X  objectInst = mkUSER(mkEnv(OBJECTCLASS->clrep, mkValuelist(mkINT(0L), NULL)),
X		      OBJECTCLASS);
}  /* initHierarchy */
X
X
main(argc, argv)
int argc;
Char *argv[];
{  /* smalltalk main */
X  PASCAL_MAIN(argc, argv);
X  if (setjmp(_JL99))
X    goto _L99;
X  initNames();
X  initHierarchy();
X  globalEnv = emptyEnv();
X
X  trueValue = mkINT(1L);
X  falseValue = mkINT(0L);
X
X  quittingtime = false;
_L99:
X  while (!quittingtime) {
X    reader();
X    if (matches((long)pos_, 4, "quit                          ")) {
X      quittingtime = true;
X      break;
X    }
X    if ((userinput[pos_ - 1] == '(') & matches(skipblanks(pos_ + 1L), 6,
X	  "define                        ")) {
X      prName(parseDef(&fundefs));
X      putchar('\n');
X    } else if ((userinput[pos_ - 1] == '(') & matches(skipblanks(pos_ + 1L),
X		 5, "class                         ")) {
X      prName(parseClass());
X      putchar('\n');
X    } else {
X      currentExp = parseExp();
X      prValue(eval(currentExp, emptyEnv(), objectInst));
X      printf("\n\n");
X    }
X  }  /* while */
X  exit(0);
}  /* smalltalk */
X
X
X
/* End. */
SHAR_EOF
  (set 19 90 03 14 17 56 57 'c-distr/smalltalk.c'; eval "$shar_touch") &&
  chmod 0644 'c-distr/smalltalk.c'
if test $? -ne 0
then ${echo} 'restore of c-distr/smalltalk.c failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/smalltalk.c: MD5 check failed'
       ) << SHAR_EOF
d1dafad5ff4de228cbbc45f94ee00173  c-distr/smalltalk.c
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/smalltalk.c'` -ne 29009 && \
  ${echo} 'restoration warning:  size of c-distr/smalltalk.c is not 29009'
  fi
fi
# ============= c-distr/scheme.c ==============
if test -f 'c-distr/scheme.c' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/scheme.c (file already exists)'
else
${echo} 'x - extracting c-distr/scheme.c (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/scheme.c' &&
/* Output from p2c, the Pascal-to-C translator */
/* From input file "scheme.p" */
X
X
/*****************************************************************
X *                     DECLARATIONS                              *
X *****************************************************************/
X
#include <p2c/p2c.h>
X
X
#define NAMELENG        20   /* Maximum length of a name */
#define MAXNAMES        300   /* Maximum number of different names */
#define MAXINPUT        4000   /* Maximum length of an input */
X
#define PROMPT          "-> "
#define PROMPT2         "> "
#define COMMENTCHAR     ";"
X
#define TABCODE         9   /* in ASCII */
X
X
typedef Char NAMESTRING[NAMELENG];
X
/* a NAME is an index in printNames */
X
typedef enum {
X  IFOP, WHILEOP, SETOP, BEGINOP, PLUSOP, MINUSOP, TIMESOP, DIVOP, EQOP, LTOP,
X  GTOP, CONSOP, CAROP, CDROP, NUMBERPOP, SYMBOLPOP, LISTPOP, NULLPOP,
X  PRIMOPPOP, CLOSUREPOP, PRINTOP
} BUILTINOP;
X
X
typedef enum {
X  NILSXP, NUMSXP, SYMSXP, LISTSXP, CLOSXP, PRIMSXP
} SEXPTYPE;
X
typedef struct SEXPREC {
X  SEXPTYPE sxptype;
X  union {
X    long intval;
X    short symval;
X    struct {
X      struct SEXPREC *carval, *cdrval;
X    } U3;
X    struct {
X      struct EXPREC *clofun;
X      struct ENVREC *cloenv;
X    } U4;
X    BUILTINOP primval;
X  } UU;
} SEXPREC;
X
typedef enum {
X  VALEXP, VAREXP, APEXP, LAMEXP
} EXPTYPE;
X
typedef struct EXPREC {
X  EXPTYPE etype;
X  union {
X    SEXPREC *sxp;
X    short varble;
X    struct {
X      struct EXPREC *optr;
X      struct EXPLISTREC *args;
X    } U2;
X    struct {
X      struct NAMELISTREC *formals;
X      struct EXPREC *lambdabody;
X    } U3;
X  } UU;
} EXPREC;
X
typedef struct EXPLISTREC {
X  EXPREC *head;
X  struct EXPLISTREC *tail;
} EXPLISTREC;
X
typedef struct VALUELISTREC {
X  SEXPREC *head;
X  struct VALUELISTREC *tail;
} VALUELISTREC;
X
typedef struct NAMELISTREC {
X  short head;
X  struct NAMELISTREC *tail;
} NAMELISTREC;
X
typedef struct ENVREC {
X  NAMELISTREC *vars;
X  VALUELISTREC *values;
X  struct ENVREC *enclosing;
} ENVREC;
X
X
Static ENVREC *globalEnv;
X
Static EXPREC *currentExp;
X
Static Char userinput[MAXINPUT];
Static short inputleng, pos_;
X
Static NAMESTRING printNames[MAXNAMES];
Static short numNames, numBuiltins;
X
Static SEXPREC *nilValue, *trueValue;
X
Static boolean quittingtime;
X
X
/*****************************************************************
X *                     DATA STRUCTURE OP'S                       *
X *****************************************************************/
X
/* mkVALEXP - return an EXP of type VALEXP with sxp s            */
Static EXPREC *mkVALEXP(s)
SEXPREC *s;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = VALEXP;
X  e->UU.sxp = s;
X  return e;
}  /* mkVALEXP */
X
X
/* mkVAREXP - return an EXP of type VAREXP with varble nm        */
Static EXPREC *mkVAREXP(nm)
short nm;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = VAREXP;
X  e->UU.varble = nm;
X  return e;
}  /* mkVAREXP */
X
X
/* mkAPEXP - return EXP of type APEXP w/ optr op and args el     */
Static EXPREC *mkAPEXP(op, el)
EXPREC *op;
EXPLISTREC *el;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = APEXP;
X  e->UU.U2.optr = op;
X  e->UU.U2.args = el;
X  return e;
}  /* mkAPEXP */
X
X
/* mkLAMEXP - return EXP of type LAMEXP w/ formals f and body b  */
Static EXPREC *mkLAMEXP(f, b)
NAMELISTREC *f;
EXPREC *b;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = LAMEXP;
X  e->UU.U3.formals = f;
X  e->UU.U3.lambdabody = b;
X  return e;
}  /* mkLAMEXP */
X
X
/* mkSExp - return SEXP of type t (but no value)                 */
Static SEXPREC *mkSExp(t)
SEXPTYPE t;
{
X  SEXPREC *s;
X
X  s = (SEXPREC *)Malloc(sizeof(SEXPREC));
X  s->sxptype = t;
X  return s;
}  /* mkSExp */
X
X
/* mkPRIMSXP - return SEXP of type PRIMSXP w/ value op           */
Static SEXPREC *mkPRIMSXP(op)
BUILTINOP op;
{
X  SEXPREC *result;
X
X  result = (SEXPREC *)Malloc(sizeof(SEXPREC));
X  result->sxptype = PRIMSXP;
X  result->UU.primval = op;
X  return result;
}  /* mkPRIMSXP */
X
X
/* mkCLOSXP - return SEXP of type CLOSXP w/ expr e and env rho   */
Static SEXPREC *mkCLOSXP(e, rho)
EXPREC *e;
ENVREC *rho;
{
X  SEXPREC *result;
X
X  result = (SEXPREC *)Malloc(sizeof(SEXPREC));
X  result->sxptype = CLOSXP;
X  result->UU.U4.clofun = e;
X  result->UU.U4.cloenv = rho;
X  return result;
}  /* mkCLOSXP */
X
X
/* mkExplist - return an EXPLIST with head e and tail el         */
Static EXPLISTREC *mkExplist(e, el)
EXPREC *e;
EXPLISTREC *el;
{
X  EXPLISTREC *newel;
X
X  newel = (EXPLISTREC *)Malloc(sizeof(EXPLISTREC));
X  newel->head = e;
X  newel->tail = el;
X  return newel;
}  /* mkExplist */
X
X
/* mkNamelist - return a NAMELIST with head n and tail nl        */
Static NAMELISTREC *mkNamelist(nm, nl)
short nm;
NAMELISTREC *nl;
{
X  NAMELISTREC *newnl;
X
X  newnl = (NAMELISTREC *)Malloc(sizeof(NAMELISTREC));
X  newnl->head = nm;
X  newnl->tail = nl;
X  return newnl;
}  /* mkNamelist */
X
X
/* mkValuelist - return an VALUELIST with head s and tail vl     */
Static VALUELISTREC *mkValuelist(s, vl)
SEXPREC *s;
VALUELISTREC *vl;
{
X  VALUELISTREC *newvl;
X
X  newvl = (VALUELISTREC *)Malloc(sizeof(VALUELISTREC));
X  newvl->head = s;
X  newvl->tail = vl;
X  return newvl;
}  /* mkValuelist */
X
X
/* mkEnv - return an ENV with vars nl, value vl, enclosing rho   */
Static ENVREC *mkEnv(nl, vl, rho)
NAMELISTREC *nl;
VALUELISTREC *vl;
ENVREC *rho;
{
X  ENVREC *newrho;
X
X  newrho = (ENVREC *)Malloc(sizeof(ENVREC));
X  newrho->vars = nl;
X  newrho->values = vl;
X  newrho->enclosing = rho;
X  return newrho;
}  /* mkEnv */
X
X
/* lengthVL - return length of VALUELIST vl                      */
Static long lengthVL(vl)
VALUELISTREC *vl;
{
X  long i;
X
X  i = 0;
X  while (vl != NULL) {
X    i++;
X    vl = vl->tail;
X  }
X  return i;
}  /* lengthVL */
X
X
/* lengthNL - return length of NAMELIST nl                       */
Static long lengthNL(nl)
NAMELISTREC *nl;
{
X  long i;
X
X  i = 0;
X  while (nl != NULL) {
X    i++;
X    nl = nl->tail;
X  }
X  return i;
}  /* lengthNL */
X
X
/*****************************************************************
X *                     NAME MANAGEMENT                           *
X *****************************************************************/
X
/* initNames - place all pre-defined names into printNames       */
Static Void initNames()
{
X  long i;
X
X  i = 1;
X  memcpy(printNames[i - 1], "if                  ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "while               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "set                 ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "begin               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "+                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "-                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "*                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "/                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "=                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "<                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], ">                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "cons                ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "car                 ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "cdr                 ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "number?             ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "symbol?             ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "list?               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "null?               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "primop?             ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "closure?            ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "print               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "T                   ", sizeof(NAMESTRING));
X  numNames = i;
X  numBuiltins = i;
}  /* initNames */
X
X
Static jmp_buf _JL99;
X
X
/* install - insert new name into printNames                     */
Static short install(nm)
Char *nm;
{
X  long i;
X  boolean found;
X
X  i = 1;
X  found = false;
X  while (i <= numNames && !found) {
X    if (!memcmp(nm, printNames[i - 1], sizeof(NAMESTRING)))
X      found = true;
X    else
X      i++;
X  }
X  if (found)
X    return i;
X  if (i > MAXNAMES) {
X    printf("No more room for names\n");
X    longjmp(_JL99, 1);
X  }
X  numNames = i;
X  memcpy(printNames[i - 1], nm, sizeof(NAMESTRING));
X  return i;
}  /* install */
X
X
/* prName - print name nm                                        */
Static Void prName(nm)
short nm;
{
X  long i;
X
X  i = 1;
X  while (i <= NAMELENG) {
X    if (printNames[nm - 1][i - 1] != ' ') {
X      putchar(printNames[nm - 1][i - 1]);
X      i++;
X    } else
X      i = NAMELENG + 1;
X  }
}  /* prName */
X
X
/*****************************************************************
X *                        INPUT                                  *
X *****************************************************************/
X
/* isDelim - check if c is a delimiter                           */
Static boolean isDelim(c)
Char c;
{
X  return (c == ';' || c == ' ' || c == ')' || c == '(');
}  /* isDelim */
X
X
/* skipblanks - return next non-blank position in userinput      */
Static long skipblanks(p)
long p;
{
X  while (userinput[p - 1] == ' ')
X    p++;
X  return p;
}  /* skipblanks */
X
X
/* matches - check if string nm matches userinput[s .. s+leng]   */
Static boolean matches(s, leng, nm)
long s;
char leng;
Char *nm;
{
X  boolean match;
X  long i;
X
X  match = true;
X  i = 1;
X  while (match && i <= leng) {
X    if (userinput[s - 1] != nm[i - 1])
X      match = false;
X    i++;
X    s++;
X  }
X  if (!isDelim(userinput[s - 1]))
X    match = false;
X  return match;
}  /* matches */
X
X
/* nextchar - read next char - filter tabs and comments          */
Local Void nextchar(c)
Char *c;
{
X  Char STR1[256];
X
X  *c = getchar();
X  if (*c == '\n')
X    *c = ' ';
X  if (*c == (Char)TABCODE) {
X    *c = ' ';
X    return;
X  }
X  sprintf(STR1, "%c", *c);
X  if (strcmp(STR1, COMMENTCHAR))
X    return;
X  while (!P_eoln(stdin)) {
X    *c = getchar();
X    if (*c == '\n')
X      *c = ' ';
X  }
X  *c = ' ';
}  /* nextchar */
X
/* readParens - read char's, ignoring newlines, to matching ')'  */
Local Void readParens()
{
X  long parencnt;   /* current depth of parentheses */
X  Char c;
X
X  parencnt = 1;   /* '(' just read */
X  do {
X    if (P_eoln(stdin))
X      fputs(PROMPT2, stdout);
X    nextchar(&c);
X    pos_++;
X    if (pos_ == MAXINPUT) {
X      printf("User input too long\n");
X      longjmp(_JL99, 1);
X    }
X    userinput[pos_ - 1] = c;
X    if (c == '(')
X      parencnt++;
X    if (c == ')')
X      parencnt--;
X  } while (parencnt != 0);   /* readParens */
}
X
Local Void readInput()
{
X  Char c;
X
X  fputs(PROMPT, stdout);
X  pos_ = 0;
X  do {
X    pos_++;
X    if (pos_ == MAXINPUT) {
X      printf("User input too long\n");
X      longjmp(_JL99, 1);
X    }
X    nextchar(&c);
X    userinput[pos_ - 1] = c;
X    if (userinput[pos_ - 1] == '(')
X      readParens();
X  } while (!P_eoln(stdin));
X  inputleng = pos_;
X  userinput[pos_] = ';';   /* sentinel */
}  /* readInput */
X
X
/* reader - read char's into userinput; be sure input not blank  */
Static Void reader()
{
X
X  /* readInput - read char's into userinput                        */
X  do {
X    readInput();
X    pos_ = skipblanks(1L);   /* ignore blank lines */
X  } while (pos_ > inputleng);   /* reader */
}
X
X
/* parseName - return (installed) NAME starting at userinput[pos]*/
Static short parseName()
{
X  NAMESTRING nm;   /* array to accumulate characters */
X  char leng;   /* length of name */
X
X  leng = 0;
X  while ((pos_ <= inputleng) & (!isDelim(userinput[pos_ - 1]))) {
X    if (leng == NAMELENG) {
X      printf("Name too long, begins: %.*s\n", NAMELENG, nm);
X      longjmp(_JL99, 1);
X    }
X    leng++;
X    nm[leng - 1] = userinput[pos_ - 1];
X    pos_++;
X  }
X  if (leng == 0) {
X    printf("Error: expected name, instead read: %c\n", userinput[pos_ - 1]);
X    longjmp(_JL99, 1);
X  }
X  for (; leng < NAMELENG; leng++)
X    nm[leng] = ' ';
X  pos_ = skipblanks((long)pos_);   /* skip blanks after name */
X  return (install(nm));
}  /* parseName */
X
X
Local boolean isDigits(pos)
long pos;
{
X  boolean Result;
X
X  if (!isdigit(userinput[pos - 1]))
X    return false;
X  Result = true;
X  while (isdigit(userinput[pos - 1]))
X    pos++;
X  if (!isDelim(userinput[pos - 1]))
X    return false;
X  return Result;
}  /* isDigits */
X
X
/* isNumber - check if a number begins at pos                    */
Static boolean isNumber(pos)
long pos;
{
X
X  /* isDigits - check if sequence of digits begins at pos          */
X  return (isDigits(pos) | ((userinput[pos - 1] == '-') & isDigits(pos + 1)));
}  /* isNumber */
X
X
/* isValue - check if a number or quoted const begins at pos     */
Static boolean isValue(pos)
long pos;
{
X  return ((userinput[pos - 1] == '\'') | isNumber(pos));
}  /* isValue */
X
X
Local SEXPREC *parseSExp PV();
X
/* Local variables for parseSExp: */
struct LOC_parseSExp {
X  SEXPREC *s;
} ;
X
/* parseInt - return number starting at userinput[pos]           */
Local SEXPREC *parseInt(LINK)
struct LOC_parseSExp *LINK;
{
X  long sum, sign;
X
X  LINK->s = mkSExp(NUMSXP);
X  sum = 0;
X  sign = 1;
X  if (userinput[pos_ - 1] == '-') {
X    sign = -1;
X    pos_++;
X  }
X  while (isdigit(userinput[pos_ - 1])) {
X    sum = sum * 10 + userinput[pos_ - 1] - '0';
X    pos_++;
X  }
X  LINK->s->UU.intval = sum * sign;
X  pos_ = skipblanks((long)pos_);   /* skip blanks after number */
X  return LINK->s;
}  /* parseInt */
X
/* parseSym - return symbol starting at userinput[pos]           */
Local SEXPREC *parseSym(LINK)
struct LOC_parseSExp *LINK;
{
X  LINK->s = mkSExp(SYMSXP);
X  LINK->s->UU.symval = parseName();
X  return LINK->s;
}  /* parseSym */
X
/* parseList - return list starting at userinput[pos]            */
Local SEXPREC *parseList(LINK)
struct LOC_parseSExp *LINK;
{
X  SEXPREC *Result, *car, *cdr;
X
X  if (userinput[pos_ - 1] == ')') {
X    Result = mkSExp(NILSXP);
X    pos_ = skipblanks(pos_ + 1L);
X    return Result;
X  } else {
X    car = parseSExp();
X    cdr = parseList(LINK);
X    LINK->s = mkSExp(LISTSXP);
X    LINK->s->UU.U3.carval = car;
X    LINK->s->UU.U3.cdrval = cdr;
X    return LINK->s;
X  }
X  return Result;
}  /* parseList */
X
Local SEXPREC *parseSExp()
{
X  struct LOC_parseSExp V;
X
X  if (isNumber((long)pos_))
X    return (parseInt(&V));
X  else if (userinput[pos_ - 1] == '(') {
X    pos_ = skipblanks(pos_ + 1L);
X    return (parseList(&V));
X  } else
X    return (parseSym(&V));
}  /* parseSExp */
X
X
/* parseVal - return S-expression starting at userinput[pos]     */
Static SEXPREC *parseVal()
{
X
X  /* parseSExp - return quoted S-expr starting at userinput[pos]   */
X  if (userinput[pos_ - 1] == '\'')
X    pos_++;
X  return (parseSExp());
}  /* parseVal */
X
X
Static EXPLISTREC *parseEL PV();
X
Static NAMELISTREC *parseNL PV();
X
X
/* parseExp - return EXP starting at userinput[pos]              */
Static EXPREC *parseExp()
{
X  EXPREC *op, *body;
X  NAMELISTREC *nl;
X  EXPLISTREC *el;
X
X  if (userinput[pos_ - 1] == '(') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X    if (matches((long)pos_, 6, "lambda              ")) {  /* LAMEXP */
X      pos_ = skipblanks(pos_ + 6L);   /* skip 'lambda ..' */
X      pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X      nl = parseNL();
X      body = parseExp();
X      pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X      return (mkLAMEXP(nl, body));
X    } else {  /* APEXP */
X      op = parseExp();
X      el = parseEL();
X      return (mkAPEXP(op, el));
X    }
X  } else if (isValue((long)pos_))
X    return (mkVALEXP(parseVal()));   /* VALEXP */
X  else
X    return (mkVAREXP(parseName()));   /* VAREXP */
}  /* parseExp */
X
X
/* parseEL - return EXPLIST starting at userinput[pos]           */
Static EXPLISTREC *parseEL()
{
X  EXPREC *e;
X  EXPLISTREC *el;
X
X  if (userinput[pos_ - 1] == ')') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X    return NULL;
X  } else {
X    e = parseExp();
X    el = parseEL();
X    return (mkExplist(e, el));
X  }
}  /* parseEL */
X
X
/* parseNL - return NAMELIST starting at userinput[pos]          */
Static NAMELISTREC *parseNL()
{
X  short nm;
X  NAMELISTREC *nl;
X
X  if (userinput[pos_ - 1] == ')') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X    return NULL;
X  } else {
X    nm = parseName();
X    nl = parseNL();
X    return (mkNamelist(nm, nl));
X  }
}  /* parseNL */
X
X
/*****************************************************************
X *                     ENVIRONMENTS                              *
X *****************************************************************/
X
/* emptyEnv - return an environment with no bindings             */
Static ENVREC *emptyEnv()
{
X  return (mkEnv(NULL, NULL, NULL));
}  /* emptyEnv */
X
X
/* bindVar - bind variable nm to value s in environment rho      */
Static Void bindVar(nm, s, rho)
short nm;
SEXPREC *s;
ENVREC *rho;
{
X  rho->vars = mkNamelist(nm, rho->vars);
X  rho->values = mkValuelist(s, rho->values);
}  /* bindVar */
X
X
/*  extendEnv - extend environment rho by binding vars to vals   */
Static ENVREC *extendEnv(rho, vars, vals)
ENVREC *rho;
NAMELISTREC *vars;
VALUELISTREC *vals;
{
X  return (mkEnv(vars, vals, rho));
}  /* extendEnv */
X
X
/* Local variables for findVar: */
struct LOC_findVar {
X  short nm;
} ;
X
/* findVarInFrame - look up nm in one frame                      */
Local VALUELISTREC *findVarInFrame(nl, vl, LINK)
NAMELISTREC *nl;
VALUELISTREC *vl;
struct LOC_findVar *LINK;
{
X  boolean found;
X
X  found = false;
X  while (nl != NULL && !found) {
X    if (nl->head == LINK->nm)
X      found = true;
X    else {
X      nl = nl->tail;
X      vl = vl->tail;
X    }  /* while */
X  }
X  return vl;
}  /* findVarInFrame */
X
X
/* findVar - look up nm in rho                                   */
Static VALUELISTREC *findVar(nm_, rho)
short nm_;
ENVREC *rho;
{
X  struct LOC_findVar V;
X  VALUELISTREC *vl;
X
X  V.nm = nm_;
X  do {
X    vl = findVarInFrame(rho->vars, rho->values, &V);
X    rho = rho->enclosing;
X  } while (vl == NULL && rho != NULL);
X  return vl;
}  /* findVar */
X
X
/* assign - assign value s to variable nm in rho                 */
Static Void assign(nm, s, rho)
short nm;
SEXPREC *s;
ENVREC *rho;
{
X  VALUELISTREC *varloc;
X
X  varloc = findVar(nm, rho);
X  varloc->head = s;
}  /* assign */
X
X
/* fetch - return SEXP bound to nm in rho                        */
Static SEXPREC *fetch(nm, rho)
short nm;
ENVREC *rho;
{
X  VALUELISTREC *vl;
X
X  vl = findVar(nm, rho);
X  return (vl->head);
}  /* fetch */
X
X
/* isBound - check if nm is bound in rho                         */
Static boolean isBound(nm, rho)
short nm;
ENVREC *rho;
{
X  return (findVar(nm, rho) != NULL);
}  /* isBound */
X
X
/*****************************************************************
X *                     S-EXPRESSIONS                             *
X *****************************************************************/
X
/* prValue - print S-expression s                                */
Static Void prValue(s)
SEXPREC *s;
{
X  SEXPREC *s1;
X
X  switch (s->sxptype) {
X
X  case NILSXP:
X    printf("()");
X    break;
X
X  case NUMSXP:
X    printf("%ld", s->UU.intval);
X    break;
X
X  case SYMSXP:
X    prName(s->UU.symval);
X    break;
X
X  case PRIMSXP:
X    printf("<primitive: ");
X    prName((int)s->UU.primval + 1);
X    putchar('>');
X    break;
X
X  case CLOSXP:
X    printf("<closure>");
X    break;
X
X  case LISTSXP:
X    putchar('(');
X    prValue(s->UU.U3.carval);
X    s1 = s->UU.U3.cdrval;
X    while (s1->sxptype == LISTSXP) {
X      putchar(' ');
X      prValue(s1->UU.U3.carval);
X      s1 = s1->UU.U3.cdrval;
X    }
X    putchar(')');
X    break;
X  }/* case and with */
}  /* prValue */
X
X
/* isTrueVal - return true if s is true (non-NIL) value          */
Static boolean isTrueVal(s)
SEXPREC *s;
{
X  return (s->sxptype != NILSXP);
}  /* isTrueVal */
X
X
/* Local variables for applyValueOp: */
struct LOC_applyValueOp {
X  BUILTINOP op;
X  SEXPREC *result;
} ;
X
/* applyArithOp - apply binary, arithmetic VALUEOP to arguments  */
Local Void applyArithOp(n1, n2, LINK)
long n1, n2;
struct LOC_applyValueOp *LINK;
{
X  SEXPREC *WITH;
X
X  LINK->result = mkSExp(NUMSXP);
X  WITH = LINK->result;
X  switch (LINK->op) {
X
X  case PLUSOP:
X    WITH->UU.intval = n1 + n2;
X    break;
X
X  case MINUSOP:
X    WITH->UU.intval = n1 - n2;
X    break;
X
X  case TIMESOP:
X    WITH->UU.intval = n1 * n2;
X    break;
X
X  case DIVOP:
X    WITH->UU.intval = n1 / n2;
X    break;
X  }
}  /* applyArithOp */
X
/* applyRelOp - apply binary, relational VALUEOP to arguments    */
Local Void applyRelOp(n1, n2, LINK)
long n1, n2;
struct LOC_applyValueOp *LINK;
{
X  switch (LINK->op) {
X
X  case LTOP:
X    if (n1 < n2)
X      LINK->result = trueValue;
X    break;
X
X  case GTOP:
X    if (n1 > n2)
X      LINK->result = trueValue;
X    break;
X  }
}  /* applyRelOp */
X
/* arity - return number of arguments expected by op             */
Local long arity(op, LINK)
BUILTINOP op;
struct LOC_applyValueOp *LINK;
{
X  if (((1L << ((long)op)) &
X       ((1 << ((long)CONSOP + 1)) - (1 << ((long)PLUSOP)))) != 0)
X    return 2;
X  else
X    return 1;
}  /* arity */
X
X
/* applyValueOp - apply VALUEOP op to arguments in VALUELIST vl  */
Static SEXPREC *applyValueOp(op_, vl)
BUILTINOP op_;
VALUELISTREC *vl;
{
X  struct LOC_applyValueOp V;
X  SEXPREC *s1, *s2, *WITH1;
X
X  V.op = op_;
X  if (arity(V.op, &V) != lengthVL(vl)) {
X    printf("Wrong number of arguments to ");
X    prName((int)V.op + 1);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  V.result = nilValue;
X  s1 = vl->head;   /* 1st actual */
X  if (arity(V.op, &V) == 2)   /* 2nd actual */
X    s2 = vl->tail->head;
X  if (((1L << ((long)V.op)) &
X       (((1L << ((long)DIVOP + 1)) - (1 << ((long)PLUSOP))) |
X	((1 << ((long)GTOP + 1)) - (1 << ((long)LTOP))))) != 0) {
X    if (s1->sxptype == NUMSXP && s2->sxptype == NUMSXP) {
X      if (((1L << ((long)V.op)) &
X	   ((1 << ((long)DIVOP + 1)) - (1 << ((long)PLUSOP)))) != 0)
X	applyArithOp(s1->UU.intval, s2->UU.intval, &V);
X      else
X	applyRelOp(s1->UU.intval, s2->UU.intval, &V);
X      return V.result;
X    }
X    printf("Non-arithmetic arguments to ");
X    prName((int)V.op + 1);
X    putchar('\n');
X    longjmp(_JL99, 1);
X    return V.result;
X  }
X  switch (V.op) {
X
X  case EQOP:
X    if (s1->sxptype == NILSXP && s2->sxptype == NILSXP)
X      V.result = trueValue;
X    else if (s1->sxptype == NUMSXP && s2->sxptype == NUMSXP &&
X	     s1->UU.intval == s2->UU.intval)
X      V.result = trueValue;
X    else if (s1->sxptype == SYMSXP && s2->sxptype == SYMSXP &&
X	     s1->UU.symval == s2->UU.symval)
X      V.result = trueValue;
X    break;
X
X  case CONSOP:
X    V.result = mkSExp(LISTSXP);
X    WITH1 = V.result;
X    WITH1->UU.U3.carval = s1;
X    WITH1->UU.U3.cdrval = s2;
X    break;
X
X  case CAROP:
X    if (s1->sxptype != LISTSXP) {
X      printf("Error: car applied to non-list: ");
X      prValue(s1);
X      putchar('\n');
X    } else
X      V.result = s1->UU.U3.carval;
X    break;
X
X  case CDROP:
X    if (s1->sxptype != LISTSXP) {
X      printf("Error: cdr applied to non-list: ");
X      prValue(s1);
X      putchar('\n');
X    } else
X      V.result = s1->UU.U3.cdrval;
X    break;
X
X  case NUMBERPOP:
X    if (s1->sxptype == NUMSXP)
X      V.result = trueValue;
X    break;
X
X  case SYMBOLPOP:
X    if (s1->sxptype == SYMSXP)
X      V.result = trueValue;
X    break;
X
X  case LISTPOP:
X    if (s1->sxptype == LISTSXP)
X      V.result = trueValue;
X    break;
X
X  case NULLPOP:
X    if (s1->sxptype == NILSXP)
X      V.result = trueValue;
X    break;
X
X  case PRIMOPPOP:
X    if (s1->sxptype == PRIMSXP)
X      V.result = trueValue;
X    break;
X
X  case CLOSUREPOP:
X    if (s1->sxptype == CLOSXP)
X      V.result = trueValue;
X    break;
X
X  case PRINTOP:
X    prValue(s1);
X    putchar('\n');
X    V.result = s1;
X    break;
X  }/* case and with */
X  return V.result;
}  /* applyValueOp */
X
X
Static SEXPREC *eval PP((EXPREC *e, ENVREC *rho));
X
/* Local variables for eval: */
struct LOC_eval {
X  ENVREC *rho;
} ;
X
/* evalList - evaluate each expression in el                     */
Local VALUELISTREC *evalList(el, LINK)
EXPLISTREC *el;
struct LOC_eval *LINK;
{
X  SEXPREC *h;
X  VALUELISTREC *t;
X
X  if (el == NULL)
X    return NULL;
X  else {
X    h = eval(el->head, LINK->rho);
X    t = evalList(el->tail, LINK);
X    return (mkValuelist(h, t));
X  }
}  /* evalList */
X
/* applyClosure - apply SEXP op of type CLOSXP to actuals        */
Local SEXPREC *applyClosure(op, actuals, LINK)
SEXPREC *op;
VALUELISTREC *actuals;
struct LOC_eval *LINK;
{
X  EXPREC *fun, *body;
X  NAMELISTREC *forms;
X  ENVREC *savedrho, *newrho;
X
X  fun = op->UU.U4.clofun;
X  savedrho = op->UU.U4.cloenv;
X  forms = fun->UU.U3.formals;
X  body = fun->UU.U3.lambdabody;
X  if (lengthNL(forms) != lengthVL(actuals)) {
X    printf("Wrong number of arguments to closure\n");
X    longjmp(_JL99, 1);
X  }
X  newrho = extendEnv(savedrho, forms, actuals);
X  return (eval(body, newrho));
}  /* applyClosure */
X
/* applyCtrlOp - apply CONTROLOP op to args in rho               */
Local SEXPREC *applyCtrlOp(op, args, LINK)
BUILTINOP op;
EXPLISTREC *args;
struct LOC_eval *LINK;
{
X  SEXPREC *Result, *s;
X  EXPLISTREC *WITH;
X
X  WITH = args;
X  switch (op) {
X
X  case IFOP:
X    if (isTrueVal(eval(WITH->head, LINK->rho)))
X      Result = eval(WITH->tail->head, LINK->rho);
X    else
X      Result = eval(WITH->tail->tail->head, LINK->rho);
X    break;
X
X  case WHILEOP:
X    s = eval(WITH->head, LINK->rho);
X    while (isTrueVal(s)) {
X      s = eval(WITH->tail->head, LINK->rho);
X      s = eval(WITH->head, LINK->rho);
X    }
X    Result = s;
X    break;
X
X  case SETOP:
X    s = eval(WITH->tail->head, LINK->rho);
X    if (isBound(WITH->head->UU.varble, LINK->rho))
X      assign(WITH->head->UU.varble, s, LINK->rho);
X    else
X      bindVar(WITH->head->UU.varble, s, globalEnv);
X    Result = s;
X    break;
X
X  case BEGINOP:
X    while (args->tail != NULL) {
X      s = eval(args->head, LINK->rho);
X      args = args->tail;
X    }
X    Result = eval(args->head, LINK->rho);
X    break;
X  }/* case and with */
X  return Result;
}  /* applyCtrlOp */
X
X
/*****************************************************************
X *                     EVALUATION                                *
X *****************************************************************/
X
/* eval - return value of expression e in local environment rho  */
Static SEXPREC *eval(e, rho_)
EXPREC *e;
ENVREC *rho_;
{
X  struct LOC_eval V;
X  SEXPREC *Result, *op;
X  BUILTINOP primname;
X
X  V.rho = rho_;
X  switch (e->etype) {
X
X  case VALEXP:
X    Result = e->UU.sxp;
X    break;
X
X  case VAREXP:
X    if (isBound(e->UU.varble, V.rho))
X      Result = fetch(e->UU.varble, V.rho);
X    else {
X      printf("Undefined variable: ");
X      prName(e->UU.varble);
X      putchar('\n');
X      longjmp(_JL99, 1);
X    }
X    break;
X
X  case APEXP:
X    op = eval(e->UU.U2.optr, V.rho);
X    if (op->sxptype == PRIMSXP) {
X      primname = op->UU.primval;
X      if (((1L << ((long)primname)) &
X	   ((1 << ((long)BEGINOP + 1)) - (1 << ((long)IFOP)))) != 0)
X	Result = applyCtrlOp(primname, e->UU.U2.args, &V);
X      else
X	Result = applyValueOp(primname, evalList(e->UU.U2.args, &V));
X    } else
X      Result = applyClosure(op, evalList(e->UU.U2.args, &V), &V);
X    break;
X
X  case LAMEXP:
X    Result = mkCLOSXP(e, V.rho);
X    break;
X  }/* case and with */
X  return Result;
}  /* eval */
X
X
/*****************************************************************
X *                     READ-EVAL-PRINT LOOP                      *
X *****************************************************************/
X
/* initGlobalEnv - assign primitive function values to names     */
Static Void initGlobalEnv()
{
X  BUILTINOP op;
X
X  globalEnv = emptyEnv();
X  for (op = IFOP; (long)op <= (long)PRINTOP; op = (BUILTINOP)((long)op + 1))
X    bindVar((int)op + 1, mkPRIMSXP(op), globalEnv);
}  /* initGlobalEnv */
X
X
main(argc, argv)
int argc;
Char *argv[];
{  /* scheme main */
X  PASCAL_MAIN(argc, argv);
X  if (setjmp(_JL99))
X    goto _L99;
X  initNames();
X
X  nilValue = mkSExp(NILSXP);
X  trueValue = mkSExp(SYMSXP);
X  trueValue->UU.symval = numNames;
X
X  initGlobalEnv();
X
X  quittingtime = false;
_L99:
X  while (!quittingtime) {
X    reader();
X    if (matches((long)pos_, 4, "quit                ")) {
X      quittingtime = true;
X      break;
X    }
X    currentExp = parseExp();
X    prValue(eval(currentExp, globalEnv));
X    printf("\n\n");
X  }  /* while */
X  exit(0);
}  /* scheme */
X
X
X
/* End. */
SHAR_EOF
  (set 19 90 01 05 18 00 45 'c-distr/scheme.c'; eval "$shar_touch") &&
  chmod 0644 'c-distr/scheme.c'
if test $? -ne 0
then ${echo} 'restore of c-distr/scheme.c failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/scheme.c: MD5 check failed'
       ) << SHAR_EOF
94d2ce7234c763d9e4c2ee7681f9129c  c-distr/scheme.c
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/scheme.c'` -ne 28300 && \
  ${echo} 'restoration warning:  size of c-distr/scheme.c is not 28300'
  fi
fi
# ============= c-distr/sasl.c ==============
if test -f 'c-distr/sasl.c' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/sasl.c (file already exists)'
else
${echo} 'x - extracting c-distr/sasl.c (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/sasl.c' &&
/* Output from p2c, the Pascal-to-C translator */
/* From input file "sasl.p" */
X
X
/*****************************************************************
X *                     DECLARATIONS                              *
X *****************************************************************/
X
#include <p2c/p2c.h>
X
X
#define NAMELENG        20   /* Maximum length of a name */
#define MAXNAMES        300   /* Maximum number of different names */
#define MAXINPUT        4000   /* Maximum length of an input */
X
#define PROMPT          "-> "
#define PROMPT2         "> "
#define COMMENTCHAR     ";"
X
#define TABCODE         9   /* in ASCII */
X
X
typedef Char NAMESTRING[NAMELENG];
X
/* a NAME is an index in printNames */
X
typedef enum {
X  IFOP, PLUSOP, MINUSOP, TIMESOP, DIVOP, EQOP, LTOP, GTOP, CONSOP, CAROP,
X  CDROP, NUMBERPOP, SYMBOLPOP, LISTPOP, NULLPOP, PRIMOPPOP, CLOSUREPOP
} BUILTINOP;
X
X
typedef enum {
X  NILSXP, NUMSXP, SYMSXP, LISTSXP, CLOSXP, PRIMSXP, THUNK
} SEXPTYPE;
X
typedef struct SEXPREC {
X  SEXPTYPE sxptype;
X  union {
X    long intval;
X    short symval;
X    struct {
X      struct SEXPREC *carval, *cdrval;
X    } U3;
X    struct {
X      struct EXPREC *clofun;
X      struct ENVREC *cloenv;
X    } U4;
X    BUILTINOP primval;
X  } UU;
} SEXPREC;
X
typedef enum {
X  VALEXP, VAREXP, APEXP, LAMEXP
} EXPTYPE;
X
typedef struct EXPREC {
X  EXPTYPE etype;
X  union {
X    SEXPREC *sxp;
X    short varble;
X    struct {
X      struct EXPREC *optr;
X      struct EXPLISTREC *args;
X    } U2;
X    struct {
X      struct NAMELISTREC *formals;
X      struct EXPREC *lambdabody;
X    } U3;
X  } UU;
} EXPREC;
X
typedef struct EXPLISTREC {
X  EXPREC *head;
X  struct EXPLISTREC *tail;
} EXPLISTREC;
X
typedef struct VALUELISTREC {
X  SEXPREC *head;
X  struct VALUELISTREC *tail;
} VALUELISTREC;
X
typedef struct NAMELISTREC {
X  short head;
X  struct NAMELISTREC *tail;
} NAMELISTREC;
X
typedef struct ENVREC {
X  NAMELISTREC *vars;
X  VALUELISTREC *values;
X  struct ENVREC *enclosing;
} ENVREC;
X
X
Static ENVREC *globalEnv;
X
Static EXPREC *currentExp;
X
Static Char userinput[MAXINPUT];
Static short inputleng, pos_;
X
Static NAMESTRING printNames[MAXNAMES];
Static short numNames, numBuiltins;
X
Static short setName;
Static SEXPREC *setVal;
X
Static SEXPREC *nilValue, *trueValue;
X
Static boolean quittingtime;
X
X
/*****************************************************************
X *                     DATA STRUCTURE OP'S                       *
X *****************************************************************/
X
/* mkVALEXP - return an EXP of type VALEXP with sxp s            */
Static EXPREC *mkVALEXP(s)
SEXPREC *s;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = VALEXP;
X  e->UU.sxp = s;
X  return e;
}  /* mkVALEXP */
X
X
/* mkVAREXP - return an EXP of type VAREXP with varble nm        */
Static EXPREC *mkVAREXP(nm)
short nm;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = VAREXP;
X  e->UU.varble = nm;
X  return e;
}  /* mkVAREXP */
X
X
/* mkAPEXP - return EXP of type APEXP w/ optr op and args el     */
Static EXPREC *mkAPEXP(op, el)
EXPREC *op;
EXPLISTREC *el;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = APEXP;
X  e->UU.U2.optr = op;
X  e->UU.U2.args = el;
X  return e;
}  /* mkAPEXP */
X
X
/* mkLAMEXP - return EXP of type LAMEXP w/ formals f and body b  */
Static EXPREC *mkLAMEXP(f, b)
NAMELISTREC *f;
EXPREC *b;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = LAMEXP;
X  e->UU.U3.formals = f;
X  e->UU.U3.lambdabody = b;
X  return e;
}  /* mkLAMEXP */
X
X
/* mkSExp - return SEXP of type t (but no value)                 */
Static SEXPREC *mkSExp(t)
SEXPTYPE t;
{
X  SEXPREC *s;
X
X  s = (SEXPREC *)Malloc(sizeof(SEXPREC));
X  s->sxptype = t;
X  return s;
}  /* mkSExp */
X
X
/* mkPRIMSXP - return SEXP of type PRIMSXP w/ value op           */
Static SEXPREC *mkPRIMSXP(op)
BUILTINOP op;
{
X  SEXPREC *result;
X
X  result = (SEXPREC *)Malloc(sizeof(SEXPREC));
X  result->sxptype = PRIMSXP;
X  result->UU.primval = op;
X  return result;
}  /* mkPRIMSXP */
X
X
/* mkCLOSXP - return SEXP of type CLOSXP w/ expr e and env rho   */
Static SEXPREC *mkCLOSXP(e, rho)
EXPREC *e;
ENVREC *rho;
{
X  SEXPREC *result;
X
X  result = (SEXPREC *)Malloc(sizeof(SEXPREC));
X  result->sxptype = CLOSXP;
X  result->UU.U4.clofun = e;
X  result->UU.U4.cloenv = rho;
X  return result;
}  /* mkCLOSXP */
X
X
/* mkTHUNK - return SEXP of type THUNK w/ expr e and env rho     */
Static SEXPREC *mkTHUNK(e, rho)
EXPREC *e;
ENVREC *rho;
{
X  SEXPREC *result;
X
X  result = (SEXPREC *)Malloc(sizeof(SEXPREC));
X  result->sxptype = THUNK;
X  result->UU.U4.clofun = e;
X  result->UU.U4.cloenv = rho;
X  return result;
}  /* mkTHUNK */
X
X
/* mkExplist - return an EXPLIST with head e and tail el         */
Static EXPLISTREC *mkExplist(e, el)
EXPREC *e;
EXPLISTREC *el;
{
X  EXPLISTREC *newel;
X
X  newel = (EXPLISTREC *)Malloc(sizeof(EXPLISTREC));
X  newel->head = e;
X  newel->tail = el;
X  return newel;
}  /* mkExplist */
X
X
/* mkNamelist - return a NAMELIST with head n and tail nl        */
Static NAMELISTREC *mkNamelist(nm, nl)
short nm;
NAMELISTREC *nl;
{
X  NAMELISTREC *newnl;
X
X  newnl = (NAMELISTREC *)Malloc(sizeof(NAMELISTREC));
X  newnl->head = nm;
X  newnl->tail = nl;
X  return newnl;
}  /* mkNamelist */
X
X
/* mkValuelist - return an VALUELIST with head s and tail vl     */
Static VALUELISTREC *mkValuelist(s, vl)
SEXPREC *s;
VALUELISTREC *vl;
{
X  VALUELISTREC *newvl;
X
X  newvl = (VALUELISTREC *)Malloc(sizeof(VALUELISTREC));
X  newvl->head = s;
X  newvl->tail = vl;
X  return newvl;
}  /* mkValuelist */
X
X
/* mkEnv - return an ENV with vars nl, value vl, enclosing rho   */
Static ENVREC *mkEnv(nl, vl, rho)
NAMELISTREC *nl;
VALUELISTREC *vl;
ENVREC *rho;
{
X  ENVREC *newrho;
X
X  newrho = (ENVREC *)Malloc(sizeof(ENVREC));
X  newrho->vars = nl;
X  newrho->values = vl;
X  newrho->enclosing = rho;
X  return newrho;
}  /* mkEnv */
X
X
/* lengthVL - return length of VALUELIST vl                      */
Static long lengthVL(vl)
VALUELISTREC *vl;
{
X  long i;
X
X  i = 0;
X  while (vl != NULL) {
X    i++;
X    vl = vl->tail;
X  }
X  return i;
}  /* lengthVL */
X
X
/* lengthNL - return length of NAMELIST nl                       */
Static long lengthNL(nl)
NAMELISTREC *nl;
{
X  long i;
X
X  i = 0;
X  while (nl != NULL) {
X    i++;
X    nl = nl->tail;
X  }
X  return i;
}  /* lengthNL */
X
X
/*****************************************************************
X *                     NAME MANAGEMENT                           *
X *****************************************************************/
X
/* initNames - place all pre-defined names into printNames       */
Static Void initNames()
{
X  long i;
X
X  i = 1;
X  memcpy(printNames[i - 1], "if                  ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "+                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "-                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "*                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "/                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "=                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "<                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], ">                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "cons                ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "car                 ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "cdr                 ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "number?             ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "symbol?             ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "list?               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "null?               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "primop?             ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "closure?            ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "T                   ", sizeof(NAMESTRING));
X  numNames = i;
X  numBuiltins = i;
}  /* initNames */
X
X
Static jmp_buf _JL99;
X
X
/* install - insert new name into printNames                     */
Static short install(nm)
Char *nm;
{
X  long i;
X  boolean found;
X
X  i = 1;
X  found = false;
X  while (i <= numNames && !found) {
X    if (!memcmp(nm, printNames[i - 1], sizeof(NAMESTRING)))
X      found = true;
X    else
X      i++;
X  }
X  if (found)
X    return i;
X  if (i > MAXNAMES) {
X    printf("No more room for names\n");
X    longjmp(_JL99, 1);
X  }
X  numNames = i;
X  memcpy(printNames[i - 1], nm, sizeof(NAMESTRING));
X  return i;
}  /* install */
X
X
/* prName - print name nm                                        */
Static Void prName(nm)
short nm;
{
X  long i;
X
X  i = 1;
X  while (i <= NAMELENG) {
X    if (printNames[nm - 1][i - 1] != ' ') {
X      putchar(printNames[nm - 1][i - 1]);
X      i++;
X    } else
X      i = NAMELENG + 1;
X  }
}  /* prName */
X
X
/*****************************************************************
X *                        INPUT                                  *
X *****************************************************************/
X
/* isDelim - check if c is a delimiter                           */
Static boolean isDelim(c)
Char c;
{
X  return (c == ';' || c == ' ' || c == ')' || c == '(');
}  /* isDelim */
X
X
/* skipblanks - return next non-blank position in userinput      */
Static long skipblanks(p)
long p;
{
X  while (userinput[p - 1] == ' ')
X    p++;
X  return p;
}  /* skipblanks */
X
X
/* matches - check if string nm matches userinput[s .. s+leng]   */
Static boolean matches(s, leng, nm)
long s;
char leng;
Char *nm;
{
X  boolean match;
X  long i;
X
X  match = true;
X  i = 1;
X  while (match && i <= leng) {
X    if (userinput[s - 1] != nm[i - 1])
X      match = false;
X    i++;
X    s++;
X  }
X  if (!isDelim(userinput[s - 1]))
X    match = false;
X  return match;
}  /* matches */
X
X
/* nextchar - read next char - filter tabs and comments          */
Local Void nextchar(c)
Char *c;
{
X  Char STR1[256];
X
X  *c = getchar();
X  if (*c == '\n')
X    *c = ' ';
X  if (*c == (Char)TABCODE) {
X    *c = ' ';
X    return;
X  }
X  sprintf(STR1, "%c", *c);
X  if (strcmp(STR1, COMMENTCHAR))
X    return;
X  while (!P_eoln(stdin)) {
X    *c = getchar();
X    if (*c == '\n')
X      *c = ' ';
X  }
X  *c = ' ';
}  /* nextchar */
X
/* readParens - read char's, ignoring newlines, to matching ')'  */
Local Void readParens()
{
X  long parencnt;   /* current depth of parentheses */
X  Char c;
X
X  parencnt = 1;   /* '(' just read */
X  do {
X    if (P_eoln(stdin))
X      fputs(PROMPT2, stdout);
X    nextchar(&c);
X    pos_++;
X    if (pos_ == MAXINPUT) {
X      printf("User input too long\n");
X      longjmp(_JL99, 1);
X    }
X    userinput[pos_ - 1] = c;
X    if (c == '(')
X      parencnt++;
X    if (c == ')')
X      parencnt--;
X  } while (parencnt != 0);   /* readParens */
}
X
Local Void readInput()
{
X  Char c;
X
X  fputs(PROMPT, stdout);
X  pos_ = 0;
X  do {
X    pos_++;
X    if (pos_ == MAXINPUT) {
X      printf("User input too long\n");
X      longjmp(_JL99, 1);
X    }
X    nextchar(&c);
X    userinput[pos_ - 1] = c;
X    if (userinput[pos_ - 1] == '(')
X      readParens();
X  } while (!P_eoln(stdin));
X  inputleng = pos_;
X  userinput[pos_] = ';';   /* sentinel */
}  /* readInput */
X
X
/* reader - read char's into userinput; be sure input not blank  */
Static Void reader()
{
X
X  /* readInput - read char's into userinput                        */
X  do {
X    readInput();
X    pos_ = skipblanks(1L);   /* ignore blank lines */
X  } while (pos_ > inputleng);   /* reader */
}
X
X
/* parseName - return (installed) NAME starting at userinput[pos]*/
Static short parseName()
{
X  NAMESTRING nm;   /* array to accumulate characters */
X  char leng;   /* length of name */
X
X  leng = 0;
X  while ((pos_ <= inputleng) & (!isDelim(userinput[pos_ - 1]))) {
X    if (leng == NAMELENG) {
X      printf("Name too long, begins: %.*s\n", NAMELENG, nm);
X      longjmp(_JL99, 1);
X    }
X    leng++;
X    nm[leng - 1] = userinput[pos_ - 1];
X    pos_++;
X  }
X  if (leng == 0) {
X    printf("Error: expected name, instead read: %c\n", userinput[pos_ - 1]);
X    longjmp(_JL99, 1);
X  }
X  for (; leng < NAMELENG; leng++)
X    nm[leng] = ' ';
X  pos_ = skipblanks((long)pos_);   /* skip blanks after name */
X  return (install(nm));
}  /* parseName */
X
X
Local boolean isDigits(pos)
long pos;
{
X  boolean Result;
X
X  if (!isdigit(userinput[pos - 1]))
X    return false;
X  Result = true;
X  while (isdigit(userinput[pos - 1]))
X    pos++;
X  if (!isDelim(userinput[pos - 1]))
X    return false;
X  return Result;
}  /* isDigits */
X
X
/* isNumber - check if a number begins at pos                    */
Static boolean isNumber(pos)
long pos;
{
X
X  /* isDigits - check if sequence of digits begins at pos          */
X  return (isDigits(pos) | ((userinput[pos - 1] == '-') & isDigits(pos + 1)));
}  /* isNumber */
X
X
/* isValue - check if a number or quoted const begins at pos     */
Static boolean isValue(pos)
long pos;
{
X  return ((userinput[pos - 1] == '\'') | isNumber(pos));
}  /* isValue */
X
X
Local SEXPREC *parseSExp PV();
X
/* Local variables for parseSExp: */
struct LOC_parseSExp {
X  SEXPREC *s;
} ;
X
/* parseInt - return number starting at userinput[pos]           */
Local SEXPREC *parseInt(LINK)
struct LOC_parseSExp *LINK;
{
X  long sum, sign;
X
X  LINK->s = mkSExp(NUMSXP);
X  sum = 0;
X  sign = 1;
X  if (userinput[pos_ - 1] == '-') {
X    sign = -1;
X    pos_++;
X  }
X  while (isdigit(userinput[pos_ - 1])) {
X    sum = sum * 10 + userinput[pos_ - 1] - '0';
X    pos_++;
X  }
X  LINK->s->UU.intval = sum * sign;
X  pos_ = skipblanks((long)pos_);   /* skip blanks after number */
X  return LINK->s;
}  /* parseInt */
X
/* parseSym - return symbol starting at userinput[pos]           */
Local SEXPREC *parseSym(LINK)
struct LOC_parseSExp *LINK;
{
X  LINK->s = mkSExp(SYMSXP);
X  LINK->s->UU.symval = parseName();
X  return LINK->s;
}  /* parseSym */
X
/* parseList - return list starting at userinput[pos]            */
Local SEXPREC *parseList(LINK)
struct LOC_parseSExp *LINK;
{
X  SEXPREC *Result, *car, *cdr;
X
X  if (userinput[pos_ - 1] == ')') {
X    Result = mkSExp(NILSXP);
X    pos_ = skipblanks(pos_ + 1L);
X    return Result;
X  } else {
X    car = parseSExp();
X    cdr = parseList(LINK);
X    LINK->s = mkSExp(LISTSXP);
X    LINK->s->UU.U3.carval = car;
X    LINK->s->UU.U3.cdrval = cdr;
X    return LINK->s;
X  }
X  return Result;
}  /* parseList */
X
Local SEXPREC *parseSExp()
{
X  struct LOC_parseSExp V;
X
X  if (isNumber((long)pos_))
X    return (parseInt(&V));
X  else if (userinput[pos_ - 1] == '(') {
X    pos_ = skipblanks(pos_ + 1L);
X    return (parseList(&V));
X  } else
X    return (parseSym(&V));
}  /* parseSExp */
X
X
/* parseVal - return S-expression starting at userinput[pos]     */
Static SEXPREC *parseVal()
{
X
X  /* parseSExp - return quoted S-expr starting at userinput[pos]   */
X  if (userinput[pos_ - 1] == '\'')
X    pos_++;
X  return (parseSExp());
}  /* parseVal */
X
X
Static EXPLISTREC *parseEL PV();
X
Static NAMELISTREC *parseNL PV();
X
X
/* parseExp - return EXP starting at userinput[pos]              */
Static EXPREC *parseExp()
{
X  EXPREC *op, *body;
X  NAMELISTREC *nl;
X  EXPLISTREC *el;
X
X  if (userinput[pos_ - 1] == '(') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X    if (matches((long)pos_, 6, "lambda              ")) {  /* LAMEXP */
X      pos_ = skipblanks(pos_ + 6L);   /* skip 'lambda ..' */
X      pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X      nl = parseNL();
X      body = parseExp();
X      pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X      return (mkLAMEXP(nl, body));
X    } else {  /* APEXP */
X      op = parseExp();
X      el = parseEL();
X      return (mkAPEXP(op, el));
X    }
X  } else if (isValue((long)pos_))
X    return (mkVALEXP(parseVal()));   /* VALEXP */
X  else
X    return (mkVAREXP(parseName()));   /* VAREXP */
}  /* parseExp */
X
X
/* parseEL - return EXPLIST starting at userinput[pos]           */
Static EXPLISTREC *parseEL()
{
X  EXPREC *e;
X  EXPLISTREC *el;
X
X  if (userinput[pos_ - 1] == ')') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X    return NULL;
X  } else {
X    e = parseExp();
X    el = parseEL();
X    return (mkExplist(e, el));
X  }
}  /* parseEL */
X
X
/* parseNL - return NAMELIST starting at userinput[pos]          */
Static NAMELISTREC *parseNL()
{
X  short nm;
X  NAMELISTREC *nl;
X
X  if (userinput[pos_ - 1] == ')') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X    return NULL;
X  } else {
X    nm = parseName();
X    nl = parseNL();
X    return (mkNamelist(nm, nl));
X  }
}  /* parseNL */
X
X
/* parseSet - read top-level definition                          */
Static EXPREC *parseSet()
{
X  EXPREC *e;
X
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X  pos_ = skipblanks(pos_ + 3L);   /* skip 'set ..' */
X  setName = parseName();
X  e = parseExp();
X  pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X  return e;
}  /* parseSet */
X
X
/*****************************************************************
X *                     ENVIRONMENTS                              *
X *****************************************************************/
X
/* emptyEnv - return an environment with no bindings             */
Static ENVREC *emptyEnv()
{
X  return (mkEnv(NULL, NULL, NULL));
}  /* emptyEnv */
X
X
/* bindVar - bind variable nm to value s in environment rho      */
Static Void bindVar(nm, s, rho)
short nm;
SEXPREC *s;
ENVREC *rho;
{
X  rho->vars = mkNamelist(nm, rho->vars);
X  rho->values = mkValuelist(s, rho->values);
}  /* bindVar */
X
X
/*  extendEnv - extend environment rho by binding vars to vals   */
Static ENVREC *extendEnv(rho, vars, vals)
ENVREC *rho;
NAMELISTREC *vars;
VALUELISTREC *vals;
{
X  return (mkEnv(vars, vals, rho));
}  /* extendEnv */
X
X
/* Local variables for findVar: */
struct LOC_findVar {
X  short nm;
} ;
X
/* findVarInFrame - look up nm in one frame                      */
Local VALUELISTREC *findVarInFrame(nl, vl, LINK)
NAMELISTREC *nl;
VALUELISTREC *vl;
struct LOC_findVar *LINK;
{
X  boolean found;
X
X  found = false;
X  while (nl != NULL && !found) {
X    if (nl->head == LINK->nm)
X      found = true;
X    else {
X      nl = nl->tail;
X      vl = vl->tail;
X    }  /* while */
X  }
X  return vl;
}  /* findVarInFrame */
X
X
/* findVar - look up nm in rho                                   */
Static VALUELISTREC *findVar(nm_, rho)
short nm_;
ENVREC *rho;
{
X  struct LOC_findVar V;
X  VALUELISTREC *vl;
X
X  V.nm = nm_;
X  do {
X    vl = findVarInFrame(rho->vars, rho->values, &V);
X    rho = rho->enclosing;
X  } while (vl == NULL && rho != NULL);
X  return vl;
}  /* findVar */
X
X
/* assign - assign value s to variable nm in rho                 */
Static Void assign(nm, s, rho)
short nm;
SEXPREC *s;
ENVREC *rho;
{
X  VALUELISTREC *varloc;
X
X  varloc = findVar(nm, rho);
X  varloc->head = s;
}  /* assign */
X
X
/* fetch - return SEXP bound to nm in rho                        */
Static SEXPREC *fetch(nm, rho)
short nm;
ENVREC *rho;
{
X  VALUELISTREC *vl;
X
X  vl = findVar(nm, rho);
X  return (vl->head);
}  /* fetch */
X
X
/* isBound - check if nm is bound in rho                         */
Static boolean isBound(nm, rho)
short nm;
ENVREC *rho;
{
X  return (findVar(nm, rho) != NULL);
}  /* isBound */
X
X
/*****************************************************************
X *                     S-EXPRESSIONS                             *
X *****************************************************************/
X
/* prValue - print S-expression s                                */
Static Void prValue(s)
SEXPREC *s;
{
X  SEXPREC *s1;
X
X  switch (s->sxptype) {
X
X  case NILSXP:
X    printf("()");
X    break;
X
X  case NUMSXP:
X    printf("%ld", s->UU.intval);
X    break;
X
X  case SYMSXP:
X    prName(s->UU.symval);
X    break;
X
X  case PRIMSXP:
X    printf("<primitive: ");
X    prName((int)s->UU.primval + 1);
X    putchar('>');
X    break;
X
X  case CLOSXP:
X    printf("<closure>");
X    break;
X
X  case THUNK:
X    printf("...");
X    break;
X
X  case LISTSXP:
X    putchar('(');
X    prValue(s->UU.U3.carval);
X    s1 = s->UU.U3.cdrval;
X    while (s1->sxptype == LISTSXP) {
X      putchar(' ');
X      prValue(s1->UU.U3.carval);
X      s1 = s1->UU.U3.cdrval;
X    }
X    if (s1->sxptype == THUNK)
X      printf(" ...)");
X    else
X      putchar(')');
X    break;
X  }/* case and with */
}  /* prValue */
X
X
/* isTrueVal - return true if s is true (non-NIL) value          */
Static boolean isTrueVal(s)
SEXPREC *s;
{
X  return (s->sxptype != NILSXP);
}  /* isTrueVal */
X
X
Static Void evalThunk PP((SEXPREC *s));
X
/* Local variables for applyValueOp: */
struct LOC_applyValueOp {
X  BUILTINOP op;
X  SEXPREC *result;
} ;
X
/* applyArithOp - apply binary, arithmetic VALUEOP to arguments  */
Local Void applyArithOp(n1, n2, LINK)
long n1, n2;
struct LOC_applyValueOp *LINK;
{
X  SEXPREC *WITH;
X
X  LINK->result = mkSExp(NUMSXP);
X  WITH = LINK->result;
X  switch (LINK->op) {
X
X  case PLUSOP:
X    WITH->UU.intval = n1 + n2;
X    break;
X
X  case MINUSOP:
X    WITH->UU.intval = n1 - n2;
X    break;
X
X  case TIMESOP:
X    WITH->UU.intval = n1 * n2;
X    break;
X
X  case DIVOP:
X    WITH->UU.intval = n1 / n2;
X    break;
X  }
}  /* applyArithOp */
X
/* applyRelOp - apply binary, relational VALUEOP to arguments    */
Local Void applyRelOp(n1, n2, LINK)
long n1, n2;
struct LOC_applyValueOp *LINK;
{
X  switch (LINK->op) {
X
X  case LTOP:
X    if (n1 < n2)
X      LINK->result = trueValue;
X    break;
X
X  case GTOP:
X    if (n1 > n2)
X      LINK->result = trueValue;
X    break;
X  }
}  /* applyRelOp */
X
/* arity - return number of arguments expected by op             */
Local long arity(op, LINK)
BUILTINOP op;
struct LOC_applyValueOp *LINK;
{
X  if (((1L << ((long)op)) &
X       ((1 << ((long)CONSOP + 1)) - (1 << ((long)PLUSOP)))) != 0)
X    return 2;
X  else
X    return 1;
}  /* arity */
X
X
/* applyValueOp - apply VALUEOP op to arguments in VALUELIST vl  */
Static SEXPREC *applyValueOp(op_, vl)
BUILTINOP op_;
VALUELISTREC *vl;
{
X  struct LOC_applyValueOp V;
X  SEXPREC *s1, *s2, *WITH1;
X
X  V.op = op_;
X  if (arity(V.op, &V) != lengthVL(vl)) {
X    printf("Wrong number of arguments to ");
X    prName((int)V.op + 1);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  V.result = nilValue;
X  s1 = vl->head;   /* 1st actual */
X  if (arity(V.op, &V) == 2)   /* 2nd actual */
X    s2 = vl->tail->head;
X  if (V.op != CONSOP)
X    evalThunk(s1);
X  if (((1L << ((long)V.op)) &
X       ((1 << ((long)GTOP + 1)) - (1 << ((long)PLUSOP)))) != 0)
X    evalThunk(s2);
X  if (((1L << ((long)V.op)) &
X       (((1L << ((long)DIVOP + 1)) - (1 << ((long)PLUSOP))) |
X	((1 << ((long)GTOP + 1)) - (1 << ((long)LTOP))))) != 0) {
X    if (s1->sxptype == NUMSXP && s2->sxptype == NUMSXP) {
X      if (((1L << ((long)V.op)) &
X	   ((1 << ((long)DIVOP + 1)) - (1 << ((long)PLUSOP)))) != 0)
X	applyArithOp(s1->UU.intval, s2->UU.intval, &V);
X      else
X	applyRelOp(s1->UU.intval, s2->UU.intval, &V);
X      return V.result;
X    }
X    printf("Non-arithmetic arguments to ");
X    prName((int)V.op + 1);
X    putchar('\n');
X    longjmp(_JL99, 1);
X    return V.result;
X  }
X  switch (V.op) {
X
X  case EQOP:
X    if (s1->sxptype == NILSXP && s2->sxptype == NILSXP)
X      V.result = trueValue;
X    else if (s1->sxptype == NUMSXP && s2->sxptype == NUMSXP &&
X	     s1->UU.intval == s2->UU.intval)
X      V.result = trueValue;
X    else if (s1->sxptype == SYMSXP && s2->sxptype == SYMSXP &&
X	     s1->UU.symval == s2->UU.symval)
X      V.result = trueValue;
X    break;
X
X  case CONSOP:
X    V.result = mkSExp(LISTSXP);
X    WITH1 = V.result;
X    WITH1->UU.U3.carval = s1;
X    WITH1->UU.U3.cdrval = s2;
X    break;
X
X  case CAROP:
X    if (s1->sxptype != LISTSXP) {
X      printf("Error: car applied to non-list: ");
X      prValue(s1);
X      putchar('\n');
X    } else {
X      evalThunk(s1->UU.U3.carval);
X      V.result = s1->UU.U3.carval;
X    }
X    break;
X
X  case CDROP:
X    if (s1->sxptype != LISTSXP) {
X      printf("Error: cdr applied to non-list: ");
X      prValue(s1);
X      putchar('\n');
X    } else {
X      evalThunk(s1->UU.U3.cdrval);
X      V.result = s1->UU.U3.cdrval;
X    }
X    break;
X
X  case NUMBERPOP:
X    if (s1->sxptype == NUMSXP)
X      V.result = trueValue;
X    break;
X
X  case SYMBOLPOP:
X    if (s1->sxptype == SYMSXP)
X      V.result = trueValue;
X    break;
X
X  case LISTPOP:
X    if (s1->sxptype == LISTSXP)
X      V.result = trueValue;
X    break;
X
X  case NULLPOP:
X    if (s1->sxptype == NILSXP)
X      V.result = trueValue;
X    break;
X
X  case PRIMOPPOP:
X    if (s1->sxptype == PRIMSXP)
X      V.result = trueValue;
X    break;
X
X  case CLOSUREPOP:
X    if (s1->sxptype == CLOSXP)
X      V.result = trueValue;
X    break;
X  }/* case and with */
X  return V.result;
}  /* applyValueOp */
X
X
Static SEXPREC *eval PP((EXPREC *e, ENVREC *rho));
X
/* Local variables for eval: */
struct LOC_eval {
X  ENVREC *rho;
} ;
X
/* evalList - evaluate each expression in el                     */
Local VALUELISTREC *evalList(el, LINK)
EXPLISTREC *el;
struct LOC_eval *LINK;
{
X  SEXPREC *h;
X  VALUELISTREC *t;
X
X  if (el == NULL)
X    return NULL;
X  else {
X    h = mkTHUNK(el->head, LINK->rho);
X    t = evalList(el->tail, LINK);
X    return (mkValuelist(h, t));
X  }
}  /* evalList */
X
/* applyClosure - apply SEXP op of type CLOSXP to actuals        */
Local SEXPREC *applyClosure(op, actuals, LINK)
SEXPREC *op;
VALUELISTREC *actuals;
struct LOC_eval *LINK;
{
X  EXPREC *fun, *body;
X  NAMELISTREC *forms;
X  ENVREC *savedrho, *newrho;
X
X  fun = op->UU.U4.clofun;
X  savedrho = op->UU.U4.cloenv;
X  forms = fun->UU.U3.formals;
X  body = fun->UU.U3.lambdabody;
X  if (lengthNL(forms) != lengthVL(actuals)) {
X    printf("Wrong number of arguments to closure\n");
X    longjmp(_JL99, 1);
X  }
X  newrho = extendEnv(savedrho, forms, actuals);
X  return (eval(body, newrho));
}  /* applyClosure */
X
/* applyCtrlOp - apply CONTROLOP op to args in rho               */
Local SEXPREC *applyCtrlOp(op, args, LINK)
BUILTINOP op;
EXPLISTREC *args;
struct LOC_eval *LINK;
{
X  SEXPREC *Result;
X
X  switch (op) {
X
X  case IFOP:
X    if (isTrueVal(eval(args->head, LINK->rho)))
X      Result = eval(args->tail->head, LINK->rho);
X    else
X      Result = eval(args->tail->tail->head, LINK->rho);
X    break;
X  }/* case and with */
X  return Result;
}  /* applyCtrlOp */
X
X
/*****************************************************************
X *                     EVALUATION                                *
X *****************************************************************/
X
/* eval - return value of expression e in local environment rho  */
Static SEXPREC *eval(e, rho_)
EXPREC *e;
ENVREC *rho_;
{
X  struct LOC_eval V;
X  SEXPREC *Result, *s, *op;
X  BUILTINOP primname;
X
X  V.rho = rho_;
X  switch (e->etype) {
X
X  case VALEXP:
X    Result = e->UU.sxp;
X    break;
X
X  case VAREXP:
X    if (isBound(e->UU.varble, V.rho))
X      s = fetch(e->UU.varble, V.rho);
X    else {
X      printf("Undefined variable: ");
X      prName(e->UU.varble);
X      putchar('\n');
X      longjmp(_JL99, 1);
X    }
X    evalThunk(s);
X    Result = s;
X    break;
X
X  case APEXP:
X    op = eval(e->UU.U2.optr, V.rho);
X    if (op->sxptype == PRIMSXP) {
X      primname = op->UU.primval;
X      if (primname == IFOP)
X	Result = applyCtrlOp(primname, e->UU.U2.args, &V);
X      else
X	Result = applyValueOp(primname, evalList(e->UU.U2.args, &V));
X    } else
X      Result = applyClosure(op, evalList(e->UU.U2.args, &V), &V);
X    break;
X
X  case LAMEXP:
X    Result = mkCLOSXP(e, V.rho);
X    break;
X  }/* case and with */
X  return Result;
}  /* eval */
X
X
/* copyValue - copy SEXP s1 into s2                              */
Local Void copyValue(s1, s2)
SEXPREC *s1, *s2;
{
X  s2->sxptype = s1->sxptype;
X  switch (s1->sxptype) {   /* with */
X
X  case NILSXP:
X    /* blank case */
X    break;
X
X  case NUMSXP:
X    s2->UU.intval = s1->UU.intval;
X    break;
X
X  case SYMSXP:
X    s2->UU.symval = s1->UU.symval;
X    break;
X
X  case PRIMSXP:
X    s2->UU.primval = s1->UU.primval;
X    break;
X
X  case LISTSXP:
X    s2->UU.U3.carval = s1->UU.U3.carval;
X    s2->UU.U3.cdrval = s1->UU.U3.cdrval;
X    break;
X
X  case CLOSXP:
X  case THUNK:
X    s2->UU.U4.clofun = s1->UU.U4.clofun;
X    s2->UU.U4.cloenv = s1->UU.U4.cloenv;
X    break;
X  }/* case */
}  /* copyValue */
X
X
/* evalThunk - evaluate thunk and replace it by its value        */
Static Void evalThunk(s)
SEXPREC *s;
{
X  SEXPREC *result;
X
X  if (s->sxptype == THUNK) {
X    result = eval(s->UU.U4.clofun, s->UU.U4.cloenv);
X    copyValue(result, s);
X  }
}  /* evalThunk */
X
X
/*****************************************************************
X *                     READ-EVAL-PRINT LOOP                      *
X *****************************************************************/
X
/* initGlobalEnv - assign primitive function values to names     */
Static Void initGlobalEnv()
{
X  BUILTINOP op;
X
X  globalEnv = emptyEnv();
X  for (op = IFOP; (long)op <= (long)CLOSUREPOP; op = (BUILTINOP)((long)op + 1))
X    bindVar((int)op + 1, mkPRIMSXP(op), globalEnv);
}  /* initGlobalEnv */
X
X
main(argc, argv)
int argc;
Char *argv[];
{  /* sasl main */
X  PASCAL_MAIN(argc, argv);
X  if (setjmp(_JL99))
X    goto _L99;
X  initNames();
X
X  nilValue = mkSExp(NILSXP);
X  trueValue = mkSExp(SYMSXP);
X  trueValue->UU.symval = numNames;
X
X  initGlobalEnv();
X
X  quittingtime = false;
_L99:
X  while (!quittingtime) {
X    reader();
X    if (matches((long)pos_, 4, "quit                ")) {
X      quittingtime = true;
X      break;
X    }
X    if ((userinput[pos_ - 1] == '(') & matches(skipblanks(pos_ + 1L), 3,
X					       "set                 ")) {
X      currentExp = parseSet();
X      setVal = eval(currentExp, globalEnv);
X      if (isBound(setName, globalEnv))
X	assign(setName, setVal, globalEnv);
X      else
X	bindVar(setName, setVal, globalEnv);
X      prValue(setVal);
X      printf("\n\n");
X    } else {
X      currentExp = parseExp();
X      prValue(eval(currentExp, globalEnv));
X      printf("\n\n");
X    }
X  }  /* while */
X  exit(0);
}  /* sasl */
X
X
X
X
X
X
/* End. */
SHAR_EOF
  (set 19 90 01 05 18 00 45 'c-distr/sasl.c'; eval "$shar_touch") &&
  chmod 0644 'c-distr/sasl.c'
if test $? -ne 0
then ${echo} 'restore of c-distr/sasl.c failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/sasl.c: MD5 check failed'
       ) << SHAR_EOF
08c0275f436119c9f7663acb35df4520  c-distr/sasl.c
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/sasl.c'` -ne 29599 && \
  ${echo} 'restoration warning:  size of c-distr/sasl.c is not 29599'
  fi
fi
# ============= c-distr/prolog.c ==============
if test -f 'c-distr/prolog.c' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/prolog.c (file already exists)'
else
${echo} 'x - extracting c-distr/prolog.c (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/prolog.c' &&
/* Output from p2c, the Pascal-to-C translator */
/* From input file "prolog.p" */
X
X
/*****************************************************************
X *                     DECLARATIONS                              *
X *****************************************************************/
X
#include <p2c/p2c.h>
X
X
#define NAMELENG        20   /* Maximum length of a name */
#define MAXNAMES        300   /* Maximum number of different names */
#define MAXINPUT        2000   /* Maximum length of an input */
X
#define PROMPT          "-> "
#define PROMPT2         "> "
#define COMMENTCHAR     ";"
X
#define TABCODE         9   /* in ASCII */
X
X
typedef Char NAMESTRING[NAMELENG];
X
/* a NAME is an index in printNames */
X
X
typedef struct GOALREC {
X  short pred;
X  struct EXPLISTREC *args;
} GOALREC;
X
typedef struct GOALLISTREC {
X  GOALREC *head;
X  struct GOALLISTREC *tail;
} GOALLISTREC;
X
typedef struct VARIABLEREC {
X  short varname;
X  long varindex;
} VARIABLEREC;
X
typedef struct VARLISTREC {
X  VARIABLEREC *head;
X  struct VARLISTREC *tail;
} VARLISTREC;
X
typedef enum {
X  VAREXP, INTEXP, APEXP
} EXPTYPE;
X
typedef struct EXPREC {
X  EXPTYPE etype;
X  union {
X    VARIABLEREC *varble;
X    long intval;
X    struct {
X      short optr;
X      struct EXPLISTREC *args;
X    } U2;
X  } UU;
} EXPREC;
X
typedef struct EXPLISTREC {
X  EXPREC *head;
X  struct EXPLISTREC *tail;
} EXPLISTREC;
X
typedef struct CLAUSEREC {
X  GOALREC *lhs;
X  GOALLISTREC *rhs;
X  struct CLAUSEREC *nextclause;
} CLAUSEREC;
X
typedef struct SUBSTREC {
X  VARLISTREC *domain;
X  EXPLISTREC *range;
} SUBSTREC;
X
X
Static CLAUSEREC *clauses, *lastclause;
X
Static GOALLISTREC *toplevelGoal;
X
Static Char userinput[MAXINPUT];
Static short inputleng, pos_;
X
Static NAMESTRING printNames[MAXNAMES];
Static short numNames, numBuiltins;
X
Static boolean quittingtime;
X
X
/*****************************************************************
X *                     DATA STRUCTURE OP'S                       *
X *****************************************************************/
X
/* mkGoal - create a new GOAL with pred p and arguments a        */
Static GOALREC *mkGoal(p, a)
short p;
EXPLISTREC *a;
{
X  GOALREC *newg;
X
X  newg = (GOALREC *)Malloc(sizeof(GOALREC));
X  newg->pred = p;
X  newg->args = a;
X  return newg;
}  /* mkGoal */
X
X
/* mkVAREXP - create a new EXP of type VAREXP                    */
Static EXPREC *mkVAREXP(v)
VARIABLEREC *v;
{
X  EXPREC *newe;
X
X  newe = (EXPREC *)Malloc(sizeof(EXPREC));
X  newe->etype = VAREXP;
X  newe->UU.varble = v;
X  return newe;
}  /* mkVAREXP */
X
X
/* mkINTEXP - create a new EXP of type INTEXP                    */
Static EXPREC *mkINTEXP(n)
long n;
{
X  EXPREC *newe;
X
X  newe = (EXPREC *)Malloc(sizeof(EXPREC));
X  newe->etype = INTEXP;
X  newe->UU.intval = n;
X  return newe;
}  /* mkINTEXP */
X
X
/* mkAPEXP - create a new EXP of type APEXP                      */
Static EXPREC *mkAPEXP(o, a)
short o;
EXPLISTREC *a;
{
X  EXPREC *newe;
X
X  newe = (EXPREC *)Malloc(sizeof(EXPREC));
X  newe->etype = APEXP;
X  newe->UU.U2.optr = o;
X  newe->UU.U2.args = a;
X  return newe;
}  /* mkAPEXP */
X
X
/* mkVariable - create a new VARIABLE with name n and index i    */
Static VARIABLEREC *mkVariable(n, i)
short n;
long i;
{
X  VARIABLEREC *newv;
X
X  newv = (VARIABLEREC *)Malloc(sizeof(VARIABLEREC));
X  newv->varname = n;
X  newv->varindex = i;
X  return newv;
}  /* mkVariable */
X
X
/* mkVarlist - create a new VARLIST with head v and tail vl      */
Static VARLISTREC *mkVarlist(v, vl)
VARIABLEREC *v;
VARLISTREC *vl;
{
X  VARLISTREC *newvl;
X
X  newvl = (VARLISTREC *)Malloc(sizeof(VARLISTREC));
X  newvl->head = v;
X  newvl->tail = vl;
X  return newvl;
}  /* mkVarlist */
X
X
/* mkGoallist - return a GOALLIST with head g and tail gl        */
Static GOALLISTREC *mkGoallist(g, gl)
GOALREC *g;
GOALLISTREC *gl;
{
X  GOALLISTREC *newgl;
X
X  newgl = (GOALLISTREC *)Malloc(sizeof(GOALLISTREC));
X  newgl->head = g;
X  newgl->tail = gl;
X  return newgl;
}  /* mkGoallist */
X
X
/* mkExplist - return an EXPLIST with head e and tail el         */
Static EXPLISTREC *mkExplist(e, el)
EXPREC *e;
EXPLISTREC *el;
{
X  EXPLISTREC *newel;
X
X  newel = (EXPLISTREC *)Malloc(sizeof(EXPLISTREC));
X  newel->head = e;
X  newel->tail = el;
X  return newel;
}  /* mkExplist */
X
X
/* mkClause - create a new GOAL with lhs l and rhs r             */
Static CLAUSEREC *mkClause(l, r)
GOALREC *l;
GOALLISTREC *r;
{
X  CLAUSEREC *c;
X
X  c = (CLAUSEREC *)Malloc(sizeof(CLAUSEREC));
X  c->lhs = l;
X  c->rhs = r;
X  c->nextclause = NULL;
X  return c;
}  /* mkClause */
X
X
/* eqVar - compare two VARIABLE's for equality                   */
Static boolean eqVar(v1, v2)
VARIABLEREC *v1, *v2;
{
X  return (v1->varname == v2->varname && v1->varindex == v2->varindex);
}  /* eqVar */
X
X
/* lengthEL - return length of EXPLIST el                        */
Static long lengthEL(el)
EXPLISTREC *el;
{
X  long i;
X
X  i = 0;
X  while (el != NULL) {
X    i++;
X    el = el->tail;
X  }
X  return i;
}  /* lengthEL */
X
X
/*****************************************************************
X *                     NAME MANAGEMENT                           *
X *****************************************************************/
X
/* newClause - add new clause at end of clauses list             */
Static Void newClause(l, r)
GOALREC *l;
GOALLISTREC *r;
{
X  if (lastclause == NULL) {
X    clauses = mkClause(l, r);
X    lastclause = clauses;
X  } else {
X    lastclause->nextclause = mkClause(l, r);
X    lastclause = lastclause->nextclause;
X  }
}  /* newClause */
X
X
/* initNames - place all pre-defined names into printNames       */
Static Void initNames()
{
X  long i;
X
X  clauses = NULL;
X  lastclause = NULL;
X  i = 1;
X  memcpy(printNames[i - 1], "plus                ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "minus               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "less                ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "print               ", sizeof(NAMESTRING));
X  numBuiltins = i;
X  numNames = i;
}  /* initNames */
X
X
Static jmp_buf _JL99;
X
X
/* install - insert new name into printNames                     */
Static short install(nm)
Char *nm;
{
X  long i;
X  boolean found;
X
X  i = 1;
X  found = false;
X  while (i <= numNames && !found) {
X    if (!memcmp(nm, printNames[i - 1], sizeof(NAMESTRING)))
X      found = true;
X    else
X      i++;
X  }
X  if (found)
X    return i;
X  if (i > MAXNAMES) {
X    printf("No more room for names\n");
X    longjmp(_JL99, 1);
X  }
X  numNames = i;
X  memcpy(printNames[i - 1], nm, sizeof(NAMESTRING));
X  return i;
}  /* install */
X
X
/* prName - print name nm                                        */
Static Void prName(nm)
short nm;
{
X  long i;
X
X  i = 1;
X  while (i <= NAMELENG) {
X    if (printNames[nm - 1][i - 1] != ' ') {
X      putchar(printNames[nm - 1][i - 1]);
X      i++;
X    } else
X      i = NAMELENG + 1;
X  }
}  /* prName */
X
X
/*****************************************************************
X *                      INPUT                                    *
X *****************************************************************/
X
/* isDelim - check if c is a delimiter                           */
Static boolean isDelim(c)
Char c;
{
X  return (c == ';' || c == ' ' || c == ')' || c == '(');
}  /* isDelim */
X
X
/* skipblanks - return next non-blank position in userinput      */
Static long skipblanks(p)
long p;
{
X  while (userinput[p - 1] == ' ')
X    p++;
X  return p;
}  /* skipblanks */
X
X
/* matches - check if string nm matches userinput[s .. s+ln]     */
Static boolean matches(s, ln, nm)
long s;
char ln;
Char *nm;
{
X  boolean match;
X  long i;
X
X  match = true;
X  i = 1;
X  while (match && i <= ln) {
X    if (userinput[s - 1] != nm[i - 1])
X      match = false;
X    i++;
X    s++;
X  }
X  if (!isDelim(userinput[s - 1]))
X    match = false;
X  return match;
}  /* matches */
X
X
/* nextchar - read next char - filter tabs and comments          */
Local Void nextchar(c)
Char *c;
{
X  Char STR1[256];
X
X  *c = getchar();
X  if (*c == '\n')
X    *c = ' ';
X  if (*c == (Char)TABCODE) {
X    *c = ' ';
X    return;
X  }
X  sprintf(STR1, "%c", *c);
X  if (strcmp(STR1, COMMENTCHAR))
X    return;
X  while (!P_eoln(stdin)) {
X    *c = getchar();
X    if (*c == '\n')
X      *c = ' ';
X  }
X  *c = ' ';
}  /* nextchar */
X
/* readParens - read char's, ignoring newlines, to matching ')'  */
Local Void readParens()
{
X  long parencnt;
X  Char c;
X
X  parencnt = 1;
X  do {
X    if (P_eoln(stdin))
X      fputs(PROMPT2, stdout);
X    nextchar(&c);
X    pos_++;
X    if (pos_ == MAXINPUT) {
X      printf("User input too long\n");
X      longjmp(_JL99, 1);
X    }
X    userinput[pos_ - 1] = c;
X    if (c == '(')
X      parencnt++;
X    if (c == ')')
X      parencnt--;
X  } while (parencnt != 0);   /* readParens */
}
X
Local Void readInput()
{
X  Char c;
X
X  fputs(PROMPT, stdout);
X  pos_ = 0;
X  do {
X    pos_++;
X    if (pos_ == MAXINPUT) {
X      printf("User input too long\n");
X      longjmp(_JL99, 1);
X    }
X    nextchar(&c);
X    userinput[pos_ - 1] = c;
X    if (userinput[pos_ - 1] == '(')
X      readParens();
X  } while (!P_eoln(stdin));
X  inputleng = pos_;
X  userinput[pos_] = ';';   /* sentinel */
}  /* readInput */
X
X
/* reader - read char's into userinput; be sure input not blank  */
Static Void reader()
{
X
X  /* readInput - read char's into userinput                        */
X  do {
X    readInput();
X    pos_ = skipblanks(1L);   /* ignore blank lines */
X  } while (pos_ > inputleng);   /* reader */
}
X
X
/* parseName - return (installed) NAME starting at userinput[pos]*/
Static short parseName()
{
X  NAMESTRING nm;   /* array to accumulate characters */
X  char leng;   /* length of name */
X
X  leng = 0;
X  while ((pos_ <= inputleng) & (!isDelim(userinput[pos_ - 1]))) {
X    if (leng == NAMELENG) {
X      printf("Name too long, begins: %.*s\n", NAMELENG, nm);
X      longjmp(_JL99, 1);
X    }
X    leng++;
X    nm[leng - 1] = userinput[pos_ - 1];
X    pos_++;
X  }
X  if (leng == 0) {
X    printf("Error: expected name, instead read: %c\n", userinput[pos_ - 1]);
X    longjmp(_JL99, 1);
X  }
X  for (; leng < NAMELENG; leng++)
X    nm[leng] = ' ';
X  pos_ = skipblanks((long)pos_);   /* skip blanks after name */
X  return (install(nm));
}  /* parseName */
X
X
/* isVar - check if first character of name n is upper-case      */
Static boolean isVar(n)
short n;
{
X  return isupper(printNames[n - 1][0]);
}  /* isVar */
X
X
Local boolean isDigits(pos)
long pos;
{
X  boolean Result;
X
X  if (!isdigit(userinput[pos - 1]))
X    return false;
X  Result = true;
X  while (isdigit(userinput[pos - 1]))
X    pos++;
X  if (!isDelim(userinput[pos - 1]))
X    return false;
X  return Result;
}  /* isDigits */
X
X
/* isNumber - check if a number begins at pos                    */
Static boolean isNumber(pos)
long pos;
{
X
X  /* isDigits - check if sequence of digits begins at pos          */
X  return (isDigits(pos) | ((userinput[pos - 1] == '-') & isDigits(pos + 1)));
}  /* isNumber */
X
X
/* parseInt - return number starting at userinput[pos]           */
Static long parseInt()
{
X  long n, sign;
X
X  n = 0;
X  sign = 1;
X  if (userinput[pos_ - 1] == '-') {
X    sign = -1;
X    pos_++;
X  }
X  while (isdigit(userinput[pos_ - 1])) {
X    n = n * 10 + userinput[pos_ - 1] - '0';
X    pos_++;
X  }
X  pos_ = skipblanks((long)pos_);   /* skip blanks after number */
X  return (n * sign);
}  /* parseInt */
X
X
Static EXPLISTREC *parseEL PV();
X
X
/* parseExp - return EXP starting at userinput[pos]              */
Static EXPREC *parseExp()
{
X  short n;
X  EXPLISTREC *el;
X
X  if (userinput[pos_ - 1] == '(') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X    n = parseName();
X    el = parseEL();
X    return (mkAPEXP(n, el));
X  } else if (isNumber((long)pos_))
X    return (mkINTEXP(parseInt()));
X  else {
X    n = parseName();
X    if (isVar(n))
X      return (mkVAREXP(mkVariable(n, 0L)));
X    else
X      return (mkAPEXP(n, NULL));
X  }
}  /* parseExp */
X
X
/* parseEL - return EXPLIST starting at userinput[pos]           */
Static EXPLISTREC *parseEL()
{
X  EXPREC *e;
X  EXPLISTREC *el;
X
X  if (userinput[pos_ - 1] == ')') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X    return NULL;
X  } else {
X    e = parseExp();
X    el = parseEL();
X    return (mkExplist(e, el));
X  }
}  /* parseEL */
X
X
/* parseGoal - return GOAL starting at userinput[pos]            */
Static GOALREC *parseGoal()
{
X  short pred;
X  EXPLISTREC *il;
X
X  if (userinput[pos_ - 1] != '(') {
X    pred = parseName();
X    il = NULL;
X    return (mkGoal(pred, il));
X  }
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ...' */
X  pred = parseName();
X  il = parseEL();
X  return (mkGoal(pred, il));
}  /* parseGoal */
X
X
/* parseGL - return GOALLIST starting at userinput[pos]          */
Static GOALLISTREC *parseGL()
{
X  GOALREC *g;
X  GOALLISTREC *gl;
X
X  if (userinput[pos_ - 1] == ')') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X    return NULL;
X  } else {
X    g = parseGoal();
X    gl = parseGL();
X    return (mkGoallist(g, gl));
X  }
}  /* parseGL */
X
X
/* parseClause - return CLAUSE at userinput[pos]                 */
Static Void parseClause()
{
X  GOALREC *h;
X  GOALLISTREC *g;
X
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X  pos_ = skipblanks(pos_ + 5L);   /* skip 'infer ..' */
X  h = parseGoal();
X  if (userinput[pos_ - 1] == ')')
X    g = NULL;
X  else {
X    pos_ = skipblanks(pos_ + 4L);   /* skip 'from ..' */
X    g = parseGL();
X  }
X  pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X  newClause(h, g);
}  /* parseClause */
X
X
/* parseQuery - return GOALLIST starting at userinput[pos]       */
Static GOALLISTREC *parseQuery()
{
X  GOALLISTREC *Result;
X
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X  pos_ = skipblanks(pos_ + 6L);   /* skip 'infer? ..' */
X  Result = parseGL();
X  pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X  return Result;
}  /* parseQuery */
X
X
Static Void prExplist PP((EXPLISTREC *el));
X
Local Void prVariable(v)
VARIABLEREC *v;
{
X  prName(v->varname);
X  if (v->varindex > 0)
X    printf("%ld", v->varindex);
}  /* prVariable */
X
Local Void prExp(e)
EXPREC *e;
{
X
X  /* prVariable - print variable, including index                  */
X  switch (e->etype) {
X
X  case INTEXP:
X    printf("%ld", e->UU.intval);
X    break;
X
X  case VAREXP:
X    prVariable(e->UU.varble);
X    break;
X
X  case APEXP:
X    if (e->UU.U2.args == NULL)
X      prName(e->UU.U2.optr);
X    else {
X      putchar('(');
X      prName(e->UU.U2.optr);
X      if (e->UU.U2.args != NULL) {
X	putchar(' ');
X	prExplist(e->UU.U2.args);
X      }
X      putchar(')');
X    }
X    break;
X  }/* case */
}  /* prExp */
X
X
/*****************************************************************
X *                     OUTPUT                                    *
X *****************************************************************/
X
/* prExplist - print an EXPLIST                                  */
Static Void prExplist(el)
EXPLISTREC *el;
{
X
X  /* prExp - print an EXP                                          */
X  if (el == NULL)
X    return;
X  prExp(el->head);
X  if (el->tail != NULL) {
X    putchar(' ');
X    prExplist(el->tail);
X  }
}  /* prExplist */
X
X
/*****************************************************************
X *                     SUBSTITUTIONS                             *
X *****************************************************************/
X
/* emptySubst - create a substitution with no bindings           */
Static SUBSTREC *emptySubst()
{
X  SUBSTREC *s;
X
X  s = (SUBSTREC *)Malloc(sizeof(SUBSTREC));
X  s->domain = NULL;
X  s->range = NULL;
X  return s;
}  /* emptySubst */
X
X
/* bindVar - bind variable v to expression e in sigma            */
Static Void bindVar(v, e, sigma)
VARIABLEREC *v;
EXPREC *e;
SUBSTREC *sigma;
{
X  sigma->domain = mkVarlist(v, sigma->domain);
X  sigma->range = mkExplist(e, sigma->range);
}  /* bindVar */
X
X
/* findVar - look up variable v in sigma                         */
Static EXPLISTREC *findVar(v, sigma)
VARIABLEREC *v;
SUBSTREC *sigma;
{
X  VARLISTREC *dl;
X  EXPLISTREC *rl;
X  boolean found;
X
X  found = false;
X  dl = sigma->domain;
X  rl = sigma->range;
X  while (dl != NULL && !found) {
X    if (eqVar(dl->head, v))
X      found = true;
X    else {
X      dl = dl->tail;
X      rl = rl->tail;
X    }
X  }
X  return rl;
}  /* findVar */
X
X
/* fetch - fetch binding of variable v in sigma                  */
Static EXPREC *fetch(v, sigma)
VARIABLEREC *v;
SUBSTREC *sigma;
{
X  EXPLISTREC *el;
X
X  el = findVar(v, sigma);
X  return (el->head);
}  /* fetch */
X
X
/* isBound - check if variable v is bound in sigma               */
Static boolean isBound(v, sigma)
VARIABLEREC *v;
SUBSTREC *sigma;
{
X  return (findVar(v, sigma) != NULL);
}  /* isBound */
X
X
Static Void applyToExplist PP((SUBSTREC *s, EXPLISTREC *el));
X
X
/* applyToExp - apply substitution s to e, modifying e           */
Static Void applyToExp(s, e)
SUBSTREC *s;
EXPREC **e;
{
X  switch ((*e)->etype) {
X
X  case INTEXP:
X    /* blank case */
X    break;
X
X  case VAREXP:
X    if (isBound((*e)->UU.varble, s))
X      *e = fetch((*e)->UU.varble, s);
X    break;
X
X  case APEXP:
X    applyToExplist(s, (*e)->UU.U2.args);
X    break;
X  }
}  /* applyToExp */
X
X
/* applyToExplist - apply substitution s to el, modifying el     */
Static Void applyToExplist(s, el)
SUBSTREC *s;
EXPLISTREC *el;
{
X  while (el != NULL) {
X    applyToExp(s, &el->head);
X    el = el->tail;
X  }
}  /* applyToExplist */
X
X
/* applyToGoal - apply substitution s to g, modifying g          */
Static Void applyToGoal(s, g)
SUBSTREC *s;
GOALREC *g;
{
X  applyToExplist(s, g->args);
}  /* applyToGoal */
X
X
/* applyToGoallist - apply substitution s to gl, modifying gl    */
Static Void applyToGoallist(s, gl)
SUBSTREC *s;
GOALLISTREC *gl;
{
X  while (gl != NULL) {
X    applyToGoal(s, gl->head);
X    gl = gl->tail;
X  }
}  /* applyToGoallist */
X
X
/* compose - change substitution s1 to composition of s1 and s2  */
Static Void compose(s1, s2)
SUBSTREC *s1, *s2;
{
X  VARLISTREC *dom;
X  EXPLISTREC *rng;
X
X  applyToExplist(s2, s1->range);
X  if (s1->domain == NULL) {
X    s1->domain = s2->domain;
X    s1->range = s2->range;
X    return;
X  }
X  dom = s1->domain;
X  rng = s1->range;
X  while (dom->tail != NULL) {
X    dom = dom->tail;
X    rng = rng->tail;
X  }
X  dom->tail = s2->domain;
X  rng->tail = s2->range;
}  /* compose */
X
X
/* Local variables for unify: */
struct LOC_unify {
X  EXPREC *diff1, *diff2;
} ;
X
Local boolean findExpDiff PP((EXPREC *e1, EXPREC *e2, struct LOC_unify *LINK));
X
/* findELDiff - set diff1, diff2 to EXP's where el1, el2 differ  */
Local boolean findELDiff(el1, el2, LINK)
EXPLISTREC *el1, *el2;
struct LOC_unify *LINK;
{
X  boolean foundDiff;
X
X  foundDiff = false;
X  while (el1 != NULL && !foundDiff) {
X    foundDiff = findExpDiff(el1->head, el2->head, LINK);
X    el1 = el1->tail;
X    el2 = el2->tail;
X  }
X  return foundDiff;
}  /* findELDiff */
X
/* findExpDiff - set diff1, diff2 to EXP's where e1, e2 differ   */
Local boolean findExpDiff(e1, e2, LINK)
EXPREC *e1, *e2;
struct LOC_unify *LINK;
{
X  boolean Result;
X
X  Result = true;
X  LINK->diff1 = e1;
X  LINK->diff2 = e2;
X  if (e1->etype != e2->etype)
X    return Result;
X  switch (e1->etype) {
X
X  case VAREXP:
X    if (eqVar(e1->UU.varble, e2->UU.varble))
X      Result = false;
X    break;
X
X  case INTEXP:
X    if (e1->UU.intval == e2->UU.intval)
X      Result = false;
X    break;
X
X  case APEXP:
X    if (e1->UU.U2.optr == e2->UU.U2.optr)
X      Result = findELDiff(e1->UU.U2.args, e2->UU.U2.args, LINK);
X    break;
X  }/* case */
X  return Result;
}  /* findExpDiff */
X
/* occursInExp - check whether variable v occurs in exp e        */
Local boolean occursInExp(v, e, LINK)
VARIABLEREC *v;
EXPREC *e;
struct LOC_unify *LINK;
{
X  boolean Result, occurs;
X  EXPLISTREC *el;
X
X  switch (e->etype) {
X
X  case INTEXP:
X    Result = false;
X    break;
X
X  case VAREXP:
X    Result = eqVar(v, e->UU.varble);
X    break;
X
X  case APEXP:
X    occurs = false;
X    el = e->UU.U2.args;
X    while (el != NULL && !occurs) {
X      occurs = occursInExp(v, el->head, LINK);
X      el = el->tail;
X    }
X    Result = occurs;
X    break;
X  }/* case and with */
X  return Result;
}  /* occursInExp */
X
/* makeSubst - bind d1 to d2 in s, first checking if possible    */
Local Void makeSubst(d1, d2, s, LINK)
EXPREC *d1, *d2;
SUBSTREC **s;
struct LOC_unify *LINK;
{
X  if (d1->etype != VAREXP) {
X    *s = NULL;
X    return;
X  }
X  if (occursInExp(d1->UU.varble, d2, LINK))
X    *s = NULL;
X  else
X    bindVar(d1->UU.varble, d2, *s);
}  /* makeSubst */
X
X
/*****************************************************************
X *                     UNIFICATION                               *
X *****************************************************************/
X
/* unify - unify g1 and g2; return unifying subst. (or nil)      */
X
Static SUBSTREC *unify(g1, g2)
GOALREC *g1, *g2;
{
X  struct LOC_unify V;
X  SUBSTREC *sigma, *varsubst;
X  boolean foundDiff;
X
X  sigma = emptySubst();
X  do {
X    foundDiff = findELDiff(g1->args, g2->args, &V);
X    varsubst = emptySubst();
X    if (foundDiff) {
X      if (V.diff1->etype == VAREXP)
X	makeSubst(V.diff1, V.diff2, &varsubst, &V);
X      else
X	makeSubst(V.diff2, V.diff1, &varsubst, &V);
X    }
X    if (foundDiff && varsubst != NULL) {   /* done */
X      applyToGoal(varsubst, g1);
X      applyToGoal(varsubst, g2);
X      compose(sigma, varsubst);
X    }
X  } while (foundDiff && varsubst != NULL);   /* not unifiable */
X  if (varsubst == NULL)
X    return NULL;
X  else
X    return sigma;
}  /* unify */
X
X
/* Local variables for applyPrim: */
struct LOC_applyPrim {
X  boolean Result;
X  SUBSTREC **sigma;
X  EXPLISTREC *arglist;
X  EXPREC *arg1, *arg2, *arg3;
} ;
X
Local Void applyArith(op, LINK)
long op;
struct LOC_applyPrim *LINK;
{
X  long i;
X
X  LINK->arg3 = LINK->arglist->tail->tail->head;
X  if (LINK->arg3->etype == APEXP) {
X    LINK->Result = false;
X    return;
X  }
X  switch (op) {
X
X  case 1:
X    i = LINK->arg1->UU.intval + LINK->arg2->UU.intval;
X    break;
X
X  case 2:
X    i = LINK->arg1->UU.intval - LINK->arg2->UU.intval;
X    break;
X  }
X  if (LINK->arg3->etype == INTEXP) {
X    if (LINK->arg3->UU.intval != i)
X      LINK->Result = false;
X  } else
X    bindVar(LINK->arg3->UU.varble, mkINTEXP(i), *LINK->sigma);
X
X  /* applyPrim already true */
}  /* applyArith */
X
X
/*****************************************************************
X *                     EVALUATION                                *
X *****************************************************************/
X
/* applyPrim - apply primitive predicate, modifying sigma        */
Static boolean applyPrim(g, sigma_)
GOALREC *g;
SUBSTREC **sigma_;
{
X  struct LOC_applyPrim V;
X
X  V.sigma = sigma_;
X  *V.sigma = emptySubst();
X  V.Result = true;
X  V.arglist = g->args;
X  if (g->pred == 4) {   /* print */
X    prExplist(V.arglist);
X    putchar('\n');
X    return V.Result;
X  }
X  V.arg1 = V.arglist->head;
X  V.arg2 = V.arglist->tail->head;
X  if (V.arg1->etype != INTEXP || V.arg2->etype != INTEXP)
X    return false;
X  switch (g->pred) {
X
X  case 1:
X  case 2:   /* plus, minus */
X    applyArith((long)g->pred, &V);
X    break;
X
X  case 3:   /* less */
X    if (V.arg1->UU.intval >= V.arg2->UU.intval)
X      V.Result = false;
X    break;
X  }/* case */
X  return V.Result;
}  /* applyPrim */
X
X
Static GOALREC *copyGoal PP((GOALREC *g, long id));
X
X
/* copyGoallist - copy gl; rename variables if id<>0             */
Static GOALLISTREC *copyGoallist(gl, id)
GOALLISTREC *gl;
long id;
{
X  if (gl == NULL)
X    return NULL;
X  else
X    return (mkGoallist(copyGoal(gl->head, id), copyGoallist(gl->tail, id)));
}  /* copyGoallist */
X
X
/* Local variables for copyGoal: */
struct LOC_copyGoal {
X  long id;
} ;
X
Local EXPLISTREC *copyExplist PP((EXPLISTREC *el, struct LOC_copyGoal *LINK));
X
/* Local variables for copyExplist: */
struct LOC_copyExplist {
X  struct LOC_copyGoal *LINK;
} ;
X
Local EXPREC *copyExp(e, LINK)
EXPREC *e;
struct LOC_copyExplist *LINK;
{
X  EXPREC *Result;
X
X  switch (e->etype) {
X
X  case INTEXP:
X    Result = e;
X    break;
X
X  case VAREXP:
X    if (LINK->LINK->id == 0)
X      Result = mkVAREXP(mkVariable(e->UU.varble->varname,
X				   e->UU.varble->varindex));
X    else
X      Result = mkVAREXP(mkVariable(e->UU.varble->varname, LINK->LINK->id));
X    break;
X
X  case APEXP:
X    Result = mkAPEXP(e->UU.U2.optr, copyExplist(e->UU.U2.args, LINK->LINK));
X    break;
X  }/* case */
X  return Result;
}  /* copyExp */
X
Local EXPLISTREC *copyExplist(el, LINK)
EXPLISTREC *el;
struct LOC_copyGoal *LINK;
{
X
X  /* copyExp - copy e; rename variables if id<>0                   */
X  struct LOC_copyExplist V;
X
X  V.LINK = LINK;
X  if (el == NULL)
X    return NULL;
X  else
X    return (mkExplist(copyExp(el->head, &V), copyExplist(el->tail, LINK)));
}  /* copyExplist */
X
X
/* copyGoal - copy g; rename variables if id<>0                  */
Static GOALREC *copyGoal(g, id_)
GOALREC *g;
long id_;
{
X
X  /* copyExplist - copy el; rename variables if id<>0              */
X  struct LOC_copyGoal V;
X
X  V.id = id_;
X  return (mkGoal(g->pred, copyExplist(g->args, &V)));
}  /* copyGoal */
X
X
/* append - append second to end of first, modifying first       */
Static GOALLISTREC *append(first, second)
GOALLISTREC *first, *second;
{
X  GOALLISTREC *Result;
X
X  if (first == NULL)
X    return second;
X  Result = first;
X  while (first->tail != NULL)
X    first = first->tail;
X  first->tail = second;
X  return Result;
}  /* append */
X
X
Static SUBSTREC *prove PP((GOALLISTREC *gl, long id));
X
/* Local variables for prove: */
struct LOC_prove {
X  long id;
X  SUBSTREC *sigma0;
} ;
X
/* tryClause - try to match goal g and clause head of c          */
Local SUBSTREC *tryClause(clgoal, g, LINK)
GOALREC *clgoal, *g;
struct LOC_prove *LINK;
{
X  SUBSTREC *Result;
X
X  Result = NULL;
X  if (!((clgoal->pred == g->pred) & (lengthEL(clgoal->args) == lengthEL(g->args))))
X    return Result;
X  clgoal = copyGoal(clgoal, LINK->id);
X  g = copyGoal(g, 0L);
X  return (unify(clgoal, g));
/* p2c: prolog.p: Note: Deleting unreachable code [255] */
}  /* tryClause */
X
/* proveRest - add subgoals to restofgoals and prove             */
Local SUBSTREC *proveRest(subgoals, restofgoals, LINK)
GOALLISTREC *subgoals, *restofgoals;
struct LOC_prove *LINK;
{
X  subgoals = copyGoallist(subgoals, LINK->id);
X  applyToGoallist(LINK->sigma0, subgoals);
X  restofgoals = copyGoallist(restofgoals, 0L);
X  applyToGoallist(LINK->sigma0, restofgoals);
X  return (prove(append(subgoals, restofgoals), LINK->id + 1));
}  /* proveRest */
X
X
/* prove - prove goals gl; return subst; id used to rename var's */
Static SUBSTREC *prove(gl, id_)
GOALLISTREC *gl;
long id_;
{
X  struct LOC_prove V;
X  CLAUSEREC *cl;
X  SUBSTREC *sigma1;
X
X  V.id = id_;
X  if (gl == NULL)
X    return (emptySubst());
X  else {
X    if (gl->head->pred <= numBuiltins) {
X      if (applyPrim(gl->head, &V.sigma0)) {
X	applyToGoallist(V.sigma0, gl->tail);
X	sigma1 = prove(gl->tail, V.id + 1);
X      } else
X	sigma1 = NULL;
X    } else {
X      sigma1 = NULL;
X      cl = clauses;
X      while (cl != NULL && sigma1 == NULL) {
X	V.sigma0 = tryClause(cl->lhs, gl->head, &V);
X	if (V.sigma0 != NULL)
X	  sigma1 = proveRest(cl->rhs, gl->tail, &V);
X	cl = cl->nextclause;
X      }  /* while */
X    }
X    if (sigma1 == NULL)
X      return NULL;
X    else {
X      compose(V.sigma0, sigma1);
X      return V.sigma0;
X    }
X  }
}  /* prove */
X
X
/*****************************************************************
X *                     READ-EVAL-PRINT LOOP                      *
X *****************************************************************/
X
main(argc, argv)
int argc;
Char *argv[];
{  /* prolog main */
X  PASCAL_MAIN(argc, argv);
X  if (setjmp(_JL99))
X    goto _L99;
X  initNames();
X
X  quittingtime = false;
_L99:
X  while (!quittingtime) {
X    reader();
X    if (matches((long)pos_, 4, "quit                ")) {
X      quittingtime = true;
X      break;
X    }
X    if (matches(skipblanks(pos_ + 1L), 5, "infer               ")) {
X      parseClause();
X      putchar('\n');
X    } else {
X      toplevelGoal = parseQuery();
X      putchar('\n');
X      if (prove(toplevelGoal, 1L) == NULL)
X	printf("Not satisfied\n");
X      else
X	printf("Satisfied\n");
X      putchar('\n');
X    }
X  }
X  exit(0);
}  /* prolog */
X
X
X
/* End. */
SHAR_EOF
  (set 19 90 01 05 18 00 44 'c-distr/prolog.c'; eval "$shar_touch") &&
  chmod 0644 'c-distr/prolog.c'
if test $? -ne 0
then ${echo} 'restore of c-distr/prolog.c failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/prolog.c: MD5 check failed'
       ) << SHAR_EOF
492884899edb698089f21b159fe9f97f  c-distr/prolog.c
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/prolog.c'` -ne 27798 && \
  ${echo} 'restoration warning:  size of c-distr/prolog.c is not 27798'
  fi
fi
# ============= c-distr/lisp.c ==============
if test -f 'c-distr/lisp.c' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/lisp.c (file already exists)'
else
${echo} 'x - extracting c-distr/lisp.c (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/lisp.c' &&
/* Output from p2c, the Pascal-to-C translator */
/* From input file "lisp.p" */
X
X
/*****************************************************************
X *                     DECLARATIONS                              *
X *****************************************************************/
X
#include <p2c/p2c.h>
X
X
#define NAMELENG        20   /* Maximum length of a name */
#define MAXNAMES        300   /* Maximum number of different names */
#define MAXINPUT        4000   /* Maximum length of an input */
X
#define PROMPT          "-> "
#define PROMPT2         "> "
#define COMMENTCHAR     ";"
X
#define TABCODE         9   /* in ASCII */
X
X
typedef Char NAMESTRING[NAMELENG];
X
/* a NAME is an index in printNames */
X
typedef enum {
X  IFOP, WHILEOP, SETOP, BEGINOP, PLUSOP, MINUSOP, TIMESOP, DIVOP, EQOP, LTOP,
X  GTOP, CONSOP, CAROP, CDROP, NUMBERPOP, SYMBOLPOP, LISTPOP, NULLPOP, PRINTOP
} BUILTINOP;
X
X
typedef enum {
X  NILSXP, NUMSXP, SYMSXP, LISTSXP
} SEXPTYPE;
X
typedef struct SEXPREC {
X  SEXPTYPE sxptype;
X  union {
X    long intval;
X    short symval;
X    struct {
X      struct SEXPREC *carval, *cdrval;
X    } U3;
X  } UU;
} SEXPREC;
X
typedef enum {
X  VALEXP, VAREXP, APEXP
} EXPTYPE;
X
typedef struct EXPREC {
X  EXPTYPE etype;
X  union {
X    SEXPREC *sxp;
X    short varble;
X    struct {
X      short optr;
X      struct EXPLISTREC *args;
X    } U2;
X  } UU;
} EXPREC;
X
typedef struct EXPLISTREC {
X  EXPREC *head;
X  struct EXPLISTREC *tail;
} EXPLISTREC;
X
typedef struct VALUELISTREC {
X  SEXPREC *head;
X  struct VALUELISTREC *tail;
} VALUELISTREC;
X
typedef struct NAMELISTREC {
X  short head;
X  struct NAMELISTREC *tail;
} NAMELISTREC;
X
typedef struct ENVREC {
X  NAMELISTREC *vars;
X  VALUELISTREC *values;
} ENVREC;
X
typedef struct FUNDEFREC {
X  short funname;
X  NAMELISTREC *formals;
X  EXPREC *body;
X  struct FUNDEFREC *nextfundef;
} FUNDEFREC;
X
X
Static FUNDEFREC *fundefs;
X
Static ENVREC *globalEnv;
X
Static EXPREC *currentExp;
X
Static Char userinput[MAXINPUT];
Static short inputleng, pos_;
X
Static NAMESTRING printNames[MAXNAMES];
Static short numNames, numBuiltins;
X
Static SEXPREC *nilValue, *trueValue;
X
Static boolean quittingtime;
X
X
/*****************************************************************
X *                     DATA STRUCTURE OP'S                       *
X *****************************************************************/
X
/* mkVALEXP - return an EXP of type VALEXP with sxp s            */
Static EXPREC *mkVALEXP(s)
SEXPREC *s;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = VALEXP;
X  e->UU.sxp = s;
X  return e;
}  /* mkVALEXP */
X
X
/* mkVAREXP - return an EXP of type VAREXP with varble nm        */
Static EXPREC *mkVAREXP(nm)
short nm;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = VAREXP;
X  e->UU.varble = nm;
X  return e;
}  /* mkVAREXP */
X
X
/* mkAPEXP - return EXP of type APEXP w/ optr op and args el     */
Static EXPREC *mkAPEXP(op, el)
short op;
EXPLISTREC *el;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = APEXP;
X  e->UU.U2.optr = op;
X  e->UU.U2.args = el;
X  return e;
}  /* mkAPEXP */
X
X
/* mkSExp - return SEXP of type t (but no value)                 */
Static SEXPREC *mkSExp(t)
SEXPTYPE t;
{
X  SEXPREC *s;
X
X  s = (SEXPREC *)Malloc(sizeof(SEXPREC));
X  s->sxptype = t;
X  return s;
}  /* mkSExp */
X
X
/* mkExplist - return an EXPLIST with head e and tail el         */
Static EXPLISTREC *mkExplist(e, el)
EXPREC *e;
EXPLISTREC *el;
{
X  EXPLISTREC *newel;
X
X  newel = (EXPLISTREC *)Malloc(sizeof(EXPLISTREC));
X  newel->head = e;
X  newel->tail = el;
X  return newel;
}  /* mkExplist */
X
X
/* mkNamelist - return a NAMELIST with head n and tail nl        */
Static NAMELISTREC *mkNamelist(nm, nl)
short nm;
NAMELISTREC *nl;
{
X  NAMELISTREC *newnl;
X
X  newnl = (NAMELISTREC *)Malloc(sizeof(NAMELISTREC));
X  newnl->head = nm;
X  newnl->tail = nl;
X  return newnl;
}  /* mkNamelist */
X
X
/* mkValuelist - return an VALUELIST with head s and tail vl     */
Static VALUELISTREC *mkValuelist(s, vl)
SEXPREC *s;
VALUELISTREC *vl;
{
X  VALUELISTREC *newvl;
X
X  newvl = (VALUELISTREC *)Malloc(sizeof(VALUELISTREC));
X  newvl->head = s;
X  newvl->tail = vl;
X  return newvl;
}  /* mkValuelist */
X
X
/* mkEnv - return an ENV with vars nl and values vl              */
Static ENVREC *mkEnv(nl, vl)
NAMELISTREC *nl;
VALUELISTREC *vl;
{
X  ENVREC *rho;
X
X  rho = (ENVREC *)Malloc(sizeof(ENVREC));
X  rho->vars = nl;
X  rho->values = vl;
X  return rho;
}  /* mkEnv */
X
X
/* lengthVL - return length of VALUELIST vl                      */
Static long lengthVL(vl)
VALUELISTREC *vl;
{
X  long i;
X
X  i = 0;
X  while (vl != NULL) {
X    i++;
X    vl = vl->tail;
X  }
X  return i;
}  /* lengthVL */
X
X
/* lengthNL - return length of NAMELIST nl                       */
Static long lengthNL(nl)
NAMELISTREC *nl;
{
X  long i;
X
X  i = 0;
X  while (nl != NULL) {
X    i++;
X    nl = nl->tail;
X  }
X  return i;
}  /* lengthNL */
X
X
/*****************************************************************
X *                     NAME MANAGEMENT                           *
X *****************************************************************/
X
/* fetchFun - get function definition of fname from fundefs      */
Static FUNDEFREC *fetchFun(fname)
short fname;
{
X  FUNDEFREC *f;
X  boolean found;
X
X  found = false;
X  f = fundefs;
X  while (f != NULL && !found) {
X    if (f->funname == fname)
X      found = true;
X    else
X      f = f->nextfundef;
X  }
X  return f;
}  /* fetchFun */
X
X
/* newFunDef - add new function fname w/ parameters nl, body e   */
Static Void newFunDef(fname, nl, e)
short fname;
NAMELISTREC *nl;
EXPREC *e;
{
X  FUNDEFREC *f;
X
X  f = fetchFun(fname);
X  if (f == NULL) {   /* fname not yet defined as a function */
X    f = (FUNDEFREC *)Malloc(sizeof(FUNDEFREC));
X    f->nextfundef = fundefs;   /* place new FUNDEFREC */
X    fundefs = f;   /* on fundefs list */
X  }
X  f->funname = fname;
X  f->formals = nl;
X  f->body = e;
}  /* newFunDef */
X
X
/* initNames - place all pre-defined names into printNames       */
Static Void initNames()
{
X  long i;
X
X  fundefs = NULL;
X  i = 1;
X  memcpy(printNames[i - 1], "if                  ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "while               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "set                 ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "begin               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "+                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "-                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "*                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "/                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "=                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "<                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], ">                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "cons                ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "car                 ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "cdr                 ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "number?             ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "symbol?             ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "list?               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "null?               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "print               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "T                   ", sizeof(NAMESTRING));
X  numNames = i;
X  numBuiltins = i;
}  /* initNames */
X
X
Static jmp_buf _JL99;
X
X
/* install - insert new name into printNames                     */
Static short install(nm)
Char *nm;
{
X  long i;
X  boolean found;
X
X  i = 1;
X  found = false;
X  while (i <= numNames && !found) {
X    if (!memcmp(nm, printNames[i - 1], sizeof(NAMESTRING)))
X      found = true;
X    else
X      i++;
X  }
X  if (found)
X    return i;
X  if (i > MAXNAMES) {
X    printf("No more room for names\n");
X    longjmp(_JL99, 1);
X  }
X  numNames = i;
X  memcpy(printNames[i - 1], nm, sizeof(NAMESTRING));
X  return i;
}  /* install */
X
X
/* prName - print name nm                                        */
Static Void prName(nm)
short nm;
{
X  long i;
X
X  i = 1;
X  while (i <= NAMELENG) {
X    if (printNames[nm - 1][i - 1] != ' ') {
X      putchar(printNames[nm - 1][i - 1]);
X      i++;
X    } else
X      i = NAMELENG + 1;
X  }
}  /* prName */
X
X
/* primOp - translate NAME optr to corresponding BUILTINOP       */
Static BUILTINOP primOp(optr)
short optr;
{
X  BUILTINOP op;
X  long i;
X
X  op = IFOP;   /* N.B. IFOP is first value in BUILTINOPS */
X  for (i = 1; i < optr; i++)
X    op = (BUILTINOP)((long)op + 1);
X  return op;
}  /* primOp */
X
X
/*****************************************************************
X *                        INPUT                                  *
X *****************************************************************/
X
/* isDelim - check if c is a delimiter                           */
Static boolean isDelim(c)
Char c;
{
X  return (c == ';' || c == ' ' || c == ')' || c == '(');
}  /* isDelim */
X
X
/* skipblanks - return next non-blank position in userinput      */
Static long skipblanks(p)
long p;
{
X  while (userinput[p - 1] == ' ')
X    p++;
X  return p;
}  /* skipblanks */
X
X
/* matches - check if string nm matches userinput[s .. s+leng]   */
Static boolean matches(s, leng, nm)
long s;
char leng;
Char *nm;
{
X  boolean match;
X  long i;
X
X  match = true;
X  i = 1;
X  while (match && i <= leng) {
X    if (userinput[s - 1] != nm[i - 1])
X      match = false;
X    i++;
X    s++;
X  }
X  if (!isDelim(userinput[s - 1]))
X    match = false;
X  return match;
}  /* matches */
X
X
/* nextchar - read next char - filter tabs and comments          */
Local Void nextchar(c)
Char *c;
{
X  Char STR1[256];
X
X  *c = getchar();
X  if (*c == '\n')
X    *c = ' ';
X  if (*c == (Char)TABCODE) {
X    *c = ' ';
X    return;
X  }
X  sprintf(STR1, "%c", *c);
X  if (strcmp(STR1, COMMENTCHAR))
X    return;
X  while (!P_eoln(stdin)) {
X    *c = getchar();
X    if (*c == '\n')
X      *c = ' ';
X  }
X  *c = ' ';
}  /* nextchar */
X
/* readParens - read char's, ignoring newlines, to matching ')'  */
Local Void readParens()
{
X  long parencnt;   /* current depth of parentheses */
X  Char c;
X
X  parencnt = 1;   /* '(' just read */
X  do {
X    if (P_eoln(stdin))
X      fputs(PROMPT2, stdout);
X    nextchar(&c);
X    pos_++;
X    if (pos_ == MAXINPUT) {
X      printf("User input too long\n");
X      longjmp(_JL99, 1);
X    }
X    userinput[pos_ - 1] = c;
X    if (c == '(')
X      parencnt++;
X    if (c == ')')
X      parencnt--;
X  } while (parencnt != 0);   /* readParens */
}
X
Local Void readInput()
{
X  Char c;
X
X  fputs(PROMPT, stdout);
X  pos_ = 0;
X  do {
X    pos_++;
X    if (pos_ == MAXINPUT) {
X      printf("User input too long\n");
X      longjmp(_JL99, 1);
X    }
X    nextchar(&c);
X    userinput[pos_ - 1] = c;
X    if (userinput[pos_ - 1] == '(')
X      readParens();
X  } while (!P_eoln(stdin));
X  inputleng = pos_;
X  userinput[pos_] = ';';   /* sentinel */
}  /* readInput */
X
X
/* reader - read char's into userinput; be sure input not blank  */
Static Void reader()
{
X
X  /* readInput - read char's into userinput                        */
X  do {
X    readInput();
X    pos_ = skipblanks(1L);   /* ignore blank lines */
X  } while (pos_ > inputleng);   /* reader */
}
X
X
/* parseName - return (installed) NAME starting at userinput[pos]*/
Static short parseName()
{
X  NAMESTRING nm;   /* array to accumulate characters */
X  char leng;   /* length of name */
X
X  leng = 0;
X  while ((pos_ <= inputleng) & (!isDelim(userinput[pos_ - 1]))) {
X    if (leng == NAMELENG) {
X      printf("Name too long, begins: %.*s\n", NAMELENG, nm);
X      longjmp(_JL99, 1);
X    }
X    leng++;
X    nm[leng - 1] = userinput[pos_ - 1];
X    pos_++;
X  }
X  if (leng == 0) {
X    printf("Error: expected name, instead read: %c\n", userinput[pos_ - 1]);
X    longjmp(_JL99, 1);
X  }
X  for (; leng < NAMELENG; leng++)
X    nm[leng] = ' ';
X  pos_ = skipblanks((long)pos_);   /* skip blanks after name */
X  return (install(nm));
}  /* parseName */
X
X
Local boolean isDigits(pos)
long pos;
{
X  boolean Result;
X
X  if (!isdigit(userinput[pos - 1]))
X    return false;
X  Result = true;
X  while (isdigit(userinput[pos - 1]))
X    pos++;
X  if (!isDelim(userinput[pos - 1]))
X    return false;
X  return Result;
}  /* isDigits */
X
X
/* isNumber - check if a number begins at pos                    */
Static boolean isNumber(pos)
long pos;
{
X
X  /* isDigits - check if sequence of digits begins at pos          */
X  return (isDigits(pos) | ((userinput[pos - 1] == '-') & isDigits(pos + 1)));
}  /* isNumber */
X
X
/* isValue - check if a number or quoted const begins at pos     */
Static boolean isValue(pos)
long pos;
{
X  return ((userinput[pos - 1] == '\'') | isNumber(pos));
}  /* isValue */
X
X
Local SEXPREC *parseSExp PV();
X
/* Local variables for parseSExp: */
struct LOC_parseSExp {
X  SEXPREC *s;
} ;
X
/* parseInt - return number starting at userinput[pos]           */
Local SEXPREC *parseInt(LINK)
struct LOC_parseSExp *LINK;
{
X  long sum, sign;
X
X  LINK->s = mkSExp(NUMSXP);
X  sum = 0;
X  sign = 1;
X  if (userinput[pos_ - 1] == '-') {
X    sign = -1;
X    pos_++;
X  }
X  while (isdigit(userinput[pos_ - 1])) {
X    sum = sum * 10 + userinput[pos_ - 1] - '0';
X    pos_++;
X  }
X  LINK->s->UU.intval = sum * sign;
X  pos_ = skipblanks((long)pos_);   /* skip blanks after number */
X  return LINK->s;
}  /* parseInt */
X
/* parseSym - return symbol starting at userinput[pos]           */
Local SEXPREC *parseSym(LINK)
struct LOC_parseSExp *LINK;
{
X  LINK->s = mkSExp(SYMSXP);
X  LINK->s->UU.symval = parseName();
X  return LINK->s;
}  /* parseSym */
X
/* parseList - return list starting at userinput[pos]            */
Local SEXPREC *parseList(LINK)
struct LOC_parseSExp *LINK;
{
X  SEXPREC *Result, *car, *cdr;
X
X  if (userinput[pos_ - 1] == ')') {
X    Result = mkSExp(NILSXP);
X    pos_ = skipblanks(pos_ + 1L);
X    return Result;
X  } else {
X    car = parseSExp();
X    cdr = parseList(LINK);
X    LINK->s = mkSExp(LISTSXP);
X    LINK->s->UU.U3.carval = car;
X    LINK->s->UU.U3.cdrval = cdr;
X    return LINK->s;
X  }
X  return Result;
}  /* parseList */
X
Local SEXPREC *parseSExp()
{
X  struct LOC_parseSExp V;
X
X  if (isNumber((long)pos_))
X    return (parseInt(&V));
X  else if (userinput[pos_ - 1] == '(') {
X    pos_ = skipblanks(pos_ + 1L);
X    return (parseList(&V));
X  } else
X    return (parseSym(&V));
}  /* parseSExp */
X
X
/* parseVal - return S-expression starting at userinput[pos]     */
Static SEXPREC *parseVal()
{
X
X  /* parseSExp - return quoted S-expr starting at userinput[pos]   */
X  if (userinput[pos_ - 1] == '\'')
X    pos_++;
X  return (parseSExp());
}  /* parseVal */
X
X
Static EXPLISTREC *parseEL PV();
X
X
/* parseExp - return EXP starting at userinput[pos]              */
Static EXPREC *parseExp()
{
X  short nm;
X  EXPLISTREC *el;
X
X  if (userinput[pos_ - 1] == '(') {  /* APEXP */
X    pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X    nm = parseName();
X    el = parseEL();
X    return (mkAPEXP(nm, el));
X  } else if (isValue((long)pos_))
X    return (mkVALEXP(parseVal()));   /* VALEXP */
X  else
X    return (mkVAREXP(parseName()));   /* VAREXP */
}  /* parseExp */
X
X
/* parseEL - return EXPLIST starting at userinput[pos]           */
Static EXPLISTREC *parseEL()
{
X  EXPREC *e;
X  EXPLISTREC *el;
X
X  if (userinput[pos_ - 1] == ')') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X    return NULL;
X  } else {
X    e = parseExp();
X    el = parseEL();
X    return (mkExplist(e, el));
X  }
}  /* parseEL */
X
X
/* parseNL - return NAMELIST starting at userinput[pos]          */
Static NAMELISTREC *parseNL()
{
X  short nm;
X  NAMELISTREC *nl;
X
X  if (userinput[pos_ - 1] == ')') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X    return NULL;
X  } else {
X    nm = parseName();
X    nl = parseNL();
X    return (mkNamelist(nm, nl));
X  }
}  /* parseNL */
X
X
/* parseDef - parse function definition at userinput[pos]        */
Static short parseDef()
{
X  short fname;   /* function name */
X  NAMELISTREC *nl;   /* formal parameters */
X  EXPREC *e;   /* body */
X
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X  pos_ = skipblanks(pos_ + 6L);   /* skip 'define ..' */
X  fname = parseName();
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X  nl = parseNL();
X  e = parseExp();
X  pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X  newFunDef(fname, nl, e);
X  return fname;
}  /* parseDef */
X
X
/*****************************************************************
X *                     ENVIRONMENTS                              *
X *****************************************************************/
X
/* emptyEnv - return an environment with no bindings             */
Static ENVREC *emptyEnv()
{
X  return (mkEnv(NULL, NULL));
}  /* emptyEnv */
X
X
/* bindVar - bind variable nm to value s in environment rho      */
Static Void bindVar(nm, s, rho)
short nm;
SEXPREC *s;
ENVREC *rho;
{
X  rho->vars = mkNamelist(nm, rho->vars);
X  rho->values = mkValuelist(s, rho->values);
}  /* bindVar */
X
X
/* findVar - look up nm in rho                                   */
Static VALUELISTREC *findVar(nm, rho)
short nm;
ENVREC *rho;
{
X  NAMELISTREC *nl;
X  VALUELISTREC *vl;
X  boolean found;
X
X  found = false;
X  nl = rho->vars;
X  vl = rho->values;
X  while (nl != NULL && !found) {
X    if (nl->head == nm)
X      found = true;
X    else {
X      nl = nl->tail;
X      vl = vl->tail;
X    }
X  }
X  return vl;
}  /* findVar */
X
X
/* assign - assign value s to variable nm in rho                 */
Static Void assign(nm, s, rho)
short nm;
SEXPREC *s;
ENVREC *rho;
{
X  VALUELISTREC *varloc;
X
X  varloc = findVar(nm, rho);
X  varloc->head = s;
}  /* assign */
X
X
/* fetch - return SEXP bound to nm in rho                        */
Static SEXPREC *fetch(nm, rho)
short nm;
ENVREC *rho;
{
X  VALUELISTREC *vl;
X
X  vl = findVar(nm, rho);
X  return (vl->head);
}  /* fetch */
X
X
/* isBound - check if nm is bound in rho                         */
Static boolean isBound(nm, rho)
short nm;
ENVREC *rho;
{
X  return (findVar(nm, rho) != NULL);
}  /* isBound */
X
X
/*****************************************************************
X *                     S-EXPRESSIONS                             *
X *****************************************************************/
X
/* prValue - print S-expression s                                */
Static Void prValue(s)
SEXPREC *s;
{
X  SEXPREC *s1;
X
X  switch (s->sxptype) {
X
X  case NILSXP:
X    printf("()");
X    break;
X
X  case NUMSXP:
X    printf("%ld", s->UU.intval);
X    break;
X
X  case SYMSXP:
X    prName(s->UU.symval);
X    break;
X
X  case LISTSXP:
X    putchar('(');
X    prValue(s->UU.U3.carval);
X    s1 = s->UU.U3.cdrval;
X    while (s1->sxptype == LISTSXP) {
X      putchar(' ');
X      prValue(s1->UU.U3.carval);
X      s1 = s1->UU.U3.cdrval;
X    }
X    putchar(')');
X    break;
X  }/* case and with */
}  /* prValue */
X
X
/* isTrueVal - return true if s is true (non-NIL) value          */
Static boolean isTrueVal(s)
SEXPREC *s;
{
X  return (s->sxptype != NILSXP);
}  /* isTrueVal */
X
X
/* Local variables for applyValueOp: */
struct LOC_applyValueOp {
X  BUILTINOP op;
X  SEXPREC *result;
} ;
X
/* applyArithOp - apply binary, arithmetic VALUEOP to arguments  */
Local Void applyArithOp(n1, n2, LINK)
long n1, n2;
struct LOC_applyValueOp *LINK;
{
X  SEXPREC *WITH;
X
X  LINK->result = mkSExp(NUMSXP);
X  WITH = LINK->result;
X  switch (LINK->op) {
X
X  case PLUSOP:
X    WITH->UU.intval = n1 + n2;
X    break;
X
X  case MINUSOP:
X    WITH->UU.intval = n1 - n2;
X    break;
X
X  case TIMESOP:
X    WITH->UU.intval = n1 * n2;
X    break;
X
X  case DIVOP:
X    WITH->UU.intval = n1 / n2;
X    break;
X  }
}  /* applyArithOp */
X
/* applyRelOp - apply binary, relational VALUEOP to arguments    */
Local Void applyRelOp(n1, n2, LINK)
long n1, n2;
struct LOC_applyValueOp *LINK;
{
X  switch (LINK->op) {
X
X  case LTOP:
X    if (n1 < n2)
X      LINK->result = trueValue;
X    break;
X
X  case GTOP:
X    if (n1 > n2)
X      LINK->result = trueValue;
X    break;
X  }
}  /* applyRelOp */
X
/* arity - return number of arguments expected by op             */
Local long arity(op, LINK)
BUILTINOP op;
struct LOC_applyValueOp *LINK;
{
X  if (((1L << ((long)op)) &
X       ((1 << ((long)CONSOP + 1)) - (1 << ((long)PLUSOP)))) != 0)
X    return 2;
X  else
X    return 1;
}  /* arity */
X
X
/* applyValueOp - apply VALUEOP op to arguments in VALUELIST vl  */
Static SEXPREC *applyValueOp(op_, vl)
BUILTINOP op_;
VALUELISTREC *vl;
{
X  struct LOC_applyValueOp V;
X  SEXPREC *s1, *s2, *WITH1;
X
X  V.op = op_;
X  if (arity(V.op, &V) != lengthVL(vl)) {
X    printf("Wrong number of arguments to ");
X    prName((int)V.op + 1);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  V.result = nilValue;
X  s1 = vl->head;   /* 1st actual */
X  if (arity(V.op, &V) == 2)   /* 2nd actual */
X    s2 = vl->tail->head;
X  if (((1L << ((long)V.op)) &
X       (((1L << ((long)DIVOP + 1)) - (1 << ((long)PLUSOP))) |
X	((1 << ((long)GTOP + 1)) - (1 << ((long)LTOP))))) != 0) {
X    if (s1->sxptype == NUMSXP && s2->sxptype == NUMSXP) {
X      if (((1L << ((long)V.op)) &
X	   ((1 << ((long)DIVOP + 1)) - (1 << ((long)PLUSOP)))) != 0)
X	applyArithOp(s1->UU.intval, s2->UU.intval, &V);
X      else
X	applyRelOp(s1->UU.intval, s2->UU.intval, &V);
X      return V.result;
X    }
X    printf("Non-arithmetic arguments to ");
X    prName((int)V.op + 1);
X    putchar('\n');
X    longjmp(_JL99, 1);
X    return V.result;
X  }
X  switch (V.op) {
X
X  case EQOP:
X    if (s1->sxptype == NILSXP && s2->sxptype == NILSXP)
X      V.result = trueValue;
X    else if (s1->sxptype == NUMSXP && s2->sxptype == NUMSXP &&
X	     s1->UU.intval == s2->UU.intval)
X      V.result = trueValue;
X    else if (s1->sxptype == SYMSXP && s2->sxptype == SYMSXP &&
X	     s1->UU.symval == s2->UU.symval)
X      V.result = trueValue;
X    break;
X
X  case CONSOP:
X    V.result = mkSExp(LISTSXP);
X    WITH1 = V.result;
X    WITH1->UU.U3.carval = s1;
X    WITH1->UU.U3.cdrval = s2;
X    break;
X
X  case CAROP:
X    if (s1->sxptype != LISTSXP) {
X      printf("Error: car applied to non-list: ");
X      prValue(s1);
X      putchar('\n');
X    } else
X      V.result = s1->UU.U3.carval;
X    break;
X
X  case CDROP:
X    if (s1->sxptype != LISTSXP) {
X      printf("Error: cdr applied to non-list: ");
X      prValue(s1);
X      putchar('\n');
X    } else
X      V.result = s1->UU.U3.cdrval;
X    break;
X
X  case NUMBERPOP:
X    if (s1->sxptype == NUMSXP)
X      V.result = trueValue;
X    break;
X
X  case SYMBOLPOP:
X    if (s1->sxptype == SYMSXP)
X      V.result = trueValue;
X    break;
X
X  case LISTPOP:
X    if (s1->sxptype == LISTSXP)
X      V.result = trueValue;
X    break;
X
X  case NULLPOP:
X    if (s1->sxptype == NILSXP)
X      V.result = trueValue;
X    break;
X
X  case PRINTOP:
X    prValue(s1);
X    putchar('\n');
X    V.result = s1;
X    break;
X  }/* case and with */
X  return V.result;
}  /* applyValueOp */
X
X
Static SEXPREC *eval PP((EXPREC *e, ENVREC *rho));
X
/* Local variables for eval: */
struct LOC_eval {
X  ENVREC *rho;
} ;
X
/* evalList - evaluate each expression in el                     */
Local VALUELISTREC *evalList(el, LINK)
EXPLISTREC *el;
struct LOC_eval *LINK;
{
X  SEXPREC *h;
X  VALUELISTREC *t;
X
X  if (el == NULL)
X    return NULL;
X  else {
X    h = eval(el->head, LINK->rho);
X    t = evalList(el->tail, LINK);
X    return (mkValuelist(h, t));
X  }
}  /* evalList */
X
/* applyUserFun - look up definition of nm and apply to actuals  */
Local SEXPREC *applyUserFun(nm, actuals, LINK)
short nm;
VALUELISTREC *actuals;
struct LOC_eval *LINK;
{
X  FUNDEFREC *f;
X  ENVREC *rho;
X
X  f = fetchFun(nm);
X  if (f == NULL) {
X    printf("Undefined function: ");
X    prName(nm);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  if (lengthNL(f->formals) != lengthVL(actuals)) {
X    printf("Wrong number of arguments to: ");
X    prName(nm);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  rho = mkEnv(f->formals, actuals);
X  return (eval(f->body, rho));
}  /* applyUserFun */
X
/* applyCtrlOp - apply CONTROLOP op to args in rho               */
Local SEXPREC *applyCtrlOp(op, args, LINK)
BUILTINOP op;
EXPLISTREC *args;
struct LOC_eval *LINK;
{
X  SEXPREC *Result, *s;
X  EXPLISTREC *WITH;
X
X  WITH = args;
X  switch (op) {
X
X  case IFOP:
X    if (isTrueVal(eval(WITH->head, LINK->rho)))
X      Result = eval(WITH->tail->head, LINK->rho);
X    else
X      Result = eval(WITH->tail->tail->head, LINK->rho);
X    break;
X
X  case WHILEOP:
X    s = eval(WITH->head, LINK->rho);
X    while (isTrueVal(s)) {
X      s = eval(WITH->tail->head, LINK->rho);
X      s = eval(WITH->head, LINK->rho);
X    }
X    Result = s;
X    break;
X
X  case SETOP:
X    s = eval(WITH->tail->head, LINK->rho);
X    if (isBound(WITH->head->UU.varble, LINK->rho))
X      assign(WITH->head->UU.varble, s, LINK->rho);
X    else if (isBound(WITH->head->UU.varble, globalEnv))
X      assign(WITH->head->UU.varble, s, globalEnv);
X    else
X      bindVar(WITH->head->UU.varble, s, globalEnv);
X    Result = s;
X    break;
X
X  case BEGINOP:
X    while (args->tail != NULL) {
X      s = eval(args->head, LINK->rho);
X      args = args->tail;
X    }
X    Result = eval(args->head, LINK->rho);
X    break;
X  }/* case and with */
X  return Result;
}  /* applyCtrlOp */
X
X
/*****************************************************************
X *                     EVALUATION                                *
X *****************************************************************/
X
/* eval - return value of expression e in local environment rho  */
Static SEXPREC *eval(e, rho_)
EXPREC *e;
ENVREC *rho_;
{
X  struct LOC_eval V;
X  SEXPREC *Result;
X  BUILTINOP op;
X
X  V.rho = rho_;
X  switch (e->etype) {
X
X  case VALEXP:
X    Result = e->UU.sxp;
X    break;
X
X  case VAREXP:
X    if (isBound(e->UU.varble, V.rho))
X      Result = fetch(e->UU.varble, V.rho);
X    else if (isBound(e->UU.varble, globalEnv))
X      Result = fetch(e->UU.varble, globalEnv);
X    else {
X      printf("Undefined variable: ");
X      prName(e->UU.varble);
X      putchar('\n');
X      longjmp(_JL99, 1);
X    }
X    break;
X
X  case APEXP:
X    if (e->UU.U2.optr > numBuiltins)
X      Result = applyUserFun(e->UU.U2.optr, evalList(e->UU.U2.args, &V), &V);
X    else {
X      op = primOp(e->UU.U2.optr);
X      if (((1L << ((long)op)) &
X	   ((1 << ((long)BEGINOP + 1)) - (1 << ((long)IFOP)))) != 0)
X	Result = applyCtrlOp(op, e->UU.U2.args, &V);
X      else
X	Result = applyValueOp(op, evalList(e->UU.U2.args, &V));
X    }
X    break;
X  }/* case and with */
X  return Result;
}  /* eval */
X
X
/*****************************************************************
X *                     READ-EVAL-PRINT LOOP                      *
X *****************************************************************/
X
main(argc, argv)
int argc;
Char *argv[];
{  /* lisp main */
X  PASCAL_MAIN(argc, argv);
X  if (setjmp(_JL99))
X    goto _L99;
X  initNames();
X
X  nilValue = mkSExp(NILSXP);
X  trueValue = mkSExp(SYMSXP);
X  trueValue->UU.symval = numNames;
X
X  globalEnv = emptyEnv();
X
X  quittingtime = false;
_L99:
X  while (!quittingtime) {
X    reader();
X    if (matches((long)pos_, 4, "quit                ")) {
X      quittingtime = true;
X      break;
X    }
X    if ((userinput[pos_ - 1] == '(') & matches(skipblanks(pos_ + 1L), 6,
X					       "define              ")) {
X      prName(parseDef());
X      putchar('\n');
X    } else {
X      currentExp = parseExp();
X      prValue(eval(currentExp, emptyEnv()));
X      printf("\n\n");
X    }
X  }  /* while */
X  exit(0);
}  /* lisp */
X
X
X
X
X
X
/* End. */
SHAR_EOF
  (set 19 90 01 05 18 00 44 'c-distr/lisp.c'; eval "$shar_touch") &&
  chmod 0644 'c-distr/lisp.c'
if test $? -ne 0
then ${echo} 'restore of c-distr/lisp.c failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/lisp.c: MD5 check failed'
       ) << SHAR_EOF
9047f620af303e878014152bdbc3483c  c-distr/lisp.c
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/lisp.c'` -ne 27320 && \
  ${echo} 'restoration warning:  size of c-distr/lisp.c is not 27320'
  fi
fi
# ============= c-distr/code2.pro ==============
if test -f 'c-distr/code2.pro' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code2.pro (file already exists)'
else
${echo} 'x - extracting c-distr/code2.pro (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/code2.pro' &&
; Section 8.4 - Note that two versions of transform are given.
; This file can only be run if one of these is commented out.
; Currently, the first, and less efficient, version is commented out.
(infer (member X (cons X L)))
(infer (member X (cons Y M)) from (member X M))
;
(infer (block a))
(infer (block b))
(infer (block c))
;
(infer (different a b))
(infer (different a c))
(infer (different b a))
(infer (different b c))
(infer (different c a))
(infer (different c b))
(infer (different X table) from (block X))
(infer (different table Y) from (block Y))
;
(infer (clear X nil))
(infer (clear X (cons (on B Y) State))
X      from (different X Y) (clear X State))
;
(infer (on X Y State) from (member (on X Y) State))
;
(infer (update (move X Y Z) (cons (on X Y) S) (cons (on X Z) S)))
(infer (update (move X Y Z) (cons (on U V) S1) (cons (on U V) S2))
X      from (different X U) (update (move X Y Z) S1 S2))
;
(infer (legal-move (move B P1 table) State)
X      from
X             (on B P1 State)
X             (different P1 table)
X             (clear B State))
(infer (legal-move (move B1 P B2) State)
X      from
X             (block B2)
X             (on B1 P State)
X             (different P B2)
X             (different B1 B2)
X             (clear B1 State)
X             (clear B2 State))
;
(infer (different (cons (on A X) State1) (cons (on A Y) State2))
X      from (different X Y))
(infer (different (cons (on A X) State1) (cons (on A X) State2))
X      from (different State1 State2))
;
(infer (not-member X nil))
(infer (not-member X (cons Y L))
X      from (different X Y) (not-member X L))
;
;(infer (transform State1 State2 Plan)
;      from (transform State1 State2 (cons State1 nil) Plan))
;;
;(infer (transform State State Visited nil))
;(infer (transform State1 State2 Visited (cons Move Moves))
;      from
;            (legal-move Move State1)
;             (update Move State1 State)
;             (not-member State Visited)
;             (transform State State2 (cons State Visited) Moves))
;;
;(infer (state1 (cons (on a b) (cons (on b table) (cons (on c a) nil)))))
;(infer (state2 (cons (on a b) (cons (on b c) (cons (on c table) nil)))))
;(infer? (state1 S1) (state2 S2) (transform S1 S2 Plan)
;              (print Plan))
;(infer? (print (cons (move c a table)
;   (cons (move a b table) (cons (move b table a)
;   (cons (move b a c) (cons (move a table b) nil)))))))
;
(infer (transform State1 State2 Plan)
X      from (transform State1 State2 (cons State1 nil) Plan))
;
(infer (transform State State Visited nil))
(infer (transform State1 State2 Visited (cons Move Moves))
X      from
X             (choose-move Move State1 State2)
X             (update Move State1 State)
X             (not-member State Visited)
X             (transform State State2 (cons State Visited) Moves))
;
(infer (choose-move Move State1 State2)
X      from (suggest Move State2) (legal-move Move State1))
(infer (choose-move Move State1 State2)
X      from (legal-move Move State1))
(infer (suggest (move X Y Z) State)
X      from (member (on X Z) State))
(infer (state1 (cons (on a b) (cons (on b table) (cons (on c a) nil)))))
(infer (state2 (cons (on a b) (cons (on b c) (cons (on c table) nil)))))
(infer? (state1 S1) (state2 S2) (transform S1 S2 Plan)
X              (print Plan))
(infer? (print (cons (move c a table) (cons (move a b table) (cons (move b table c)
X   (cons (move a table b) nil))))))
quit
SHAR_EOF
  (set 19 90 01 05 18 00 43 'c-distr/code2.pro'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code2.pro'
if test $? -ne 0
then ${echo} 'restore of c-distr/code2.pro failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code2.pro: MD5 check failed'
       ) << SHAR_EOF
451eaf746d08c783c961dfa177c5e851  c-distr/code2.pro
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code2.pro'` -ne 3400 && \
  ${echo} 'restoration warning:  size of c-distr/code2.pro is not 3400'
  fi
fi
# ============= c-distr/code1.pro ==============
if test -f 'c-distr/code1.pro' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code1.pro (file already exists)'
else
${echo} 'x - extracting c-distr/code1.pro (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/code1.pro' &&
; Section 8.1
(infer (different yellow blue))
(infer (different yellow red))
(infer (different blue yellow))
(infer (different blue red))
(infer (different red yellow))
(infer (different red blue))
;
(infer (mapb-coloring A B C D E F)
X     from (different A B) (different A C) (different A D) (different A F)
X       (different B C) (different B E) (different C E) (different C D)
X       (different D E) (different E F))
(infer?  (mapb-coloring A B C D E F))
(infer? (print))
(infer?  (mapb-coloring A B C D E F) (print A B C D E F))
(infer? (print yellow blue red blue yellow blue))
;
(infer (member X (cons X L)))
(infer (member X (cons Y M)) from (member X M))
(infer?  (member 3 (cons 2 (cons 3 nil))))
(infer? (print))
(infer?  (member 3 (cons 2 (cons 4 nil))))
(infer? fail)
; Section 8.2.2
(infer imokay from youreokay hesokay)
(infer youreokay from theyreokay)
(infer hesokay)
(infer theyreokay)
(infer?  imokay)
(infer? (print))
(infer hesnotokay from imnotokay)
(infer shesokay from hesnotokay)
(infer shesokay from theyreokay)
(infer?  shesokay)
(infer? (print))
(infer hesnotokay from shesokay)
(infer hesnotokay from imokay)
; section 8.2.3
(infer (addtoend nil X (cons X nil)))
(infer (addtoend (cons Y L) X (cons Y M)) from (addtoend L X M))
(infer?  (addtoend (cons 3 nil) 4 L) (print L))
(infer? (print (cons 3 (cons 4 nil))))
(infer?  (addtoend L 4 (cons 3 (cons 4 nil))) (print L))
(infer? (print (cons 3 nil)))
;
(infer (reverse nil nil))
(infer (reverse (cons X L) M) from (reverse L N) (addtoend N X M))
(infer?  (reverse (cons 1 (cons 2 nil)) L) (print L))
(infer? (print (cons 2 (cons 1 nil))))
(infer?  (reverse L (cons 1 (cons 2 nil))) (print L))
(infer? (print (cons 2 (cons 1 nil))))
;
(infer (append nil L L))
(infer (append (cons X L) M (cons X N)) from (append L M N))
(infer? (append nil (cons 3 nil) L) (print L))
(infer? (print (cons 3 nil)))
(infer? (append (cons 3 (cons 4 nil)) (cons 5 (cons 6 nil)) L)
X       (print L))
(infer? (print (cons 3 (cons 4 (cons 5 (cons 6 nil))))))
(infer? (append L (cons 6 (cons 7 nil)) (cons 5 (cons 6 (cons 7 nil))))
X       (print L))
(infer? (print (cons 5 nil)))
;
(infer (member X L) from (append L1 (cons X L2) L)).
(infer (lookup K A L) from (member (pair K A) L))
(infer (capitols (cons (pair chile santiago) (cons (pair peru lima) nil))))
(infer?  (capitols C) (lookup peru Capitol C) (print Capitol))
(infer? (print lima))
;
(infer (mult 0 Y 0))
(infer (mult X Y Z) from (minus X 1 V) (mult V Y W) (plus W Y Z))
(infer?  (mult 3 5 X) (print X))
(infer? (print 15))
(infer (mult X Y Z) from (minus X 1 V) (plus W Y Z) (mult V Y W)).
(infer (fac 0 1))
(infer (fac N R) from (minus N 1 N1) (fac N1 R1) (mult R1 N R))
(infer (naive-sort L M) from (permutation L M) (ordered M)).
(infer (<= X X))
(infer (<= X Y) from (less X Y))
;
(infer (ordered nil))
(infer (ordered (cons A nil)))
(infer (ordered (cons A (cons B L))) from (<= A B) (ordered (cons B L)))
;
(infer (permutation nil nil))
(infer (permutation L (cons H T))
X      from (append V (cons H U) L) (append V U W) (permutation W T))
;
(infer (naive-sort L M) from (permutation L M) (ordered M)).
(infer?  (naive-sort (cons 4 (cons 2 (cons 3 nil))) L) (print L))
(infer? (print (cons 2 (cons 3 (cons 4 nil)))))
;
(infer (partition H (cons A X) (cons A Y) Z) from (<= A H) (partition H X Y Z))
(infer (partition H (cons A X) Y (cons A Z)) from (less H A) (partition H X Y Z))
(infer (partition H nil nil nil))
;
(infer (quicksort nil nil))
(infer (quicksort (cons H T) S)
X      from
X      (partition H T A B)
X             (quicksort A A1)
X             (quicksort B B1)
X             (append A1 (cons H B1) S))
(infer?  (quicksort (cons 8 (cons 2 (cons 3 (cons 7 (cons 1 nil))))) S)
X              (print S))
(infer? (print (cons 1 (cons 2 (cons 3 (cons 7 (cons 8 nil)))))))
;
(infer (simplify (diff X X) nil))
(infer (simplify (diff (cons X Y) Z) (cons X W)) from (simplify (diff Y Z) W))
(infer?  (simplify (diff (cons 3 (cons 4 X)) X) L) (print L))
(infer? (print (cons 3 (cons 4 nil))))
(infer?  (simplify L (cons 3 (cons 4 nil))) (print L))
(infer? (print (diff (cons 3 (cons 4 Z1)) Z1)))
(infer (diffappend (diff L X) (diff X Y) (diff L Y))).
(infer?  (diffappend (diff (cons 3 X) X) (diff (cons 4 Y) Y) Z)
X        (print Z))
(infer? (print (diff (cons 3 (cons 4 Y)) Y)))
quit
SHAR_EOF
  (set 19 90 01 05 18 00 43 'c-distr/code1.pro'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code1.pro'
if test $? -ne 0
then ${echo} 'restore of c-distr/code1.pro failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code1.pro: MD5 check failed'
       ) << SHAR_EOF
91fd699e87f2c5145b05b864e642b69e  c-distr/code1.pro
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code1.pro'` -ne 4310 && \
  ${echo} 'restoration warning:  size of c-distr/code1.pro is not 4310'
  fi
fi
# ============= c-distr/code2.pro.out ==============
if test -f 'c-distr/code2.pro.out' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code2.pro.out (file already exists)'
else
${echo} 'x - extracting c-distr/code2.pro.out (binary)'
  sed 's/^X//' << 'SHAR_EOF' | uudecode &&
begin 600 c-distr/code2.pro.out
M+3X@+3X@+3X@+3X@"BT^(`HM/B`M/B`*+3X@"BT^(`HM/B`M/B`*+3X@"BT^
M(`HM/B`*+3X@"BT^(`HM/B`*+3X@"BT^("T^(`HM/B`^(`HM/B`M/B`*+3X@
M+3X@"BT^(#X@"BT^("T^(#X@/B`^(#X@"BT^(#X@/B`^(#X@/B`^(#X@"BT^
M("T^(#X@"BT^(#X@"BT^("T^(`HM/B`^(`HM/B`M/B`M/B`M/B`M/B`M/B`M
M/B`M/B`M/B`M/B`M/B`M/B`M/B`M/B`M/B`M/B`M/B`M/B`M/B`M/B`M/B`^
M(`HM/B`M/B`*+3X@/B`^(#X@/B`^(`HM/B`M/B`^(`HM/B`^(`HM/B`^(`HM
M/B`*+3X@"BT^(#X@"BAC;VYS("AM;W9E(&,@82!T86)L92D@*&-O;G,@*&UO
M=F4@82!B('1A8FQE*2`H8V]N<R`H;6]V92!B('1A8FQE(&,I("AC;VYS("AM
M;W9E(&$@=&%B;&4@8BD@;FEL*2DI*0I3871I<V9I960*"BT^(#X@"BAC;VYS
M("AM;W9E(&,@82!T86)L92D@*&-O;G,@*&UO=F4@82!B('1A8FQE*2`H8V]N
M<R`H;6]V92!B('1A8FQE(&,I("AC;VYS("AM;W9E(&$@=&%B;&4@8BD@;FEL
3*2DI*0I3871I<V9I960*"BT^("AC
`
end
SHAR_EOF
  (set 19 90 01 05 18 00 43 'c-distr/code2.pro.out'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code2.pro.out'
if test $? -ne 0
then ${echo} 'restore of c-distr/code2.pro.out failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code2.pro.out: MD5 check failed'
       ) << SHAR_EOF
cc8d33c1f5ac7fdcff17eb5af18a3257  c-distr/code2.pro.out
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code2.pro.out'` -ne 514 && \
  ${echo} 'restoration warning:  size of c-distr/code2.pro.out is not 514'
  fi
fi
# ============= c-distr/code.ssl ==============
if test -f 'c-distr/code.ssl' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code.ssl (file already exists)'
else
${echo} 'x - extracting c-distr/code.ssl (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/code.ssl' &&
; From previous chapters (esp. Scheme and Lisp)
(set +1 (lambda (x) (+ x 1)))
(set mapcar (lambda (f l)
X     (if (null? l) '()
X      (cons (f (car l)) (mapcar f (cdr l)))))))
(set sqr (lambda (x) (* x x)))
(set cadr (lambda (x) (car (cdr x))))
(set cddr (lambda (x) (cdr (cdr x))))
(set cadddr (lambda (x) (car (cdr (cdr (cdr x))))))
(set abs (lambda (x) (if (< x 0) (- 0 x) x)))
(set mod (lambda (m n) (- m (* n (/ m n)))))
(set divides (lambda (m n) (= (mod n m) 0)))
(set length (lambda (l) (if (null? l) 0 (+1 (length (cdr l))))))
(set append (lambda (x y)
X   (if (null? x) y
X      (cons (car x) (append (cdr x) y)))))
(set list1 (lambda (x) (cons x '())))
(set list2 (lambda (x y) (cons x (cons y '()))))
(set not (lambda (x) (if x '() 'T)))
(set or (lambda (x y) (if x x y)))
(set and (lambda (x y) (if x y x)))
(set cadr (lambda (x) (car (cdr x))))
(set caddr (lambda (x) (car (cdr (cdr x)))))
(set curry (lambda (f) (lambda (x) (lambda (y) (f x y)))))
(set id (lambda (x) x))
(set compose (lambda (f g) (lambda (x) (g (f x)))))
(set member? (lambda (x l)
X   (if (null? l) '()
X     (if (= x (car l)) 'T
X        (member? x (cdr l))))))
(set union (lambda (s1 s2)
X     (if (null? s1) s2
X         (if (member? (car s1) s2)
X                (union (cdr s1) s2)
X             (cons (car s1) (union (cdr s1) s2))))))
(set empty-queue '())
(set front (lambda (q) (car q)))
(set rm-front (lambda (q) (cdr q)))
(set enqueue (lambda (t q)
X   (if (null? q) (list1 t) (cons (car q) (enqueue t (cdr q))))))
(set empty? (lambda (q) (null? q)))
; Section 5.0
(set pred (lambda (x) (> x 5)))
(set fun-srch-for (lambda (n)
X     (find-val pred (interval 1 n) (+1 n))))
(set find-val (lambda (pred lis failure-value)
X     (if (null? lis) failure-value
X         (if (pred (car lis)) (car lis)
X             (find-val pred (cdr lis) failure-value)))))
(set interval (lambda (i j)
X   (if (> i j) '() (cons i (interval (+1 i) j)))))
(fun-srch-for 10)
6
(set fun-srch-for-sqr (lambda (n)
X     (find-val pred (mapcar sqr (interval 1 n)) (sqr (+1 n)))))
(fun-srch-for-sqr 10)
9
; Section 5.1
(set fun-srch-while (lambda () (find-val pred (ints-from 1) '())))
(set ints-from (lambda (i) (cons i (ints-from (+1 i)))))
(fun-srch-while)
6
; Section 5.2.3
(set x (mapcar +1 '(2 3)))
'(... ...)
(car x)
3
(cadr x)
4
x
'(3 4 ...)
(cddr x)
'()
x
'(3 4)
(set ints-from (lambda (i)
X        (cons i (ints-from (+1 i)))))
(set ints (ints-from 0))
'(... ...)
(car ints)
0
(cadr ints)
1
ints
'(0 1 ...)
(set force (lambda (x)
X   (if (list? x)  ; apply list? to every component
X     (if (force (car x)) (force (cdr x)) '())
X     'T)))
(set x (mapcar +1 '(2 3)))
'(... ...)
(force x)
'T
x
'(3 4)
(set first-n (lambda (n l)
X   (if (null? l) '()
X     (if (= n 0) '()
X       (cons (car l) (first-n (- n 1) (cdr l)))))))
(set ints5 (first-n 5 ints))
'(... ...)
(force ints5)
'T
ints5
'(0 1 2 3 4)
(set next (lambda (n xi) (/ (+ xi (/ n xi)) 2)))
(set xlist (lambda (xi n) (cons xi (xlist (next n xi) n))))
(set mk-xlist (lambda (n) (xlist 1 n)))
(set abs-conv (lambda (epsilon)
X   (lambda (l) (< (abs (- (cadr l) (car l))) epsilon))))
(set abs-sqrt (lambda (n)
X   (find-list (abs-conv 3) cadr (mk-xlist n))))
(set find-list (lambda (pred extract l)
X   (if (null? l) '() (if (pred l) (extract l)
X     (find-list pred extract (cdr l))))))
(abs-sqrt 100)
10
(set next (lambda (n xi) (/ (+ xi (/ n (* xi xi))) 2)))
(set abs-cbrt (lambda (n)
X     (find-list (abs-conv 2) cadr (mk-xlist n))))
(abs-cbrt 100)
5
(set remove-multiples (lambda (n l)
X   (if (null? l) '()
X     (if (divides n (car l))
X        (remove-multiples n (cdr l))
X        (cons (car l) (remove-multiples n (cdr l)))))))
(set sieve (lambda (l) (if (null? l) '()
X        (cons (car l)
X              (sieve (remove-multiples (car l) (cdr l)))))))
(set primes<= (lambda (n) (sieve (interval 2 n))))
(set primes (sieve (ints-from 2)))
(set first-n-primes (lambda (n) (first-n n primes)))
(set p (first-n-primes 5))
(force p)
p
;
(set next-int +1)
(set repeat-until (lambda (init next pred)
X   (if (pred init) init
X     (repeat-until (next init) next pred))))
(set new-fun-srch-while (lambda ()
X   (repeat-until 1 next-int pred)))
(set pred (lambda (x) (> x 5)))
(new-fun-srch-while)
6
;
(set find-atom (lambda (s) (find-val pred (flatten s) '())))
(set flatten (lambda (x)
X     (if (null? x) '()
X          (if (atom? x) (list1 x)
X              (append (flatten (car x)) (flatten (cdr x)))))))
(set samefringe (lambda (x y) (equal (flatten x) (flatten y))))
(set find-perm (lambda (l)
X    (find-val pred (permutations l) '())))
(set append* (lambda (l)
X    (if (null? l) '() (append (car l) (append* (cdr l))))))
(set filter (lambda (pred l)
X    (if (null? l) '()
X     (if (pred (car l)) (cons (car l) (filter pred (cdr l)))
X       (filter pred (cdr l))))))
(set remove (lambda (item l)
X     (filter (lambda (x) (not (= x item))) l)))
(set permutations (lambda (l)
X  (if (= (length l) 1) (list1 l)
X     (append* (mapcar (lambda (x) (mapcar (lambda (z) (cons x z))
X                                  (permutations (remove x l)))) l)))))
(set p (permutations '(a b c)))
(force p)
'(Permutations of a b c)
p
(set pred (lambda (perm) (= (car perm) 2)))
(set p (find-perm '(1 2 3 4)))
(force p)
p
'(2 1 3 4)
;
(set ints (cons 0 (mapcar +1 ints)))
(set powersof2 (cons 1 (mapcar double powersof2)))
(set mapcar2 (lambda (f l1 l2)
X        (cons (f (car l1) (car l2))
X                (mapcar2 f (cdr l1) (cdr l2)))))
(set posints (cdr ints))
(set X (cons x0 (mapcar2 f X posints)))
(set facs (cons 1 (mapcar2 * facs posints)))
(cadddr facs)
6
; Section 5.4
(set evalBoolexp (lambda (e a)
X     (if (symbol? e) (isTrue? e a)
X       (if (= (car e) 'not)
X               (not (evalBoolexp (cadr e) a))
X          (if (= (car e) 'or)
X                (or (evalBoolexp (cadr e) a)
X                      (evalBoolexp (caddr e) a))
X              (and (evalBoolexp (cadr e) a)
X                      (evalBoolexp (caddr e) a)))))))
(set mapaddx (lambda (x l) ; add x to each list in l, then append to l
X     (append l (mapcar (lambda (y) (cons x y)) l))))
(set gensubsets (lambda (l) ; create a list containing all sub-sets of l
X     (if (null? (cdr l)) (list2 l '())
X         (mapaddx (car l) (gensubsets (cdr l))))))
(set variables (lambda (e) ; All variables occurring in e
X     (if (symbol? e) (cons e '())
X          (if (= (car e) 'not) (variables (cadr e))
X               (union (variables (cadr e)) (variables (caddr e)))))))
(set assignments (lambda (e) (gensubsets (variables e))))
(set isTrue? member?)
(set findTruth (lambda (e alist)
X     ; Find if any assignment on alist satisfies e
X     (if (null? alist) '() ; No assignments left to try
X          (if (evalBoolexp e (car alist)) 'T
X               (findTruth e (cdr alist))))))
(set SAT (lambda (e)
X     (if (findTruth e (assignments e))
X          'Satisfiable
X          'Unsatisfiable)))
(SAT '(not (or p (and (or (not p) q) (or (not p) (not q))))))
; Section 5.5
(set add-points (lambda (p q)
X    (list2 (+ (car p) (car q)) (+ (cadr p) (cadr q)))))
(set gen-paths (lambda (p points)
X    (cons p
X     (mapcar (lambda (r) (gen-paths r points))
X                   (mapcar (lambda (q) (add-points q p)) points)))))
(set P '((2 2)(0 1)(3 0)))
'((2 2)(0 1)(3 0))
(set PATHS (gen-paths '(0 0) P))
(set == (lambda (p q) (and (= (car p) (car q)) (= (cadr p) (cadr q)))))
(set << (lambda (p q) (or (< (car p) (car q)) (< (cadr p) (cadr q)))))
(set dfs (lambda (t pred term)
X     (if (pred (car t)) 'T  ; success
X          (if (term (car t)) '()  ; failure on this branch
X               (dfs* (cdr t) pred term)))))
(set dfs* (lambda (l pred term)
X     (if (null? l) '() ; failure
X          (if (dfs (car l) pred term) 'T
X               (dfs* (cdr l) pred term)))))
(set reaches-dfs (lambda (p0 paths)
X     (dfs paths
X            (lambda (q) (== p0 q))
X            (lambda (q) (<< p0 q)))))
;
(set enqueue* (lambda (q items)
X     (if (null? items) q (enqueue* (enqueue (car items) q) (cdr items)))))
;
(set bfs (lambda (t pred term)
X     (bfs-queue (enqueue t empty-queue) pred term)))
(set bfs-queue (lambda (q pred term)
X     (if (empty? q) '()
X       (if (pred (car (front q))) 'T
X        (if (term (car (front q))) (bfs-queue (rm-front q) pred term)
X         (bfs-queue (enqueue* (rm-front q) (cdr (front q)))
X                    pred term))))))
(set reaches-bfs (lambda (p0 paths)
X     (bfs paths
X            (lambda (q) (== p0 q))
X            (lambda (q) (<< p0 q)))))
(reaches-dfs '(4 6) PATHS)
'T
(reaches-bfs '(4 3) PATHS)
'()
; Section 5.7
;; The following is SCHEME code!!
;(set find-val (lambda (pred str failure-value)
;   (if (empty-stream? str) failure-value
;     (if (pred (head str)) (head str)
;       (find-val pred (tail str) failure-value)))))
;(set if2 (lambda (pred x y) (if (pred x) x y)))
;(set find-val (lambda (pred str failure-value)
;   (if (empty-stream? str) failure-value
;     (if2 pred (head str)
;       (find-val pred (tail str) failure-value)))))
;(set ones (cons 1 (lambda () ones)))
;(1 <closure>)
;(car ((cdr ones)))
;1
;(set flatten (lambda (l)
;     (if (null? l) '()
;         (if (atom? l) (list2 l (lambda () '()))
;             (append-str (flatten (car l))
;                         (lambda () (flatten (cdr l))))))))
;(set append-str (lambda (s1 s2)
;     (if (null? s1) (s2)
;          (list2 (car s1) (lambda () (append-str ((cadr s1)) s2))))))
;(set find-str (lambda (pred s)
;     (if (null? s) '()
;          (if (pred (car s)) (car s)
;               (find-str pred ((cadr s)))))))
;(set find-atom (lambda (pred l)
;      (find-str pred (flatten l))))
; Back to SASL
; Section 5.8
(set TRUE (lambda (t f) t))
(set FALSE (lambda (t f) f))
(set IF (lambda (c t f) (c t f)))
(IF TRUE 'a 'b)
'a
(set EQ (lambda (x y) (if (= x y) TRUE FALSE)))
(set fac (lambda (x) (IF (EQ x 0) 1 (* x (fac (- x 1))))))
(fac 4)
24
(set AND (lambda (x y) (IF x y x)))
(set CONS (lambda (a d) (lambda (f) (f a d FALSE))))
(set NIL (lambda (f) (f NIL NIL TRUE)))
(set CAR (lambda (l) (l (lambda (car cdr null?) car))))
(set CDR (lambda (l) (l (lambda (car cdr null?) cdr))))
(set NULL? (lambda (l) (l (lambda (car cdr null?) null?))))
(set CADR (lambda (x) (CAR (CDR x))))
(CADR (CONS 'abc (CONS 3 NIL)))
3
(set l1 (CONS 4 (CONS 5 (CONS 6 NIL))))
(set +/ (lambda (l)
X       (IF (NULL? l) 0 (+ (CAR l) (+/ (CDR l))))))
(+/ l1)
15
(set ZERO (lambda (f) (lambda (x) x)))
(set ONE (lambda (f) (lambda (x) (f x))))
(set TWO (lambda (f) (lambda (x) (f (f x)))))
(set print-int (lambda (n) ((n +1) 0)))
(print-int TWO)
2
(set +ONE (lambda (n) (lambda (g) (compose g (n g)))))
(set PLUS (lambda (m n) (lambda (g) (compose (m g) (n g)))))
(set THREE (PLUS ONE TWO))
(print-int THREE)
3
(set MULT (lambda (m n) (compose m n)))
(set SIX (MULT THREE TWO))
(print-int SIX)
6
(set LIST2 (lambda (x y) (CONS x (CONS y NIL))))
(set STEP (lambda (m-a) (LIST2 (CADR m-a) (+ONE (CADR m-a))))),
(set -ONE (lambda (n) (CAR ((n STEP) (LIST2 ZERO ZERO)))))
(set SUB (lambda (m n) ((n -ONE) m)))
(set FOUR (SUB SIX TWO))
(print-int FOUR)
4
(set GT (lambda (m n) (NOT (=ZERO? (SUB m n)))))
(set GE (lambda (m n) (=ZERO? (SUB n m))))
(set EQUAL (lambda (m n)
X   (AND (=ZERO? (SUB m n)) (=ZERO? (SUB n m)))))
(set uncurry (lambda (f) (lambda (x y) ((f x) y))))
(set F (curry FALSE))
(set =ZERO? (lambda (n)
X     (uncurry (lambda (y) ((n F) (lambda (x) y))))))
(IF (=ZERO? ZERO) 'yes 'no)
'yes
(IF (=ZERO? FOUR) 'yes 'no)
'no
(set fac (lambda (n)
X     (IF (EQUAL n ZERO) ONE (MULT n (fac (SUB n ONE))))))
(print-int (fac FOUR))
24
(set FAC-STEP (lambda (x-y)
X     (LIST2 (-ONE (CAR x-y)) (MULT (CAR x-y) (CADR x-y)))))
(set FAC (lambda (n) (CADR ((n FAC-STEP) (LIST2 n ONE)))))
(print-int (FAC FOUR))
24
(set W (lambda (F) (lambda (f) (F (f f)))))
(set Y (lambda (F) ((W F) (W F))))
(set ONES (Y (lambda (ones) (CONS ONE ones))))
(print-int (CAR (CDR (CDR ONES))))
1
(set FAC (Y (lambda (fac)
X     (lambda (n)
X          (IF (EQUAL n ZERO) ONE (MULT n (fac (SUB n ONE))))))))
(print-int (FAC FOUR))
24
quit
SHAR_EOF
  (set 19 90 01 05 18 00 42 'c-distr/code.ssl'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code.ssl'
if test $? -ne 0
then ${echo} 'restore of c-distr/code.ssl failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code.ssl: MD5 check failed'
       ) << SHAR_EOF
5b84a62a74efbe9a0ee391e3abacc294  c-distr/code.ssl
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code.ssl'` -ne 11957 && \
  ${echo} 'restoration warning:  size of c-distr/code.ssl is not 11957'
  fi
fi
# ============= c-distr/code1.pro.out ==============
if test -f 'c-distr/code1.pro.out' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code1.pro.out (file already exists)'
else
${echo} 'x - extracting c-distr/code1.pro.out (binary)'
  sed 's/^X//' << 'SHAR_EOF' | uudecode &&
begin 600 c-distr/code1.pro.out
M+3X@+3X@"BT^(`HM/B`*+3X@"BT^(`HM/B`*+3X@+3X@/B`^(#X@"BT^(`I3
M871I<V9I960*"BT^(`H*4V%T:7-F:65D"@HM/B`*>65L;&]W(&)L=64@<F5D
M(&)L=64@>65L;&]W(&)L=64*4V%T:7-F:65D"@HM/B`*>65L;&]W(&)L=64@
M<F5D(&)L=64@>65L;&]W(&)L=64*4V%T:7-F:65D"@HM/B`M/B`*+3X@"BT^
M(`I3871I<V9I960*"BT^(`H*4V%T:7-F:65D"@HM/B`*3F]T('-A=&ES9FEE
M9`H*+3X@"DYO="!S871I<V9I960*"BT^("T^(`HM/B`*+3X@"BT^(`HM/B`*
M4V%T:7-F:65D"@HM/B`*"E-A=&ES9FEE9`H*+3X@"BT^(`HM/B`*+3X@"E-A
M=&ES9FEE9`H*+3X@"@I3871I<V9I960*"BT^(`HM/B`*+3X@+3X@"BT^(`HM
M/B`**&-O;G,@,R`H8V]N<R`T(&YI;"DI"E-A=&ES9FEE9`H*+3X@"BAC;VYS
M(#,@*&-O;G,@-"!N:6PI*0I3871I<V9I960*"BT^(`HH8V]N<R`S(&YI;"D*
M4V%T:7-F:65D"@HM/B`**&-O;G,@,R!N:6PI"E-A=&ES9FEE9`H*+3X@+3X@
M"BT^(`HM/B`**&-O;G,@,B`H8V]N<R`Q(&YI;"DI"E-A=&ES9FEE9`H*+3X@
M"BAC;VYS(#(@*&-O;G,@,2!N:6PI*0I3871I<V9I960*"BT^(`HH8V]N<R`R
M("AC;VYS(#$@;FEL*2D*4V%T:7-F:65D"@HM/B`**&-O;G,@,B`H8V]N<R`Q
M(&YI;"DI"E-A=&ES9FEE9`H*+3X@+3X@"BT^(`HM/B`**&-O;G,@,R!N:6PI
M"E-A=&ES9FEE9`H*+3X@"BAC;VYS(#,@;FEL*0I3871I<V9I960*"BT^(#X@
M"BAC;VYS(#,@*&-O;G,@-"`H8V]N<R`U("AC;VYS(#8@;FEL*2DI*0I3871I
M<V9I960*"BT^(`HH8V]N<R`S("AC;VYS(#0@*&-O;G,@-2`H8V]N<R`V(&YI
M;"DI*2D*4V%T:7-F:65D"@HM/B`^(`HH8V]N<R`U(&YI;"D*4V%T:7-F:65D
M"@HM/B`**&-O;G,@-2!N:6PI"E-A=&ES9FEE9`H*+3X@+3X@"BT^(`HM/B`*
M+3X@"FQI;6$*4V%T:7-F:65D"@HM/B`*;&EM80I3871I<V9I960*"BT^("T^
M(`HM/B`*+3X@"C$U"E-A=&ES9FEE9`H*+3X@"C$U"E-A=&ES9FEE9`H*+3X@
M"BT^(`HM/B`*+3X@"BT^(`HM/B`*+3X@+3X@"BT^(`HM/B`*+3X@+3X@"BT^
M(#X@"BT^("T^(`HM/B`**&-O;G,@,B`H8V]N<R`S("AC;VYS(#0@;FEL*2DI
M"E-A=&ES9FEE9`H*+3X@"BAC;VYS(#(@*&-O;G,@,R`H8V]N<R`T(&YI;"DI
M*0I3871I<V9I960*"BT^("T^(`HM/B`*+3X@"BT^("T^(`HM/B`^(#X@/B`^
M(#X@"BT^(#X@"BAC;VYS(#$@*&-O;G,@,B`H8V]N<R`S("AC;VYS(#<@*&-O
M;G,@."!N:6PI*2DI*0I3871I<V9I960*"BT^(`HH8V]N<R`Q("AC;VYS(#(@
M*&-O;G,@,R`H8V]N<R`W("AC;VYS(#@@;FEL*2DI*2D*4V%T:7-F:65D"@HM
M/B`M/B`*+3X@"BT^(`HH8V]N<R`S("AC;VYS(#0@;FEL*2D*4V%T:7-F:65D
M"@HM/B`**&-O;G,@,R`H8V]N<R`T(&YI;"DI"E-A=&ES9FEE9`H*+3X@"BAD
M:69F("AC;VYS(#,@*&-O;G,@-"!:,2DI(%HQ*0I3871I<V9I960*"BT^(`HH
M9&EF9B`H8V]N<R`S("AC;VYS(#0@6C$I*2!:,2D*4V%T:7-F:65D"@HM/B`*
M+3X@/B`**&1I9F8@*&-O;G,@,R`H8V]N<R`T(%DI*2!9*0I3871I<V9I960*
M"BT^(`HH9&EF9B`H8V]N<R`S("AC;VYS(#0@62DI(%DI"E-A=&ES9FEE9`H*
#+3X@
`
end
SHAR_EOF
  (set 19 90 01 05 18 00 43 'c-distr/code1.pro.out'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code1.pro.out'
if test $? -ne 0
then ${echo} 'restore of c-distr/code1.pro.out failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code1.pro.out: MD5 check failed'
       ) << SHAR_EOF
ac2e3472956ebdabd11ade31f1d65701  c-distr/code1.pro.out
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code1.pro.out'` -ne 1578 && \
  ${echo} 'restoration warning:  size of c-distr/code1.pro.out is not 1578'
  fi
fi
# ============= c-distr/code.smt ==============
if test -f 'c-distr/code.smt' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code.smt (file already exists)'
else
${echo} 'x - extracting c-distr/code.smt (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/code.smt' &&
; Code from previous chapters
(define +1 (x) (+ x 1))
(define or (x y) (if x x y))
(define and (x y) (if x y x))
(define not (x) (if x false true))
(define <> (x y) (not (= x y)))
(define <= (x y) (or (< x y) (= x y)))
(define divides (n x) (= (* n (/ x n)) x))
(define mod (n m) (- n (* m (/ n m))))
(define gcd (i j)
X   (if (> i j) (gcd j i)
X     (if (divides i j) i (gcd (mod j i) i))))
(define abs (x) (if (< x 0) (- 0 x) x))
; Section 7.1.1
(class FinancialHistory Object
X    (cashOnHand incomes expenditures)
X    (define initFinancialHistory (amount)
X         (begin
X              (set cashOnHand amount)
X              (set incomes (mkDictionary))
X              (set expenditures (mkDictionary))
X              self))
X    (define receive:from: (amount source)
X         (begin
X            (at:put: incomes source (+ (totalReceivedFrom: self source) amount))
X            (set cashOnHand (+ cashOnHand amount))))
X    (define spend:for: (amount reason)
X         (begin
X           (at:put: expenditures reason (+ (totalSpentFor: self reason) amount))
X           (set cashOnHand (- cashOnHand amount))))
X    (define cashOnHand () cashOnHand)
X    (define totalReceivedFrom: (source)
X         (if (includesKey: incomes source)
X              (at: incomes source)
X              0))
X    (define totalSpentFor: (reason)
X         (if (includesKey: expenditures reason)
X              (at: expenditures reason)
X              0))
)
(define mkFinancialHistory (amount)
X     (initFinancialHistory (new FinancialHistory) amount))
; Test cases for FinancialHistory moved to after Collection hierarchy
(class DeductibleHistory FinancialHistory
X    (deductible)
X    (define initDeductibleHistory (amount)
X         (begin
X              (initFinancialHistory self amount)
X              (set deductible 0)
X              self))
X    (define spend:Deduct: (amount reason)
X         (begin
X              (spend:for: self amount reason)
X              (set deductible (+ deductible amount))))
X    (define spend:for:deduct: (amount reason deduction)
X         (begin
X              (spend:for: self amount reason)
X              (set deductible (+ deductible deduction))))
X    (define totalDeductions () deductible))
(define mkDeductibleHistory (amount)
X     (initDeductibleHistory (new DeductibleHistory) amount))
; Test cases for DeductibleHistory moved to after Collection hierarchy
; Section 7.1.5
(set false 0)
(set true 1)
(define isNil (x) (= x #nil))
(define notNil (x) (<> x #nil))
(class Collection Object
X    ()  ; abstract class
X    (define first () #subclassResponsibility)
X    (define next () #subclassResponsibility)
X    (define add: (item) #subclassResponsibility)
X    (define size ()
X         (begin
X              (set tempitem (first self))
X              (set tempsize 0)
X              (while (notNil tempitem)
X                   (begin
X                        (set tempsize (+1 tempsize))
X                        (set tempitem (next self))))
X              tempsize))
X    (define isEmpty () (isNil (first self)))
X    (define includes: (item)
X         (begin
X              (set tempitem (first self))
X              (set found false)
X              (while (and (notNil tempitem) (not found))
X                   (if (= tempitem item)
X                        (set found true)
X                        (set tempitem (next self))))
X              found))
)
(class Set Collection
X    (members)  ; list of elements
X    (define initSet () (begin (set members (mkList)) self))
X    (define first () (first members))
X    (define next () (next members))
X    (define add: (item)
X         (if (includes: members item) self (add: members item)))
)
(define mkSet () (initSet (new Set)))
;
(class KeyedCollection Collection
X    ()  ; abstract class
X    (define at:put: (key value) #subclassResponsibility)
X    (define currentKey () #subclassResponsibility)
X    (define at: (key)
X         (begin
X              (set tempvalue (first self))
X              (set found false)
X              (while (and (notNil tempvalue) (not found))
X                   (if (= key (currentKey self))
X                        (set found true)
X                        (set tempvalue (next self))))
X              tempvalue))  ; note: nil if key out of range
X    (define includesKey: (key)
X         (notNil (at: self key)))
X    (define indexOf: (value)
X         (begin
X              (set tempvalue (first self))
X              (set found false)
X              (while (and (notNil tempvalue) (not found))
X                   (if (= value tempvalue)
X                        (set found true)
X                        (set tempvalue (next self))))
X              (if (isNil tempvalue) #nil (currentKey self))))
)
;
(class Association Object 
X   (fst snd)
X     (define initAssociation (x y) (begin (set fst x) (set snd y) self))
X     (define fst () fst)
X     (define snd () snd)
X     (define fst:  (x) (set fst x))
X     (define snd:  (y) (set snd y))
)
;
(define mkAssociation (a b) (initAssociation (new Association) a b))
(class Dictionary KeyedCollection
X    (table currentKey)
X    (define initDictionary ()
X         (begin (set table (mkList)) self))
X    (define currentKey () currentKey)
X    (define first ()
X         (if (isEmpty table) #nil
X              (begin
X                   (set tempassoc (first table))
X                   (set currentKey (fst tempassoc))
X                   (snd tempassoc))))
X    (define next ()
X         (begin
X              (set tempassoc (next table))
X              (if (isNil tempassoc) #nil
X                   (begin
X                        (set currentKey (fst tempassoc))
X                        (snd tempassoc)))))
X    (define at:put: (key value)
X         (begin
X              (set tempassoc (associationAt: self key))
X              (if (isNil tempassoc)
X                   (add: table (mkAssociation key value))
X                   (snd: tempassoc value))))
X    (define associationAt: (key)
X         (begin
X              (set temptable table)
X              (set found false)
X              (while (not (or (isEmpty temptable) found))
X                   (if (= (fst (car temptable)) key)
X                       (set found true)
X                       (set temptable (cdr temptable))))
X              (if found (car temptable) #nil)))
)
(define mkDictionary () (initDictionary (new Dictionary)))
;
(class SequenceableCollection KeyedCollection
X    () ; abstract class
X    (define firstKey () #subclassResponsibility)
X    (define lastKey () #subclassResponsibility)
X    (define last () (at:  self (lastKey self)))
X   (define at: (index)
X         (begin
X               (set iterations (- index (firstKey self)))
X               (set result (first self))
X               (while (> iterations 0)
X                     (begin
X                           (set result (next self))
X                           (set iterations (- iterations 1))))
X               result))
)
(class List SequenceableCollection
X    (car cdr currentKey currentCell)
X    (define car () car)
X    (define cdr () cdr)
X    (define initList ()
X         (begin (set car #nil) self))
X    (define add: (item)
X         (begin
X              (set temp (new List))
X              (car: temp car)
X              (cdr: temp cdr)
X              (set cdr temp)
X              (set car item)))
X    (define car: (x) (set car x))
X    (define cdr: (x) (set cdr x))
X    (define first ()
X         (begin
X              (set currentKey 1)
X              (set currentCell self)
X              car))
X    (define next ()
X         (if (isNil (car currentCell)) #nil
X              (begin
X                   (set currentKey (+1 currentKey))
X                   (set currentCell (cdr currentCell))
X                   (car currentCell))))
X    (define firstKey () 1)
X    (define lastKey () (size self))
X    (define currentKey () currentKey)
X    (define at:put: (n value)
X         (if (= n 1) (set car value)
X             (at:put: cdr (- n 1) value)))
X    (define removeFirst ()
X         (if (isEmpty self) self ; do nothing
X              (begin
X                    (set car (car cdr))
X                    (set cdr (cdr cdr)))))
X    (define zerolist (size)
X            (while (> size 0)
X                 (begin
X                      (add: self 0)
X                      (set size (- size 1)))))
)
(define mkList () (initList (new List)))
;
(class Array SequenceableCollection
X    (elements lobound hibound currentKey)
X    (define initArray (lo size)
X         (begin
X              (set lobound lo)
X              (set hibound (- (+ lo size) 1))
X              (set elements (new List))
X              (zerolist elements size)
X              self))
X    (define size () (+1 (- hibound lobound)))
X    (define firstKey () lobound)
X    (define lastKey () hibound)
X    (define currentKey () currentKey)
X    (define first ()
X         (begin
X              (set currentKey lobound)
X              (first elements)))
X    (define next ()
X         (if (= currentKey hibound) #nil
X              (begin
X                   (set currentKey (+1 currentKey))
X                (next elements))))
X    (define at:put: (n value)
X         (if (> n hibound) #nil
X             (if (< n lobound) #nil
X                  (at:put: elements (+1 (- n lobound)) value))))
)
(define mkArray (l s) (initArray (new Array) l s))
; Test cases for FinancialHistory and DeductibleHistory
(set myaccount (mkFinancialHistory 1000))
(spend:for: myaccount 50 #insurance)
(receive:from: myaccount 200 #salary)
(cashOnHand myaccount)
1150
(spend:for: myaccount 100 #books)
(cashOnHand myaccount)
1050
(set myaccount (mkDeductibleHistory 1000))
(spend:for: myaccount 50 #insurance)
(receive:from: myaccount 200 #salary)
(cashOnHand myaccount)
1150
(totalDeductions myaccount)
0
(spend:Deduct: myaccount 100 #mortgage)
(cashOnHand myaccount)
1050
(totalDeductions myaccount)
100
(spend:for:deduct: myaccount 100 #3-martini-lunch 50)
(cashOnHand myaccount)
950
(totalDeductions myaccount)
150
; Section 7.3
(class Number Object
X    ()  ; abstract class
X    (define + (x) #subclassResponsibility)
X    (define negate () #subclassResponsibility)
X    (define * (x) #subclassResponsibility)
X    (define recip () #subclassResponsibility)
X    (define = (x) #subclassResponsibility)
X    (define < (x) #subclassResponsibility)
X    (define zero () #subclassResponsibility)
X    (define one () #subclassResponsibility)
X    (define print () #subclassResponsibility)
X    (define - (y) (+ self (negate y)))
X    (define / (y) (* self (recip y)))
X    (define > (y) (< y self))
X    (define +1 () (+ self (one self)))
X    (define sub1 () (- self (one self)))
X    (define isZero () (= self (zero self)))
X    (define isNegative () (< self (zero self)))
X    (define abs () (if (isNegative self) (negate self) self))
X    (define sqr () (* self self))
X    (define sqrt (epsilon) ; find square root of receiver within epsilon
X         (begin
X              (set this-step (+1 (zero self)))
X              (set two (+1 this-step))
X              (set next-step (/ (+ this-step (/ self this-step)) two))
X              (while (> (abs (- this-step next-step)) epsilon)
X                   (begin
X                        (set this-step next-step)
X                        (set next-step (/
X                            (+ this-step (/ self this-step)) two))))
X              next-step))
)
(class Fraction Number
X    (x y)
X    (define initFraction (a b)
X         (begin
X               (setFraction self a b)
X               (sign-reduce self)
X               (div-reduce self)))
X    (define setFraction (a b) (begin (set x a) (set y b) self))
X    (define x () x)
X    (define y () y)
X    (define + (f)
X         (div-reduce
X            (setFraction (new Fraction)
X                            (+ (* x (y f)) (* (x f) y))
X                            (* y (y f)))))
X    (define negate () (setFraction (new Fraction) (- 0 x) y))
X    (define * (f)
X         (div-reduce
X              (setFraction (new Fraction)
X                            (* x (x f))
X                            (* y (y f)))))
X    (define recip ()
X     (sign-reduce (setFraction (new Fraction) y x)))
X    (define = (f)
X     (and (= x (x f)) (= y (y f))))
X    (define < (f)
X     (< (* x (y f)) (* (x f) y)))
X    (define zero () (setFraction (new Fraction) 0 1))
X    (define one () (setFraction (new Fraction) 1 1))
X    (define print () (begin (print x) (print y)))
X    ; div-reduce and sign-reduce should not be exported
X    (define div-reduce ()
X         (begin
X              (if (= x 0)
X                   (set y 1)
X                   (begin
X                         (set temp (gcd (abs x) y))
X                         (set x (/ x temp))
X                         (set y (/ y temp))))
X              self))
X    (define sign-reduce ()
X         (begin
X              (if (< y 0)
X                   (begin (set x (- 0 x))(set y (- 0 y)))
X                   0)
X              self))
)
(define mkFraction (a b) (initFraction (new Fraction) a b))
(set eps (mkFraction 1 2))
(set f1 (mkFraction 17 1))
(set f2 (sqrt f1 eps))
(print f2)
X 3437249
X 833049
;
(class Float Number
X    (mant exp)
X    (define initFloat (m e)
X     (begin (set mant m) (set exp e) self))
X    (define mant () mant)
X    (define exp () exp)
X    (define + (x)
X         (begin
X              (if (< exp (exp x))
X                  (begin
X                       (set min self)
X                       (set max x))
X                  (begin
X                       (set min x)
X                       (set max self)))
X              (set delta (- (exp max) (exp min)))
X              (set temp (+ (* (mant max) (powerof10 self delta)) (mant min)))
X              (normalize
X                  (initFloat (new Float) temp (if (= temp 0) 0 (exp min))))))
X    (define negate ()  (initFloat (new Float) (- 0 mant) exp))
X    (define * (x)
X         (normalize (initFloat (new Float)
X              (* mant (mant x))
X              (+ exp (exp x)))))
X    (define recip ()
X         (if (isZero self) self
X             (normalize (initFloat (new Float)
X                  (/ 100000000 mant)
X                  (- (- 0 8) exp)))))
X    (define zero () (initFloat (new Float) 0 0))
X    (define one () (initFloat (new Float) 1 0))
X    (define = (x) (isZero (- self x)))
X    (define < (x) (isNegative (- self x)))
X    (define print () (begin (print mant) (print exp)))
X    (define isZero () (= mant 0))
X    (define isNegative () (< mant 0))
X    ; normalize and powerof10 should not be exported
X    (define powerof10 (d)
X     (if (= d 0) 1 (* 10 (powerof10 self (- d 1)))))
X    (define normalize ()
X           (begin
X                (while (> (abs mant) 10000)
X                     (begin
X                          (set mant (/ mant 10))
X                          (set exp (+ exp 1))))
X                self))
)
(define mkFloat (m e) (initFloat (new Float) m e))
(set eps (mkFloat 5 -1))
(set x1 (mkFloat 17 0))
(print (sqrt x1 eps))
4125
-3
; Section 7.4
(class Simulation Object
X     () ; abstract class
X     (define initialize () #subclassResponsibility)
X     (define report () #subclassResponsibility)
X     (define run (timelimit)
X          (begin
X                (set CLOCK 0)
X                (set EVQUEUE (mkEventQueue))
X                (initialize self)
X                (while (<= CLOCK timelimit) (doNextEvent EVQUEUE))
X                (report self)))
)
(class LabSimulation Simulation
X     (termlimit)
X     (define initLabSimulation (t)
X           (begin (set termlimit t) self))
X     (define initialize ()
X          (begin
X                (set TERMINALLIMIT termlimit)
X                (set THELAB (mkLab))
X                (set STUDENTNO 0)
X                (set STUDENTSFINISHING 0)
X                (set TOTALTIMEWASTED 0)
X                (set TERMINALQUEUE (mkQueue))
X                (set WAITTIMES (mkWaitTimeList))
X                (set SERVICETIMES (mkServiceTimeList))
X                (scheduleNewArrival (new Student))))
X     (define report ()
X          (begin
X                (print #simulation-done)
X                (print #students-finishing)
X                (print STUDENTSFINISHING)
X                (print #left-on-queue)
X                (print (size TERMINALQUEUE))
X                (print #Total-time-wasted:)
X                (print TOTALTIMEWASTED)
X                (print #Average-time-wasted:)
X                (print (/ TOTALTIMEWASTED STUDENTSFINISHING))))
)
(define mkLabSimulation (tl) (initLabSimulation (new LabSimulation) tl))
(class Lab Object
X    (term1free term2free)
X    (define initLab ()
X           (begin (set term1free true) (set term2free true) self))
X    (define terminals-free? () (or term1free term2free))
X    (define pick-terminal ()
X         (if term1free
X              (begin (set term1free false) 1)
X              (begin (set term2free false) 2)))
X    (define release-terminal (t)
X         (if (= t 1) (set term1free true) (set term2free true)))
)
(define mkLab () (initLab (new Lab)))
;
(class List SequenceableCollection
X  (car cdr currentKey currentCell)
X  (define car () car)
X  (define cdr () cdr)
X  (define initList ()
X     (begin (set car #nil) self))
X  (define newEmptyCollection () (initList (new List)))
X  (define add: (item)
X     (begin
X        (set temp (newEmptyCollection self))
X        (car: temp car)
X        (cdr: temp cdr)
X        (set cdr temp)
X        (set car item)))
X  (define car: (x) (set car x))
X  (define cdr: (x) (set cdr x))
X  (define first ()
X     (begin
X        (set currentKey 1)
X        (set currentCell self)
X        car))
X  (define next ()
X     (if (isNil (car currentCell)) #nil
X        (begin
X           (set currentKey (+1 currentKey))
X           (set currentCell (cdr currentCell))
X           (car currentCell))))
X  (define firstKey () 1)
X  (define lastKey () (size self))
X  (define currentKey () currentKey)
X  (define at:put: (n value)
X     (if (= n 1) (set car value)
X       (at:put: cdr (- n 1) value)))
X  (define removeFirst ()
X     (if (isEmpty self) self ; do nothing
X        (begin
X            (set car (car cdr))
X            (set cdr (cdr cdr)))))
X  (define zerolist (size)
X        (while (> size 0)
X           (begin
X              (add: self 0)
X              (set size (- size 1)))))
)
;
(class Queue List
X     ()
X    (define initQueue () (initList self))
X    (define newEmptyCollection () (initList (new Queue)))
X    (define enqueue: (item)
X         (if (isEmpty self) (add: self item) (enqueue: cdr item)))
)
(define mkQueue () (initQueue (new Queue)))
(class EventQueue Object
X    (pqueue) ; a PriorityQueue
X    (define initEventQueue ()
X         (begin (set pqueue (mkPriorityQueue)) self))
X    (define scheduleEvent (event time)
X         (insert: pqueue (mkAssociation time event)))
X    (define doNextEvent ()
X         (begin
X               (set pair (car pqueue))
X               (removeFirst pqueue)
X               (set CLOCK (fst pair))
X               (takeAction (snd pair))))
)
(define mkEventQueue () (initEventQueue (new EventQueue)))
(class PriorityQueue List
X    ()
X    (define initPriorityQueue () (initList self))
X    (define newEmptyCollection () (initList (new PriorityQueue)))
X    (define insert: (pair)
X        (if (isEmpty self) (add: self pair)
X             (if (< (fst pair) (fst car)) (add: self pair)
X                  (insert: cdr pair))))
)
(define mkPriorityQueue () (initPriorityQueue (new PriorityQueue)))
(class Student Object
X    (status number timeNeeded timeStillNeeded arrivalTime)
X    (define initStudent (n t a)
X         (begin
X               (set status -1)
X               (set number n)
X               (set timeNeeded t)
X               (set timeStillNeeded t)
X               (set arrivalTime a)
X               self))
X    (define takeAction ()
X         (if (= status -1) (arrive self) (leaveTerminal self)))
X    (define arrive ()
X         (begin
X               (if (terminals-free? THELAB)
X                    (grabTerminal self)
X                    (begin
X                          (set status 0)
X                          (enqueue: TERMINALQUEUE self)))
X               (scheduleNewArrival (new Student))))
X    (define leaveTerminal ()
X         (if (= timeStillNeeded 0)
X              (begin
X                    (release-terminal THELAB status)
X                    (set status 3)
X            (set wasted (- (- CLOCK arrivalTime) timeNeeded))
X                 (set STUDENTSFINISHING (+1 STUDENTSFINISHING))
X                 (set TOTALTIMEWASTED (+ TOTALTIMEWASTED wasted))
X                    (if (not (isEmpty TERMINALQUEUE))
X                         (grabTerminal (car TERMINALQUEUE)) 0))
X              (if (isEmpty TERMINALQUEUE)
X                   (scheduleLeaveTerminal self)
X                   (begin
X                         (release-terminal THELAB self)
X                         (set status 0)
X                         (enqueue: TERMINALQUEUE self)
X                         (grabTerminal (car TERMINALQUEUE))))))
X    (define grabTerminal ()
X         (begin
X               (if (= status 0) ; was on terminal queue
X                    (removeFirst TERMINALQUEUE)
X                     0) ; else do nothing
X               (set status (pick-terminal THELAB))
X               (scheduleLeaveTerminal self)))
X    (define scheduleLeaveTerminal ()
X         (if (<= timeStillNeeded TERMINALLIMIT)
X              (begin
X                    (scheduleEvent EVQUEUE self (+ CLOCK timeStillNeeded))
X                    (set timeStillNeeded 0))
X              (begin
X                  (scheduleEvent EVQUEUE self (+ CLOCK TERMINALLIMIT))
X                  (set timeStillNeeded (- timeStillNeeded TERMINALLIMIT)))))
X    (define scheduleNewArrival ()
X         (begin
X               (set wait (next WAITTIMES))
X               (set service (next SERVICETIMES))
X               (set STUDENTNO (+1 STUDENTNO))
X               (set arrival (+ CLOCK wait))
X               (initStudent self STUDENTNO service arrival)
X               (scheduleEvent EVQUEUE self arrival)))
)
; Twenty arrivals at time zero
(class WaitTimeList Object
X    (which)
X    (define initWaitTimeList () (begin (set which 0) self))
X    (define next ()
X         (if (= which 20) 2000 (begin (set which (+1 which)) 0)))
)
(define mkWaitTimeList () (initWaitTimeList (new WaitTimeList)))
; All students need 120 minutes of terminal time
(class ServiceTimeList Object
X    ()
X    (define initServiceTimeList () self)
X    (define next () 120)
)
(define mkServiceTimeList () (initServiceTimeList (new ServiceTimeList)))
(set sim30 (mkLabSimulation 30))
(run sim30 1200)
#simulation-done
#students-finishing
20
#left-on-queue
0
#Total-time-wasted:
18900
#Average-time-wasted:
945
; Arrivals every 30 minutes
(class WaitTimeList Object
X    ()
X    (define initWaitTimeList () self)
X    (define next () 30)
)
(define mkWaitTimeList () (initWaitTimeList (new WaitTimeList)))
; Service times alternating: 120, 30, 120, 30, ...
(class ServiceTimeList Object
X    (which)
X    (define initServiceTimeList () (begin (set which 1) self))
X    (define next ()
X          (begin
X                (set which (- 1 which))
X                (if (= which 0) 120 30)))
)
(define mkServiceTimeList () (initServiceTimeList (new ServiceTimeList)))
(set sim30 (mkLabSimulation 30))
(run sim30 1200)
#simulation-done
#students-finishing
30
#left-on-queue
8
#Total-time-wasted:
3090
#Average-time-wasted:
103
quit
SHAR_EOF
  (set 19 90 01 05 18 00 26 'c-distr/code.smt'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code.smt'
if test $? -ne 0
then ${echo} 'restore of c-distr/code.smt failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code.smt: MD5 check failed'
       ) << SHAR_EOF
729ec929653e3b1e243611c90a7b53dd  c-distr/code.smt
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code.smt'` -ne 23032 && \
  ${echo} 'restoration warning:  size of c-distr/code.smt is not 23032'
  fi
fi
# ============= c-distr/code.ssl.out ==============
if test -f 'c-distr/code.ssl.out' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code.ssl.out (file already exists)'
else
${echo} 'x - extracting c-distr/code.ssl.out (binary)'
  sed 's/^X//' << 'SHAR_EOF' | uudecode &&
begin 600 c-distr/code.ssl.out
M+3X@+3X@/&-L;W-U<F4^"@HM/B`^(#X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R
M93X*"BT^(#QC;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R93X*
M"BT^(#QC;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R93X*"BT^
M(#QC;&]S=7)E/@H*+3X@/B`^(#QC;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM
M/B`\8VQO<W5R93X*"BT^(#QC;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`\
M8VQO<W5R93X*"BT^(#QC;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`\8VQO
M<W5R93X*"BT^(#QC;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`^(#X@/B`\
M8VQO<W5R93X*"BT^(#X@/B`^(#X@/&-L;W-U<F4^"@HM/B`H*0H*+3X@/&-L
M;W-U<F4^"@HM/B`\8VQO<W5R93X*"BT^(#X@/&-L;W-U<F4^"@HM/B`\8VQO
M<W5R93X*"BT^("T^(#QC;&]S=7)E/@H*+3X@/B`\8VQO<W5R93X*"BT^(#X@
M/B`^(#QC;&]S=7)E/@H*+3X@/B`\8VQO<W5R93X*"BT^(#8*"BT^(#8*"BT^
M(#X@/&-L;W-U<F4^"@HM/B`Y"@HM/B`Y"@HM/B`M/B`\8VQO<W5R93X*"BT^
M(#QC;&]S=7)E/@H*+3X@-@H*+3X@-@H*+3X@+3X@*"XN+B`N+BXI"@HM/B`H
M+BXN("XN+BD*"BT^(#,*"BT^(#,*"BT^(#0*"BT^(#0*"BT^("@S(#0@+BXN
M*0H*+3X@*#,@-"`N+BXI"@HM/B`H*0H*+3X@*"D*"BT^("@S(#0I"@HM/B`H
M,R`T*0H*+3X@/B`\8VQO<W5R93X*"BT^("@N+BX@+BXN*0H*+3X@*"XN+B`N
M+BXI"@HM/B`P"@HM/B`P"@HM/B`Q"@HM/B`Q"@HM/B`H,"`Q("XN+BD*"BT^
M("@P(#$@+BXN*0H*+3X@/B`^(#X@/&-L;W-U<F4^"@HM/B`H+BXN("XN+BD*
M"BT^("@N+BX@+BXN*0H*+3X@5`H*+3X@5`H*+3X@*#,@-"D*"BT^("@S(#0I
M"@HM/B`^(#X@/B`\8VQO<W5R93X*"BT^("@N+BX@+BXN*0H*+3X@*"XN+B`N
M+BXI"@HM/B!4"@HM/B!4"@HM/B`H,"`Q(#(@,R`T*0H*+3X@*#`@,2`R(#,@
M-"D*"BT^(#QC;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R93X*
M"BT^(#X@/&-L;W-U<F4^"@HM/B`^(#QC;&]S=7)E/@H*+3X@/B`^(#QC;&]S
M=7)E/@H*+3X@,3`*"BT^(#$P"@HM/B`\8VQO<W5R93X*"BT^(#X@/&-L;W-U
M<F4^"@HM/B`U"@HM/B`U"@HM/B`^(#X@/B`^(#QC;&]S=7)E/@H*+3X@/B`^
M(#QC;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`H+BXN("XN+BD*"BT^(#QC
M;&]S=7)E/@H*+3X@*"XN+B`N+BXI"@HM/B!4"@HM/B`H,B`S(#4@-R`Q,2D*
M"BT^("T^(#QC;&]S=7)E/@H*+3X@/B`^(#QC;&]S=7)E/@H*+3X@/B`\8VQO
M<W5R93X*"BT^(#QC;&]S=7)E/@H*+3X@-@H*+3X@-@H*+3X@+3X@/&-L;W-U
M<F4^"@HM/B`^(#X@/B`\8VQO<W5R93X*"BT^(#QC;&]S=7)E/@H*+3X@/B`\
M8VQO<W5R93X*"BT^(#X@/&-L;W-U<F4^"@HM/B`^(#X@/B`\8VQO<W5R93X*
M"BT^(#X@/&-L;W-U<F4^"@HM/B`^(#X@/B`\8VQO<W5R93X*"BT^("@N+BX@
M+BXN*0H*+3X@5`H*+3X@*%!E<FUU=&%T:6]N<R!O9B!A(&(@8RD*"BT^("@H
M82!B(&,I("AA(&,@8BD@*&(@82!C*2`H8B!C(&$I("AC(&$@8BD@*&,@8B!A
M*2D*"BT^(#QC;&]S=7)E/@H*+3X@*#(@+BXN*0H*+3X@5`H*+3X@*#(@,2`S
M(#0I"@HM/B`H,B`Q(#,@-"D*"BT^("T^("@N+BX@+BXN*0H*+3X@*"XN+B`N
M+BXI"@HM/B`^(#X@/&-L;W-U<F4^"@HM/B`H+BXN("XN+BD*"BT^("@N+BX@
M+BXN*0H*+3X@*"XN+B`N+BXI"@HM/B`V"@HM/B`V"@HM/B`M/B`^(#X@/B`^
M(#X@/B`^(#X@/&-L;W-U<F4^"@HM/B`^(#QC;&]S=7)E/@H*+3X@/B`^(#QC
M;&]S=7)E/@H*+3X@/B`^(#X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R93X*"BT^
M(#QC;&]S=7)E/@H*+3X@/B`^(#X@/B`\8VQO<W5R93X*"BT^(#X@/B`^(#QC
M;&]S=7)E/@H*+3X@56YS871I<V9I86)L90H*+3X@+3X@/B`\8VQO<W5R93X*
M"BT^(#X@/B`^(#QC;&]S=7)E/@H*+3X@*"@R(#(I("@P(#$I("@S(#`I*0H*
M+3X@*"@R(#(I("@P(#$I("@S(#`I*0H*+3X@*"XN+B`N+BXI"@HM/B`\8VQO
M<W5R93X*"BT^(#QC;&]S=7)E/@H*+3X@/B`^(#X@/&-L;W-U<F4^"@HM/B`^
M(#X@/B`\8VQO<W5R93X*"BT^(#X@/B`^(#QC;&]S=7)E/@H*+3X@+3X@/B`\
M8VQO<W5R93X*"BT^("T^(#X@/&-L;W-U<F4^"@HM/B`^(#X@/B`^(#X@/&-L
M;W-U<F4^"@HM/B`^(#X@/B`\8VQO<W5R93X*"BT^(%0*"BT^(%0*"BT^("@I
M"@HM/B`H*0H*+3X@+3X@+3X@+3X@+3X@+3X@+3X@+3X@+3X@+3X@+3X@+3X@
M+3X@+3X@+3X@+3X@+3X@+3X@+3X@+3X@+3X@+3X@+3X@+3X@+3X@+3X@+3X@
M+3X@+3X@+3X@+3X@+3X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R93X*"BT^(#QC
M;&]S=7)E/@H*+3X@80H*+3X@80H*+3X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R
M93X*"BT^(#(T"@HM/B`R-`H*+3X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R93X*
M"BT^(#QC;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R93X*"BT^
M(#QC;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`S"@HM/B`S"@HM/B`\8VQO
M<W5R93X*"BT^(#X@/&-L;W-U<F4^"@HM/B`Q-0H*+3X@,34*"BT^(#QC;&]S
M=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R93X*"BT^(#QC;&]S=7)E
M/@H*+3X@,@H*+3X@,@H*+3X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R93X*"BT^
M(#QC;&]S=7)E/@H*+3X@,PH*+3X@,PH*+3X@/&-L;W-U<F4^"@HM/B`\8VQO
M<W5R93X*"BT^(#8*"BT^(#8*"BT^(#QC;&]S=7)E/@H*+3X@/&-L;W-U<F4^
M"@HM/B`\8VQO<W5R93X*"BT^(#QC;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM
M/B`T"@HM/B`T"@HM/B`\8VQO<W5R93X*"BT^(#QC;&]S=7)E/@H*+3X@/B`\
M8VQO<W5R93X*"BT^(#QC;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`^(#QC
M;&]S=7)E/@H*+3X@>65S"@HM/B!Y97,*"BT^(&YO"@HM/B!N;PH*+3X@/B`\
M8VQO<W5R93X*"BT^(#(T"@HM/B`R-`H*+3X@/B`\8VQO<W5R93X*"BT^(#QC
M;&]S=7)E/@H*+3X@,C0*"BT^(#(T"@HM/B`\8VQO<W5R93X*"BT^(#QC;&]S
M=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`Q"@HM/B`Q"@HM/B`^(#X@/&-L;W-U
6<F4^"@HM/B`R-`H*+3X@,C0*"BT^("`Q
`
end
SHAR_EOF
  (set 19 90 01 05 18 00 42 'c-distr/code.ssl.out'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code.ssl.out'
if test $? -ne 0
then ${echo} 'restore of c-distr/code.ssl.out failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code.ssl.out: MD5 check failed'
       ) << SHAR_EOF
92802c4fa391ebf0f52031a1d32007d8  c-distr/code.ssl.out
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code.ssl.out'` -ne 3037 && \
  ${echo} 'restoration warning:  size of c-distr/code.ssl.out is not 3037'
  fi
fi
# ============= c-distr/code.sch ==============
if test -f 'c-distr/code.sch' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code.sch (file already exists)'
else
${echo} 'x - extracting c-distr/code.sch (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/code.sch' &&
; From Chapter 1 and Lisp
(set +1 (lambda (x) (+ x 1)))
(set list2 (lambda (x y) (cons x (cons y '()))))
(set list3 (lambda (x y z) (cons x (cons y (cons z '())))))
(set nth (lambda (n l)
X   (if (= n 0) (car l) (nth (- n 1) (cdr l)))))
(set cadr (lambda (x) (car (cdr x))))
(set caddr (lambda (x) (car (cdr (cdr x)))))
(set atom? (lambda (x) (or (null? x) (or (number? x) (symbol? x)))))
(set equal (lambda (l1 l2)
X  (if (atom? l1) (= l1 l2)
X    (if (atom? l2) '()
X      (if (equal (car l1) (car l2))
X         (equal (cdr l1) (cdr l2))
X         '())))))
(set or (lambda (x y) (if x x y)))
(set not (lambda (x) (if x '() 'T)))
(set cadar (lambda (l) (car (cdr (car l)))))
(set caar (lambda (l) (car (car l))))
(set assoc (lambda (x alist) 
X     (if (null? alist) '()
X         (if  (= x (caar alist)) (cadar alist)
X             (assoc x (cdr alist))))))
(set mod (lambda (m n) (- m (* n (/ m n)))))
(set gcd (lambda (m n)
X  (if (= n 0) m (gcd n (mod m n)))))
(set mkassoc (lambda (x y alist)
X     (if (null? alist)
X          (cons (list2 x y) '())
X         (if  (= x (caar alist)) (cons (list2 x y) (cdr alist))
X           (cons (car alist) (mkassoc x y (cdr alist)))))))
(set mkassoc* (lambda (keys values al)
X   (if (null? keys) al
X      (mkassoc* (cdr keys) (cdr values)
X            (mkassoc (car keys) (car values) al)))))
(set length (lambda (l) (if (null? l) 0 (+1 (length (cdr l))))))
; Section 4.1
(set sort2 (lambda (x y comp)
X     (if (comp x y) (list2 x y) (list2 y x))))
(sort2 7 5 <)
'(5 7)
(set compare-pairs (lambda (p1 p2)
X     (if (< (car p1) (car p2)) 'T
X       (if (< (car p2) (car p1)) '()
X         (< (cadr p1) (cadr p2))))))
(sort2 '(4 5) '(2 9) compare-pairs)
'((2 9)(4 5))
(set add (lambda (x) (lambda (y) (+ x y))))
(set add1 (add 1))
(add1 4)
5
; Section 4.2.4
(set mapcar (lambda (f l)
X     (if (null? l) '()
X       (cons (f (car l)) (mapcar f (cdr l))))))
(mapcar number? '(3 a b (5 6)))
'(T () () ())
(mapcar add1 '(3 4 5))
'(4 5 6)
(set add1* (lambda (l) (mapcar add1 l)))
(add1* '(3 4 5))
'(4 5 6)
(set curry (lambda (f) (lambda (x) (lambda (y) (f x y)))))
(((curry +) 3) 4)
7
(set mapc (curry mapcar))
(set add1* (mapc add1))
(add1* '(3 4 5))
'(4 5 6)
(set add1** (mapc add1*))
(add1** '((2 3)(4 5)))
'((3 4)(5 6))
(set combine (lambda (f sum zero)
X     (lambda (l) (if (null? l) zero
X       (sum (f (car l)) ((combine f sum zero) (cdr l)))))))
(set sum-squares (combine (lambda (x) (* x x)) + 0))
(sum-squares '(1 2 3 4))
30
(set id (lambda (x) x))
(set +/ (combine id + 0))
(+/ '(1 2 3 4))
10
(set */ (combine id * 1))
(*/ '(1 2 3 4))
24
(set list-id (combine id cons '()))
(list-id '(3 4 5))
'(3 4 5)
(set alternate-mapc (lambda (f) (combine f cons '())))
(set cmp-pairs-of-pairs (lambda (t1 t2)
X     (if (compare-pairs (car t1) (car t2)) 'T
X       (if (compare-pairs (car t2) (car t1)) '()
X         (compare-pairs (cadr t1) (cadr t2))))))
(set lex-order (lambda (<1 <2)
X         (lambda (p1 p2)
X             (if (<1 (car p1) (car p2)) 'T
X                 (if (<1 (car p2) (car p1)) '()
X                     (<2 (cadr p1) (cadr p2)))))))
(set compare-pairs (lex-order < <))
(set cmp-pairs-of-pairs
X   (lex-order compare-pairs compare-pairs))
(set student-order (lex-order > <))
(sort2 '(85 1005) '(95 2170) student-order)
'((95 2170) (85 1005))
(sort2 '(85 1005) '(85 2170) student-order)
'((85 1005) (85 2170))
(set invert-order (lambda (<) (lambda (x y) (< y x))))
(sort2 '(85 1005) '(95 2170) (invert-order student-order))
'((85 1005) (95 2170))
(set select-cols (lambda (c1 c2)
X   (lambda (l) (list2 (nth c1 l) (nth c2 l)))))
(set compose-binary
X   (lambda (f g) (lambda (x y) (g (f x) (f y)))))
(set compare-cols (lambda (< c1 c2)
X        (compose-binary (select-cols c1 c2) <)))
(set new-student-order (compare-cols student-order 2 1))
(sort2 '(Kaplan 1005 85 87) '(Reddy 2170 95 92)
X       new-student-order)
'((Reddy 2170 95 92) (Kaplan 1005 85 87))
(set compose (lambda (f g) (lambda (x) (g (f x)))))
(set apply-binary (lambda (f)
X   (lambda (l) (f (car l) (cadr l)))))
(set improvement
X   (compose (select-cols 3 2)
X            (apply-binary -)))
(set comp-improvement (compose-binary improvement >))
(sort2 '(Kaplan 1005 85 87) '(Reddy 2170 95 92)
X       comp-improvement)
'((Kaplan 1005 85 87) (Reddy 2170 95 92))
(set find (lambda (pred lis)
X   (if (null? lis) '()
X          (if (pred (car lis)) 'T (find pred (cdr lis))))))
(set nullset '())
(set addelt (lambda (x s) (if (member? x s) s (cons x s))))
(set member? (lambda (x s) (find ((curry equal) x) s)))
(set union (lambda (s1 s2) ((combine id addelt s1) s2)))
(set s1 (addelt 'a (addelt 'b nullset)))
'(a b)
(member? 'a s1)
'T
(member? 'c s1)
'()
(set s2 (addelt 'b (addelt 'c nullset)))
'(b c)
(set s3 (union s1 s2))
'(c a b)
(set sub-alist (lambda (al1 al2)
X     (not (find
X             (lambda (pair)
X                 (not (equal (cadr pair) (assoc (car pair) al2))))
X             al1))))
(set =alist (lambda (al1 al2)
X     (if (sub-alist al1 al2) (sub-alist al2 al1) '())))
(=alist '((E coli)(I Magnin)(U Thant))
X        '((E coli)(I Ching)(U Thant)))
'()
(=alist '((U Thant)(I Ching)(E coli))
X        '((E coli)(I Ching)(U Thant)))
'T
(set member? (lambda (x s eqfun)
X     (find ((curry eqfun) x) s)))
(set addelt (lambda (x s eqfun)
X   (if (member? x s eqfun) s (cons x s))))
(set nullset (lambda (eqfun) (list2 eqfun '())))
(set member? (lambda (x s)
X     (find ((curry (car s)) x) (cadr s))))
(set addelt (lambda (x s)
X   (if (member? x s) s (list2 (car s) (cons x (cadr s))))))
(set mk-set-ops (lambda (eqfun)
X   (cons '()  ; empty set
X   (cons (lambda (x s) (find ((curry eqfun) x) s)) ; member?
X   (cons (lambda (x s) ; addelt
X             (if (find ((curry eqfun) x) s) s (cons x s)))
X          '()
X       )))))
(set list-of-al-ops (mk-set-ops =alist))
(set al-nullset (car list-of-al-ops))
(set al-member? (cadr list-of-al-ops))
(set al-addelt (caddr list-of-al-ops))
(set gcd* (lambda (l)
X    (if (= (car l) 1) 1
X         (if (null? (cdr l)) (car l)
X              (gcd (car l) (gcd* (cdr l)))))))
(gcd* '(20 48 32 1))
1
(set gcd* (lambda (l)
X     (if (= (car l) 1) 1
X          (gcd*-aux (car l) (cdr l)))))
(set gcd*-aux (lambda (n l)
X     (if (null? l) n
X          (if (= (car l) 1) 1
X               (gcd*-aux (gcd n (car l)) (cdr l))))))
(gcd* '(20 48 32 1))
1
(set gcd* (lambda (l) (gcd*-aux l id)))
(set gcd*-aux (lambda (l f)
X     (if (= (car l) 1) 1
X          (if (null? (cdr l)) (f (car l))
X               (gcd*-aux (cdr l)
X                           (lambda (n) (f (gcd (car l) n))))))))
(gcd* '(20 48 32 1))
1
(set gcds (lambda (s) (gcds-aux s id)))
(set gcds-aux (lambda (s f)
X     (if (number? s) (if (= s 1) 1 (f s))
X          (if (null? (cdr s))
X               (gcds-aux (car s) f)
X               (gcds-aux (car s)
X                           (lambda (n) (gcds-aux (cdr s)
X                                          (lambda (p) (f (gcd n p))))))))))
(gcds '(20 (48 32) (1)))
1
(set rand (lambda (seed) ($\cdots$ seed $\cdots$)))
(set init-rand (lambda (seed)
X     (lambda () (set seed (mod (+ (* seed 9) 5) 1024)))))
(set rand (init-rand 1))
'<closure>
(rand)
14
(rand)
131
; Section 4.4
; Restore required defn. of member?
(set find (lambda (pred lis)
X     (if (null? lis) '()
X          (if (pred (car lis)) 'T
X               (find pred (cdr lis))))))
(set member? (lambda (x s) (find ((curry equal) x) s)))
;
(set fun-mod (lambda (f x y) (lambda (z) (if (= x z) y (f z)))))
(set variable? (lambda (x) (member? x '(X Y))))
(set empty-subst (lambda (x) 'unbound))
(set mk-subst-fn
X    (lambda (lhs e sigma)
X         (if (variable? lhs)
X             (if (= (sigma lhs) 'unbound)
X                 (fun-mod sigma lhs e)
X                 (if (equal (sigma lhs) e) sigma 'nomatch))
X           (if (atom? lhs)
X               (if (= lhs e) sigma 'nomatch)
X             (if (atom? e) 'nomatch
X                 (if (= (car lhs) (car e))
X                     (mk-subst-fn* (cdr lhs) (cdr e) sigma)
X                     'nomatch))))))
(set mk-subst-fn*   
X     (lambda (lhs-lis exp-lis sigma)
X         (if (null? lhs-lis) sigma
X             (begin
X                (set car-match
X                       (mk-subst-fn (car lhs-lis) (car exp-lis) sigma))
X                (if (= car-match 'nomatch) 'nomatch
X                   (mk-subst-fn* (cdr lhs-lis) (cdr exp-lis) car-match))))))
(set extend-to-pat  
X     (lambda (sigma)
X         (lambda (p)
X             (if (variable? p) (if (= (sigma p) 'unbound) p (sigma p))
X                 (if (atom? p) p
X                     (cons (car p)
X                           (mapcar (extend-to-pat sigma) (cdr p))))))))
(set mk-toplvl-rw-fn
X    (lambda (rule)
X        (lambda (e)
X             (begin
X          (set induced-subst (mk-subst-fn (car rule) e empty-subst))
X                      (if (= induced-subst 'nomatch) '()
X                          ((extend-to-pat induced-subst) (cadr rule)))))))
(set apply-inside-exp  
X     (lambda (f)
X         (lambda (e)
X               (begin
X                     (set newe (f e))
X                     (if newe newe
X                          (if (atom? e) '()
X                               (begin
X                          (set newargs ((apply-inside-exp* f) (cdr e)))
X                         (if newargs (cons (car e) newargs) '()))))))))
(set apply-inside-exp*  
X       (lambda (f)
X           (lambda (l)
X               (if (null? l) '()
X                    (begin
X                        (set newfirstarg ((apply-inside-exp f) (car l)))
X                        (if newfirstarg
X                             (cons newfirstarg (cdr l))
X                             (begin
X                      (set newrestofargs ((apply-inside-exp* f) (cdr l)))
X                  (if newrestofargs
X                      (cons (car l) newrestofargs) '()))))))))
(set mk-rw-fn 
X      (compose mk-toplvl-rw-fn apply-inside-exp))
(set failure (lambda (e) '()))
(set compose-rewrites (lambda (f g)
X      (lambda (x)
X           ( (lambda (fx) (if fx fx (g x))) (f x)))))
(set mk-rw-fn*
X     (combine mk-rw-fn compose-rewrites failure))
(set repeat-fn
X    (lambda (f)
X        (lambda (e)
X             (begin
X                  (set tmp (f e))
X                  (if tmp ((repeat-fn f) tmp) e)))))
(set compile-trs
X     (compose mk-rw-fn* repeat-fn))
(set diff-rules '(
X      ((Dx x) 1)
X         ((Dx c) 0)
X         ((Dx (+ X Y)) (+ (Dx X) (Dx Y)))
X         ((Dx (- X Y)) (- (Dx X) (Dx Y)))
X         ((Dx (* X Y)) (+ (* Y (Dx X)) (* X (Dx Y))))
X         ((Dx (/ X Y)) (/ (- (* Y (Dx X)) (* X (Dx Y))) (* Y Y)))))
(set differentiate (compile-trs diff-rules))
;(differentiate '(Dx (+ x c)))
;'(+ 1 0)
; Section 4.5
(set formals (lambda (lamexp) (cadr lamexp)))
(set body (lambda (lamexp) (caddr lamexp)))
(set funpart (lambda (clo) (cadr clo)))
(set envpart (lambda (clo) (caddr clo)))
(set eval (lambda (exp env)
X          (if (number? exp) exp
X          (if (symbol? exp) (assoc exp env)
X          (if (= (car exp) 'quote) (cadr exp)
X          (if  (= (car exp) 'lambda) (list3 'closure exp env)
X          (if  (= (car exp) 'if)
X                  (if  (null? (eval (cadr exp) env))
X                          (eval (cadddr exp) env)
X                          (eval (caddr exp) env))
X            (apply (evallist exp env) env))))))))
(set evallist (lambda (el env)
X     (if (null? el) '()
X          (cons (eval (car el) env)
X                  (evallist (cdr el) env)))))
(set apply (lambda (el env)
X          (if (closure? (car el))
X               (apply-closure (car el) (cdr el))
X               (apply-value-op (car el) (cdr el)))))
(set apply-closure (lambda (clo args)
X          (eval (body (funpart clo))
X                  (mkassoc* (formals (funpart clo)) args (envpart clo)))))
(set apply-value-op (lambda (primop args)
X          (if (= (length args) 1)
X               (apply-unary-op  (cadr primop) (car args))
X               (apply-binary-op (cadr primop) (car args) (cadr args)))))
(set closure? (lambda (f) (= (car f) 'closure)))
(set primop? (lambda (f) (= (car f) 'primop)))
(set valueops '(
X      (+ (primop +))
X      (- (primop -))
X      (cons (primop cons))
X      (* (primop *))
X      (/ (primop /))
X      (< (primop <))
X      (> (primop >))
X      (= (primop =))
X      (cdr (primop cdr))
X      (car (primop car))
X      (number? (primop number?))
X      (list? (primop list?))
X      (symbol? (primop symbol?))
X      (null? (primop null?))
X      (closure? (primop closure?))
X      (primop? (primop primop?))))
(set apply-binary-op (lambda (f x y)
X      (if (= f 'cons) (cons x y)
X      (if (= f '+) (+ x y)
X      (if (= f '-) (- x y)
X      (if (= f '*) (* x y)
X      (if (= f '/) (/ x y)
X      (if (= f '<) (< x y)
X      (if (= f '>) (> x y)
X      (if (= f '=) (= x y) 'error!))))))))))
(set apply-unary-op (lambda (f x)
X      (if (= f 'car) (car x)
X      (if (= f 'cdr) (cdr x)
X      (if (= f 'number?) (number? x)
X      (if (= f 'list?) (list? x)
X      (if (= f 'symbol?) (symbol? x)
X      (if (= f 'closure?) (closure? x)
X      (if (= f 'primop?) (primop? x)
X      (if (= f 'null?) (null? x) 'error!))))))))))
(set E (mkassoc 'double (eval '(lambda (a) (+ a a)) valueops) valueops))
'((+ (primop +)) (- (primop -)) ...
X    (double (closure (lambda (a) (+ a a)) ... )))
(eval '(double 4) E)
8
; Section 4.7.6
(set eval (lambda (exp env)
X          (if (number? exp) exp
X          (if (symbol? exp) (assoc exp env)
X          (if (= (car exp) 'quote) (cadr exp)
X          (if  (= (car exp) 'lambda) exp ; closure is not formed
X          (if  (= (car exp) 'if)
X                  (if  (null? (eval (cadr exp) env))
X                          (eval (cadddr exp) env)
X                          (eval (caddr exp) env))
X            (apply (evallist exp env) env))))))))
(set apply (lambda (el env)
X          (if (lambda? (car el))
X               (apply-lambda (car el) (cdr el) env)
X               (apply-value-op (car el) (cdr el)))))
(set apply-lambda (lambda (lam args env)
X          (eval (body lam)
X                  (mkassoc* (formals lam) args env))))
(set lambda? (lambda (f) (= (car f) 'lambda)))
(set E (mkassoc 's (eval 10 valueops) valueops))
(set E (mkassoc 'f (eval '(lambda (x) (+ x s)) E) E))
(set E (mkassoc 'g (eval '(lambda (s) (f (+ s 11))) E) E))
(eval '(g 5) E)
21
(set E
X  (mkassoc 'add (eval '(lambda (x) (lambda (y) (+ x y))) E) E))
(set E (mkassoc 'add1 (eval '(add 1) E) E))
(set E (mkassoc 'f (eval '(lambda (x) (add1 x)) E) E))
(eval '(f 5) E)
10
quit
SHAR_EOF
  (set 19 90 01 05 18 00 26 'c-distr/code.sch'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code.sch'
if test $? -ne 0
then ${echo} 'restore of c-distr/code.sch failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code.sch: MD5 check failed'
       ) << SHAR_EOF
f22a67ae241ac434aa4ea548a3aa1d8c  c-distr/code.sch
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code.sch'` -ne 14352 && \
  ${echo} 'restoration warning:  size of c-distr/code.sch is not 14352'
  fi
fi
# ============= c-distr/code.smt.out ==============
if test -f 'c-distr/code.smt.out' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code.smt.out (file already exists)'
else
${echo} 'x - extracting c-distr/code.smt.out (binary)'
  sed 's/^X//' << 'SHAR_EOF' | uudecode &&
begin 600 c-distr/code.smt.out
M+3X@+3X@*S$*+3X@;W(*+3X@86YD"BT^(&YO=`HM/B`\/@HM/B`\/0HM/B!D
M:79I9&5S"BT^(&UO9`HM/B`^(#X@9V-D"BT^(&%B<PHM/B`M/B`^(#X@/B`^
M(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(&EN
M:71&:6YA;F-I86Q(:7-T;W)Y"G)E8V5I=F4Z9G)O;3H*<W!E;F0Z9F]R.@IC
M87-H3VY(86YD"G1O=&%L4F5C96EV961&<F]M.@IT;W1A;%-P96YT1F]R.@I&
M:6YA;F-I86Q(:7-T;W)Y"BT^(#X@;6M&:6YA;F-I86Q(:7-T;W)Y"BT^("T^
M(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(&EN:71$961U8W1I8FQE
M2&ES=&]R>0IS<&5N9#I$961U8W0Z"G-P96YD.F9O<CID961U8W0Z"G1O=&%L
M1&5D=6-T:6]N<PI$961U8W1I8FQE2&ES=&]R>0HM/B`^(&UK1&5D=6-T:6)L
M94AI<W1O<GD*+3X@+3X@+3X@,`H*+3X@,0H*+3X@:7-.:6P*+3X@;F]T3FEL
M"BT^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^
M(#X@/B`^(&9I<G-T"FYE>'0*861D.@IS:7IE"FES16UP='D*:6YC;'5D97,Z
M"D-O;&QE8W1I;VX*+3X@/B`^(#X@/B`^(#X@/B!I;FET4V5T"F9I<G-T"FYE
M>'0*861D.@I3970*+3X@;6M3970*+3X@+3X@/B`^(#X@/B`^(#X@/B`^(#X@
M/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@870Z<'5T.@IC=7)R96YT
M2V5Y"F%T.@II;F-L=61E<TME>3H*:6YD97A/9CH*2V5Y961#;VQL96-T:6]N
M"BT^("T^(#X@/B`^(#X@/B`^(#X@:6YI=$%S<V]C:6%T:6]N"F9S=`IS;F0*
M9G-T.@IS;F0Z"D%S<V]C:6%T:6]N"BT^("T^(&UK07-S;V-I871I;VX*+3X@
M/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^
M(#X@/B`^(#X@/B`^(#X@/B`^(#X@:6YI=$1I8W1I;VYA<GD*8W5R<F5N=$ME
M>0IF:7)S=`IN97AT"F%T.G!U=#H*87-S;V-I871I;VY!=#H*1&EC=&EO;F%R
M>0HM/B!M:T1I8W1I;VYA<GD*+3X@+3X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^
M(#X@/B`^(&9I<G-T2V5Y"FQA<W1+97D*;&%S=`IA=#H*4V5Q=65N8V5A8FQE
M0V]L;&5C=&EO;@HM/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^
M(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@
M/B`^(#X@/B!C87(*8V1R"FEN:71,:7-T"F%D9#H*8V%R.@IC9'(Z"F9I<G-T
M"FYE>'0*9FER<W1+97D*;&%S=$ME>0IC=7)R96YT2V5Y"F%T.G!U=#H*<F5M
M;W9E1FER<W0*>F5R;VQI<W0*3&ES=`HM/B!M:TQI<W0*+3X@+3X@/B`^(#X@
M/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^
M(&EN:71!<G)A>0IS:7IE"F9I<G-T2V5Y"FQA<W1+97D*8W5R<F5N=$ME>0IF
M:7)S=`IN97AT"F%T.G!U=#H*07)R87D*+3X@;6M!<G)A>0HM/B`M/B`\=7-E
M<G9A;#X*"BT^(#DU,`H*+3X@,3$U,`H*+3X@,3$U,`H*+3X@,3$U,`H*+3X@
M,3`U,`H*+3X@,3`U,`H*+3X@,3`U,`H*+3X@/'5S97)V86P^"@HM/B`Y-3`*
M"BT^(#$Q-3`*"BT^(#$Q-3`*"BT^(#$Q-3`*"BT^(#`*"BT^(#`*"BT^(#$P
M,`H*+3X@,3`U,`H*+3X@,3`U,`H*+3X@,3`P"@HM/B`Q,#`*"BT^(#$U,`H*
M+3X@.34P"@HM/B`Y-3`*"BT^(#$U,`H*+3X@,34P"@HM/B`M/B`^(#X@/B`^
M(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@
M/B`^(#X@/B`^("L*;F5G871E"BH*<F5C:7`*/0H\"GIE<F\*;VYE"G!R:6YT
M"BT*+PH^"BLQ"G-U8C$*:7-:97)O"FES3F5G871I=F4*86)S"G-Q<@IS<7)T
M"DYU;6)E<@HM/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@
M/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^
M(#X@/B`^(#X@/B`^(&EN:71&<F%C=&EO;@IS971&<F%C=&EO;@IX"GD**PIN
M96=A=&4**@IR96-I<`H]"CP*>F5R;PIO;F4*<')I;G0*9&EV+7)E9'5C90IS
M:6=N+7)E9'5C90I&<F%C=&EO;@HM/B!M:T9R86-T:6]N"BT^(#QU<V5R=F%L
M/@H*+3X@/'5S97)V86P^"@HM/B`\=7-E<G9A;#X*"BT^(#,T,S<R-#D*.#,S
M,#0Y"C@S,S`T.0H*+3X@,S0S-S(T.0H*+3X@.#,S,#0Y"@HM/B`M/B`^(#X@
M/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^
M(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(&EN
M:71&;&]A=`IM86YT"F5X<`HK"FYE9V%T90HJ"G)E8VEP"GIE<F\*;VYE"CT*
M/`IP<FEN=`II<UIE<F\*:7-.96=A=&EV90IP;W=E<F]F,3`*;F]R;6%L:7IE
M"D9L;V%T"BT^(&UK1FQO870*+3X@/'5S97)V86P^"@HM/B`\=7-E<G9A;#X*
M"BT^(#0Q,C4*+3,*+3,*"BT^(#0Q,C4*"BT^("TS"@HM/B`M/B`^(#X@/B`^
M(#X@/B`^(#X@/B`^(#X@:6YI=&EA;&EZ90IR97!O<G0*<G5N"E-I;75L871I
M;VX*+3X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^
M(#X@/B`^(#X@/B`^(&EN:71,86)3:6UU;&%T:6]N"FEN:71I86QI>F4*<F5P
M;W)T"DQA8E-I;75L871I;VX*+3X@;6M,86)3:6UU;&%T:6]N"BT^(#X@/B`^
M(#X@/B`^(#X@/B`^(#X@/B!I;FET3&%B"G1E<FUI;F%L<RUF<F5E/PIP:6-K
M+71E<FUI;F%L"G)E;&5A<V4M=&5R;6EN86P*3&%B"BT^(&UK3&%B"BT^("T^
M(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@
M/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@8V%R
M"F-D<@II;FET3&ES=`IN97=%;7!T>4-O;&QE8W1I;VX*861D.@IC87(Z"F-D
M<CH*9FER<W0*;F5X=`IF:7)S=$ME>0IL87-T2V5Y"F-U<G)E;G1+97D*870Z
M<'5T.@IR96UO=F5&:7)S=`IZ97)O;&ES=`I,:7-T"BT^("T^(#X@/B`^(#X@
M/B`^(&EN:711=65U90IN97=%;7!T>4-O;&QE8W1I;VX*96YQ=65U93H*475E
M=64*+3X@;6M1=65U90HM/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B!I;FET
M179E;G11=65U90IS8VAE9'5L945V96YT"F1O3F5X=$5V96YT"D5V96YT475E
M=64*+3X@;6M%=F5N=%%U975E"BT^(#X@/B`^(#X@/B`^(#X@/B!I;FET4')I
M;W)I='E1=65U90IN97=%;7!T>4-O;&QE8W1I;VX*:6YS97)T.@I0<FEO<FET
M>5%U975E"BT^(&UK4')I;W)I='E1=65U90HM/B`^(#X@/B`^(#X@/B`^(#X@
M/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^
M(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@
M/B`^(#X@/B`^(#X@/B!I;FET4W1U9&5N=`IT86ME06-T:6]N"F%R<FEV90IL
M96%V951E<FUI;F%L"F=R86)497)M:6YA;`IS8VAE9'5L94QE879E5&5R;6EN
M86P*<V-H961U;&5.97=!<G)I=F%L"E-T=61E;G0*+3X@+3X@/B`^(#X@/B`^
M(&EN:71786ET5&EM94QI<W0*;F5X=`I786ET5&EM94QI<W0*+3X@;6M786ET
M5&EM94QI<W0*+3X@+3X@/B`^(#X@/B!I;FET4V5R=FEC951I;65,:7-T"FYE
M>'0*4V5R=FEC951I;65,:7-T"BT^(&UK4V5R=FEC951I;65,:7-T"BT^(#QU
M<V5R=F%L/@H*+3X@<VEM=6QA=&EO;BUD;VYE"G-T=61E;G1S+69I;FES:&EN
M9PHR,`IL969T+6]N+7%U975E"C`*5&]T86PM=&EM92UW87-T960Z"C$X.3`P
M"D%V97)A9V4M=&EM92UW87-T960Z"CDT-0HY-#4*"BT^('-I;75L871I;VXM
M9&]N90H*+3X@<W1U9&5N=',M9FEN:7-H:6YG"@HM/B`R,`H*+3X@;&5F="UO
M;BUQ=65U90H*+3X@,`H*+3X@5&]T86PM=&EM92UW87-T960Z"@HM/B`Q.#DP
M,`H*+3X@079E<F%G92UT:6UE+7=A<W1E9#H*"BT^(#DT-0H*+3X@+3X@/B`^
M(#X@/B!I;FET5V%I=%1I;65,:7-T"FYE>'0*5V%I=%1I;65,:7-T"BT^(&UK
M5V%I=%1I;65,:7-T"BT^("T^(#X@/B`^(#X@/B`^(#X@:6YI=%-E<G9I8V54
M:6UE3&ES=`IN97AT"E-E<G9I8V54:6UE3&ES=`HM/B!M:U-E<G9I8V54:6UE
M3&ES=`HM/B`\=7-E<G9A;#X*"BT^('-I;75L871I;VXM9&]N90IS='5D96YT
M<RUF:6YI<VAI;F<*,S`*;&5F="UO;BUQ=65U90HX"E1O=&%L+71I;64M=V%S
M=&5D.@HS,#DP"D%V97)A9V4M=&EM92UW87-T960Z"C$P,PHQ,#,*"BT^('-I
M;75L871I;VXM9&]N90H*+3X@<W1U9&5N=',M9FEN:7-H:6YG"@HM/B`S,`H*
M+3X@;&5F="UO;BUQ=65U90H*+3X@.`H*+3X@5&]T86PM=&EM92UW87-T960Z
M"@HM/B`S,#DP"@HM/B!!=F5R86=E+71I;64M=V%S=&5D.@H*+3X@,3`S"@HM
"/B`M
`
end
SHAR_EOF
  (set 19 90 01 05 18 00 27 'c-distr/code.smt.out'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code.smt.out'
if test $? -ne 0
then ${echo} 'restore of c-distr/code.smt.out failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code.smt.out: MD5 check failed'
       ) << SHAR_EOF
442b1b9fe791ca5eae375f373da83c3d  c-distr/code.smt.out
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code.smt.out'` -ne 4142 && \
  ${echo} 'restoration warning:  size of c-distr/code.smt.out is not 4142'
  fi
fi
# ============= c-distr/code.lsp ==============
if test -f 'c-distr/code.lsp' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code.lsp (file already exists)'
else
${echo} 'x - extracting c-distr/code.lsp (binary)'
  sed 's/^X//' << 'SHAR_EOF' | uudecode &&
begin 600 c-distr/code.lsp
M.R!&<F]M(&-H87!T97(@,0HH9&5F:6YE(&UO9"`H;2!N*2`H+2!M("@J(&X@
M*"\@;2!N*2DI*0HH9&5F:6YE("LQ("AX*2`H*R!X(#$I*0H[(%-E8W1I;VX@
M,BXQ+C,**&-O;G,@)V$@)R@I*0HG*&$I"BAC;VYS("=A("<H8BDI"B<H82!B
M*0HH8V]N<R`G*&$I("<H8BDI"B<H*&$I(&(I"BAC9'(@)RAA("AB("AC(&0I
M*2DI"B<H*&(@*&,@9"DI*0HH;G5L;#\@)R@I*0HG5`HH;G5L;#\@)R@H*2DI
M"B<H*0HH9&5F:6YE(&QE;F=T:"`H;"D@*&EF("AN=6QL/R!L*2`P("@K,2`H
M;&5N9W1H("AC9'(@;"DI*2DI"BAD969I;F4@8V%A<B`H;"D@*&-A<B`H8V%R
M(&PI*2D**&1E9FEN92!C861R("AL*2`H8V%R("AC9'(@;"DI*0HH9&5F:6YE
M(&-D9'(@*&PI("AC9'(@*&-D<B!L*2DI"BAD969I;F4@8V%D9'(@*&PI("AC
M87(@*&-D<B`H8V1R(&PI*2DI"BAD969I;F4@8V%D87(@*&PI("AC87(@*&-D
M<B`H8V%R(&PI*2DI"BAD969I;F4@8V%D9&1R("AE>'`I("AC87(@*&-D<B`H
M8V1R("AC9'(@97AP*2DI*2D**&1E9FEN92!L:7-T,2`H>"D@*&-O;G,@>"`G
M*"DI*0HH9&5F:6YE(&QI<W0R("AX('DI("AC;VYS('@@*&-O;G,@>2`G*"DI
M*2D**&1E9FEN92!L:7-T,R`H>"!Y('HI("AC;VYS('@@*&-O;G,@>2`H8V]N
M<R!Z("<H*2DI*2D**&QI<W0R("AL:7-T,2`G82D@)V(I"B<H*&$I(&(I"BAD
M969I;F4@;W(@*'@@>2D@*&EF('@@>"!Y*2D**&1E9FEN92!A=&]M/R`H>"D@
M*&]R("AN=6QL/R!X*2`H;W(@*&YU;6)E<C\@>"D@*'-Y;6)O;#\@>"DI*2D*
M*&1E9FEN92!E<75A;"`H;#$@;#(I"B`@("`@("AI9B`H871O;3\@;#$I("@]
M(&PQ(&PR*0H@("`@("`@("`@*&EF("AA=&]M/R!L,BD@)R@I"B`@("`@("`@
M("`@("`@*&EF("AE<75A;"`H8V%R(&PQ*2`H8V%R(&PR*2D*("`@("`@("`@
M("`@("`@("`@("AE<75A;"`H8V1R(&PQ*2`H8V1R(&PR*2D*("`@("`@("`@
M("`@("`@("`@("<H*2DI*2D**&5Q=6%L("=A("=B*0HG*"D**&5Q=6%L("<H
M82`H,2`S*2!C*2`G*&$@*#$@,RD@8RDI"B=4"BAE<75A;"`G*&$@*#$@,RD@
M9"D@)RAA("@Q(#,I(&,I*0HG*"D**&1E9FEN92!A;F0@*'@@>2D@*&EF('@@
M>2!X*2DN"BAD969I;F4@;F]T("AX*2`H:68@>"`G*"D@)U0I*2X**&1E9FEN
M92!D:79I9&5S("AM(&XI("@]("AM;V0@;B!M*2`P*2D**&1E9FEN92`@:6YT
M97)V86PM;&ES="`H;2!N*0H@("`@("AI9B`H/B!M(&XI("<H*2`H8V]N<R!M
M("AI;G1E<G9A;"UL:7-T("@K,2!M*2!N*2DI*0HH:6YT97)V86PM;&ES="`S
M(#<I"B<H,R`T(#4@-B`W*0HH9&5F:6YE(')E;6]V92UM=6QT:7!L97,@*&X@
M;"D*("`@("`@("AI9B`H;G5L;#\@;"D@)R@I"B`@("`@("`H:68@("AD:79I
M9&5S(&X@*&-A<B!L*2D*("`@("`@("`@("`@("`@("`@("`@("`@("`H<F5M
M;W9E+6UU;'1I<&QE<R!N("AC9'(@;"DI"B`@("`@("`@("`@("`H8V]N<R`H
M8V%R(&PI("AR96UO=F4M;75L=&EP;&5S(&X@*&-D<B!L*2DI*2DI"BAR96UO
M=F4M;75L=&EP;&5S(#(@)R@R(#,@-"`U(#8@-RDI"B<H,R`U(#<I"BAD969I
M;F4@<VEE=F4@*&PI"B`@("`@*&EF("AN=6QL/R!L*2`G*"D*("`@("`@("`@
M("AC;VYS("AC87(@;"D@*'-I979E("AR96UO=F4M;75L=&EP;&5S("AC87(@
M;"D@*&-D<B!L*2DI*2DI"BAD969I;F4@<')I;65S/#T@*&XI("AS:65V92`H
M:6YT97)V86PM;&ES="`R(&XI*2D**'!R:6UE<SP](#$P*0HG*#(@,R`U(#<I
M"BAD969I;F4@:6YS97)T("AX(&PI"B`@("`@*&EF("AN=6QL/R!L*2`H;&ES
M=#$@>"D*("`@("`@*&EF("@\('@@*&-A<B!L*2D@("AC;VYS('@@;"D*("`@
M("`@("`@*&-O;G,@*&-A<B!L*2AI;G-E<G0@>"`H8V1R(&PI*2DI*2D**&1E
M9FEN92!I;G-E<G1I;VXM<V]R="`H;"D*("`@*&EF("AN=6QL/R!L*2`G*"D*
M("`@("AI;G-E<G0@*&-A<B!L*2`H:6YS97)T:6]N+7-O<G0@*&-D<B!L*2DI
M*2D**&EN<V5R=&EO;BUS;W)T("<H-"`S(#(@-B`X(#4I*0HG*#(@,R`T(#4@
M-B`X*0H@*&1E9FEN92!A<W-O8R`H>"!A;&ES="D@"B`@("`@*&EF("AN=6QL
M/R!A;&ES="D@)R@I"B`@("`@("`@("AI9B`@*#T@>"`H8V%A<B!A;&ES="DI
M("AC861A<B!A;&ES="D*("`@("`@("`@("`@("AA<W-O8R!X("AC9'(@86QI
M<W0I*2DI*0HH87-S;V,@)U4@)R@H12!C;VQI*2A)($-H:6YG*2A5(%1H86YT
M*2DI"B=4:&%N=`HH9&5F:6YE(&UK87-S;V,@*'@@>2!A;&ES="D*("`@("`H
M:68@*&YU;&P_(&%L:7-T*0H@("`@("`@("`@*&QI<W0Q("AL:7-T,B!X('DI
M*0H@("`@("`@("`H:68@("@]('@@*&-A87(@86QI<W0I*2`H8V]N<R`H;&ES
M=#(@>"!Y*2`H8V1R(&%L:7-T*2D*("`@("`@("`@("`H8V]N<R`H8V%R(&%L
M:7-T*2`H;6MA<W-O8R!X('D@*&-D<B!A;&ES="DI*2DI*0HH<V5T(&%L("AM
M:V%S<V]C("=)("=#:&EN9R`G*"DI*0HG*"A)($-H:6YG*2D**'-E="!A;"`H
M;6MA<W-O8R`G12`G8V]L:2!A;"DI"B<H*$D@0VAI;F<I*$4@0V]L:2DI"BAS
M970@86P@*&UK87-S;V,@)TD@)TUA9VYI;B!A;"DI"B<H*$D@36%G;FEN*2A%
M(&-O;&DI*0HH87-S;V,@)TD@86PI"B=-86=N:6X**'-E="!F<G5I=',@)R@H
M87!P;&4@*"AT97AT=7)E(&-R=6YC:'DI*2DH8F%N86YA("@H8V]L;W(@>65L
M;&]W*2DI*2D**&1E9FEN92!G971P<F]P("AX('`@<&QI<W0I"B`@("`@.R!F
M:6YD('!R;W!E<G1Y('`@;V8@:6YD:79I9'5A;"!X(&EN('!L:7-T"B`@("`@
M*&%S<V]C('`@*&%S<V]C('@@<&QI<W0I*2D**&=E='!R;W`@)V%P<&QE("=T
M97AT=7)E(&9R=6ET<RD*)V-R=6YC:'D**&1E9FEN92!P=71P<F]P("AX('`@
M>2!P;&ES="D*("`@("`[(&=I=F4@:6YD:79I9'5A;"!X('9A;'5E('D@9F]R
M('!R;W!E<G1Y('`*("`@("`@("`H;6MA<W-O8R!X("AM:V%S<V]C('`@>2`H
M87-S;V,@>"!P;&ES="DI('!L:7-T*2D**'-E="!F<G5I=',@*'!U='!R;W`@
M)V%P<&QE("=C;VQO<B`G<F5D(&9R=6ET<RDI"B<H*&%P<&QE("@H=&5X='5R
M92!C<G5N8VAY*2AC;VQO<B!R960I*2DH8F%N86YA("@H8V]L;W(@>65L;&]W
M*2DI*2D**&=E='!R;W`@)V%P<&QE("=C;VQO<B!F<G5I=',I"B=R960**&1E
M9FEN92!H87-P<F]P/R`H<"!Y(&%L:7-T*2`H/2`H87-S;V,@<"!A;&ES="D@
M>2DI"B`H9&5F:6YE("!G871H97)P<F]P("AP('D@<&QI<W0I"B`@("`@.R!G
M970@86QL(&EN9&EV:61U86QS(&AA=FEN9R!V86QU92!Y(&9O<B!P<F]P97)T
M>2!P"B`@("`@("`@*&EF("`H;G5L;#\@<&QI<W0I("<H*0H@("`@("`@("`@
M("`@("AI9B`@*&AA<W!R;W`_('`@>2`H8V%D87(@<&QI<W0I*0H@("`@("`@
M("`@("`@("`@("`@("AC;VYS("AC86%R('!L:7-T*2`H9V%T:&5R<')O<"!P
M('D@*&-D<B!P;&ES="DI*0H@("`@("`@("`@("`@("`@("`@("AG871H97)P
M<F]P('`@>2`H8V1R('!L:7-T*2DI*2D**'-E="!F<G5I=',@*'!U='!R;W`@
M)VQE;6]N("=C;VQO<B`G>65L;&]W(&9R=6ET<RDI"B<H*&%P<&QE("@H=&5X
M='5R92!C<G5N8VAY*2`N+BX@*&QE;6]N("@H8V]L;W(@>65L;&]W*2DI*2DI
M"BAG871H97)P<F]P("=C;VQO<B`G>65L;&]W(&9R=6ET<RD*)RAB86YA;F$@
M;&5M;VXI"BAS970@;G5L;'-E="`G*"DI"B<H*0HH9&5F:6YE(&%D9&5L="`H
M>"!S*0H@("`H:68@*&UE;6)E<C\@>"!S*2!S("AC;VYS('@@<RDI*0HH9&5F
M:6YE(&UE;6)E<C\@*'@@<RD*("`@("`H:68@*&YU;&P_(',I("<H*0H@("`@
M("`@("`H:68@*&5Q=6%L('@@*&-A<B!S*2D@)U0@*&UE;6)E<C\@>"`H8V1R
M(',I*2DI*0HH9&5F:6YE('-I>F4@*',I("AL96YG=&@@<RDI"BAD969I;F4@
M=6YI;VX@*',Q(',R*0H@("`@("AI9B`H;G5L;#\@<S$I(',R"B`@("`@("`@
M("AI9B`H;65M8F5R/R`H8V%R(',Q*2!S,BD*("`@("`@("`@("`@("`@("AU
M;FEO;B`H8V1R(',Q*2!S,BD*("`@("`@("`@("`@("AC;VYS("AC87(@<S$I
M("AU;FEO;B`H8V1R(',Q*2!S,BDI*2DI"BAS970@<R`H861D96QT(#,@*&%D
M9&5L="`G82!N=6QL<V5T*2DI"B<H,R!A*0HH;65M8F5R/R`G82!S*0HG5`HH
M=6YI;VX@<R`H861D96QT(#(@*&%D9&5L="`S(&YU;&QS970I*2D*)RAA(#(@
M,RD**'-E="!T("AA9&1E;'0@)RAA(&(I("AA9&1E;'0@,2!N=6QL<V5T*2DI
M"B<H*&$@8BD@,2D**&UE;6)E<C\@)RAA(&(I('0I"B=4"BAD969I;F4@<W5M
M("AL*0H@("`H:68@*&YU;&P_(&PI(#`*("`@("`H:68@*&YU;6)E<C\@;"D@
M;`H@("`@("`@*"L@*'-U;2`H8V%R(&PI*2`H<W5M("AC9'(@;"DI*2DI*0HH
M9&5F:6YE('=R;VYG+7-U;2`H;"D*("`@*&EF("AN=6QL/R!L*2`P"B`@("`@
M*&EF("AN=6UB97(_(&PI(&P*("`@("`@("AB96=I;@H@("`@("`@("`H<V5T
M('1M<"`H=W)O;F<M<W5M("AC87(@;"DI*0H@("`@("`@("`H*R`H=W)O;F<M
M<W5M("AC9'(@;"DI('1M<"DI*2DI"BAS=6T@)R@Q(#(@,R`T*2D*,3`**'=R
M;VYG+7-U;2`G*#$@,B`S(#0I*0HQ-@HH9&5F:6YE(')I9VAT+7-U;2`H;"D@
M*')I9VAT+7-U;2UA=7@@;"`P*2D**&1E9FEN92!R:6=H="US=6TM875X("AL
M('1M<"D*("`@("AI9B`H;G5L;#\@;"D@,`H@("`@("`@*&EF("AN=6UB97(_
M(&PI(&P*("`@("`@("`@("AB96=I;@H@("`@("`@("`@("`@*'-E="!T;7`@
M*')I9VAT+7-U;2`H8V%R(&PI*2D*("`@("`@("`@("`@("@K("AR:6=H="US
M=6T@*&-D<B!L*2D@=&UP*2DI*2D**')I9VAT+7-U;2`G*#$@,B`S(#0I*0HQ
M,`HH9&5F:6YE('!R92UO<F0@*'1R964I"B`@("`@*&EF("AA=&]M/R!T<F5E
M*2`H<')I;G0@=')E92D*("`@("`@("`@*&)E9VEN"B`@("`@("`@("`@("`H
M<')I;G0@*&-A<B!T<F5E*2D*("`@("`@("`@("`@("AP<F4M;W)D("AC861R
M('1R964I*0H@("`@("`@("`@("`@*'!R92UO<F0@*&-A9&1R('1R964I*2DI
M*0HH<')E+6]R9"`G*$$@*$(@0R!$*2`H12`H1B!'($@I($DI*2D*)RAO=71P
M=70@:7,@02!"($,@1"!%($8@1R!(($DI"CL@475E=64@;W!E<F%T:6]N<PHH
M<V5T(&5M<'1Y+7%U975E("<H*2D**&1E9FEN92!F<F]N="`H<2D@*&-A<B!Q
M*2D**&1E9FEN92!R;2UF<F]N="`H<2D@*&-D<B!Q*2D**&1E9FEN92!E;G%U
M975E("AT('$I"B`@("AI9B`H;G5L;#\@<2D@*&QI<W0Q('0I("AC;VYS("AC
M87(@<2D@*&5N<75E=64@="`H8V1R('$I*2DI*0HH9&5F:6YE(&5M<'1Y/R`H
M<2D@*&YU;&P_('$I*0H[($QE=F5L+6]R9&5R('1R879E<G-A;`HH9&5F:6YE
M(&QE=F5L+6]R9"`H=')E92D@*&QE=F5L+6]R9"H@*&5N<75E=64@=')E92!E
M;7!T>2UQ=65U92DI*0HH9&5F:6YE(&QE=F5L+6]R9"H@*&YO9&4M<2D*("`@
M*&EF("AE;7!T>3\@;F]D92UQ*2`G*"D*("`@("`H8F5G:6X*("`@("`@("AS
M970@=&AI<RUN;V1E("AF<F]N="!N;V1E+7$I*0H@("`@("`@*&EF("AA=&]M
M/R!T:&ES+6YO9&4I"B`@("`@("`@("`@("`@("`@*&)E9VEN"B`@("`@("`@
M("`@("`@("`@("`@("`H<')I;G0@=&AI<RUN;V1E*0H@("`@("`@("`@("`@
M("`@("`@("`@*&QE=F5L+6]R9"H@*')M+69R;VYT(&YO9&4M<2DI*0H@("`@
M("`@("`H8F5G:6X*("`@("`@("`@("`H<')I;G0@*&-A<B!T:&ES+6YO9&4I
M*0H@("`@("`@("`@("AL979E;"UO<F0J"B`@("`@("`@("`@("`H96YQ=65U
M92`H8V%D9'(@=&AI<RUN;V1E*0H@("`@("`@("`@("`@("`H96YQ=65U92`H
M8V%D<B!T:&ES+6YO9&4I("AR;2UF<F]N="!N;V1E+7$I*2DI*2DI*2D**&QE
M=F5L+6]R9"`G*$$@*$(@0R!$*2`H12`H1B!'($@I($DI*2D*)RAO=71P=70@
M:7,@02!"($4@0R!$($4@1B!)($<@2"D*.R!396-T:6]N(#(N,PHH9&5F:6YE
M(&EN=&5R("AS,2!S,BD*("`@("`H:68@*&YU;&P_(',Q*2!S,0H@("`@("`@
M("`@*&EF("AM96UB97(_("AC87(@<S$I(',R*0H@("`@("`@("`@("`@("`H
M8V]N<R`H8V%R(',Q*2`H:6YT97(@*&-D<B!S,2D@<S(I*0H@("`@("`@("`@
M("`@("`H:6YT97(@*&-D<B!S,2D@<S(I*2DI"BAD969I;F4@9&EF9B`H<S$@
M<S(I"B`@("`@*&EF("AN=6QL/R!S,2D@<S$*("`@("`@("`@*&EF("AN=6QL
M/R!S,BD@<S$*("`@("`@("`@("`@("`H:68@*&UE;6)E<C\@*&-A<B!S,2D@
M<S(I"B`@("`@("`@("`@("`@("`@("`H9&EF9B`H8V1R(',Q*2!S,BD*("`@
M("`@("`@("`@("`@("`@("AC;VYS("AC87(@<S$I("AD:69F("AC9'(@<S$I
M(',R*2DI*2DI"BAD969I;F4@54Y)3TX@*'(@<RD*("`@("`H:68@*&YO="`H
M97%U86P@*&-A<B!R*2`H8V%R(',I*2D*("`@("`@("`@("AP<FEN="`G97)R
M;W(I"B`@("`@("`@("`H8V]N<R`H8V%R('(I("AU;FEO;B`H8V1R('(I("AC
M9'(@<RDI*2DI"BAD969I;F4@24Y415(@*'(@<RD*("`@("`H:68@*&YO="`H
M97%U86P@*&-A<B!R*2`H8V%R(',I*2D*("`@("`@("`@("AP<FEN="`G97)R
M;W(I"B`@("`@("`@("`H8V]N<R`H8V%R('(I("AI;G1E<B`H8V1R('(I("AC
M9'(@<RDI*2DI"BAD969I;F4@1$E&1B`H<B!S*0H@("`@("AI9B`H;F]T("AE
M<75A;"`H8V%R('(I("AC87(@<RDI*0H@("`@("`@("`@*'!R:6YT("=E<G)O
M<BD*("`@("`@("`@("AC;VYS("AC87(@<BD@*&1I9F8@*&-D<B!R*2`H8V1R
M(',I*2DI*0HH9&5F:6YE(%-%3$5#5"`H02!V('(I"B`@("`@*&-O;G,@*&-A
M<B!R*2`H:6YC;'5D92UR;W=S('8@*&-O;"UN=6T@02`H8V%R('(I*2`H8V1R
M('(I*2DI"BAD969I;F4@8V]L+6YU;2`H02!!+6QI<W0I"B`@("`@*&EF("@]
M($$@*&-A<B!!+6QI<W0I*2`P"B`@("`@("`@("`H*S$@*&-O;"UN=6T@02`H
M8V1R($$M;&ES="DI*2DI"BAD969I;F4@:6YC;'5D92UR;W=S("AV(&X@<F]W
M<RD*("`@("`H:68@*&YU;&P_(')O=W,I("<H*0H@("`@("`@("`H:68@*#T@
M=B`H;G1H(&X@*&-A<B!R;W=S*2DI"B`@("`@("`@("`@("`@*&-O;G,@*&-A
M<B!R;W=S*2`H:6YC;'5D92UR;W=S('8@;B`H8V1R(')O=W,I*2D*("`@("`@
M("`@("`@("`H:6YC;'5D92UR;W=S('8@;B`H8V1R(')O=W,I*2DI*0HH9&5F
M:6YE(&YT:"`H;B!L*0H@("`@("AI9B`H/2!N(#`I("AC87(@;"D@*&YT:"`H
M+2!N(#$I("AC9'(@;"DI*2D**&1E9FEN92!04D]*14-4("A8('(I"B`@("`@
M*&-O;G,@6"`H:6YC;'5D92UC;VQS*B`H8V]L+6YU;2H@6"`H8V%R('(I*2`H
M8V1R('(I*2DI"BAD969I;F4@8V]L+6YU;2H@*%@@02UL:7-T*0H@("`@("AI
M9B`H;G5L;#\@6"D@)R@I"B`@("`@("`@("`H8V]N<R`H8V]L+6YU;2`H8V%R
M(%@I($$M;&ES="D@*&-O;"UN=6TJ("AC9'(@6"D@02UL:7-T*2DI*0HH9&5F
M:6YE(&EN8VQU9&4M8V]L<RH@*&-O;"UN=6US(')O=W,I"B`@("`@*&EF("AN
M=6QL/R!R;W=S*2!N=6QL<V5T"B`@("`@("`@("`H861D96QT("AI;F-L=61E
M+6-O;',@8V]L+6YU;7,@*&-A<B!R;W=S*2D*("`@("`@("`@("`@("`@("`@
M("`H:6YC;'5D92UC;VQS*B!C;VPM;G5M<R`H8V1R(')O=W,I*2DI*0HH9&5F
M:6YE(&EN8VQU9&4M8V]L<R`H8V]L+6YU;7,@<F]W*0H@("`@("AI9B`H;G5L
M;#\@8V]L+6YU;7,I("<H*0H@("`@("`@("`@*&-O;G,@*&YT:"`H8V%R(&-O
M;"UN=6US*2!R;W<I"B`@("`@("`@("`@("`@("`@("AI;F-L=61E+6-O;',@
M*&-D<B!C;VPM;G5M<RD@<F]W*2DI*0HH9&5F:6YE(&%P<&5N9"`H>"!Y*0H@
M("`@*&EF("AN=6QL/R!X*2!Y("AC;VYS("AC87(@>"D@*&%P<&5N9"`H8V1R
M('@I('DI*2DI"BAD969I;F4@2D])3B`H<B!S*0H@("`@("AB96=I;@H@("`@
M("`@("`@("AS970@:6YT97)S96-T:6]N("AI;G1E<B`H8V%R('(I("AC87(@
M<RDI*0H@("`@("`@("`@("AS970@<BUI;G1E<G-E8W1I;VX@*&-O;"UN=6TJ
M(&EN=&5R<V5C=&EO;B`H8V%R('(I*2D*("`@("`@("`@("`H<V5T(',M:6YT
M97)S96-T:6]N("AC;VPM;G5M*B!I;G1E<G-E8W1I;VX@*&-A<B!S*2DI"B`@
M("`@("`@("`@*'-E="!R+61I9F8M<R`H9&EF9B`H8V%R('(I(&EN=&5R<V5C
M=&EO;BDI"B`@("`@("`@("`@*'-E="!R+61I9F8M<RUC;VQS("AC;VPM;G5M
M*B!R+61I9F8M<R`H8V%R('(I*2D*("`@("`@("`@("`H<V5T(',M9&EF9BUR
M("AD:69F("AC87(@<RD@:6YT97)S96-T:6]N*2D*("`@("`@("`@("`H<V5T
M(',M9&EF9BUR+6-O;',@*&-O;"UN=6TJ(',M9&EF9BUR("AC87(@<RDI*0H@
M("`@("`@*&-O;G,@*&%P<&5N9"!I;G1E<G-E8W1I;VX@*&%P<&5N9"!R+61I
M9F8M<R!S+61I9F8M<BDI"B`@("`@("`@("`@("`@("AJ;VEN+6-O;',J('(M
M:6YT97)S96-T:6]N('(M9&EF9BUS+6-O;',@<RUI;G1E<G-E8W1I;VX*("`@
M("`@("`@("`@("`@("`@("`@("!S+61I9F8M<BUC;VQS("AC9'(@<BD@*&-D
M<B!S*2DI*2D**&1E9FEN92!J;VEN+6-O;',J("A8+7(@<BUC;VQS(%@M<R!S
M+6-O;',@<BUR;W=S(',M<F]W<RD*("`@("AB96=I;@H@("`@("`@("AS970@
M;F5W+7)O=W,@)R@I*0H@("`@("`@("AW:&EL92`H;F]T("AN=6QL/R!R+7)O
M=W,I*0H@("`@("`@("`@("`H8F5G:6X*("`@("`@("`@("`@("`@("AS970@
M<RUT;7`@<RUR;W=S*0H@("`@("`@("`@("`@("`@*'=H:6QE("AN;W0@*&YU
M;&P_(',M=&UP*2D*("`@("`@("`@("`@("`@("`@("`H8F5G:6X*("`@("`@
M("`@("`@("`@("`@("`@("`@*&EF("AE<75A;"`H:6YC;'5D92UC;VQS(%@M
M<B`H8V%R('(M<F]W<RDI"B`@("`@("`@("`@("`@("`@("`@("`@("`@("`@
M("`@("AI;F-L=61E+6-O;',@6"US("AC87(@<RUT;7`I*2D*("`@("`@("`@
M("`@("`@("`@("`@("`@("`@("`H<V5T(&YE=RUR;W=S("AC;VYS("AJ;VEN
M+6-O;',@6"UR('(M8V]L<R!S+6-O;',*("`@("`@("`@("`@("`@("`@("`@
M("`@("`@("`H8V%R('(M<F]W<RD@*&-A<B!S+71M<"DI"B`@("`@("`@("`@
M("`@("`@("`@("`@("`@("`@("`@("!N97<M<F]W<RDI"B`@("`@("`@("`@
M("`@("`@("`@("`@("`@("`@)R@I*0H@("`@("`@("`@("`@("`@("`@("`@
M("`H<V5T(',M=&UP("AC9'(@<RUT;7`I*2DI"B`@("`@("`@("`@("`@("`@
M*'-E="!R+7)O=W,@*&-D<B!R+7)O=W,I*2DI"B`@("`@("`@(&YE=RUR;W=S
M*2D**&1E9FEN92!J;VEN+6-O;',@*%@M<B!R+6-O;',@<RUC;VQS('(M<F]W
M(',M<F]W*0H@("`@*&%P<&5N9"`H:6YC;'5D92UC;VQS(%@M<B!R+7)O=RD*
M("`@("`@("`@*&%P<&5N9"`H:6YC;'5D92UC;VQS('(M8V]L<R!R+7)O=RD*
M("`@("`@("`@("`@("`@("AI;F-L=61E+6-O;',@<RUC;VQS(',M<F]W*2DI
M*0HH<V5T($-224U%4PH@("`@("`@)R@H5FEC=&EM($-R:6UE($-R:6UI;F%L
M($QO8V%T:6]N*0H@("`@("`@("`@("A0:&5L<',@<F]B8F5R>2!(87)R:7-O
M;B!,;VYD;VXI"B`@("`@("`@("`@*$1R96)B97(@;75R9&5R($AO<&4@3&]N
M9&]N*0H@("`@("`@("`@("A3:7(M0VAA<FQE<R!M=7)D97(@4W1A<&QE=&]N
M($1E=F]N<VAI<F4I"B`@("`@("`@("`@*$QA9'DM179A(&)L86-K;6%I;"!-
M:6QV97)T;VX@3&]N9&]N*0H@("`@("`@("`@("A"<G5N=&]N(&UU<F1E<B!(
M;W=E;&QS(%=E<W0M4W5S<V5X*2DI"BAS970@35521$524PH@("`@("`@)R@H
M5FEC=&EM(%=E87!O;B!-;W1I=F4I"B`@("`@("`@("`@*$1R96)B97(@('!O
M:7-O;B`@<F5V96YG92D*("`@("`@("`@("`H4VER+4-H87)L97,@(&AO=6YD
M("!G<F5E9"D*("`@("`@("`@("`H0G)U;G1O;B`@8G5R:6%L+6%L:79E("!P
M87-S:6]N*2DI"BA*3TE.($U54D1%4E,*("`@("`@("`@("A04D]*14-4("<H
M5FEC=&EM($-R:6UI;F%L*0H@("`@("`@("`@("`@("`@*%-%3$5#5"`G3&]C
M871I;VX@)TQO;F1O;@H@("`@("`@("`@("`@("`@("`@("`H4T5,14-4("=#
M<FEM92`G;75R9&5R($-224U%4RDI*2D*)R@H5FEC=&EM(%=E87!O;B!-;W1I
M=F4@0W)I;6EN86PI("A$<F5B8F5R('!O:7-O;B!R979E;F=E($AO<&4I*0H[
M(%-E8W1I;VX@,BXT"BAD969I;F4@979A;"`H97AP*0H@("`@("`@("AI9B`@
M*&YU;6)E<C\@97AP*2!E>'`*("`@("`@("`@("`@("`@("AA<'!L>2UO<`H@
M("`@("`@("`@("`@("`@("`H8V%R(&5X<"D*("`@("`@("`@("`@("`@("`@
M("`@("`@*&5V86P@*&-A9'(@97AP*2D*("`@("`@("`@("`@("`@("`@("`@
M("`@*&5V86P@*&-A9&1R(&5X<"DI*2DI"BAD969I;F4@87!P;'DM;W`@*&8@
M>"!Y*0H@("`@("`@("AI9B`H/2!F("<K*2`H*R!X('DI"B`@("`@("`@*&EF
M("@](&8@)RTI("@M('@@>2D*("`@("`@("`H:68@*#T@9B`G*BD@*"H@>"!Y
M*0H@("`@("`@("AI9B`H/2!F("<O*2`H+R!X('DI("=E<G)O<B$I*2DI*0HH
M979A;"`G*"L@,R`H*B`T(#4I*2D*,C,**&5V86P@)R@K(#,@-"DI"C<**&5V
M86P@)R@K("@J(#0@*"\@,3`@,BDI("@M(#<@,RDI*0HR-`H@*&1E9FEN92!E
M=F%L("AE>'`@<FAO*0H@("`@("`@("AI9B`@*&YU;6)E<C\@97AP*2!E>'`*
M("`@("`@("`@("AI9B`@*'-Y;6)O;#\@97AP*2`H87-S;V,@97AP(')H;RD*
M("`@("`@("`@("`@("`@("AA<'!L>2UO<"`@"B`@("`@("`@("`@("`@("`@
M("`@("`H8V%R(&5X<"D*("`@("`@("`@("`@("`@("`@("`@("AE=F%L("AC
M861R(&5X<"D@<FAO*0H@("`@("`@("`@("`@("`@("`@("`@*&5V86P@*&-A
M9&1R(&5X<"D@<FAO*2DI*2D**&5V86P@)R@K(&D@*"\@.2!I*2D@*&UK87-S
M;V,@)VD@,R`G*"DI*0HV"BAD969I;F4@979A;"`H97AP(')H;RD*("`@("`@
M("`H:68@*&YU;6)E<C\@97AP*2!E>'`*("`@("`@("`H:68@*'-Y;6)O;#\@
M97AP*2`H87-S;V,@97AP(')H;RD*("`@("`@("`H:68@*#T@*&-A<B!E>'`I
M("=Q=6]T92D@*&-A9'(@97AP*0H@("`@("`@("AI9B`@*#T@*&QE;F=T:"!E
M>'`I(#(I"B`@("`@("`@("`H87!P;'DM=6YA<GDM;W`@*&-A<B!E>'`I("AE
M=F%L("AC861R(&5X<"D@<FAO*2D*("`@("`@("`@("AA<'!L>2UB:6YA<GDM
M;W`@("AC87(@97AP*0H@("`@("`@("`@("`@("AE=F%L("AC861R(&5X<"D@
M<FAO*0H@("`@("`@("`@("`@("AE=F%L("AC861D<B!E>'`I(')H;RDI"B`@
M("`@("`@*2DI*2D**&1E9FEN92!A<'!L>2UB:6YA<GDM;W`@*&8@>"!Y*0H@
M("`@("`H:68@*#T@9B`G8V]N<RD@*&-O;G,@>"!Y*0H@("`@("`H:68@*#T@
M9B`G*RD@*"L@>"!Y*0H@("`@("`H:68@*#T@9B`G+2D@*"T@>"!Y*0H@("`@
M("`H:68@*#T@9B`G*BD@*"H@>"!Y*0H@("`@("`H:68@*#T@9B`G+RD@*"\@
M>"!Y*0H@("`@("`H:68@*#T@9B`G/"D@*#P@>"!Y*0H@("`@("`H:68@*#T@
M9B`G/BD@*#X@>"!Y*0H@("`@("`H:68@*#T@9B`G/2D@*#T@>"!Y*2`G97)R
M;W(A*2DI*2DI*2DI"BAD969I;F4@87!P;'DM=6YA<GDM;W`@*&8@>"D*("`@
M("`@*&EF("@](&8@)V-A<BD@*&-A<B!X*0H@("`@("`H:68@*#T@9B`G8V1R
M*2`H8V1R('@I"B`@("`@("AI9B`H/2!F("=N=6UB97(_*2`H;G5M8F5R/R!X
M*0H@("`@("`H:68@*#T@9B`G;&ES=#\I("AL:7-T/R!X*0H@("`@("`H:68@
M*#T@9B`G<WEM8F]L/RD@*'-Y;6)O;#\@>"D*("`@("`@*&EF("@](&8@)VYU
M;&P_*2`H;G5L;#\@>"D@)V5R<F]R(2DI*2DI*2D**&5V86P@)RAC87(@*'%U
M;W1E("AA(&(I*2D@)R@I*0HG82`**&5V86P@)RAC;VYS(#,@*&-O;G,@*"L@
M-"`U*2`H<75O=&4@*"DI*2D@)R@I*0HG*#,@.2D@"BAD969I;F4@979A;"`H
M97AP(')H;R!F=6YD969S*0H@("`@("`@("`@*&EF("AN=6UB97(_(&5X<"D@
M97AP"B`@("`@("`@("`H:68@*'-Y;6)O;#\@97AP*2`H87-S;V,@97AP(')H
M;RD*("`@("`@("`@("AI9B`H/2`H8V%R(&5X<"D@)W%U;W1E*2`H8V%D<B!E
M>'`I"B`@("`@("`@("`H:68@("@]("AC87(@97AP*2`G:68I"B`@("`@("`@
M("`@("`@("`@("AI9B`@*&YU;&P_("AE=F%L("AC861R(&5X<"D@<FAO(&9U
M;F1E9G,I*0H@("`@("`@("`@("`@("`@("`@("`@("`@("AE=F%L("AC861D
M9'(@97AP*2!R:&\@9G5N9&5F<RD*("`@("`@("`@("`@("`@("`@("`@("`@
M("`H979A;"`H8V%D9'(@97AP*2!R:&\@9G5N9&5F<RDI"B`@("`@("`@("`H
M:68@*'5S97)F=6X_("AC87(@97AP*2!F=6YD969S*0H@("`@("`@("`@("`@
M("`H87!P;'DM=7-E<F9U;B`H87-S;V,@*&-A<B!E>'`I(&9U;F1E9G,I"B`@
M("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@*&5V86QL:7-T("AC9'(@
M97AP*2!R:&\@9G5N9&5F<RD*("`@("`@("`@("`@("`@("`@("`@("`@("`@
M("`@("!F=6YD969S*0H@("`@("`@("`@("`@*&EF("@]("AL96YG=&@@97AP
M*2`R*0H@("`@("`@("`@("`@("`@("`@("`H87!P;'DM=6YA<GDM;W`@("AC
M87(@97AP*0H@("`@("`@("`@("`@("`@("`@("`@("`@("`@("AE=F%L("AC
M861R(&5X<"D@<FAO(&9U;F1E9G,I*0H@("`@("`@("`@("`@("`@("`@("`H
M87!P;'DM8FEN87)Y+6]P("AC87(@97AP*0H@("`@("`@("`@("`@("`@("`@
M("`@("`@("`@("`@*&5V86P@*&-A9'(@97AP*2!R:&\@9G5N9&5F<RD*("`@
M("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@("`@*&5V86P@*&-A9&1R
M(&5X<"D@<FAO(&9U;F1E9G,I*2DI*2DI*2DI"BAD969I;F4@=7-E<F9U;C\@
M*&8@9G5N9&5F<RD@*&%S<V]C(&8@9G5N9&5F<RDI"BAD969I;F4@87!P;'DM
M=7-E<F9U;B`H9G5N9&5F(&%R9W,@9G5N9&5F<RD*("`@("`@("`@("AE=F%L
M("AC861R(&9U;F1E9BD@.R!B;V1Y(&]F(&9U;F-T:6]N"B`@("`@("`@("`@
M("`@("`@("AM:V%S<V]C*B`H8V%R(&9U;F1E9BD@87)G<R`G*"DI(#L@;&]C
M86P@96YV"B`@("`@("`@("`@("`@("`@(&9U;F1E9G,I*0HH9&5F:6YE(&5V
M86QL:7-T("AE;"!R:&\@9G5N9&5F<RD*("`@("`H:68@*&YU;&P_(&5L*2`G
M*"D*("`@("`@("`@("AC;VYS("AE=F%L("AC87(@96PI(')H;R!F=6YD969S
M*0H@("`@("`@("`@("`@("`@("`H979A;&QI<W0@*&-D<B!E;"D@<FAO(&9U
M;F1E9G,I*2DI"BAD969I;F4@;6MA<W-O8RH@*&ME>7,@=F%L=65S(&%L*0H@
M("`@("AI9B`H;G5L;#\@:V5Y<RD@86P*("`@("`@("`@("AM:V%S<V]C*B`H
M8V1R(&ME>7,I("AC9'(@=F%L=65S*0H@("`@("`@("`@("`@("`@("`H;6MA
M<W-O8R`H8V%R(&ME>7,I("AC87(@=F%L=65S*2!A;"DI*2D**'-E="!%("AM
M:V%S<V]C("=D;W5B;&4@)R@H82D@*"L@82!A*2D@)R@I*2D*)R@H9&]U8FQE
M("@H82D@*"L@82!A*2DI*0HH979A;"`G*&1O=6)L92`H8V%R("AQ=6]T92`H
M-"`U*2DI*2`G*"D@12D*.`HH<V5T($4@*&UK87-S;V,@("=E>'`*("`@("`@
M("`@("`@("`@)R@H;2!N*2`H:68@*#T@;B`P*2`Q("@J(&T@*&5X<"!M("@M
M(&X@,2DI*2DI"B`@("`@("`@("`@("`@("<H*2DI"B<H*&5X<"`H*&T@;BD@
M*&EF("@](&X@,"D@,2`H*B!M("AE>'`@;2`H+2!N(#$I*2DI*2DI"BAE=F%L
M("<H97AP(#0@,RD@)R@I($4I"C8T"BAD969I;F4@<BUE+7`M;&]O<"`H:6YP
M=71S*2`H<BUE+7`M;&]O<"H@:6YP=71S("<H*2DI"BAD969I;F4@<BUE+7`M
M;&]O<"H@*&EN<'5T<R!F=6YD969S*0H@("`@*&EF("AN=6QL/R!I;G!U=',I
M("<H*2`[('-E<W-I;VX@9&]N90H@("`@("`@("`H:68@*&%T;VT_("AC87(@
M:6YP=71S*2D@.R!I;G!U="!I<R!V87)I86)L92!O<B!N=6UB97(*("`@("`@
M("`@("`@("`H<')O8V5S<RUE>'`@*&-A<B!I;G!U=',I("AC9'(@:6YP=71S
M*2!F=6YD969S*0H@("`@("`@("`@("`@("AI9B`H/2`H8V%A<B!I;G!U=',I
M("=D969I;F4I(#L@:6YP=70@:7,@9G5N8W1I;VX@9&5F:6YI=&EO;@H@("`@
M("`@("`@("`@("`@("`@*'!R;V-E<W,M9&5F("AC87(@:6YP=71S*2`H8V1R
M(&EN<'5T<RD@9G5N9&5F<RD*("`@("`@("`@("`@("`@("`@("AP<F]C97-S
M+65X<"`H8V%R(&EN<'5T<RD@*&-D<B!I;G!U=',I(&9U;F1E9G,I*2DI*0HH
M9&5F:6YE('!R;V-E<W,M9&5F("AE(&EN<'5T<R!F=6YD969S*0H@("`@("`@
M*&-O;G,@*&-A9'(@92D@.R!E8VAO(&9U;F-T:6]N(&YA;64*("`@("`@("`@
M("`@("`@*'(M92UP+6QO;W`J(&EN<'5T<PH@("`@("`@("`@("`@("`@("`@
M("AM:V%S<V]C("AC861R(&4I("AC9&1R(&4I(&9U;F1E9G,I*2DI"BAD969I
M;F4@<')O8V5S<RUE>'`@*&4@:6YP=71S(&9U;F1E9G,I"B`@("`@("`H8V]N
M<R`H979A;"!E("<H*2!F=6YD969S*2`[('!R:6YT('9A;'5E(&]F(&5X<')E
M<W-I;VX*("`@("`@("`@("`@("`@*'(M92UP+6QO;W`J(&EN<'5T<R!F=6YD
M969S*2DI"BAR+64M<"UL;V]P("<H"B`@("`@("AD969I;F4@9&]U8FQE("AA
M*2`H*R!A(&$I*0H@("`@("`H9&]U8FQE("AC87(@*'%U;W1E("@T(#4I*2DI
M"B`@("`@("AD969I;F4@97AP("AM(&XI("AI9B`H/2!N(#`I(#$@*"H@;2`H
M97AP(&T@*"T@;B`Q*2DI*2D*("`@("`@*&5X<"`T(#,I"B`@("`@("DI"B<H
M9&]U8FQE(#@@97AP(#8T*0IQ=6ET"BAR+64M<"UL;V]P("<H"B`@*&1E9FEN
M92!C861R("AE>'`I("AC87(@*&-D<B!E>'`I*2D*("`H9&5F:6YE(&-D9'(@
M*&5X<"D@*&-D<B`H8V1R(&5X<"DI*0H@("AD969I;F4@8V%A<B`H97AP*2`H
M8V%R("AC87(@97AP*2DI"B`@*&1E9FEN92!C861D<B`H97AP*2`H8V%R("AC
M9'(@*&-D<B!E>'`I*2DI"B`@*&1E9FEN92!C861D9'(@*&5X<"D@*&-A<B`H
M8V1R("AC9'(@*&-D<B!E>'`I*2DI*0H@("AD969I;F4@8V%D87(@*&5X<"D@
M*&-A<B`H8V1R("AC87(@97AP*2DI*0H@("AD969I;F4@;&ES=#(@*'@@>2D@
M*&-O;G,@>"`H8V]N<R!Y("AQ=6]T92`H*2DI*2D*("`H9&5F:6YE("LQ("AX
M*2`H*R!X(#$I*0H@("AD969I;F4@;&5N9W1H("AL*2`H:68@*&YU;&P_(&PI
M(#`@*"LQ("AL96YG=&@@*&-D<B!L*2DI*2D*("`H9&5F:6YE("!A<W-O8R`H
M>"!A;&ES="D@"B`@("`@("`H:68@*&YU;&P_(&%L:7-T*2`H<75O=&4@*"DI
M"B`@("`@("`@("`@*&EF("`H/2!X("AC86%R(&%L:7-T*2D@*&-A9&%R(&%L
M:7-T*0H@("`@("`@("`@("`@("`H87-S;V,@>"`H8V1R(&%L:7-T*2DI*2D*
M("`H9&5F:6YE(&UK87-S;V,@*'@@>2!A;&ES="D*("`@("`@("AI9B`H;G5L
M;#\@86QI<W0I"B`@("`@("`@("`@("AC;VYS("AL:7-T,B!X('DI("AQ=6]T
M92`H*2DI"B`@("`@("`@("`@*&EF("`H/2!X("AC86%R(&%L:7-T*2D@*&-O
M;G,@*&QI<W0R('@@>2D@*&-D<B!A;&ES="DI"B`@("`@("`@("`@("`H8V]N
M<R`H8V%R(&%L:7-T*2`H;6MA<W-O8R!X('D@*&-D<B!A;&ES="DI*2DI*0H@
M("AD969I;F4@;6MA<W-O8RH@*&ME>7,@=F%L=65S(&%L*0H@("`@("AI9B`H
M;G5L;#\@:V5Y<RD@86P*("`@("`@("`H;6MA<W-O8RH@*&-D<B!K97ES*2`H
M8V1R('9A;'5E<RD*("`@("`@("`@("`@*&UK87-S;V,@*&-A<B!K97ES*2`H
M8V%R('9A;'5E<RD@86PI*2DI"B`@*&1E9FEN92`@979A;"`H97AP(')H;R!F
M=6YD969S*0H@("`@("`@("`@*&EF("AN=6UB97(_(&5X<"D@97AP"B`@("`@
M("`@("`H:68@*'-Y;6)O;#\@97AP*2`H87-S;V,@97AP(')H;RD*("`@("`@
M("`@("AI9B`H/2`H8V%R(&5X<"D@*'%U;W1E('%U;W1E*2D@*&-A9'(@97AP
M*0H@("`@("`@("`@*&EF("`H/2`H8V%R(&5X<"D@*'%U;W1E(&EF*2D*("`@
M("`@("`@("`@("`@("AI9B`@*&YU;&P_("AE=F%L("AC861R(&5X<"D@<FAO
M(&9U;F1E9G,I*0H@("`@("`@("`@("`@("`@("`@("`@*&5V86P@*&-A9&1D
M<B!E>'`I(')H;R!F=6YD969S*0H@("`@("`@("`@("`@("`@("`@("`@*&5V
M86P@*&-A9&1R(&5X<"D@<FAO(&9U;F1E9G,I*0H@("`@("`@("`@*&EF("AU
M<V5R9G5N/R`H8V%R(&5X<"D@9G5N9&5F<RD*("`@("`@("`@("`@("AA<'!L
M>2UU<V5R9G5N("AA<W-O8R`H8V%R(&5X<"D@9G5N9&5F<RD*("`@("`@("`@
M("`@("`@("`@("`@("`@("`@("AE=F%L;&ES="`H8V1R(&5X<"D@<FAO(&9U
M;F1E9G,I"B`@("`@("`@("`@("`@("`@("`@("`@("`@("!F=6YD969S*0H@
M("`@("`@("`@("`@*&EF("@]("AL96YG=&@@97AP*2`R*0H@("`@("`@("`@
M("`@("`@("`@*&%P<&QY+75N87)Y+6]P("`H8V%R(&5X<"D*("`@("`@("`@
M("`@("`@("`@("`@("`@("AE=F%L("AC861R(&5X<"D@<FAO(&9U;F1E9G,I
M(&9U;F1E9G,I"B`@("`@("`@("`@("`@("`@("`H87!P;'DM8FEN87)Y+6]P
M("AC87(@97AP*0H@("`@("`@("`@("`@("`@("`@("`@("`@("`H979A;"`H
M8V%D<B!E>'`I(')H;R!F=6YD969S*0H@("`@("`@("`@("`@("`@("`@("`@
M("`@("`@("`@("`@("AE=F%L("AC861D<B!E>'`I(')H;R!F=6YD969S*2DI
M*2DI*2DI"B`@*&1E9FEN92!A<'!L>2UU;F%R>2UO<"`H9B!X(&9U;F1E9G,I
M"B`@("`@("`@*&EF("@](&8@*'%U;W1E(&-A<BDI("AC87(@>"D*("`@("`@
M("`H:68@*#T@9B`H<75O=&4@8V1R*2D@*&-D<B!X*0H@("`@("`@("AI9B`H
M/2!F("AQ=6]T92!N=6UB97(_*2D@*&YU;6)E<C\@>"D*("`@("`@("`H:68@
M*#T@9B`H<75O=&4@;&ES=#\I*2`H;&ES=#\@>"D*("`@("`@("`H:68@*#T@
M9B`H<75O=&4@<WEM8F]L/RDI("AS>6UB;VP_('@I"B`@("`@("`@*&EF("@]
M(&8@*'%U;W1E(&YU;&P_*2D@*&YU;&P_('@I("AQ=6]T92!E<G)O<B$I*2DI
M*2DI*0H@("AD969I;F4@87!P;'DM8FEN87)Y+6]P("AF('@@>2D*("`@("`@
M("`H:68@*#T@9B`H<75O=&4@8V]N<RDI("AC;VYS('@@>2D*("`@("`@("`H
M:68@*#T@9B`H<75O=&4@*RDI("@K('@@>2D*("`@("`@("`H:68@*#T@9B`H
M<75O=&4@+2DI("@M('@@>2D*("`@("`@("`H:68@*#T@9B`H<75O=&4@*BDI
M("@J('@@>2D*("`@("`@("`H:68@*#T@9B`H<75O=&4@+RDI("@O('@@>2D*
M("`@("`@("`H:68@*#T@9B`H<75O=&4@/"DI("@\('@@>2D*("`@("`@("`H
M:68@*#T@9B`H<75O=&4@/BDI("@^('@@>2D*("`@("`@("`H:68@*#T@9B`H
M<75O=&4@/2DI("@]('@@>2D@*'%U;W1E(&5R<F]R(2DI*2DI*2DI*2D*("`H
M9&5F:6YE('5S97)F=6X_("AF(&9U;F1E9G,I("AA<W-O8R!F(&9U;F1E9G,I
M*0H@("AD969I;F4@87!P;'DM=7-E<F9U;B`H9G5N9&5F(&%R9W,@9G5N9&5F
M<RD*("`@("`@("`@("AE=F%L("AC861R(&9U;F1E9BD@.R!B;V1Y(&]F(&9U
M;F-T:6]N"B`@("`@("`@("`@("`@("`H;6MA<W-O8RH@*&-A<B!F=6YD968I
M(&%R9W,@*'%U;W1E("@I*2D@.R!L;V-A;"!E;G8*("`@("`@("`@("`@("`@
M(&9U;F1E9G,I*0H@("AD969I;F4@979A;&QI<W0@*&5L(')H;R!F=6YD969S
M*0H@("`@("AI9B`H;G5L;#\@96PI("AQ=6]T92`H*2D*("`@("`@("`H8V]N
M<R`H979A;"`H8V%R(&5L*2!R:&\@9G5N9&5F<RD*("`@("`@("`@("`@("`H
M979A;&QI<W0@*&-D<B!E;"D@<FAO(&9U;F1E9G,I*2DI"B`@*&1E9FEN92!R
M+64M<"UL;V]P("AI;G!U=',I("AR+64M<"UL;V]P*B!I;G!U=',@*'%U;W1E
M("@I*2DI"B`@*&1E9FEN92!R+64M<"UL;V]P*B`H:6YP=71S(&9U;F1E9G,I
M"B`@("`H:68@*&YU;&P_(&EN<'5T<RD@*'%U;W1E("@I*0H@("`@("`@*&EF
M("AL:7-T/R`H8V%R(&EN<'5T<RDI"B`@("`@("`@("`H:68@*#T@*&-A87(@
M:6YP=71S*2`H<75O=&4@9&5F:6YE*2D*("`@("`@("`@("`@("AP<F]C97-S
M+61E9B`H8V%R(&EN<'5T<RD@*&-D<B!I;G!U=',I(&9U;F1E9G,I"B`@("`@
M("`@("`@("`H<')O8V5S<RUE>'`@*&-A<B!I;G!U=',I("AC9'(@:6YP=71S
M*2!F=6YD969S*2D*("`@("`@("`@("AP<F]C97-S+65X<"`H8V%R(&EN<'5T
M<RD@*&-D<B!I;G!U=',I(&9U;F1E9G,I*2DI"B`@*&1E9FEN92!P<F]C97-S
M+61E9B`H92!I;G!U=',@9G5N9&5F<RD*("`@("`@("AC;VYS("AC861R(&4I
M"B`@("`@("`@("`@("`H<BUE+7`M;&]O<"H@:6YP=71S"B`@("`@("`@("`@
M("`@("`H;6MA<W-O8R`H8V%D<B!E*2`H8V1D<B!E*2!F=6YD969S*2DI*0H@
M("AD969I;F4@<')O8V5S<RUE>'`@*&4@:6YP=71S(&9U;F1E9G,I"B`@("`@
M("`H8V]N<R`H979A;"!E("AQ=6]T92`H*2D@9G5N9&5F<RD*("`@("`@("`@
M("`@("AR+64M<"UL;V]P*B!I;G!U=',@9G5N9&5F<RDI*0H@("AR+64M<"UL
M;V]P("AQ=6]T92`H"B`@("`H9&5F:6YE(&1O=6)L92`H82D@*"L@82!A*2D*
M("`@("AD;W5B;&4@*&-A<B`H<75O=&4@*#0@-2DI*2D*("`@("DI*0HI*0HG
M*&-A9'(@8V1D<B!C86%R(&-A9&1R(&-A9&1D<B!C861A<B!L:7-T,B`K,2!L
M96YG=&@@87-S;V,@;6MA<W-O8R!M:V%S<V]C*B!E=F%L(&%P<&QY+75N87)Y
M+6]P(&%P<&QY+6)I;F%R>2UO<"!U<V5R9G5N/R!A<'!L>2UU<V5R9G5N(&5V
M86QL:7-T('(M92UP+6QO;W`@<BUE+7`M;&]O<"H@<')O8V5S<RUD968@<')O
:8V5S<RUE>'`@*&1O=6)L92`X*2D*<75I=`IO
`
end
SHAR_EOF
  (set 19 90 01 05 18 00 25 'c-distr/code.lsp'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code.lsp'
if test $? -ne 0
then ${echo} 'restore of c-distr/code.lsp failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code.lsp: MD5 check failed'
       ) << SHAR_EOF
5db39d2afea7e9a6f24b19261a4dd10f  c-distr/code.lsp
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code.lsp'` -ne 18116 && \
  ${echo} 'restoration warning:  size of c-distr/code.lsp is not 18116'
  fi
fi
# ============= c-distr/code.sch.out ==============
if test -f 'c-distr/code.sch.out' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code.sch.out (file already exists)'
else
${echo} 'x - extracting c-distr/code.sch.out (binary)'
  sed 's/^X//' << 'SHAR_EOF' | uudecode &&
begin 600 c-distr/code.sch.out
M+3X@+3X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R93X*"BT^(#QC;&]S=7)E/@H*
M+3X@/B`\8VQO<W5R93X*"BT^(#QC;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM
M/B`\8VQO<W5R93X*"BT^(#X@/B`^(#X@/B`\8VQO<W5R93X*"BT^(#QC;&]S
M=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R93X*"BT^(#QC;&]S=7)E
M/@H*+3X@/B`^(#X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R93X*"BT^(#X@/&-L
M;W-U<F4^"@HM/B`^(#X@/B`^(#QC;&]S=7)E/@H*+3X@/B`^(#X@/&-L;W-U
M<F4^"@HM/B`\8VQO<W5R93X*"BT^("T^(#X@/&-L;W-U<F4^"@HM/B`H-2`W
M*0H*+3X@*#4@-RD*"BT^(#X@/B`^(#QC;&]S=7)E/@H*+3X@*"@R(#DI("@T
M(#4I*0H*+3X@*"@R(#DI("@T(#4I*0H*+3X@/&-L;W-U<F4^"@HM/B`\8VQO
M<W5R93X*"BT^(#4*"BT^(#4*"BT^("T^(#X@/B`\8VQO<W5R93X*"BT^("A4
M("@I("@I("@I*0H*+3X@*%0@*"D@*"D@*"DI"@HM/B`H-"`U(#8I"@HM/B`H
M-"`U(#8I"@HM/B`\8VQO<W5R93X*"BT^("@T(#4@-BD*"BT^("@T(#4@-BD*
M"BT^(#QC;&]S=7)E/@H*+3X@-PH*+3X@-PH*+3X@/&-L;W-U<F4^"@HM/B`\
M8VQO<W5R93X*"BT^("@T(#4@-BD*"BT^("@T(#4@-BD*"BT^(#QC;&]S=7)E
M/@H*+3X@*"@S(#0I("@U(#8I*0H*+3X@*"@S(#0I("@U(#8I*0H*+3X@/B`^
M(#QC;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`S,`H*+3X@,S`*"BT^(#QC
M;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`Q,`H*+3X@,3`*"BT^(#QC;&]S
M=7)E/@H*+3X@,C0*"BT^(#(T"@HM/B`\8VQO<W5R93X*"BT^("@S(#0@-2D*
M"BT^("@S(#0@-2D*"BT^(#QC;&]S=7)E/@H*+3X@/B`^(#X@/&-L;W-U<F4^
M"@HM/B`^(#X@/B`^(#QC;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`^(#QC
M;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`H*#DU(#(Q-S`I("@X-2`Q,#`U
M*2D*"BT^("@H.34@,C$W,"D@*#@U(#$P,#4I*0H*+3X@*"@X-2`Q,#`U*2`H
M.#4@,C$W,"DI"@HM/B`H*#@U(#$P,#4I("@X-2`R,3<P*2D*"BT^(#QC;&]S
M=7)E/@H*+3X@*"@X-2`Q,#`U*2`H.34@,C$W,"DI"@HM/B`H*#@U(#$P,#4I
M("@Y-2`R,3<P*2D*"BT^(#X@/&-L;W-U<F4^"@HM/B`^(#QC;&]S=7)E/@H*
M+3X@/B`\8VQO<W5R93X*"BT^(#QC;&]S=7)E/@H*+3X@/B`H*%)E9&1Y(#(Q
M-S`@.34@.3(I("A+87!L86X@,3`P-2`X-2`X-RDI"@HM/B`H*%)E9&1Y(#(Q
M-S`@.34@.3(I("A+87!L86X@,3`P-2`X-2`X-RDI"@HM/B`\8VQO<W5R93X*
M"BT^(#X@/&-L;W-U<F4^"@HM/B`^(#X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R
M93X*"BT^(#X@*"A+87!L86X@,3`P-2`X-2`X-RD@*%)E9&1Y(#(Q-S`@.34@
M.3(I*0H*+3X@*"A+87!L86X@,3`P-2`X-2`X-RD@*%)E9&1Y(#(Q-S`@.34@
M.3(I*0H*+3X@/B`^(#QC;&]S=7)E/@H*+3X@*"D*"BT^(#QC;&]S=7)E/@H*
M+3X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R93X*"BT^("AA(&(I"@HM/B`H82!B
M*0H*+3X@5`H*+3X@5`H*+3X@*"D*"BT^("@I"@HM/B`H8B!C*0H*+3X@*&(@
M8RD*"BT^("AC(&$@8BD*"BT^("AC(&$@8BD*"BT^(#X@/B`^(#X@/&-L;W-U
M<F4^"@HM/B`^(#QC;&]S=7)E/@H*+3X@/B`H*0H*+3X@*"D*"BT^(#X@5`H*
M+3X@5`H*+3X@/B`\8VQO<W5R93X*"BT^(#X@/&-L;W-U<F4^"@HM/B`\8VQO
M<W5R93X*"BT^(#X@/&-L;W-U<F4^"@HM/B`^(#QC;&]S=7)E/@H*+3X@/B`^
M(#X@/B`^(#X@/&-L;W-U<F4^"@HM/B`H*"D@/&-L;W-U<F4^(#QC;&]S=7)E
M/BD*"BT^("@I"@HM/B`\8VQO<W5R93X*"BT^(#QC;&]S=7)E/@H*+3X@/B`^
M(#X@/&-L;W-U<F4^"@HM/B`Q"@HM/B`Q"@HM/B`^(#X@/&-L;W-U<F4^"@HM
M/B`^(#X@/B`\8VQO<W5R93X*"BT^(#$*"BT^(#$*"BT^(#QC;&]S=7)E/@H*
M+3X@/B`^(#X@/B`\8VQO<W5R93X*"BT^(#$*"BT^(#$*"BT^(#QC;&]S=7)E
M/@H*+3X@/B`^(#X@/B`^(#X@/&-L;W-U<F4^"@HM/B`Q"@HM/B`Q"@HM/B`\
M8VQO<W5R93X*"BT^(#X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R93X*"BT^(#QC
M;&]S=7)E/@H*+3X@,30*"BT^(#$T"@HM/B`Q,S$*"BT^(#$S,0H*+3X@+3X@
M+3X@/B`^(#X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R93X*"BT^("T^(#QC;&]S
M=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`\8VQO<W5R93X*"BT^(#X@/B`^(#X@
M/B`^(#X@/B`^(#X@/B`\8VQO<W5R93X*"BT^(#X@/B`^(#X@/B`^(#X@/&-L
M;W-U<F4^"@HM/B`^(#X@/B`^(#X@/B`\8VQO<W5R93X*"BT^(#X@/B`^(#X@
M/B`^(#QC;&]S=7)E/@H*+3X@/B`^(#X@/B`^(#X@/B`^(#X@/&-L;W-U<F4^
M"@HM/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/&-L;W-U<F4^"@HM/B`^(#QC
M;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`^(#X@/&-L;W-U<F4^"@HM/B`^
M(#QC;&]S=7)E/@H*+3X@/B`^(#X@/B`^(#QC;&]S=7)E/@H*+3X@/B`\8VQO
M<W5R93X*"BT^(#X@/B`^(#X@/B`^("@H*$1X('@I(#$I("@H1'@@8RD@,"D@
M*"A$>"`H*R!8(%DI*2`H*R`H1'@@6"D@*$1X(%DI*2D@*"A$>"`H+2!8(%DI
M*2`H+2`H1'@@6"D@*$1X(%DI*2D@*"A$>"`H*B!8(%DI*2`H*R`H*B!9("A$
M>"!8*2D@*"H@6"`H1'@@62DI*2D@*"A$>"`H+R!8(%DI*2`H+R`H+2`H*B!9
M("A$>"!8*2D@*"H@6"`H1'@@62DI*2`H*B!9(%DI*2DI"@HM/B`\8VQO<W5R
M93X*"BT^("T^("T^("T^(#QC;&]S=7)E/@H*+3X@/&-L;W-U<F4^"@HM/B`\
M8VQO<W5R93X*"BT^(#QC;&]S=7)E/@H*+3X@/B`^(#X@/B`^(#X@/B`^(#X@
M/&-L;W-U<F4^"@HM/B`^(#X@/B`\8VQO<W5R93X*"BT^(#X@/B`^(#QC;&]S
M=7)E/@H*+3X@/B`^(#QC;&]S=7)E/@H*+3X@/B`^(#X@/&-L;W-U<F4^"@HM
M/B`\8VQO<W5R93X*"BT^(#QC;&]S=7)E/@H*+3X@/B`^(#X@/B`^(#X@/B`^
M(#X@/B`^(#X@/B`^(#X@/B`H*"L@*'!R:6UO<"`K*2D@*"T@*'!R:6UO<"`M
M*2D@*&-O;G,@*'!R:6UO<"!C;VYS*2D@*"H@*'!R:6UO<"`J*2D@*"\@*'!R
M:6UO<"`O*2D@*#P@*'!R:6UO<"`\*2D@*#X@*'!R:6UO<"`^*2D@*#T@*'!R
M:6UO<"`]*2D@*&-D<B`H<')I;6]P(&-D<BDI("AC87(@*'!R:6UO<"!C87(I
M*2`H;G5M8F5R/R`H<')I;6]P(&YU;6)E<C\I*2`H;&ES=#\@*'!R:6UO<"!L
M:7-T/RDI("AS>6UB;VP_("AP<FEM;W`@<WEM8F]L/RDI("AN=6QL/R`H<')I
M;6]P(&YU;&P_*2D@*&-L;W-U<F4_("AP<FEM;W`@8VQO<W5R93\I*2`H<')I
M;6]P/R`H<')I;6]P('!R:6UO<#\I*2D*"BT^(#X@/B`^(#X@/B`^(#X@/B`\
M8VQO<W5R93X*"BT^(#X@/B`^(#X@/B`^(#X@/B`\8VQO<W5R93X*"BT^("@H
M*R`H<')I;6]P("LI*2`H+2`H<')I;6]P("TI*2`H8V]N<R`H<')I;6]P(&-O
M;G,I*2`H*B`H<')I;6]P("HI*2`H+R`H<')I;6]P("\I*2`H/"`H<')I;6]P
M(#PI*2`H/B`H<')I;6]P(#XI*2`H/2`H<')I;6]P(#TI*2`H8V1R("AP<FEM
M;W`@8V1R*2D@*&-A<B`H<')I;6]P(&-A<BDI("AN=6UB97(_("AP<FEM;W`@
M;G5M8F5R/RDI("AL:7-T/R`H<')I;6]P(&QI<W0_*2D@*'-Y;6)O;#\@*'!R
M:6UO<"!S>6UB;VP_*2D@*&YU;&P_("AP<FEM;W`@;G5L;#\I*2`H8VQO<W5R
M93\@*'!R:6UO<"!C;&]S=7)E/RDI("AP<FEM;W`_("AP<FEM;W`@<')I;6]P
M/RDI("AD;W5B;&4@*&-L;W-U<F4@*&QA;6)D82`H82D@*"L@82!A*2D@*"@K
M("AP<FEM;W`@*RDI("@M("AP<FEM;W`@+2DI("AC;VYS("AP<FEM;W`@8V]N
M<RDI("@J("AP<FEM;W`@*BDI("@O("AP<FEM;W`@+RDI("@\("AP<FEM;W`@
M/"DI("@^("AP<FEM;W`@/BDI("@]("AP<FEM;W`@/2DI("AC9'(@*'!R:6UO
M<"!C9'(I*2`H8V%R("AP<FEM;W`@8V%R*2D@*&YU;6)E<C\@*'!R:6UO<"!N
M=6UB97(_*2D@*&QI<W0_("AP<FEM;W`@;&ES=#\I*2`H<WEM8F]L/R`H<')I
M;6]P('-Y;6)O;#\I*2`H;G5L;#\@*'!R:6UO<"!N=6QL/RDI("AC;&]S=7)E
M/R`H<')I;6]P(&-L;W-U<F4_*2D@*'!R:6UO<#\@*'!R:6UO<"!P<FEM;W`_
M*2DI*2DI"@HM/B`^("@H*R`H<')I;6]P("LI*2`H+2`H<')I;6]P("TI*2`N
M+BX@*&1O=6)L92`H8VQO<W5R92`H;&%M8F1A("AA*2`H*R!A(&$I*2`N+BXI
M*2D*"BT^(#@*"BT^(#@*"BT^("T^(#X@/B`^(#X@/B`^(#X@/B`^(#QC;&]S
M=7)E/@H*+3X@/B`^(#X@/&-L;W-U<F4^"@HM/B`^(#X@/&-L;W-U<F4^"@HM
M/B`\8VQO<W5R93X*"BT^("@H*R`H<')I;6]P("LI*2`H+2`H<')I;6]P("TI
M*2`H8V]N<R`H<')I;6]P(&-O;G,I*2`H*B`H<')I;6]P("HI*2`H+R`H<')I
M;6]P("\I*2`H/"`H<')I;6]P(#PI*2`H/B`H<')I;6]P(#XI*2`H/2`H<')I
M;6]P(#TI*2`H8V1R("AP<FEM;W`@8V1R*2D@*&-A<B`H<')I;6]P(&-A<BDI
M("AN=6UB97(_("AP<FEM;W`@;G5M8F5R/RDI("AL:7-T/R`H<')I;6]P(&QI
M<W0_*2D@*'-Y;6)O;#\@*'!R:6UO<"!S>6UB;VP_*2D@*&YU;&P_("AP<FEM
M;W`@;G5L;#\I*2`H8VQO<W5R93\@*'!R:6UO<"!C;&]S=7)E/RDI("AP<FEM
M;W`_("AP<FEM;W`@<')I;6]P/RDI("AS(#$P*2D*"BT^("@H*R`H<')I;6]P
M("LI*2`H+2`H<')I;6]P("TI*2`H8V]N<R`H<')I;6]P(&-O;G,I*2`H*B`H
M<')I;6]P("HI*2`H+R`H<')I;6]P("\I*2`H/"`H<')I;6]P(#PI*2`H/B`H
M<')I;6]P(#XI*2`H/2`H<')I;6]P(#TI*2`H8V1R("AP<FEM;W`@8V1R*2D@
M*&-A<B`H<')I;6]P(&-A<BDI("AN=6UB97(_("AP<FEM;W`@;G5M8F5R/RDI
M("AL:7-T/R`H<')I;6]P(&QI<W0_*2D@*'-Y;6)O;#\@*'!R:6UO<"!S>6UB
M;VP_*2D@*&YU;&P_("AP<FEM;W`@;G5L;#\I*2`H8VQO<W5R93\@*'!R:6UO
M<"!C;&]S=7)E/RDI("AP<FEM;W`_("AP<FEM;W`@<')I;6]P/RDI("AS(#$P
M*2`H9B`H;&%M8F1A("AX*2`H*R!X(',I*2DI"@HM/B`H*"L@*'!R:6UO<"`K
M*2D@*"T@*'!R:6UO<"`M*2D@*&-O;G,@*'!R:6UO<"!C;VYS*2D@*"H@*'!R
M:6UO<"`J*2D@*"\@*'!R:6UO<"`O*2D@*#P@*'!R:6UO<"`\*2D@*#X@*'!R
M:6UO<"`^*2D@*#T@*'!R:6UO<"`]*2D@*&-D<B`H<')I;6]P(&-D<BDI("AC
M87(@*'!R:6UO<"!C87(I*2`H;G5M8F5R/R`H<')I;6]P(&YU;6)E<C\I*2`H
M;&ES=#\@*'!R:6UO<"!L:7-T/RDI("AS>6UB;VP_("AP<FEM;W`@<WEM8F]L
M/RDI("AN=6QL/R`H<')I;6]P(&YU;&P_*2D@*&-L;W-U<F4_("AP<FEM;W`@
M8VQO<W5R93\I*2`H<')I;6]P/R`H<')I;6]P('!R:6UO<#\I*2`H<R`Q,"D@
M*&8@*&QA;6)D82`H>"D@*"L@>"!S*2DI("AG("AL86UB9&$@*',I("AF("@K
M(',@,3$I*2DI*0H*+3X@,C$*"BT^(#(Q"@HM/B`^("@H*R`H<')I;6]P("LI
M*2`H+2`H<')I;6]P("TI*2`H8V]N<R`H<')I;6]P(&-O;G,I*2`H*B`H<')I
M;6]P("HI*2`H+R`H<')I;6]P("\I*2`H/"`H<')I;6]P(#PI*2`H/B`H<')I
M;6]P(#XI*2`H/2`H<')I;6]P(#TI*2`H8V1R("AP<FEM;W`@8V1R*2D@*&-A
M<B`H<')I;6]P(&-A<BDI("AN=6UB97(_("AP<FEM;W`@;G5M8F5R/RDI("AL
M:7-T/R`H<')I;6]P(&QI<W0_*2D@*'-Y;6)O;#\@*'!R:6UO<"!S>6UB;VP_
M*2D@*&YU;&P_("AP<FEM;W`@;G5L;#\I*2`H8VQO<W5R93\@*'!R:6UO<"!C
M;&]S=7)E/RDI("AP<FEM;W`_("AP<FEM;W`@<')I;6]P/RDI("AS(#$P*2`H
M9B`H;&%M8F1A("AX*2`H*R!X(',I*2D@*&<@*&QA;6)D82`H<RD@*&8@*"L@
M<R`Q,2DI*2D@*&%D9"`H;&%M8F1A("AX*2`H;&%M8F1A("AY*2`H*R!X('DI
M*2DI*0H*+3X@*"@K("AP<FEM;W`@*RDI("@M("AP<FEM;W`@+2DI("AC;VYS
M("AP<FEM;W`@8V]N<RDI("@J("AP<FEM;W`@*BDI("@O("AP<FEM;W`@+RDI
M("@\("AP<FEM;W`@/"DI("@^("AP<FEM;W`@/BDI("@]("AP<FEM;W`@/2DI
M("AC9'(@*'!R:6UO<"!C9'(I*2`H8V%R("AP<FEM;W`@8V%R*2D@*&YU;6)E
M<C\@*'!R:6UO<"!N=6UB97(_*2D@*&QI<W0_("AP<FEM;W`@;&ES=#\I*2`H
M<WEM8F]L/R`H<')I;6]P('-Y;6)O;#\I*2`H;G5L;#\@*'!R:6UO<"!N=6QL
M/RDI("AC;&]S=7)E/R`H<')I;6]P(&-L;W-U<F4_*2D@*'!R:6UO<#\@*'!R
M:6UO<"!P<FEM;W`_*2D@*',@,3`I("AF("AL86UB9&$@*'@I("@K('@@<RDI
M*2`H9R`H;&%M8F1A("AS*2`H9B`H*R!S(#$Q*2DI*2`H861D("AL86UB9&$@
M*'@I("AL86UB9&$@*'DI("@K('@@>2DI*2D@*&%D9#$@*&QA;6)D82`H>2D@
M*"L@>"!Y*2DI*0H*+3X@*"@K("AP<FEM;W`@*RDI("@M("AP<FEM;W`@+2DI
M("AC;VYS("AP<FEM;W`@8V]N<RDI("@J("AP<FEM;W`@*BDI("@O("AP<FEM
M;W`@+RDI("@\("AP<FEM;W`@/"DI("@^("AP<FEM;W`@/BDI("@]("AP<FEM
M;W`@/2DI("AC9'(@*'!R:6UO<"!C9'(I*2`H8V%R("AP<FEM;W`@8V%R*2D@
M*&YU;6)E<C\@*'!R:6UO<"!N=6UB97(_*2D@*&QI<W0_("AP<FEM;W`@;&ES
M=#\I*2`H<WEM8F]L/R`H<')I;6]P('-Y;6)O;#\I*2`H;G5L;#\@*'!R:6UO
M<"!N=6QL/RDI("AC;&]S=7)E/R`H<')I;6]P(&-L;W-U<F4_*2D@*'!R:6UO
M<#\@*'!R:6UO<"!P<FEM;W`_*2D@*',@,3`I("AF("AL86UB9&$@*'@I("AA
M9&0Q('@I*2D@*&<@*&QA;6)D82`H<RD@*&8@*"L@<R`Q,2DI*2D@*&%D9"`H
M;&%M8F1A("AX*2`H;&%M8F1A("AY*2`H*R!X('DI*2DI("AA9&0Q("AL86UB
D9&$@*'DI("@K('@@>2DI*2D*"BT^(#$P"@HM/B`Q,`H*+3X@
`
end
SHAR_EOF
  (set 19 90 01 05 18 00 26 'c-distr/code.sch.out'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code.sch.out'
if test $? -ne 0
then ${echo} 'restore of c-distr/code.sch.out failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code.sch.out: MD5 check failed'
       ) << SHAR_EOF
a5f2bf90c190daa29ce361b7b8e3e376  c-distr/code.sch.out
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code.sch.out'` -ne 6606 && \
  ${echo} 'restoration warning:  size of c-distr/code.sch.out is not 6606'
  fi
fi
# ============= c-distr/code.clu ==============
if test -f 'c-distr/code.clu' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code.clu (file already exists)'
else
${echo} 'x - extracting c-distr/code.clu (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/code.clu' &&
; From Chapter 1
(define sqr (x) (* x x))
(define abs (x) (if (< x 0) (- 0 x) x))
(define +1 (x) (+ x 1))
(define and (x y) (if x y x))
(define or (x y) (if x x y))
(define not (x) (if x 0 1))
(define <> (x y) (not (= x y)))
(define >= (x y) (or (> x y) (= x y)))
(define <= (x y) (or (< x y) (= x y)))
(define mod (m n) (- m (* n (/ m n))))
(define min (x y) (if (< x y) x y))
(define max (x y) (if (> x y) x y))
; Section 6.1
(cluster Point
X    ; Export: new, abscissa, ordinate, reflect, rotate, compare, quadrant
X    (rep x-coord y-coord)
X    (define new (x y) (Point x y))
X    (define abscissa (p) (x-coord p))
X    (define ordinate (p) (y-coord p))
X    (define reflect (p)
X         (begin
X               (set-x-coord p (- 0 (x-coord p)))
X               (set-y-coord p (- 0 (y-coord p)))))
X    (define rotate (p)
X         (begin
X               (set temp (x-coord p))
X               (set-x-coord p (y-coord p))
X               (set-y-coord p (- 0 temp))))
X    (define compare (p1 p2)
X         (< (sqrdist p1) (sqrdist p2)))
X    (define quadrant (p)
X         (if (>= (x-coord p) 0)
X              (if (>= (y-coord p) 0) 1 2)
X              (if (< (y-coord p) 0) 3 4)))
X    ; sqrdist is not exported
X    (define sqrdist (p)
X         (+ (sqr (x-coord p)) (sqr (y-coord p))))
)
(set p1 (Point$new 3 4))
(Point$rotate p1)
(Point$abscissa p1)
4
(Point$ordinate p1)
-3
(Point$reflect p1)
(Point$abscissa p1)
-4
(Point$ordinate p1)
3
(set p2 (Point$new 1 5))
(Point$compare p1 p2)
1
(define enclosed-area (p1 p2)
X      (abs (* (- (Point$abscissa p1) (Point$abscissa p2))
X        (- (Point$ordinate p1) (Point$ordinate p2)))))
(enclosed-area p1 p2)
10
(cluster Point
X    ; Export: new, abscissa, ordinate, reflect, rotate, compare, quadrant
X    (rep x-mag y-mag quad)
X    (define new (x y) (Point (abs x) (abs y) (compute-quad x y)))
X    (define abscissa (p)
X         (if (> (quad p) 2) (- 0 (x-mag p)) (x-mag p)))
X    (define ordinate (p)
X         (if (or (= (quad p) 2) (= (quad p) 3))
X              (- 0 (y-mag p))
X              (y-mag p)))
X    (define reflect (p)
X         (set-quad p (+1 (mod (+1 (quad p)) 4))))
X    (define rotate (p)
X         (begin
X               (set temp (x-mag p))
X               (set-x-mag p (y-mag p))
X               (set-y-mag p temp)
X               (set-quad p (+1 (mod (quad p) 4)))))
X    (define compare (p1 p2)
X         (< (sqrdist p1) (sqrdist p2)))
X    (define quadrant (p) (quad p))
X    ; compute-quad, sqrdist are not exported
X    (define compute-quad (x y)
X         (if (>= x 0)
X              (if (>= y 0) 1 2)
X              (if (< y 0) 3 4)))
X    (define sqrdist (p)
X         (+ (sqr (x-mag p)) (sqr (y-mag p))))
)
(set p1 (Point$new 3 4))
(Point$rotate p1)
(Point$abscissa p1)
4
(Point$ordinate p1)
-3
(Point$reflect p1)
(Point$abscissa p1)
-4
(Point$ordinate p1)
3
(set p2 (Point$new 1 5))
(Point$compare p1 p2)
1
(define enclosed-area (p1 p2)
X      (abs (* (- (Point$abscissa p1) (Point$abscissa p2))
X        (- (Point$ordinate p1) (Point$ordinate p2)))))
(enclosed-area p1 p2)
10
; Section 6.2.3
(cluster List
X    ; Exports: nil, null?, cons, car, cdr, rplaca, rplacd
X    (rep type a d)
X    (define nil () (List 0 0 0))
X    (define null? (l) (= (type l) 0))
X    (define cons (item l) (List 1 item l))
X    (define car (l) (a l))
X    (define cdr (l) (d l))
X    (define rplaca (l a) (set-a l a))
X    (define rplacd (l d) (set-d l d))
)
(set x (List$cons 1 (List$cons 2 (List$nil)))) ; x is 1,2
(set y x) ; y is 1,2
(List$car x)
1
(List$car y)
1
(List$car (List$cdr x))
2
(List$rplaca y 3) ; y is 3,2, and so is x
(List$car x)
3
(List$car y)
3
(define length (l)
X    (if (List$null? l) 0 (+1 (length (List$cdr l)))))
(length x)
2
(length y)
2
;
(define nth (n l)
X      (if (= n 0) (List$car l) (nth (- n 1) (List$cdr l))))
(define changenth (n x l)
X      (if (= n 0) (List$rplaca l x) (changenth (- n 1) x (List$cdr l)))))
;
(cluster Array
X      ; Exports: new, index, assign
X      ; Indexing is from base, array has length size,
X      ; and elements are in list elts.
X      (rep base size elts)
X      (define new (b s) (Array b s (zerolist s)))
X      (define index (A i)
X            (if (out-of-bounds A i) 0 (nth (- i (base A)) (elts A))))
X      (define assign (A i x)
X            (if (out-of-bounds A i) A (changenth (- i (base A)) x (elts A))))
X      ; zerolist, out-of-bounds not exported
X      (define zerolist (n)
X            (if (= n 0) (List$nil) (List$cons 0 (zerolist (- n 1)))))
X      (define out-of-bounds (A i)
X            (or (< i (base A)) (> i (- (+ (base A) (size A)) 1))))
)
(set A (Array$new 1 10))
(set i 0)
(while (< i 10) (begin (set i (+ i 1)) (Array$assign A i (* i i))))
(set i 0)
(while (< i 10) (begin (set i (+ i 1)) (print (Array$index A i))))
;
(cluster Pair
X    ; Exports: fst, snd, mkPair
X    (rep f s)
X    (define fst (p) (f p))
X    (define snd (p) (s p))
X    (define mkPair (x y) (Pair x y))
)
;
(define assoc (i l)
X       (if (List$null? l) l
X            (if (= (Pair$fst (List$car l)) i)
X                 l
X                 (assoc i (List$cdr l)))))
;
(cluster SpArray
X    ; Exports: new, index, assign
X    (rep base size elts)
X    (define new (b s) (SpArray b s (List$nil)))
X    (define index (A i)
X           (begin
X               (set found (assoc i (elts A)))
X               (if (List$null? found) 0 (Pair$snd (List$car found)))))
X    (define assign (A i x)
X         (if (out-of-bounds A i) A
X             (begin
X                 (set found (assoc i (elts A)))
X                 (if (List$null? found)
X                     (set-elts A (List$cons (Pair$mkPair i x) (elts A)))
X                     (List$rplaca found (Pair$mkPair i x)))
X                 A)))
X    ; out-of-bounds not exported
X    (define out-of-bounds (A i)
X          (or (< i (base A)) (> i (- (+ (base A) (size A)) 1))))
)
(set A (SpArray$new 1 10))
(set i 0)
(while (< i 10) (begin (set i (+ i 1)) (SpArray$assign A i (* i i))))
(set i 0)
(while (< i 10) (begin (set i (+ i 1)) (print (SpArray$index A i))))
; Section 6.4
(cluster Poly
X    ; Export: create, degree, coeff, zero?, add, minus, sub, mul, prnt
X    (rep coeffs lo hi)
X    (define create (c n)
X        (begin
X             (set A (Array$new 0 20))
X             (Array$assign A n c)
X             (Poly A n n)))
X    (define degree (p) (hi p))
X    (define coeff (p n)
X        (if (or (< n (lo p)) (> n (hi p))) 0 (Array$index (coeffs p) n)))
X    (define zero? (p) (= 0 (coeff p (lo p))))
X    (define add (p q)
X        (begin
X             (set result (create 0 0))
X             (set-lo result (min (lo p) (lo q)))
X             (set-hi result (max (hi p) (hi q)))
X             (set i (lo result))
X             (while (<= i (hi result))
X                 (begin
X                      (set-coeff result i (+ (coeff p i) (coeff q i)))
X                      (set i (+1 i))))
X             (remove-zeros result)
X             result))
X    (define minus (p)
X        (begin
X             (set result (create 0 0))
X             (set-lo result (lo p))
X             (set-hi result (hi p))
X             (set i (lo p))
X             (while (<= i (hi p))
X                 (begin
X                      (set-coeff result i (- 0 (coeff p i)))
X                      (set i (+1 i))))
X               result))
X    (define sub (p q)
X        (add p (minus q)))
X    (define mul (p q)
X        (begin
X             (set result (create 0 0))
X             (if (> (+ (hi p) (hi q)) 19) result ; error!
X                 (if (or (zero? p) (zero? q)) result
X                    (begin
X                         (set-lo result (+ (lo p) (lo q)))
X                         (set-hi result (+ (hi p) (hi q)))
X                         (set p-hi (hi p))
X                         (set q-hi (hi q))
X                         (set q-lo (lo q))
X                         (set i (lo p))
X                         (while (<= i p-hi)
X                              (begin
X                                   (set j q-lo)
X                                   (while (<= j q-hi)
X                                             (begin
X                                    (set-coeff result (+ i j)
X                                          (+ (coeff result (+ i j))
X                                         (* (coeff p i) (coeff q j))))
X                                      (set j (+1 j))))
X                                 (set i (+1 i))))
X                         result)))))
X    (define prnt (p)
X     (if (zero? p) (begin (print 0) (print 0))
X       (begin
X         (set expon (hi p))
X         (while (>= expon (lo p))
X           (if (= (coeff p expon) 0)
X             (set expon (- expon 1))
X             (begin (print (coeff p expon)) (print expon)
X                    (set expon (- expon 1))))))))
X  ; set-coeff, remove-zeros not exported
X    (define set-coeff (p n c)
X          (Array$assign (coeffs p) n c))
X    (define remove-zeros (p) ; (lo p) is too low, and/or (hi p) too high
X        (begin
X             (while (and (= 0 (coeff p (lo p))) (<= (lo p) (hi p)))
X                  (set-lo p (+1 (lo p))))
X             (if (> (lo p) (hi p)) ; p a zero polynomial
X                  (begin (set-lo p 0) (set-hi p 0))
X                  (while (= 0 (coeff p (hi p)))
X                          (set-hi p (- (hi p) 1))))))
)
(define diff (p)
X    (begin
X        (set n 1)
X        (set pdx (Poly$create 0 0))
X        (while (<= n (Poly$degree p))
X            (begin
X                (set pdx (Poly$add pdx
X                       (Poly$create (* n (Poly$coeff p n)) (- n 1))))
X                (set n (+1 n))))
X        pdx))
(set p (Poly$create 5 2))
(set q (Poly$create 3 1))
(set r (Poly$add p q))
(Poly$prnt (diff r))
10
1
3
0
quit
SHAR_EOF
  (set 19 90 01 05 18 00 24 'c-distr/code.clu'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code.clu'
if test $? -ne 0
then ${echo} 'restore of c-distr/code.clu failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code.clu: MD5 check failed'
       ) << SHAR_EOF
7e85f48797e13e21f5151a262e5e364b  c-distr/code.clu
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code.clu'` -ne 9561 && \
  ${echo} 'restoration warning:  size of c-distr/code.clu is not 9561'
  fi
fi
# ============= c-distr/code.lsp.out ==============
if test -f 'c-distr/code.lsp.out' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code.lsp.out (file already exists)'
else
${echo} 'x - extracting c-distr/code.lsp.out (binary)'
  sed 's/^X//' << 'SHAR_EOF' | uudecode &&
begin 600 c-distr/code.lsp.out
M+3X@+3X@;6]D"BT^("LQ"BT^("T^("AA*0H*+3X@*&$I"@HM/B`H82!B*0H*
M+3X@*&$@8BD*"BT^("@H82D@8BD*"BT^("@H82D@8BD*"BT^("@H8B`H8R!D
M*2DI"@HM/B`H*&(@*&,@9"DI*0H*+3X@5`H*+3X@5`H*+3X@*"D*"BT^("@I
M"@HM/B!L96YG=&@*+3X@8V%A<@HM/B!C861R"BT^(&-D9'(*+3X@8V%D9'(*
M+3X@8V%D87(*+3X@8V%D9&1R"BT^(&QI<W0Q"BT^(&QI<W0R"BT^(&QI<W0S
M"BT^("@H82D@8BD*"BT^("@H82D@8BD*"BT^(&]R"BT^(&%T;VT_"BT^(#X@
M/B`^(#X@/B!E<75A;`HM/B`H*0H*+3X@*"D*"BT^(%0*"BT^(%0*"BT^("@I
M"@HM/B`H*0H*+3X@86YD"BT^(&YO=`HM/B!D:79I9&5S"BT^(#X@:6YT97)V
M86PM;&ES=`HM/B`H,R`T(#4@-B`W*0H*+3X@*#,@-"`U(#8@-RD*"BT^(#X@
M/B`^(#X@<F5M;W9E+6UU;'1I<&QE<PHM/B`H,R`U(#<I"@HM/B`H,R`U(#<I
M"@HM/B`^(#X@<VEE=F4*+3X@<')I;65S/#T*+3X@*#(@,R`U(#<I"@HM/B`H
M,B`S(#4@-RD*"BT^(#X@/B`^(&EN<V5R=`HM/B`^(#X@:6YS97)T:6]N+7-O
M<G0*+3X@*#(@,R`T(#4@-B`X*0H*+3X@*#(@,R`T(#4@-B`X*0H*+3X@/B`^
M(#X@87-S;V,*+3X@5&AA;G0*"BT^(%1H86YT"@HM/B`^(#X@/B`^(&UK87-S
M;V,*+3X@*"A)($-H:6YG*2D*"BT^("@H22!#:&EN9RDI"@HM/B`H*$D@0VAI
M;F<I("A%(&-O;&DI*0H*+3X@*"A)($-H:6YG*2`H12!#;VQI*2D*"BT^("@H
M22!-86=N:6XI("A%(&-O;&DI*0H*+3X@*"A)($UA9VYI;BD@*$4@8V]L:2DI
M"@HM/B!-86=N:6X*"BT^($UA9VYI;@H*+3X@*"AA<'!L92`H*'1E>'1U<F4@
M8W)U;F-H>2DI*2`H8F%N86YA("@H8V]L;W(@>65L;&]W*2DI*0H*+3X@/B`^
M(&=E='!R;W`*+3X@8W)U;F-H>0H*+3X@8W)U;F-H>0H*+3X@/B`^('!U='!R
M;W`*+3X@*"AA<'!L92`H*'1E>'1U<F4@8W)U;F-H>2D@*&-O;&]R(')E9"DI
M*2`H8F%N86YA("@H8V]L;W(@>65L;&]W*2DI*0H*+3X@*"AA<'!L92`H*'1E
M>'1U<F4@8W)U;F-H>2D@*&-O;&]R(')E9"DI*2`H8F%N86YA("@H8V]L;W(@
M>65L;&]W*2DI*0H*+3X@<F5D"@HM/B!R960*"BT^(&AA<W!R;W`_"BT^(#X@
M/B`^(#X@/B!G871H97)P<F]P"BT^("@H87!P;&4@*"AT97AT=7)E(&-R=6YC
M:'DI("AC;VQO<B!R960I*2D@*&)A;F%N82`H*&-O;&]R('EE;&QO=RDI*2`H
M;&5M;VX@*"AC;VQO<B!Y96QL;W<I*2DI"@HM/B`H*&%P<&QE("@H=&5X='5R
M92!C<G5N8VAY*2`N+BX@*&QE;6]N("@H8V]L;W(@>65L;&]W*2DI*2DI"@HM
M/B`H8F%N86YA(&QE;6]N*0H*+3X@*&)A;F%N82!L96UO;BD*"BT^("@I"@HM
M/B`H*0H*+3X@/B!A9&1E;'0*+3X@/B`^(&UE;6)E<C\*+3X@<VEZ90HM/B`^
M(#X@/B`^('5N:6]N"BT^("@S(&$I"@HM/B`H,R!A*0H*+3X@5`H*+3X@5`H*
M+3X@*&$@,B`S*0H*+3X@*&$@,B`S*0H*+3X@*"AA(&(I(#$I"@HM/B`H*&$@
M8BD@,2D*"BT^(%0*"BT^(%0*"BT^(#X@/B`^('-U;0HM/B`^(#X@/B`^(#X@
M=W)O;F<M<W5M"BT^(#$P"@HM/B`Q,`H*+3X@,38*"BT^(#$V"@HM/B!R:6=H
M="US=6T*+3X@/B`^(#X@/B`^(')I9VAT+7-U;2UA=7@*+3X@,3`*"BT^(#$P
M"@HM/B`^(#X@/B`^(#X@<')E+6]R9`HM/B!!"D(*0PI$"D4*1@I'"D@*20I)
M"@HM/B`H;W5T<'5T(&ES($$@0B!#($0@12!&($<@2"!)*0H*+3X@+3X@*"D*
M"BT^(&9R;VYT"BT^(')M+69R;VYT"BT^(#X@96YQ=65U90HM/B!E;7!T>3\*
M+3X@+3X@;&5V96PM;W)D"BT^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(&QE
M=F5L+6]R9"H*+3X@00I""D4*0PI$"D8*20I'"D@**"D*"BT^("AO=71P=70@
M:7,@02!"($4@0R!$($4@1B!)($<@2"D*"BT^("T^(#X@/B`^(#X@:6YT97(*
M+3X@/B`^(#X@/B`^(&1I9F8*+3X@/B`^(#X@54Y)3TX*+3X@/B`^(#X@24Y4
M15(*+3X@/B`^(#X@1$E&1@HM/B`^(%-%3$5#5`HM/B`^(#X@8V]L+6YU;0HM
M/B`^(#X@/B`^(&EN8VQU9&4M<F]W<PHM/B`^(&YT:`HM/B`^(%!23TI%0U0*
M+3X@/B`^(&-O;"UN=6TJ"BT^(#X@/B`^(&EN8VQU9&4M8V]L<RH*+3X@/B`^
M(#X@:6YC;'5D92UC;VQS"BT^(#X@87!P96YD"BT^(#X@/B`^(#X@/B`^(#X@
M/B`^(#X@/B!*3TE."BT^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^
M(#X@:F]I;BUC;VQS*@HM/B`^(#X@/B!J;VEN+6-O;',*+3X@/B`^(#X@/B`^
M(#X@*"A6:6-T:6T@0W)I;64@0W)I;6EN86P@3&]C871I;VXI("A0:&5L<',@
M<F]B8F5R>2!(87)R:7-O;B!,;VYD;VXI("A$<F5B8F5R(&UU<F1E<B!(;W!E
M($QO;F1O;BD@*%-I<BU#:&%R;&5S(&UU<F1E<B!3=&%P;&5T;VX@1&5V;VYS
M:&ER92D@*$QA9'DM179A(&)L86-K;6%I;"!-:6QV97)T;VX@3&]N9&]N*2`H
M0G)U;G1O;B!M=7)D97(@2&]W96QL<R!797-T+5-U<W-E>"DI"@HM/B`^(#X@
M/B`^("@H5FEC=&EM(%=E87!O;B!-;W1I=F4I("A$<F5B8F5R('!O:7-O;B!R
M979E;F=E*2`H4VER+4-H87)L97,@:&]U;F0@9W)E960I("A"<G5N=&]N(&)U
M<FEA;"UA;&EV92!P87-S:6]N*2D*"BT^(#X@/B`^("@H5FEC=&EM(%=E87!O
M;B!-;W1I=F4@0W)I;6EN86PI("A$<F5B8F5R('!O:7-O;B!R979E;F=E($AO
M<&4I*0H*+3X@*"A6:6-T:6T@5V5A<&]N($UO=&EV92!#<FEM:6YA;"D@*$1R
M96)B97(@<&]I<V]N(')E=F5N9V4@2&]P92DI"@HM/B`M/B`^(#X@/B`^(#X@
M979A;`HM/B`^(#X@/B`^(&%P<&QY+6]P"BT^(#(S"@HM/B`R,PH*+3X@-PH*
M+3X@-PH*+3X@,C0*"BT^(#(T"@HM/B`^(#X@/B`^(#X@/B!E=F%L"BT^(#8*
M"BT^(#8*"BT^(#X@/B`^(#X@/B`^(#X@/B`^(&5V86P*+3X@/B`^(#X@/B`^
M(#X@/B`^(&%P<&QY+6)I;F%R>2UO<`HM/B`^(#X@/B`^(#X@/B!A<'!L>2UU
M;F%R>2UO<`HM/B!A"@HM/B!A"@HM/B`H,R`Y*0H*+3X@*#,@.2D*"BT^(#X@
M/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B!E=F%L"BT^('5S97)F
M=6X_"BT^(#X@/B`^(&%P<&QY+75S97)F=6X*+3X@/B`^(#X@979A;&QI<W0*
M+3X@/B`^(#X@;6MA<W-O8RH*+3X@*"AD;W5B;&4@*"AA*2`H*R!A(&$I*2DI
M"@HM/B`H*&1O=6)L92`H*&$I("@K(&$@82DI*2D*"BT^(#@*"BT^(#@*"BT^
M(#X@/B`H*&5X<"`H*&T@;BD@*&EF("@](&X@,"D@,2`H*B!M("AE>'`@;2`H
M+2!N(#$I*2DI*2DI"@HM/B`H*&5X<"`H*&T@;BD@*&EF("@](&X@,"D@,2`H
M*B!M("AE>'`@;2`H+2!N(#$I*2DI*2DI"@HM/B`V-`H*+3X@-C0*"BT^('(M
M92UP+6QO;W`*+3X@/B`^(#X@/B`^(#X@<BUE+7`M;&]O<"H*+3X@/B`^(#X@
M<')O8V5S<RUD968*+3X@/B`^('!R;V-E<W,M97AP"BT^(#X@/B`^(#X@/B`H
K9&]U8FQE(#@@97AP(#8T*0H*+3X@*&1O=6)L92`X(&5X<"`V-"D*"BT^("`H
`
end
SHAR_EOF
  (set 19 90 01 05 18 00 25 'c-distr/code.lsp.out'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code.lsp.out'
if test $? -ne 0
then ${echo} 'restore of c-distr/code.lsp.out failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code.lsp.out: MD5 check failed'
       ) << SHAR_EOF
e4adc98a8b04c3bc50cc9c94a37a3abd  c-distr/code.lsp.out
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code.lsp.out'` -ne 3328 && \
  ${echo} 'restoration warning:  size of c-distr/code.lsp.out is not 3328'
  fi
fi
# ============= c-distr/code.ch1 ==============
if test -f 'c-distr/code.ch1' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code.ch1 (file already exists)'
else
${echo} 'x - extracting c-distr/code.ch1 (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/code.ch1' &&
3
3
(+ 4 7)
11
(set x 4)
4
(+ x x)
8
(print x)
X  4
4
(set y 5)
5
(begin (print x) (print y) (* x y))
X  4
X  5
20
(if (> y 0) 5 10)
5
(while (> y 0)
X    (begin (set x (+ x x)) (set y (- y 1))))
0
x
128
(define +1 (x) (+ x 1))
(+1 4)
5
(define double (x) (+ x x))
(double 4)
8
x
128
(define setx (x y) (begin (set x (+ x y)) x))
(setx x 1)
129
x
128
(define not (boolval) (if boolval 0 1))
(define <> (x y) (not (= x y)))
(define mod (m n) (- m (* n (/ m n))))
(define gcd (m n)
X      (begin
X          (set r (mod m n))
X          (while (<> r 0)
X               (begin
X                    (set m n)
X                    (set n r)
X                    (set r (mod m n))))
X          n))
(gcd 6 15)
3
(define gcd (m n)
X      (if (= n 0) m (gcd n (mod m n))))
(gcd 6 15)
3
quit
SHAR_EOF
  (set 19 90 01 05 18 00 24 'c-distr/code.ch1'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code.ch1'
if test $? -ne 0
then ${echo} 'restore of c-distr/code.ch1 failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code.ch1: MD5 check failed'
       ) << SHAR_EOF
3e2104fd83a632bc81d81bc0f31e4578  c-distr/code.ch1
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code.ch1'` -ne 768 && \
  ${echo} 'restoration warning:  size of c-distr/code.ch1 is not 768'
  fi
fi
# ============= c-distr/code.clu.out ==============
if test -f 'c-distr/code.clu.out' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code.clu.out (file already exists)'
else
${echo} 'x - extracting c-distr/code.clu.out (binary)'
  sed 's/^X//' << 'SHAR_EOF' | uudecode &&
begin 600 c-distr/code.clu.out
M+3X@+3X@<W%R"BT^(&%B<PHM/B`K,0HM/B!A;F0*+3X@;W(*+3X@;F]T"BT^
M(#P^"BT^(#X]"BT^(#P]"BT^(&UO9`HM/B!M:6X*+3X@;6%X"BT^("T^(#X@
M/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^
M(&YE=PIA8G-C:7-S80IO<F1I;F%T90IR969L96-T"G)O=&%T90IC;VUP87)E
M"G%U861R86YT"G-Q<F1I<W0*4&]I;G0*+3X@/'5S97)V86P^"@HM/B`M,PH*
M+3X@-`H*+3X@-`H*+3X@+3,*"BT^("TS"@HM/B`S"@HM/B`M-`H*+3X@+30*
M"BT^(#,*"BT^(#,*"BT^(#QU<V5R=F%L/@H*+3X@,0H*+3X@,0H*+3X@/B`^
M(&5N8VQO<V5D+6%R96$*+3X@,3`*"BT^(#$P"@HM/B`^(#X@/B`^(#X@/B`^
M(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(&YE
M=PIA8G-C:7-S80IO<F1I;F%T90IR969L96-T"G)O=&%T90IC;VUP87)E"G%U
M861R86YT"F-O;7!U=&4M<75A9`IS<7)D:7-T"E!O:6YT"BT^(#QU<V5R=F%L
M/@H*+3X@,@H*+3X@-`H*+3X@-`H*+3X@+3,*"BT^("TS"@HM/B`T"@HM/B`M
M-`H*+3X@+30*"BT^(#,*"BT^(#,*"BT^(#QU<V5R=F%L/@H*+3X@,0H*+3X@
M,0H*+3X@/B`^(&5N8VQO<V5D+6%R96$*+3X@,3`*"BT^(#$P"@HM/B`M/B`^
M(#X@/B`^(#X@/B`^(#X@/B`^(&YI;`IN=6QL/PIC;VYS"F-A<@IC9'(*<G!L
M86-A"G)P;&%C9`I,:7-T"BT^(#QU<V5R=F%L/@H*+3X@/'5S97)V86P^"@HM
M/B`Q"@HM/B`Q"@HM/B`Q"@HM/B`Q"@HM/B`R"@HM/B`R"@HM/B`S"@HM/B`S
M"@HM/B`S"@HM/B`S"@HM/B`S"@HM/B`^(&QE;F=T:`HM/B`R"@HM/B`R"@HM
M/B`R"@HM/B`R"@HM/B`M/B`^(&YT:`HM/B`^(&-H86YG96YT:`HM/B`M/B`^
M(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B!N97<*:6YD97@*87-S:6=N
M"GIE<F]L:7-T"F]U="UO9BUB;W5N9',*07)R87D*+3X@/'5S97)V86P^"@HM
M/B`P"@HM/B`P"@HM/B`P"@HM/B`Q"C0*.0HQ-@HR-0HS-@HT.0HV-`HX,0HQ
M,#`*,`H*+3X@+3X@/B`^(#X@/B`^(#X@9G-T"G-N9`IM:U!A:7(*4&%I<@HM
M/B`M/B`^(#X@/B`^(&%S<V]C"BT^("T^(#X@/B`^(#X@/B`^(#X@/B`^(#X@
M/B`^(#X@/B`^(#X@/B`^(#X@;F5W"FEN9&5X"F%S<VEG;@IO=70M;V8M8F]U
M;F1S"E-P07)R87D*+3X@/'5S97)V86P^"@HM/B`P"@HM/B`P"@HM/B`P"@HM
M/B`Q"C0*.0HQ-@HR-0HS-@HT.0HV-`HX,0HQ,#`*,`H*+3X@+3X@/B`^(#X@
M/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^
M(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@
M/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^(#X@/B`^
M(#X@/B`^(#X@/B`^(#X@/B`^(&-R96%T90ID96=R964*8V]E9F8*>F5R;S\*
M861D"FUI;G5S"G-U8@IM=6P*<')N=`IS970M8V]E9F8*<F5M;W9E+7IE<F]S
M"E!O;'D*+3X@/B`^(#X@/B`^(#X@/B`^(#X@9&EF9@HM/B`\=7-E<G9A;#X*
M"BT^(#QU<V5R=F%L/@H*+3X@/'5S97)V86P^"@HM/B`Q,`HQ"C,*,`HP"@HM
;/B`Q,`H*+3X@,0H*+3X@,PH*+3X@,`H*+3X@
`
end
SHAR_EOF
  (set 19 90 01 05 18 00 25 'c-distr/code.clu.out'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code.clu.out'
if test $? -ne 0
then ${echo} 'restore of c-distr/code.clu.out failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code.clu.out: MD5 check failed'
       ) << SHAR_EOF
599048865dedd29619558d31932fd20b  c-distr/code.clu.out
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code.clu.out'` -ne 1557 && \
  ${echo} 'restoration warning:  size of c-distr/code.clu.out is not 1557'
  fi
fi
# ============= c-distr/code.apl ==============
if test -f 'c-distr/code.apl' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/code.apl (file already exists)'
else
${echo} 'x - extracting c-distr/code.apl (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/code.apl' &&
; From chapter 1
(define +1 (x) (+ x 1))
(define <= (x y) (or (< x y) (= x y)))
; Section 3.1,3
(define fac (n) (*/ (indx n)))
(fac 4)
24
(define avg (v) (/ (+/ v) (shape v)))
(avg '(2 4 6))
4
(define neg (v) (- 0 v))
(neg '(3 -5 -8))
'(-3 5 8)
(define min (v1 v2) (neg (max (neg v1) (neg v2))))
(min 4 8)
4
(min '(2 4 6 8) '(5 3 7 4))
'(2 3 6 4)
(define min/ (v) (neg (max/ (neg v))))
(min/ '(5 3 7 4))
3
(define mod (m n) (- m (* n (/ m n))))
(mod '(2 5 8 11) '(1 2 3 4))
'(0 1 2 3)
(mod 10 '(2 5 8 11))
'(0 0 2 10)
(define even? (n) (= (mod n 2) 0))
(even? '(1 2 3 4 5))
'(0 1 0 1 0)
(define even-sum (v) (+/ (compress (even? v) v)))
(even-sum '(1 2 3 4 5))
6
(define not= (x y) (if (= x y) 0 1))
(not= 3 5)
1
(not= '(1 3 5) '(1 4 8))
0
(define not (x) (- 1 x))
(define <> (x y) (not (= x y)))
(<> '(1 3 5) '(1 4 8))
'(0 1 1)
(define reverse (a)
X        (begin
X         (set size ([] (shape a) 1))
X                 ([] a (+1 (- size (indx size))))))
(set m (restruct '(4 4) '(1 1 0 0 0)))
X   '(1   1   0   0)
X   '(0   1   1   0)
X   '(0   0   1   1)
X   '(0   0   0   1)
(reverse m)
X   '(0   0   0   1)
X   '(0   0   1   1)
X   '(0   1   1   0)
X   '(1   1   0   0)
(define reverse (a)
X           ([] a (+1 (- (set size ([] (shape a) 1)) (indx size))))))
(reverse m)
X   '(0   0   0   1)
X   '(0   0   1   1)
X   '(0   1   1   0)
X   '(1   1   0   0)
(define signum (x) (+ (* (< x 0) -1)(> x 0)))
(define abs (x) (* x (signum x)))
(define find (x v) ([] (compress (= x v) (indx (shape v))) 1))
(find 3 '(1 4 7 3 9 2))
4
(define find-closest (x v)
X      (begin
X           (set absdiffs (abs (- v x)))
X           (find (min/ absdiffs) absdiffs)))
(find-closest 10 '(8 11 4 13 7))
2
(define sqr (x) (* x x))
(define variance (v) (/ (+/ (sqr (- v (avg v)))) (shape v)))
(variance '(5 10 15 20))
31
(define binom (n)
X     (begin (set l '(1))
X              (print l)
X              (while (< (shape l) n)
X                    (begin
X                          (set l (+ (cat 0 l)(cat l 0)))
X                          (print l)))))
(define prime (n)
X        (and/ (<> 0 (mod n (+1 (indx (- n 2)))))))
(define dropend (v) ([] v (indx (- (shape v) 1))))
(define +\ (v)
X         (if (= (shape v) 0) v
X               (cat (+\ (dropend v)) (+/ v))))
(+\ '(1 3 5 7))
'(1   4   9   16)
(define assign (v i x)
X      (cat ([] v (indx (- i 1)))
X           (cat x ([] v (+ i (indx (- (shape v) i)))))))
(assign '(1 2 3 4 5) 3 6)
'(1 2 6 4 5)
(define drop1 (v) ([] v (+1 (indx (- (shape v) 1)))))
(define vecassign (v i x)
X      (if (= (shape i) 0) v
X             (vecassign (assign v ([] i 1)([] x 1))
X                       (drop1 i) (drop1 x))))
(vecassign '(10 20 30 40 50) '(3 5 1) '(7 9 11))
'(11 20 7 40 9)
(define fillzeros (v)
X       (vecassign (restruct (+/ (+ v 1)) 0)
X                    (+\ (+ v 1))
X                    (restruct (shape v) 1)))
(fillzeros '(2 0 3 1))
'(0 0 1 1 0 0 0 1 0 1)
(define mod-outer-prod (v1 v2)
X         (mod (trans (restruct (cat (shape v2)(shape v1)) v1))
X             (restruct (cat (shape v1) (shape v2)) v2)))
(mod-outer-prod (indx 4) (indx 7))
'(0 1 1 1 1 1 1)
'(0 0 2 2 2 2 2)
'(0 1 0 3 3 3 3)
'(0 0 1 0 4 4 4)
(define primes<= (n)
X    (compress (= 2 (+/ (= 0 (mod-outer-prod (set s (indx n)) s))))
X              s))
(primes<= 7)
'(2 3 5 7)
; Section 3.3??
(define dup-cols (v n)
X    (trans (restruct (cat n (shape v)) v)))
(define dup-rows (v n)
X    ([] (restruct (cat 1 (shape v)) v) (restruct n 1)))
(define freqvec (scores lo hi)
X     (begin
X          (set width (+ (- hi lo) 1))
X          (+/ (trans (= 
X                (dup-cols scores width)
X                (dup-rows (+ (indx width) (- lo 1)) (shape scores))))))))
(define cumfreqvec (freqs) (+\ freqs))
(define range (scores) (cat (min/ scores) (max/ scores)))
(define mode (freqs lo) (+ (find (max/ freqs) freqs) (- lo 1)))
(define median (cumfreqs lo)
X           (+ (- lo 1) (find-closest (max/ cumfreqs) (* 2 cumfreqs))))
(define addelt (e i v)
X    (cat ([] v (indx (- i 1)))
X         (cat e ([] v (+ (indx (- (+1 (shape v)) i)) (- i 1))))))
(define addrow (v i m)
X    ([] (restruct (+ '(1 0) (shape m)) (cat v m))
X          (addelt 1 i (+1 (indx ([] (shape m) 1))))))
(define addcol (v i m)
X    (trans (addrow v i (trans m))))
(define histo (freqs lo hi)
X    (begin
X         (set width (+1 (- hi lo)))
X         (set length (max/ freqs))
X         (set hist
X             (<=   (restruct (cat width length) (indx length))
X                 (dup-cols freqs length)))
X         (addcol (- (indx width) (- 1 lo)) 1 hist)))
(define graph (freqs lo)
X   (begin
X       (set length (max/ freqs))
X       (set lines (restruct (cat (+ length 1) length)
X                                  (cat (restruct length 0) 1)))
X       (set thegraph (reverse (trans ([] lines (+ freqs 1)))))
X       (addrow (- (indx (shape freqs)) (- 1 lo)) (+ length 1) thegraph)))
(set SCORES '(-2 1 -1 0 0 2 1 1))
(set FREQS (freqvec SCORES -2 2))
'(1 1 2 3 1)
(set CUMFREQS (cumfreqvec FREQS))
'(1 2 4 7 8)
(range SCORES)
'(-2 2)
(mode FREQS -2)
1 
(median CUMFREQS -2)
0 
(histo FREQS -2 2)
'(-2 1 0 0)
'(-1 1 0 0)
'(0 1 1 0)
'(1 1 1 1)
'(2 1 0 0)
(graph FREQS -2)
'(0 0 0 1 0)
'(0 0 1 0 0)
'(1 1 0 0 1)
'(-2 -1 0 1 2)
(graph CUMFREQS -2)
'(0 0 0 0 1)
'(0 0 0 1 0)
'(0 0 0 0 0)
'(0 0 0 0 0)
'(0 0 1 0 0)
'(0 0 0 0 0)
'(0 1 0 0 0)
'(1 0 0 0 0)
'(-2 -1 0 1 2)
quit
SHAR_EOF
  (set 19 90 01 05 18 00 24 'c-distr/code.apl'; eval "$shar_touch") &&
  chmod 0644 'c-distr/code.apl'
if test $? -ne 0
then ${echo} 'restore of c-distr/code.apl failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/code.apl: MD5 check failed'
       ) << SHAR_EOF
e500bf70a7848dc37c235c708b5314be  c-distr/code.apl
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/code.apl'` -ne 5305 && \
  ${echo} 'restoration warning:  size of c-distr/code.apl is not 5305'
  fi
fi
# ============= c-distr/clu.c ==============
if test -f 'c-distr/clu.c' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/clu.c (file already exists)'
else
${echo} 'x - extracting c-distr/clu.c (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/clu.c' &&
/* Output from p2c, the Pascal-to-C translator */
/* From input file "clu.p" */
X
X
/*****************************************************************
X *                     DECLARATIONS                              *
X *****************************************************************/
X
#include <p2c/p2c.h>
X
X
#define NAMELENG        20   /* Maximum length of a name */
#define MAXNAMES        150   /* Maximum number of different names */
#define MAXINPUT        5000   /* Maximum length of an input */
X
#define PROMPT          "-> "
#define PROMPT2         "> "
#define COMMENTCHAR     ";"
X
#define TABCODE         9   /* in ASCII */
X
X
typedef Char NAMESTRING[NAMELENG];
X
/* a NAME is an index in printNames */
X
typedef enum {
X  ONEPART, TWOPART
} FNAMETYPE;
X
typedef struct FUNNAME {
X  uchar funpart;
X  FNAMETYPE nametype;
X  union {
X    uchar clpart;
X  } UU;
} FUNNAME;
X
typedef enum {
X  IFOP, WHILEOP, SETOP, BEGINOP, PLUSOP, MINUSOP, TIMESOP, DIVOP, EQOP, LTOP,
X  GTOP, PRINTOP
} BUILTINOP;
X
X
typedef enum {
X  PRIM, USER
} CLUVALUETYPE;
X
typedef struct CLUVALUEREC {
X  CLUVALUETYPE vtype;
X  union {
X    long intval;
X    struct ENVREC *userval;
X  } UU;
} CLUVALUEREC;
X
typedef enum {
X  VALEXP, VAREXP, APEXP
} EXPTYPE;
X
typedef struct EXPREC {
X  EXPTYPE etype;
X  union {
X    CLUVALUEREC *valu;
X    uchar varble;
X    struct {
X      FUNNAME optr;
X      struct EXPLISTREC *args;
X    } U2;
X  } UU;
} EXPREC;
X
typedef struct EXPLISTREC {
X  EXPREC *head;
X  struct EXPLISTREC *tail;
} EXPLISTREC;
X
typedef struct VALUELISTREC {
X  CLUVALUEREC *head;
X  struct VALUELISTREC *tail;
} VALUELISTREC;
X
typedef struct NAMELISTREC {
X  uchar head;
X  struct NAMELISTREC *tail;
} NAMELISTREC;
X
typedef struct ENVREC {
X  NAMELISTREC *vars;
X  VALUELISTREC *values;
} ENVREC;
X
typedef enum {
X  NORMAL, CONSTRUCTOR, SELECTOR, SETTOR
} FUNTYPE;
X
typedef struct FUNDEFREC {
X  uchar funname;
X  struct FUNDEFREC *nextfundef;
X  FUNTYPE ftype;
X  union {
X    struct {
X      NAMELISTREC *formals;
X      EXPREC *body;
X    } U0;
X    uchar selname;
X  } UU;
} FUNDEFREC;
X
typedef struct CLUSTERREC {
X  uchar clname;
X  NAMELISTREC *clrep;
X  FUNDEFREC *exported, *nonexported;
X  struct CLUSTERREC *nextcluster;
} CLUSTERREC;
X
X
Static FUNDEFREC *fundefs;
Static CLUSTERREC *clusters;
X
Static ENVREC *globalEnv;
X
Static EXPREC *currentExp;
X
Static Char userinput[MAXINPUT];
Static short inputleng, pos_;
X
Static NAMESTRING printNames[MAXNAMES];
Static uchar numNames, numBuiltins;
X
Static boolean quittingtime;
X
X
/*****************************************************************
X *                     DATA STRUCTURE OP'S                       *
X *****************************************************************/
X
/* mkVALEXP - return an EXP of type VALEXP with valu v           */
Static EXPREC *mkVALEXP(v)
CLUVALUEREC *v;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = VALEXP;
X  e->UU.valu = v;
X  return e;
}  /* mkVALEXP */
X
X
/* mkVAREXP - return an EXP of type VAREXP with varble nm        */
Static EXPREC *mkVAREXP(nm)
uchar nm;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = VAREXP;
X  e->UU.varble = nm;
X  return e;
}  /* mkVAREXP */
X
X
/* mkAPEXP - return EXP of type APEXP w/ optr op or cl$op        */
Static EXPREC *mkAPEXP(ot, op, cl, el)
FNAMETYPE ot;
uchar op, cl;
EXPLISTREC *el;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = APEXP;
X  e->UU.U2.optr.funpart = op;
X  e->UU.U2.optr.nametype = ot;
X  if (ot == TWOPART)
X    e->UU.U2.optr.UU.clpart = cl;
X  e->UU.U2.args = el;
X  return e;
}  /* mkAPEXP */
X
X
/* mkPRIM - return a CLUVALUE with integer value n               */
Static CLUVALUEREC *mkPRIM(n)
long n;
{
X  CLUVALUEREC *newval;
X
X  newval = (CLUVALUEREC *)Malloc(sizeof(CLUVALUEREC));
X  newval->vtype = PRIM;
X  newval->UU.intval = n;
X  return newval;
}  /* mkPRIM */
X
X
/* mkUSER - return a user-type CLUVALUE                          */
Static CLUVALUEREC *mkUSER(rho)
ENVREC *rho;
{
X  CLUVALUEREC *newval;
X
X  newval = (CLUVALUEREC *)Malloc(sizeof(CLUVALUEREC));
X  newval->vtype = USER;
X  newval->UU.userval = rho;
X  return newval;
}  /* mkUSER */
X
X
/* mkExplist - return an EXPLIST with head e and tail el         */
Static EXPLISTREC *mkExplist(e, el)
EXPREC *e;
EXPLISTREC *el;
{
X  EXPLISTREC *newel;
X
X  newel = (EXPLISTREC *)Malloc(sizeof(EXPLISTREC));
X  newel->head = e;
X  newel->tail = el;
X  return newel;
}  /* mkExplist */
X
X
/* mkNamelist - return a NAMELIST with head n and tail nl        */
Static NAMELISTREC *mkNamelist(nm, nl)
uchar nm;
NAMELISTREC *nl;
{
X  NAMELISTREC *newnl;
X
X  newnl = (NAMELISTREC *)Malloc(sizeof(NAMELISTREC));
X  newnl->head = nm;
X  newnl->tail = nl;
X  return newnl;
}  /* mkNamelist */
X
X
/* mkValuelist - return an VALUELIST with head v and tail vl     */
Static VALUELISTREC *mkValuelist(v, vl)
CLUVALUEREC *v;
VALUELISTREC *vl;
{
X  VALUELISTREC *newvl;
X
X  newvl = (VALUELISTREC *)Malloc(sizeof(VALUELISTREC));
X  newvl->head = v;
X  newvl->tail = vl;
X  return newvl;
}  /* mkValuelist */
X
X
/* mkEnv - return an ENV with vars nl and values vl              */
Static ENVREC *mkEnv(nl, vl)
NAMELISTREC *nl;
VALUELISTREC *vl;
{
X  ENVREC *rho;
X
X  rho = (ENVREC *)Malloc(sizeof(ENVREC));
X  rho->vars = nl;
X  rho->values = vl;
X  return rho;
}  /* mkEnv */
X
X
/* lengthVL - return length of VALUELIST vl                      */
Static long lengthVL(vl)
VALUELISTREC *vl;
{
X  long i;
X
X  i = 0;
X  while (vl != NULL) {
X    i++;
X    vl = vl->tail;
X  }
X  return i;
}  /* lengthVL */
X
X
/* lengthNL - return length of NAMELIST nl                       */
Static long lengthNL(nl)
NAMELISTREC *nl;
{
X  long i;
X
X  i = 0;
X  while (nl != NULL) {
X    i++;
X    nl = nl->tail;
X  }
X  return i;
}  /* lengthNL */
X
X
/*****************************************************************
X *                     NAME MANAGEMENT                           *
X *****************************************************************/
X
/* fetchCluster - get cluster definition of cname from clusters  */
Static CLUSTERREC *fetchCluster(cname)
uchar cname;
{
X  CLUSTERREC *cl;
X  boolean found;
X
X  found = false;
X  cl = clusters;
X  while (cl != NULL && !found) {
X    if (cl->clname == cname)
X      found = true;
X    else
X      cl = cl->nextcluster;
X  }
X  return cl;
}  /* fetchCluster */
X
X
/* newCluster - add new cluster cname to clusters                */
Static CLUSTERREC *newCluster(cname)
uchar cname;
{
X  CLUSTERREC *cl;
X
X  cl = fetchCluster(cname);
X  if (cl != NULL)   /* cname not yet defined as cluster */
X    return cl;
X  cl = (CLUSTERREC *)Malloc(sizeof(CLUSTERREC));
X  cl->clname = cname;
X  cl->nextcluster = clusters;   /* place new CLUSTERREC */
X  clusters = cl;   /* on clusters list */
X  return cl;
}  /* newCluster */
X
X
/* fetchFun - get function definition of NAME fname from fenv    */
Static FUNDEFREC *fetchFun(fname, fenv)
uchar fname;
FUNDEFREC *fenv;
{
X  boolean found;
X
X  found = false;
X  while (fenv != NULL && !found) {
X    if (fenv->funname == fname)
X      found = true;
X    else
X      fenv = fenv->nextfundef;
X  }
X  return fenv;
}  /* fetchFun */
X
X
/* newFunDef - add new function fname to fenv                    */
Static FUNDEFREC *newFunDef(fname, fenv)
uchar fname;
FUNDEFREC **fenv;
{
X  FUNDEFREC *f;
X
X  f = fetchFun(fname, *fenv);
X  if (f != NULL)   /* fname not yet defined as a function */
X    return f;
X  f = (FUNDEFREC *)Malloc(sizeof(FUNDEFREC));
X  f->funname = fname;
X  f->nextfundef = *fenv;   /* place new FUNDEFREC */
X  *fenv = f;   /* on fenv list */
X  return f;
}  /* newFunDef */
X
X
/* initNames - place all pre-defined names into printNames       */
Static Void initNames()
{
X  long i;
X
X  fundefs = NULL;
X  clusters = NULL;
X  i = 1;
X  memcpy(printNames[i - 1], "if                  ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "while               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "set                 ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "begin               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "+                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "-                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "*                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "/                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "=                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "<                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], ">                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "print               ", sizeof(NAMESTRING));
X  numNames = i;
X  numBuiltins = i;
}  /* initNames */
X
X
Static jmp_buf _JL99;
X
X
/* install - insert new name into printNames                     */
Static uchar install(nm)
Char *nm;
{
X  long i;
X  boolean found;
X
X  i = 1;
X  found = false;
X  while (i <= numNames && !found) {
X    if (!memcmp(nm, printNames[i - 1], sizeof(NAMESTRING)))
X      found = true;
X    else
X      i++;
X  }
X  if (found)
X    return i;
X  if (i > MAXNAMES) {
X    printf("No more room for names\n");
X    longjmp(_JL99, 1);
X  }
X  numNames = i;
X  memcpy(printNames[i - 1], nm, sizeof(NAMESTRING));
X  return i;
}  /* install */
X
X
/* prName - print name nm                                        */
Static Void prName(nm)
uchar nm;
{
X  long i;
X
X  i = 1;
X  while (i <= NAMELENG) {
X    if (printNames[nm - 1][i - 1] != ' ') {
X      putchar(printNames[nm - 1][i - 1]);
X      i++;
X    } else
X      i = NAMELENG + 1;
X  }
}  /* prName */
X
X
/* primOp - translate NAME optr to corresponding BUILTINOP       */
Static BUILTINOP primOp(optr)
uchar optr;
{
X  BUILTINOP op;
X  long i;
X
X  op = IFOP;   /* N.B. IFOP is first value in BUILTINOPS */
X  for (i = 1; i < optr; i++)
X    op = (BUILTINOP)((long)op + 1);
X  return op;
}  /* primOp */
X
X
/*****************************************************************
X *                        INPUT                                  *
X *****************************************************************/
X
/* isDelim - check if c is a delimiter                           */
Static boolean isDelim(c)
Char c;
{
X  return (c == ';' || c == '$' || c == ' ' || c == ')' || c == '(');
}  /* isDelim */
X
X
/* skipblanks - return next non-blank position in userinput      */
Static long skipblanks(p)
long p;
{
X  while (userinput[p - 1] == ' ')
X    p++;
X  return p;
}  /* skipblanks */
X
X
/* matches - check if string nm matches userinput[s .. s+leng]   */
Static boolean matches(s, leng, nm)
long s;
char leng;
Char *nm;
{
X  boolean match;
X  long i;
X
X  match = true;
X  i = 1;
X  while (match && i <= leng) {
X    if (userinput[s - 1] != nm[i - 1])
X      match = false;
X    i++;
X    s++;
X  }
X  if (!isDelim(userinput[s - 1]))
X    match = false;
X  return match;
}  /* matches */
X
X
/* nextchar - read next char - filter tabs and comments          */
Local Void nextchar(c)
Char *c;
{
X  Char STR1[256];
X
X  *c = getchar();
X  if (*c == '\n')
X    *c = ' ';
X  if (*c == (Char)TABCODE) {
X    *c = ' ';
X    return;
X  }
X  sprintf(STR1, "%c", *c);
X  if (strcmp(STR1, COMMENTCHAR))
X    return;
X  while (!P_eoln(stdin)) {
X    *c = getchar();
X    if (*c == '\n')
X      *c = ' ';
X  }
X  *c = ' ';
}  /* nextchar */
X
/* readParens - read char's, ignoring newlines, to matching ')'  */
Local Void readParens()
{
X  long parencnt;   /* current depth of parentheses */
X  Char c;
X
X  parencnt = 1;   /* '(' just read */
X  do {
X    if (P_eoln(stdin))
X      fputs(PROMPT2, stdout);
X    nextchar(&c);
X    pos_++;
X    if (pos_ == MAXINPUT) {
X      printf("User input too long\n");
X      longjmp(_JL99, 1);
X    }
X    userinput[pos_ - 1] = c;
X    if (c == '(')
X      parencnt++;
X    if (c == ')')
X      parencnt--;
X  } while (parencnt != 0);   /* readParens */
}
X
Local Void readInput()
{
X  Char c;
X
X  fputs(PROMPT, stdout);
X  pos_ = 0;
X  do {
X    pos_++;
X    if (pos_ == MAXINPUT) {
X      printf("User input too long\n");
X      longjmp(_JL99, 1);
X    }
X    nextchar(&c);
X    userinput[pos_ - 1] = c;
X    if (userinput[pos_ - 1] == '(')
X      readParens();
X  } while (!P_eoln(stdin));
X  inputleng = pos_;
X  userinput[pos_] = ';';   /* sentinel */
}  /* readInput */
X
X
/* reader - read char's into userinput; be sure input not blank  */
Static Void reader()
{
X
X  /* readInput - read char's into userinput                        */
X  do {
X    readInput();
X    pos_ = skipblanks(1L);   /* ignore blank lines */
X  } while (pos_ > inputleng);   /* reader */
}
X
X
/* parseName - return (installed) NAME starting at userinput[pos]*/
Static uchar parseName()
{
X  NAMESTRING nm;   /* array to accumulate characters */
X  char leng;   /* length of name */
X
X  leng = 0;
X  while ((pos_ <= inputleng) & (!isDelim(userinput[pos_ - 1]))) {
X    if (leng == NAMELENG) {
X      printf("Name too long, begins: %.*s\n", NAMELENG, nm);
X      longjmp(_JL99, 1);
X    }
X    leng++;
X    nm[leng - 1] = userinput[pos_ - 1];
X    pos_++;
X  }
X  if (leng == 0) {
X    printf("Error: expected name, instead read: %c\n", userinput[pos_ - 1]);
X    longjmp(_JL99, 1);
X  }
X  for (; leng < NAMELENG; leng++)
X    nm[leng] = ' ';
X  pos_ = skipblanks((long)pos_);   /* skip blanks after name */
X  return (install(nm));
}  /* parseName */
X
X
Local boolean isDigits(pos)
long pos;
{
X  boolean Result;
X
X  if (!isdigit(userinput[pos - 1]))
X    return false;
X  Result = true;
X  while (isdigit(userinput[pos - 1]))
X    pos++;
X  if (!isDelim(userinput[pos - 1]))
X    return false;
X  return Result;
}  /* isDigits */
X
X
/* isNumber - check if a number begins at pos                    */
Static boolean isNumber(pos)
long pos;
{
X
X  /* isDigits - check if sequence of digits begins at pos          */
X  return (isDigits(pos) | ((userinput[pos - 1] == '-') & isDigits(pos + 1)));
}  /* isNumber */
X
X
/* parseVal - return number starting at userinput[pos]           */
Static CLUVALUEREC *parseVal()
{
X  long n, sign;
X
X  n = 0;
X  sign = 1;
X  if (userinput[pos_ - 1] == '-') {
X    sign = -1;
X    pos_++;
X  }
X  while (isdigit(userinput[pos_ - 1])) {
X    n = n * 10 + userinput[pos_ - 1] - '0';
X    pos_++;
X  }
X  pos_ = skipblanks((long)pos_);   /* skip blanks after number */
X  return (mkPRIM(n * sign));
}  /* parseVal */
X
X
Static EXPLISTREC *parseEL PV();
X
X
/* parseExp - return EXP starting at userinput[pos]              */
Static EXPREC *parseExp()
{
X  uchar fnm, cnm;
X  EXPLISTREC *el;
X  FNAMETYPE optrtype;
X
X  if (userinput[pos_ - 1] == '(') {  /* APEXP */
X    pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X    optrtype = ONEPART;
X    cnm = 1;   /* arbitrary name */
X    fnm = parseName();
X    if (userinput[pos_ - 1] == '$') {  /* two-part name */
X      pos_++;
X      cnm = fnm;
X      optrtype = TWOPART;
X      fnm = parseName();
X    }
X    el = parseEL();
X    return (mkAPEXP(optrtype, fnm, cnm, el));
X  } else if (isNumber((long)pos_))
X    return (mkVALEXP(parseVal()));   /* VALEXP */
X  else
X    return (mkVAREXP(parseName()));   /* VAREXP */
}  /* parseExp */
X
X
/* parseEL - return EXPLIST starting at userinput[pos]           */
Static EXPLISTREC *parseEL()
{
X  EXPREC *e;
X  EXPLISTREC *el;
X
X  if (userinput[pos_ - 1] == ')') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X    return NULL;
X  } else {
X    e = parseExp();
X    el = parseEL();
X    return (mkExplist(e, el));
X  }
}  /* parseEL */
X
X
/* parseNL - return NAMELIST starting at userinput[pos]          */
Static NAMELISTREC *parseNL()
{
X  uchar nm;
X  NAMELISTREC *nl;
X
X  if (userinput[pos_ - 1] == ')') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X    return NULL;
X  } else {
X    nm = parseName();
X    nl = parseNL();
X    return (mkNamelist(nm, nl));
X  }
}  /* parseNL */
X
X
/* parseDef - parse function definition at userinput[pos]        */
Static uchar parseDef(fenv)
FUNDEFREC **fenv;
{
X  uchar fname;   /* function name */
X  FUNDEFREC *newfun;   /* new FUNDEFREC */
X
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X  pos_ = skipblanks(pos_ + 6L);   /* skip 'define ..' */
X  fname = parseName();
X  newfun = newFunDef(fname, fenv);
X  newfun->ftype = NORMAL;
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X  newfun->UU.U0.formals = parseNL();
X  newfun->UU.U0.body = parseExp();
X  pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X  return fname;
}  /* parseDef */
X
X
/* mkSetName - make name of settor corresponding to selector nm  */
Local uchar mkSetName(nm)
uchar nm;
{
X  NAMESTRING setname;
X  long i;
X
X  memcpy(setname, "set-                ", sizeof(NAMESTRING));
X  if (printNames[nm - 1][NAMELENG - 4] != ' ') {
X    printf("Selector name too long: ");
X    prName(nm);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  for (i = 1; i <= NAMELENG - 4; i++)
X    setname[i + 3] = printNames[nm - 1][i - 1];
X  return (install(setname));
}  /* mkSetName */
X
X
/* parseCluster - parse cluster definition at userinput[pos]     */
Static uchar parseCluster()
{
X  uchar cname, sel, fname;
X  CLUSTERREC *newclust;
X  NAMELISTREC *rep;
X  FUNDEFREC *cenv, *confun, *selfun, *setfun;
X
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X  pos_ = skipblanks(pos_ + 7L);   /* skip 'cluster ...' */
X  cname = parseName();
X  newclust = newCluster(cname);
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ...' */
X  pos_ = skipblanks(pos_ + 3L);   /* skip 'rep ...' */
X  rep = parseNL();   /* selector names */
X  newclust->clrep = rep;
X  cenv = NULL;
X  while (userinput[pos_ - 1] == '(') {
X    fname = parseDef(&cenv);
X    prName(fname);
X    putchar('\n');
X  }
X  newclust->exported = cenv;
X  cenv = NULL;
X  confun = newFunDef(cname, &cenv);
X  confun->ftype = CONSTRUCTOR;
X  while (rep != NULL) {
X    sel = rep->head;
X    selfun = newFunDef(sel, &cenv);
X    selfun->ftype = SELECTOR;
X    setfun = newFunDef(mkSetName(sel), &cenv);
X    setfun->ftype = SETTOR;
X    setfun->UU.selname = sel;
X    rep = rep->tail;
X  }
X  newclust->nonexported = cenv;
X  pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X  return cname;
}  /* parseCluster */
X
X
/*****************************************************************
X *                     ENVIRONMENTS                              *
X *****************************************************************/
X
/* emptyEnv - return an environment with no bindings             */
Static ENVREC *emptyEnv()
{
X  return (mkEnv(NULL, NULL));
}  /* emptyEnv */
X
X
/* bindVar - bind variable nm to value n in environment rho      */
Static Void bindVar(nm, v, rho)
uchar nm;
CLUVALUEREC *v;
ENVREC *rho;
{
X  rho->vars = mkNamelist(nm, rho->vars);
X  rho->values = mkValuelist(v, rho->values);
}  /* bindVar */
X
X
/* findVar - look up nm in rho                                   */
Static VALUELISTREC *findVar(nm, rho)
uchar nm;
ENVREC *rho;
{
X  NAMELISTREC *nl;
X  VALUELISTREC *vl;
X  boolean found;
X
X  found = false;
X  nl = rho->vars;
X  vl = rho->values;
X  while (nl != NULL && !found) {
X    if (nl->head == nm)
X      found = true;
X    else {
X      nl = nl->tail;
X      vl = vl->tail;
X    }
X  }
X  return vl;
}  /* findVar */
X
X
/* assign - assign value n to variable nm in rho                 */
Static Void assign(nm, v, rho)
uchar nm;
CLUVALUEREC *v;
ENVREC *rho;
{
X  VALUELISTREC *varloc;
X
X  varloc = findVar(nm, rho);
X  varloc->head = v;
}  /* assign */
X
X
/* fetch - return number bound to nm in rho                      */
Static CLUVALUEREC *fetch(nm, rho)
uchar nm;
ENVREC *rho;
{
X  VALUELISTREC *vl;
X
X  vl = findVar(nm, rho);
X  return (vl->head);
}  /* fetch */
X
X
/* isBound - check if nm is bound in rho                         */
Static boolean isBound(nm, rho)
uchar nm;
ENVREC *rho;
{
X  return (findVar(nm, rho) != NULL);
}  /* isBound */
X
X
/*****************************************************************
X *                           VALUES                              *
X *****************************************************************/
X
/* prValue - print value v                                       */
Static Void prValue(v)
CLUVALUEREC *v;
{
X  if (v->vtype == PRIM)
X    printf("%ld", v->UU.intval);
X  else
X    printf("<userval>");
}  /* prValue */
X
X
/* isTrueVal - return true if v is true (non-zero) value         */
Static boolean isTrueVal(v)
CLUVALUEREC *v;
{
X  if (v->vtype == USER)
X    return true;
X  else
X    return (v->UU.intval != 0);
}  /* isTrueVal */
X
X
/* arity - return number of arguments expected by op             */
Local long arity(op)
BUILTINOP op;
{
X  if (((1L << ((long)op)) & ((1 << ((long)GTOP + 1)) - (1 << ((long)PLUSOP)))) != 0)
X    return 2;
X  else
X    return 1;
}  /* arity */
X
X
/* applyValueOp - apply VALUEOP op to arguments in VALUELIST vl  */
Static CLUVALUEREC *applyValueOp(op, vl)
BUILTINOP op;
VALUELISTREC *vl;
{
X  long n, n1, n2;
X
X  if (arity(op) != lengthVL(vl)) {
X    printf("Wrong number of arguments to ");
X    prName((int)op + 1);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  if (op == PRINTOP) {
X    prValue(vl->head);
X    putchar('\n');
X    return (vl->head);
X  } else {
X    if (vl->head->vtype != PRIM || vl->tail->head->vtype != PRIM) {
X      printf("Arguments to primitive op not primitive: ");
X      prName((int)op+1);
X      putchar('\n');
X      longjmp(_JL99, 1);
X    }
X    n1 = vl->head->UU.intval;   /* 1st actual */
X    n2 = vl->tail->head->UU.intval;   /* 2nd actual */
X    switch (op) {
X
X    case PLUSOP:
X      n = n1 + n2;
X      break;
X
X    case MINUSOP:
X      n = n1 - n2;
X      break;
X
X    case TIMESOP:
X      n = n1 * n2;
X      break;
X
X    case DIVOP:
X      n = n1 / n2;
X      break;
X
X    case EQOP:
X      if (n1 == n2)
X	n = 1;
X      else
X	n = 0;
X      break;
X
X    case LTOP:
X      if (n1 < n2)
X	n = 1;
X      else
X	n = 0;
X      break;
X
X    case GTOP:
X      if (n1 > n2)
X	n = 1;
X      else
X	n = 0;
X      break;
X    }/* case */
X    return (mkPRIM(n));
X  }
}  /* applyValueOp */
X
X
Static CLUVALUEREC *eval PP((EXPREC *e, ENVREC *rho, CLUSTERREC *c));
X
/* Local variables for eval: */
struct LOC_eval {
X  ENVREC *rho;
X  CLUSTERREC *c;
} ;
X
/* evalList - evaluate each expression in el                     */
Local VALUELISTREC *evalList(el, LINK)
EXPLISTREC *el;
struct LOC_eval *LINK;
{
X  CLUVALUEREC *h;
X  VALUELISTREC *t;
X
X  if (el == NULL)
X    return NULL;
X  else {
X    h = eval(el->head, LINK->rho, LINK->c);
X    t = evalList(el->tail, LINK);
X    return (mkValuelist(h, t));
X  }
}  /* evalList */
X
/* Local variables for applyUserFun: */
struct LOC_applyUserFun {
X  struct LOC_eval *LINK;
X  VALUELISTREC *actuals;
} ;
X
/* Local variables for checkArgs: */
struct LOC_checkArgs {
X  struct LOC_applyUserFun *LINK;
X  FUNNAME nm;
X  FUNDEFREC *f;
X  CLUSTERREC *cl;
} ;
X
Local long arity_(LINK)
struct LOC_checkArgs *LINK;
{
X  long Result;
X  FUNDEFREC *WITH;
X
X  WITH = LINK->f;
X  switch (WITH->ftype) {
X
X  case NORMAL:
X    Result = lengthNL(WITH->UU.U0.formals);
X    break;
X
X  case CONSTRUCTOR:
X    Result = lengthNL(LINK->cl->clrep);
X    break;
X
X  case SELECTOR:
X    Result = 1;
X    break;
X
X  case SETTOR:
X    Result = 2;
X    break;
X  }/* case and with */
X  return Result;
}  /* arity */
X
/* typeError - print type error message                          */
Local Void typeError(LINK)
struct LOC_checkArgs *LINK;
{
X  printf("Wrong type argument to: ");
X  prName(LINK->nm.funpart);
X  putchar('\n');
X  longjmp(_JL99, 1);
}  /* typeError */
X
/* checkArgs - check number/type (as far as possible) of args    */
Local Void checkArgs(nm_, f_, cl_, LINK)
FUNNAME nm_;
FUNDEFREC *f_;
CLUSTERREC *cl_;
struct LOC_applyUserFun *LINK;
{
X
X  /* arity - number of arguments expected by f                     */
X  struct LOC_checkArgs V;
X  FUNDEFREC *WITH;
X
X  V.LINK = LINK;
X  V.nm = nm_;
X  V.f = f_;
X  V.cl = cl_;
X  if (arity_(&V) != lengthVL(LINK->actuals)) {
X    printf("Wrong number of arguments to: ");
X    prName(V.nm.funpart);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  WITH = V.f;
X  if (((1L << ((long)WITH->ftype)) &
X       ((1L << ((long)SELECTOR)) | (1 << ((long)SETTOR)))) != 0) {
X    if (LINK->actuals->head->vtype == PRIM)
X      typeError(&V);
X  }
X  if (WITH->ftype == SELECTOR) {
X    if (!isBound(V.nm.funpart, LINK->actuals->head->UU.userval))
X      typeError(&V);
X  }
X  if (WITH->ftype == SETTOR) {
X    if (!isBound(WITH->UU.selname, LINK->actuals->head->UU.userval))
X      typeError(&V);
X  }
}  /* checkArgs */
X
/* applyUserFun - look up definition of nm and apply to actuals  */
Local CLUVALUEREC *applyUserFun(nm, actuals_, LINK)
FUNNAME nm;
VALUELISTREC *actuals_;
struct LOC_eval *LINK;
{
X  struct LOC_applyUserFun V;
X  CLUVALUEREC *Result;
X  FUNDEFREC *f;
X  ENVREC *rho, *valrho;
X  CLUVALUEREC *v;
X  CLUSTERREC *cl;
X
X  V.LINK = LINK;
X  V.actuals = actuals_;
X  if (nm.nametype == TWOPART) {
X    cl = fetchCluster(nm.UU.clpart);
X    if (cl == NULL) {
X      printf("Non-existent cluster: ");
X      prName(nm.UU.clpart);
X      putchar('\n');
X      longjmp(_JL99, 1);
X    }
X    f = fetchFun(nm.funpart, cl->exported);
X  } else {  /* one-part name */
X    cl = LINK->c;
X    if (cl == NULL)   /* called from top level */
X      f = fetchFun(nm.funpart, fundefs);
X    else {  /* try exported function first */
X      f = fetchFun(nm.funpart, cl->exported);
X      if (f == NULL) {  /* else non-exported */
X	f = fetchFun(nm.funpart, cl->nonexported);
X	if (f == NULL) {  /* else top-level */
X	  cl = NULL;
X	  f = fetchFun(nm.funpart, fundefs);
X	}
X      }
X    }
X  }
X  if (f == NULL) {
X    printf("Undefined function: ");
X    prName(nm.funpart);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  checkArgs(nm, f, cl, &V);
X  switch (f->ftype) {
X
X  case NORMAL:
X    rho = mkEnv(f->UU.U0.formals, V.actuals);
X    Result = eval(f->UU.U0.body, rho, cl);
X    break;
X
X  case CONSTRUCTOR:
X    Result = mkUSER(mkEnv(cl->clrep, V.actuals));
X    break;
X
X  case SELECTOR:
X    valrho = V.actuals->head->UU.userval;
X    Result = fetch(nm.funpart, valrho);
X    break;
X
X  case SETTOR:
X    valrho = V.actuals->head->UU.userval;
X    v = V.actuals->tail->head;
X    assign(f->UU.selname, v, valrho);
X    Result = v;
X    break;
X  }/* case and with */
X  return Result;
}  /* applyUserFun */
X
/* applyCtrlOp - apply CONTROLOP op to args in rho               */
Local CLUVALUEREC *applyCtrlOp(op, args, LINK)
BUILTINOP op;
EXPLISTREC *args;
struct LOC_eval *LINK;
{
X  CLUVALUEREC *Result, *v;
X  EXPLISTREC *WITH;
X
X  WITH = args;
X  switch (op) {
X
X  case IFOP:
X    if (isTrueVal(eval(WITH->head, LINK->rho, LINK->c)))
X      Result = eval(WITH->tail->head, LINK->rho, LINK->c);
X    else
X      Result = eval(WITH->tail->tail->head, LINK->rho, LINK->c);
X    break;
X
X  case WHILEOP:
X    v = eval(WITH->head, LINK->rho, LINK->c);
X    while (isTrueVal(v)) {
X      v = eval(WITH->tail->head, LINK->rho, LINK->c);
X      v = eval(WITH->head, LINK->rho, LINK->c);
X    }
X    Result = v;
X    break;
X
X  case SETOP:
X    v = eval(WITH->tail->head, LINK->rho, LINK->c);
X    if (isBound(WITH->head->UU.varble, LINK->rho))
X      assign(WITH->head->UU.varble, v, LINK->rho);
X    else if (isBound(WITH->head->UU.varble, globalEnv))
X      assign(WITH->head->UU.varble, v, globalEnv);
X    else
X      bindVar(WITH->head->UU.varble, v, globalEnv);
X    Result = v;
X    break;
X
X  case BEGINOP:
X    while (args->tail != NULL) {
X      v = eval(args->head, LINK->rho, LINK->c);
X      args = args->tail;
X    }
X    Result = eval(args->head, LINK->rho, LINK->c);
X    break;
X  }/* case and with */
X  return Result;
}  /* applyCtrlOp */
X
X
/*****************************************************************
X *                     EVALUATION                                *
X *****************************************************************/
/* eval - return value of e in environment rho, cluster c        */
Static CLUVALUEREC *eval(e, rho_, c_)
EXPREC *e;
ENVREC *rho_;
CLUSTERREC *c_;
{
X  struct LOC_eval V;
X  CLUVALUEREC *Result;
X  BUILTINOP op;
X
X  V.rho = rho_;
X  V.c = c_;
X  switch (e->etype) {
X
X  case VALEXP:
X    Result = e->UU.valu;
X    break;
X
X  case VAREXP:
X    if (isBound(e->UU.varble, V.rho))
X      Result = fetch(e->UU.varble, V.rho);
X    else if (isBound(e->UU.varble, globalEnv))
X      Result = fetch(e->UU.varble, globalEnv);
X    else {
X      printf("Undefined variable: ");
X      prName(e->UU.varble);
X      putchar('\n');
X      longjmp(_JL99, 1);
X    }
X    break;
X
X  case APEXP:
X    if (e->UU.U2.optr.funpart > numBuiltins)
X      Result = applyUserFun(e->UU.U2.optr, evalList(e->UU.U2.args, &V), &V);
X    else {
X      op = primOp(e->UU.U2.optr.funpart);
X      if (((1L << ((long)op)) &
X	   ((1 << ((long)BEGINOP + 1)) - (1 << ((long)IFOP)))) != 0)
X	Result = applyCtrlOp(op, e->UU.U2.args, &V);
X      else
X	Result = applyValueOp(op, evalList(e->UU.U2.args, &V));
X    }
X    break;
X  }/* case and with */
X  return Result;
}  /* eval */
X
X
/*****************************************************************
X *                     READ-EVAL-PRINT LOOP                      *
X *****************************************************************/
X
main(argc, argv)
int argc;
Char *argv[];
{  /* clu main */
X  PASCAL_MAIN(argc, argv);
X  if (setjmp(_JL99))
X    goto _L99;
X  initNames();
X  globalEnv = emptyEnv();
X
X  quittingtime = false;
_L99:
X  while (!quittingtime) {
X    reader();
X    if (matches((long)pos_, 4, "quit                ")) {
X      quittingtime = true;
X      break;
X    }
X    if ((userinput[pos_ - 1] == '(') & matches(skipblanks(pos_ + 1L), 6,
X					       "define              ")) {
X      prName(parseDef(&fundefs));
X      putchar('\n');
X    } else if ((userinput[pos_ - 1] == '(') & matches(skipblanks(pos_ + 1L),
X		 7, "cluster             ")) {
X      prName(parseCluster());
X      putchar('\n');
X    } else {
X      currentExp = parseExp();
X      prValue(eval(currentExp, emptyEnv(), NULL));
X      printf("\n\n");
X    }
X  }  /* while */
X  exit(0);
}  /* clu */
X
X
X
/* End. */
SHAR_EOF
  (set 19 90 03 15 20 12 39 'c-distr/clu.c'; eval "$shar_touch") &&
  chmod 0644 'c-distr/clu.c'
if test $? -ne 0
then ${echo} 'restore of c-distr/clu.c failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/clu.c: MD5 check failed'
       ) << SHAR_EOF
2e59bcdae5438afb0c6225024b27b79f  c-distr/clu.c
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/clu.c'` -ne 29384 && \
  ${echo} 'restoration warning:  size of c-distr/clu.c is not 29384'
  fi
fi
# ============= c-distr/chap1.c ==============
if test -f 'c-distr/chap1.c' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/chap1.c (file already exists)'
else
${echo} 'x - extracting c-distr/chap1.c (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/chap1.c' &&
/* Output from p2c, the Pascal-to-C translator */
/* From input file "chap1.p" */
X
X
/*****************************************************************
X *                     DECLARATIONS                              *
X *****************************************************************/
X
#include <p2c/p2c.h>
X
X
#define NAMELENG        20   /* Maximum length of a name */
#define MAXNAMES        100   /* Maximum number of different names */
#define MAXINPUT        500   /* Maximum length of an input */
X
#define PROMPT          "-> "
#define PROMPT2         "> "
#define COMMENTCHAR     ";"
X
#define TABCODE         9   /* in ASCII */
X
X
typedef Char NAMESTRING[NAMELENG];
X
/* a NAME is an index in printNames */
X
typedef enum {
X  IFOP, WHILEOP, SETOP, BEGINOP, PLUSOP, MINUSOP, TIMESOP, DIVOP, EQOP, LTOP,
X  GTOP, PRINTOP
} BUILTINOP;
X
X
typedef enum {
X  VALEXP, VAREXP, APEXP
} EXPTYPE;
X
typedef struct EXPREC {
X  EXPTYPE etype;
X  union {
X    long num;
X    char varble;
X    struct {
X      char optr;
X      struct EXPLISTREC *args;
X    } U2;
X  } UU;
} EXPREC;
X
typedef struct EXPLISTREC {
X  EXPREC *head;
X  struct EXPLISTREC *tail;
} EXPLISTREC;
X
typedef struct VALUELISTREC {
X  long head;
X  struct VALUELISTREC *tail;
} VALUELISTREC;
X
typedef struct NAMELISTREC {
X  char head;
X  struct NAMELISTREC *tail;
} NAMELISTREC;
X
typedef struct ENVREC {
X  NAMELISTREC *vars;
X  VALUELISTREC *values;
} ENVREC;
X
typedef struct FUNDEFREC {
X  char funname;
X  NAMELISTREC *formals;
X  EXPREC *body;
X  struct FUNDEFREC *nextfundef;
} FUNDEFREC;
X
X
Static FUNDEFREC *fundefs;
X
Static ENVREC *globalEnv;
X
Static EXPREC *currentExp;
X
Static Char userinput[MAXINPUT];
Static short inputleng, pos_;
X
Static NAMESTRING printNames[MAXNAMES];
Static char numNames, numBuiltins;
X
Static boolean quittingtime;
X
X
/*****************************************************************
X *                     DATA STRUCTURE OP'S                       *
X *****************************************************************/
X
/* mkVALEXP - return an EXP of type VALEXP with num n            */
Static EXPREC *mkVALEXP(n)
long n;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = VALEXP;
X  e->UU.num = n;
X  return e;
}  /* mkVALEXP */
X
X
/* mkVAREXP - return an EXP of type VAREXP with varble nm        */
Static EXPREC *mkVAREXP(nm)
char nm;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = VAREXP;
X  e->UU.varble = nm;
X  return e;
}  /* mkVAREXP */
X
X
/* mkAPEXP - return EXP of type APEXP w/ optr op and args el     */
Static EXPREC *mkAPEXP(op, el)
char op;
EXPLISTREC *el;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = APEXP;
X  e->UU.U2.optr = op;
X  e->UU.U2.args = el;
X  return e;
}  /* mkAPEXP */
X
X
/* mkExplist - return an EXPLIST with head e and tail el         */
Static EXPLISTREC *mkExplist(e, el)
EXPREC *e;
EXPLISTREC *el;
{
X  EXPLISTREC *newel;
X
X  newel = (EXPLISTREC *)Malloc(sizeof(EXPLISTREC));
X  newel->head = e;
X  newel->tail = el;
X  return newel;
}  /* mkExplist */
X
X
/* mkNamelist - return a NAMELIST with head n and tail nl        */
Static NAMELISTREC *mkNamelist(nm, nl)
char nm;
NAMELISTREC *nl;
{
X  NAMELISTREC *newnl;
X
X  newnl = (NAMELISTREC *)Malloc(sizeof(NAMELISTREC));
X  newnl->head = nm;
X  newnl->tail = nl;
X  return newnl;
}  /* mkNamelist */
X
X
/* mkValuelist - return an VALUELIST with head n and tail vl     */
Static VALUELISTREC *mkValuelist(n, vl)
long n;
VALUELISTREC *vl;
{
X  VALUELISTREC *newvl;
X
X  newvl = (VALUELISTREC *)Malloc(sizeof(VALUELISTREC));
X  newvl->head = n;
X  newvl->tail = vl;
X  return newvl;
}  /* mkValuelist */
X
X
/* mkEnv - return an ENV with vars nl and values vl              */
Static ENVREC *mkEnv(nl, vl)
NAMELISTREC *nl;
VALUELISTREC *vl;
{
X  ENVREC *rho;
X
X  rho = (ENVREC *)Malloc(sizeof(ENVREC));
X  rho->vars = nl;
X  rho->values = vl;
X  return rho;
}  /* mkEnv */
X
X
/* lengthVL - return length of VALUELIST vl                      */
Static long lengthVL(vl)
VALUELISTREC *vl;
{
X  long i;
X
X  i = 0;
X  while (vl != NULL) {
X    i++;
X    vl = vl->tail;
X  }
X  return i;
}  /* lengthVL */
X
X
/* lengthNL - return length of NAMELIST nl                       */
Static long lengthNL(nl)
NAMELISTREC *nl;
{
X  long i;
X
X  i = 0;
X  while (nl != NULL) {
X    i++;
X    nl = nl->tail;
X  }
X  return i;
}  /* lengthNL */
X
X
/*****************************************************************
X *                     NAME MANAGEMENT                           *
X *****************************************************************/
X
/* fetchFun - get function definition of fname from fundefs      */
Static FUNDEFREC *fetchFun(fname)
char fname;
{
X  FUNDEFREC *f;
X  boolean found;
X
X  found = false;
X  f = fundefs;
X  while (f != NULL && !found) {
X    if (f->funname == fname)
X      found = true;
X    else
X      f = f->nextfundef;
X  }
X  return f;
}  /* fetchFun */
X
X
/* newFunDef - add new function fname w/ parameters nl, body e   */
Static Void newFunDef(fname, nl, e)
char fname;
NAMELISTREC *nl;
EXPREC *e;
{
X  FUNDEFREC *f;
X
X  f = fetchFun(fname);
X  if (f == NULL) {   /* fname not yet defined as a function */
X    f = (FUNDEFREC *)Malloc(sizeof(FUNDEFREC));
X    f->nextfundef = fundefs;   /* place new FUNDEFREC */
X    fundefs = f;   /* on fundefs list */
X  }
X  f->funname = fname;
X  f->formals = nl;
X  f->body = e;
}  /* newFunDef */
X
X
/* initNames - place all pre-defined names into printNames       */
Static Void initNames()
{
X  long i;
X
X  fundefs = NULL;
X  i = 1;
X  memcpy(printNames[i - 1], "if                  ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "while               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "set                 ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "begin               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "+                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "-                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "*                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "/                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "=                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "<                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], ">                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "print               ", sizeof(NAMESTRING));
X  numNames = i;
X  numBuiltins = i;
}  /* initNames */
X
X
Static jmp_buf _JL99;
X
X
/* install - insert new name into printNames                     */
Static char install(nm)
Char *nm;
{
X  long i;
X  boolean found;
X
X  i = 1;
X  found = false;
X  while (i <= numNames && !found) {
X    if (!memcmp(nm, printNames[i - 1], sizeof(NAMESTRING)))
X      found = true;
X    else
X      i++;
X  }
X  if (found)
X    return i;
X  if (i > MAXNAMES) {
X    printf("No more room for names\n");
X    longjmp(_JL99, 1);
X  }
X  numNames = i;
X  memcpy(printNames[i - 1], nm, sizeof(NAMESTRING));
X  return i;
}  /* install */
X
X
/* prName - print name nm                                        */
Static Void prName(nm)
char nm;
{
X  long i;
X
X  i = 1;
X  while (i <= NAMELENG) {
X    if (printNames[nm - 1][i - 1] != ' ') {
X      putchar(printNames[nm - 1][i - 1]);
X      i++;
X    } else
X      i = NAMELENG + 1;
X  }
}  /* prName */
X
X
/* primOp - translate NAME optr to corresponding BUILTINOP       */
Static BUILTINOP primOp(optr)
char optr;
{
X  BUILTINOP op;
X  long i;
X
X  op = IFOP;   /* N.B. IFOP is first value in BUILTINOPS */
X  for (i = 1; i < optr; i++)
X    op = (BUILTINOP)((long)op + 1);
X  return op;
}  /* primOp */
X
X
/*****************************************************************
X *                        INPUT                                  *
X *****************************************************************/
X
/* isDelim - check if c is a delimiter                           */
Static boolean isDelim(c)
Char c;
{
X  return (c == ';' || c == ' ' || c == ')' || c == '(');
}  /* isDelim */
X
X
/* skipblanks - return next non-blank position in userinput      */
Static long skipblanks(p)
long p;
{
X  while (userinput[p - 1] == ' ')
X    p++;
X  return p;
}  /* skipblanks */
X
X
/* matches - check if string nm matches userinput[s .. s+leng]   */
Static boolean matches(s, leng, nm)
long s;
char leng;
Char *nm;
{
X  boolean match;
X  long i;
X
X  match = true;
X  i = 1;
X  while (match && i <= leng) {
X    if (userinput[s - 1] != nm[i - 1])
X      match = false;
X    i++;
X    s++;
X  }
X  if (!isDelim(userinput[s - 1]))
X    match = false;
X  return match;
}  /* matches */
X
X
/* nextchar - read next char - filter tabs and comments          */
Local Void nextchar(c)
Char *c;
{
X  Char STR1[256];
X
X  *c = getchar();
X  if (*c == '\n')
X    *c = ' ';
X  if (*c == (Char)TABCODE) {
X    *c = ' ';
X    return;
X  }
X  sprintf(STR1, "%c", *c);
X  if (strcmp(STR1, COMMENTCHAR))
X    return;
X  while (!P_eoln(stdin)) {
X    *c = getchar();
X    if (*c == '\n')
X      *c = ' ';
X  }
X  *c = ' ';
}  /* nextchar */
X
/* readParens - read char's, ignoring newlines, to matching ')'  */
Local Void readParens()
{
X  long parencnt;   /* current depth of parentheses */
X  Char c;
X
X  parencnt = 1;   /* '(' just read */
X  do {
X    if (P_eoln(stdin))
X      fputs(PROMPT2, stdout);
X    nextchar(&c);
X    pos_++;
X    if (pos_ == MAXINPUT) {
X      printf("User input too long\n");
X      longjmp(_JL99, 1);
X    }
X    userinput[pos_ - 1] = c;
X    if (c == '(')
X      parencnt++;
X    if (c == ')')
X      parencnt--;
X  } while (parencnt != 0);   /* readParens */
}
X
Local Void readInput()
{
X  Char c;
X
X  fputs(PROMPT, stdout);
X  pos_ = 0;
X  do {
X    pos_++;
X    if (pos_ == MAXINPUT) {
X      printf("User input too long\n");
X      longjmp(_JL99, 1);
X    }
X    nextchar(&c);
X    userinput[pos_ - 1] = c;
X    if (userinput[pos_ - 1] == '(')
X      readParens();
X  } while (!P_eoln(stdin));
X  inputleng = pos_;
X  userinput[pos_] = ';';   /* sentinel */
}  /* readInput */
X
X
/* reader - read char's into userinput; be sure input not blank  */
Static Void reader()
{
X
X  /* readInput - read char's into userinput                        */
X  do {
X    readInput();
X    pos_ = skipblanks(1L);   /* ignore blank lines */
X  } while (pos_ > inputleng);   /* reader */
}
X
X
/* parseName - return (installed) NAME starting at userinput[pos]*/
Static char parseName()
{
X  NAMESTRING nm;   /* array to accumulate characters */
X  char leng;   /* length of name */
X
X  leng = 0;
X  while ((pos_ <= inputleng) & (!isDelim(userinput[pos_ - 1]))) {
X    if (leng == NAMELENG) {
X      printf("Name too long, begins: %.*s\n", NAMELENG, nm);
X      longjmp(_JL99, 1);
X    }
X    leng++;
X    nm[leng - 1] = userinput[pos_ - 1];
X    pos_++;
X  }
X  if (leng == 0) {
X    printf("Error: expected name, instead read: %c\n", userinput[pos_ - 1]);
X    longjmp(_JL99, 1);
X  }
X  for (; leng < NAMELENG; leng++)
X    nm[leng] = ' ';
X  pos_ = skipblanks((long)pos_);   /* skip blanks after name */
X  return (install(nm));
}  /* parseName */
X
X
Local boolean isDigits(pos)
long pos;
{
X  boolean Result;
X
X  if (!isdigit(userinput[pos - 1]))
X    return false;
X  Result = true;
X  while (isdigit(userinput[pos - 1]))
X    pos++;
X  if (!isDelim(userinput[pos - 1]))
X    return false;
X  return Result;
}  /* isDigits */
X
X
/* isNumber - check if a number begins at pos                    */
Static boolean isNumber(pos)
long pos;
{
X
X  /* isDigits - check if sequence of digits begins at pos          */
X  return (isDigits(pos) | ((userinput[pos - 1] == '-') & isDigits(pos + 1)));
}  /* isNumber */
X
X
/* parseVal - return number starting at userinput[pos]           */
Static long parseVal()
{
X  long n, sign;
X
X  n = 0;
X  sign = 1;
X  if (userinput[pos_ - 1] == '-') {
X    sign = -1;
X    pos_++;
X  }
X  while (isdigit(userinput[pos_ - 1])) {
X    n = n * 10 + userinput[pos_ - 1] - '0';
X    pos_++;
X  }
X  pos_ = skipblanks((long)pos_);   /* skip blanks after number */
X  return (n * sign);
}  /* parseVal */
X
X
Static EXPLISTREC *parseEL PV();
X
X
/* parseExp - return EXP starting at userinput[pos]              */
Static EXPREC *parseExp()
{
X  char nm;
X  EXPLISTREC *el;
X
X  if (userinput[pos_ - 1] == '(') {  /* APEXP */
X    pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X    nm = parseName();
X    el = parseEL();
X    return (mkAPEXP(nm, el));
X  } else if (isNumber((long)pos_))
X    return (mkVALEXP(parseVal()));   /* VALEXP */
X  else
X    return (mkVAREXP(parseName()));   /* VAREXP */
}  /* parseExp */
X
X
/* parseEL - return EXPLIST starting at userinput[pos]           */
Static EXPLISTREC *parseEL()
{
X  EXPREC *e;
X  EXPLISTREC *el;
X
X  if (userinput[pos_ - 1] == ')') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X    return NULL;
X  } else {
X    e = parseExp();
X    el = parseEL();
X    return (mkExplist(e, el));
X  }
}  /* parseEL */
X
X
/* parseNL - return NAMELIST starting at userinput[pos]          */
Static NAMELISTREC *parseNL()
{
X  char nm;
X  NAMELISTREC *nl;
X
X  if (userinput[pos_ - 1] == ')') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X    return NULL;
X  } else {
X    nm = parseName();
X    nl = parseNL();
X    return (mkNamelist(nm, nl));
X  }
}  /* parseNL */
X
X
/* parseDef - parse function definition at userinput[pos]        */
Static char parseDef()
{
X  char fname;   /* function name */
X  NAMELISTREC *nl;   /* formal parameters */
X  EXPREC *e;   /* body */
X
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X  pos_ = skipblanks(pos_ + 6L);   /* skip 'define ..' */
X  fname = parseName();
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X  nl = parseNL();
X  e = parseExp();
X  pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X  newFunDef(fname, nl, e);
X  return fname;
}  /* parseDef */
X
X
/*****************************************************************
X *                     ENVIRONMENTS                              *
X *****************************************************************/
X
/* emptyEnv - return an environment with no bindings             */
Static ENVREC *emptyEnv()
{
X  return (mkEnv(NULL, NULL));
}  /* emptyEnv */
X
X
/* bindVar - bind variable nm to value n in environment rho      */
Static Void bindVar(nm, n, rho)
char nm;
long n;
ENVREC *rho;
{
X  rho->vars = mkNamelist(nm, rho->vars);
X  rho->values = mkValuelist(n, rho->values);
}  /* bindVar */
X
X
/* findVar - look up nm in rho                                   */
Static VALUELISTREC *findVar(nm, rho)
char nm;
ENVREC *rho;
{
X  NAMELISTREC *nl;
X  VALUELISTREC *vl;
X  boolean found;
X
X  found = false;
X  nl = rho->vars;
X  vl = rho->values;
X  while (nl != NULL && !found) {
X    if (nl->head == nm)
X      found = true;
X    else {
X      nl = nl->tail;
X      vl = vl->tail;
X    }
X  }
X  return vl;
}  /* findVar */
X
X
/* assign - assign value n to variable nm in rho                 */
Static Void assign(nm, n, rho)
char nm;
long n;
ENVREC *rho;
{
X  VALUELISTREC *varloc;
X
X  varloc = findVar(nm, rho);
X  varloc->head = n;
}  /* assign */
X
X
/* fetch - return number bound to nm in rho                      */
Static long fetch(nm, rho)
char nm;
ENVREC *rho;
{
X  VALUELISTREC *vl;
X
X  vl = findVar(nm, rho);
X  return (vl->head);
}  /* fetch */
X
X
/* isBound - check if nm is bound in rho                         */
Static boolean isBound(nm, rho)
char nm;
ENVREC *rho;
{
X  return (findVar(nm, rho) != NULL);
}  /* isBound */
X
X
/*****************************************************************
X *                     NUMBERS                                   *
X *****************************************************************/
X
/* prValue - print number n                                      */
Static Void prValue(n)
long n;
{
X  printf("%ld", n);
}  /* prValue */
X
X
/* isTrueVal - return true if n is a true (non-zero) value       */
Static boolean isTrueVal(n)
long n;
{
X  return (n != 0);
}  /* isTrueVal */
X
X
/* arity - return number of arguments expected by op             */
Local long arity(op)
BUILTINOP op;
{
X  if (((1L << ((long)op)) & ((1 << ((long)GTOP + 1)) - (1 << ((long)PLUSOP)))) != 0)
X    return 2;
X  else
X    return 1;
}  /* arity */
X
X
/* applyValueOp - apply VALUEOP op to arguments in VALUELIST vl  */
Static long applyValueOp(op, vl)
BUILTINOP op;
VALUELISTREC *vl;
{
X  long n, n1, n2;
X
X  if (arity(op) != lengthVL(vl)) {
X    printf("Wrong number of arguments to ");
X    prName((int)op + 1);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  n1 = vl->head;   /* 1st actual */
X  if (arity(op) == 2)   /* 2nd actual */
X    n2 = vl->tail->head;
X  switch (op) {
X
X  case PLUSOP:
X    n = n1 + n2;
X    break;
X
X  case MINUSOP:
X    n = n1 - n2;
X    break;
X
X  case TIMESOP:
X    n = n1 * n2;
X    break;
X
X  case DIVOP:
X    n = n1 / n2;
X    break;
X
X  case EQOP:
X    if (n1 == n2)
X      n = 1;
X    else
X      n = 0;
X    break;
X
X  case LTOP:
X    if (n1 < n2)
X      n = 1;
X    else
X      n = 0;
X    break;
X
X  case GTOP:
X    if (n1 > n2)
X      n = 1;
X    else
X      n = 0;
X    break;
X
X  case PRINTOP:
X    prValue(n1);
X    putchar('\n');
X    n = n1;
X    break;
X  }/* case */
X  return n;
}  /* applyValueOp */
X
X
Static long eval PP((EXPREC *e, ENVREC *rho));
X
/* Local variables for eval: */
struct LOC_eval {
X  ENVREC *rho;
} ;
X
/* evalList - evaluate each expression in el                     */
Local VALUELISTREC *evalList(el, LINK)
EXPLISTREC *el;
struct LOC_eval *LINK;
{
X  long h;
X  VALUELISTREC *t;
X
X  if (el == NULL)
X    return NULL;
X  else {
X    h = eval(el->head, LINK->rho);
X    t = evalList(el->tail, LINK);
X    return (mkValuelist(h, t));
X  }
}  /* evalList */
X
/* applyUserFun - look up definition of nm and apply to actuals  */
Local long applyUserFun(nm, actuals, LINK)
char nm;
VALUELISTREC *actuals;
struct LOC_eval *LINK;
{
X  FUNDEFREC *f;
X  ENVREC *rho;
X
X  f = fetchFun(nm);
X  if (f == NULL) {
X    printf("Undefined function: ");
X    prName(nm);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  if (lengthNL(f->formals) != lengthVL(actuals)) {
X    printf("Wrong number of arguments to: ");
X    prName(nm);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  rho = mkEnv(f->formals, actuals);
X  return (eval(f->body, rho));
}  /* applyUserFun */
X
/* applyCtrlOp - apply CONTROLOP op to args in rho               */
Local long applyCtrlOp(op, args, LINK)
BUILTINOP op;
EXPLISTREC *args;
struct LOC_eval *LINK;
{
X  long Result, n;
X  EXPLISTREC *WITH;
X
X  WITH = args;
X  switch (op) {
X
X  case IFOP:
X    if (isTrueVal(eval(WITH->head, LINK->rho)))
X      Result = eval(WITH->tail->head, LINK->rho);
X    else
X      Result = eval(WITH->tail->tail->head, LINK->rho);
X    break;
X
X  case WHILEOP:
X    n = eval(WITH->head, LINK->rho);
X    while (isTrueVal(n)) {
X      n = eval(WITH->tail->head, LINK->rho);
X      n = eval(WITH->head, LINK->rho);
X    }
X    Result = n;
X    break;
X
X  case SETOP:
X    n = eval(WITH->tail->head, LINK->rho);
X    if (isBound(WITH->head->UU.varble, LINK->rho))
X      assign(WITH->head->UU.varble, n, LINK->rho);
X    else if (isBound(WITH->head->UU.varble, globalEnv))
X      assign(WITH->head->UU.varble, n, globalEnv);
X    else
X      bindVar(WITH->head->UU.varble, n, globalEnv);
X    Result = n;
X    break;
X
X  case BEGINOP:
X    while (args->tail != NULL) {
X      n = eval(args->head, LINK->rho);
X      args = args->tail;
X    }
X    Result = eval(args->head, LINK->rho);
X    break;
X  }/* case and with */
X  return Result;
}  /* applyCtrlOp */
X
X
/*****************************************************************
X *                     EVALUATION                                *
X *****************************************************************/
X
/* eval - return value of expression e in local environment rho  */
Static long eval(e, rho_)
EXPREC *e;
ENVREC *rho_;
{
X  struct LOC_eval V;
X  long Result;
X  BUILTINOP op;
X
X  V.rho = rho_;
X  switch (e->etype) {
X
X  case VALEXP:
X    Result = e->UU.num;
X    break;
X
X  case VAREXP:
X    if (isBound(e->UU.varble, V.rho))
X      Result = fetch(e->UU.varble, V.rho);
X    else if (isBound(e->UU.varble, globalEnv))
X      Result = fetch(e->UU.varble, globalEnv);
X    else {
X      printf("Undefined variable: ");
X      prName(e->UU.varble);
X      putchar('\n');
X      longjmp(_JL99, 1);
X    }
X    break;
X
X  case APEXP:
X    if (e->UU.U2.optr > numBuiltins)
X      Result = applyUserFun(e->UU.U2.optr, evalList(e->UU.U2.args, &V), &V);
X    else {
X      op = primOp(e->UU.U2.optr);
X      if (((1L << ((long)op)) &
X	   ((1 << ((long)BEGINOP + 1)) - (1 << ((long)IFOP)))) != 0)
X	Result = applyCtrlOp(op, e->UU.U2.args, &V);
X      else
X	Result = applyValueOp(op, evalList(e->UU.U2.args, &V));
X    }
X    break;
X  }/* case and with */
X  return Result;
}  /* eval */
X
X
/*****************************************************************
X *                     READ-EVAL-PRINT LOOP                      *
X *****************************************************************/
X
main(argc, argv)
int argc;
Char *argv[];
{  /* chapter1 main */
X  PASCAL_MAIN(argc, argv);
X  if (setjmp(_JL99))
X    goto _L99;
X  initNames();
X  globalEnv = emptyEnv();
X
X  quittingtime = false;
_L99:
X  while (!quittingtime) {
X    reader();
X    if (matches((long)pos_, 4, "quit                ")) {
X      quittingtime = true;
X      break;
X    }
X    if ((userinput[pos_ - 1] == '(') & matches(skipblanks(pos_ + 1L), 6,
X					       "define              ")) {
X      prName(parseDef());
X      putchar('\n');
X    } else {
X      currentExp = parseExp();
X      prValue(eval(currentExp, emptyEnv()));
X      printf("\n\n");
X    }
X  }  /* while */
X  exit(0);
}  /* chapter1 */
X
X
X
X
X
X
/* End. */
SHAR_EOF
  (set 19 90 01 05 18 00 23 'c-distr/chap1.c'; eval "$shar_touch") &&
  chmod 0644 'c-distr/chap1.c'
if test $? -ne 0
then ${echo} 'restore of c-distr/chap1.c failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/chap1.c: MD5 check failed'
       ) << SHAR_EOF
d9402b4d20fd93289605d06e7782daff  c-distr/chap1.c
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/chap1.c'` -ne 21293 && \
  ${echo} 'restoration warning:  size of c-distr/chap1.c is not 21293'
  fi
fi
# ============= c-distr/apl.c ==============
if test -f 'c-distr/apl.c' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/apl.c (file already exists)'
else
${echo} 'x - extracting c-distr/apl.c (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/apl.c' &&
/* Output from p2c, the Pascal-to-C translator */
/* From input file "apl.p" */
X
X
/*****************************************************************
X *                     DECLARATIONS                              *
X *****************************************************************/
X
#include <p2c/p2c.h>
X
X
#define NAMELENG        20   /* Maximum length of a name */
#define MAXNAMES        100   /* Maximum number of different names */
#define MAXINPUT        500   /* Maximum length of an input */
X
#define PROMPT          "-> "
#define PROMPT2         "> "
#define COMMENTCHAR     ";"
X
#define TABCODE         9   /* in ASCII */
X
X
typedef Char NAMESTRING[NAMELENG];
X
/* a NAME is an index in printNames */
X
typedef enum {
X  IFOP, WHILEOP, SETOP, BEGINOP, PLUSOP, MINUSOP, TIMESOP, DIVOP, MAXOP, OROP,
X  ANDOP, EQOP, LTOP, GTOP, REDPLUSOP, REDMINUSOP, REDTIMESOP, REDDIVOP,
X  REDMAXOP, REDOROP, REDANDOP, COMPRESSOP, SHAPEOP, RAVELOP, RESTRUCTOP,
X  CATOP, INDXOP, TRANSOP, SUBOP, PRINTOP
} BUILTINOP;
X
X
typedef enum {
X  SCALAR, VECTOR, MATRIX
} RANK;
X
typedef struct APLVALUEREC {
X  struct INTLISTREC *intvals;
X  RANK rnk;
X  union {
X    long leng;
X    struct {
X      long rows, cols;
X    } U2;
X  } UU;
} APLVALUEREC;
X
typedef struct INTLISTREC {
X  long int_;
X  struct INTLISTREC *nextint;
} INTLISTREC;
X
typedef enum {
X  VALEXP, VAREXP, APEXP
} EXPTYPE;
X
typedef struct EXPREC {
X  EXPTYPE etype;
X  union {
X    APLVALUEREC *aplval;
X    char varble;
X    struct {
X      char optr;
X      struct EXPLISTREC *args;
X    } U2;
X  } UU;
} EXPREC;
X
typedef struct EXPLISTREC {
X  EXPREC *head;
X  struct EXPLISTREC *tail;
} EXPLISTREC;
X
typedef struct VALUELISTREC {
X  APLVALUEREC *head;
X  struct VALUELISTREC *tail;
} VALUELISTREC;
X
typedef struct NAMELISTREC {
X  char head;
X  struct NAMELISTREC *tail;
} NAMELISTREC;
X
typedef struct ENVREC {
X  NAMELISTREC *vars;
X  VALUELISTREC *values;
} ENVREC;
X
typedef struct FUNDEFREC {
X  char funname;
X  NAMELISTREC *formals;
X  EXPREC *body;
X  struct FUNDEFREC *nextfundef;
} FUNDEFREC;
X
X
Static FUNDEFREC *fundefs;
X
Static ENVREC *globalEnv;
X
Static EXPREC *currentExp;
X
Static Char userinput[MAXINPUT];
Static short inputleng, pos_;
X
Static NAMESTRING printNames[MAXNAMES];
Static char numNames, numBuiltins;
X
Static boolean quittingtime;
X
X
/*****************************************************************
X *                     DATA STRUCTURE OP'S                       *
X *****************************************************************/
X
/* mkVALEXP - return an EXP of type VALEXP with aplval a         */
Static EXPREC *mkVALEXP(a)
APLVALUEREC *a;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = VALEXP;
X  e->UU.aplval = a;
X  return e;
}  /* mkVALEXP */
X
X
/* mkVAREXP - return an EXP of type VAREXP with varble nm        */
Static EXPREC *mkVAREXP(nm)
char nm;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = VAREXP;
X  e->UU.varble = nm;
X  return e;
}  /* mkVAREXP */
X
X
/* mkAPEXP - return EXP of type APEXP w/ optr op and args el     */
Static EXPREC *mkAPEXP(op, el)
char op;
EXPLISTREC *el;
{
X  EXPREC *e;
X
X  e = (EXPREC *)Malloc(sizeof(EXPREC));
X  e->etype = APEXP;
X  e->UU.U2.optr = op;
X  e->UU.U2.args = el;
X  return e;
}  /* mkAPEXP */
X
X
/* mkExplist - return an EXPLIST with head e and tail el         */
Static EXPLISTREC *mkExplist(e, el)
EXPREC *e;
EXPLISTREC *el;
{
X  EXPLISTREC *newel;
X
X  newel = (EXPLISTREC *)Malloc(sizeof(EXPLISTREC));
X  newel->head = e;
X  newel->tail = el;
X  return newel;
}  /* mkExplist */
X
X
/* mkNamelist - return a NAMELIST with head n and tail nl        */
Static NAMELISTREC *mkNamelist(nm, nl)
char nm;
NAMELISTREC *nl;
{
X  NAMELISTREC *newnl;
X
X  newnl = (NAMELISTREC *)Malloc(sizeof(NAMELISTREC));
X  newnl->head = nm;
X  newnl->tail = nl;
X  return newnl;
}  /* mkNamelist */
X
X
/* mkValuelist - return an VALUELIST with head a and tail vl     */
Static VALUELISTREC *mkValuelist(a, vl)
APLVALUEREC *a;
VALUELISTREC *vl;
{
X  VALUELISTREC *newvl;
X
X  newvl = (VALUELISTREC *)Malloc(sizeof(VALUELISTREC));
X  newvl->head = a;
X  newvl->tail = vl;
X  return newvl;
}  /* mkValuelist */
X
X
/* mkEnv - return an ENV with vars nl and values vl              */
Static ENVREC *mkEnv(nl, vl)
NAMELISTREC *nl;
VALUELISTREC *vl;
{
X  ENVREC *rho;
X
X  rho = (ENVREC *)Malloc(sizeof(ENVREC));
X  rho->vars = nl;
X  rho->values = vl;
X  return rho;
}  /* mkEnv */
X
X
/* lengthVL - return length of VALUELIST vl                      */
Static long lengthVL(vl)
VALUELISTREC *vl;
{
X  long i;
X
X  i = 0;
X  while (vl != NULL) {
X    i++;
X    vl = vl->tail;
X  }
X  return i;
}  /* lengthVL */
X
X
/* lengthNL - return length of NAMELIST nl                       */
Static long lengthNL(nl)
NAMELISTREC *nl;
{
X  long i;
X
X  i = 0;
X  while (nl != NULL) {
X    i++;
X    nl = nl->tail;
X  }
X  return i;
}  /* lengthNL */
X
X
/* lengthIL - return length of INTLIST il                        */
Static long lengthIL(il)
INTLISTREC *il;
{
X  long i;
X
X  i = 0;
X  while (il != NULL) {
X    i++;
X    il = il->nextint;
X  }
X  return i;
}  /* lengthIL */
X
X
/*****************************************************************
X *                     NAME MANAGEMENT                           *
X *****************************************************************/
X
/* fetchFun - get function definition of fname from fundefs      */
Static FUNDEFREC *fetchFun(fname)
char fname;
{
X  FUNDEFREC *f;
X  boolean found;
X
X  found = false;
X  f = fundefs;
X  while (f != NULL && !found) {
X    if (f->funname == fname)
X      found = true;
X    else
X      f = f->nextfundef;
X  }
X  return f;
}  /* fetchFun */
X
X
/* newFunDef - add new function fname w/ parameters nl, body e   */
Static Void newFunDef(fname, nl, e)
char fname;
NAMELISTREC *nl;
EXPREC *e;
{
X  FUNDEFREC *f;
X
X  f = fetchFun(fname);
X  if (f == NULL) {   /* fname not yet defined as a function */
X    f = (FUNDEFREC *)Malloc(sizeof(FUNDEFREC));
X    f->nextfundef = fundefs;   /* place new FUNDEFREC */
X    fundefs = f;   /* on fundefs list */
X  }
X  f->funname = fname;
X  f->formals = nl;
X  f->body = e;
}  /* newFunDef */
X
X
/* initNames - place all pre-defined names into printNames       */
Static Void initNames()
{
X  long i;
X
X  fundefs = NULL;
X  i = 1;
X  memcpy(printNames[i - 1], "if                  ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "while               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "set                 ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "begin               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "+                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "-                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "*                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "/                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "max                 ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "or                  ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "and                 ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "=                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "<                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], ">                   ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "+/                  ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "-/                  ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "*/                  ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "//                  ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "max/                ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "or/                 ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "and/                ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "compress            ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "shape               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "ravel               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "restruct            ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "cat                 ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "indx                ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "trans               ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "[]                  ", sizeof(NAMESTRING));
X  i++;
X  memcpy(printNames[i - 1], "print               ", sizeof(NAMESTRING));
X  numNames = i;
X  numBuiltins = i;
}  /* initNames */
X
X
Static jmp_buf _JL99;
X
X
/* install - insert new name into printNames                     */
Static char install(nm)
Char *nm;
{
X  long i;
X  boolean found;
X
X  i = 1;
X  found = false;
X  while (i <= numNames && !found) {
X    if (!memcmp(nm, printNames[i - 1], sizeof(NAMESTRING)))
X      found = true;
X    else
X      i++;
X  }
X  if (found)
X    return i;
X  if (i > MAXNAMES) {
X    printf("No more room for names\n");
X    longjmp(_JL99, 1);
X  }
X  numNames = i;
X  memcpy(printNames[i - 1], nm, sizeof(NAMESTRING));
X  return i;
}  /* install */
X
X
/* prName - print name nm                                        */
Static Void prName(nm)
char nm;
{
X  long i;
X
X  i = 1;
X  while (i <= NAMELENG) {
X    if (printNames[nm - 1][i - 1] != ' ') {
X      putchar(printNames[nm - 1][i - 1]);
X      i++;
X    } else
X      i = NAMELENG + 1;
X  }
}  /* prName */
X
X
/* primOp - translate NAME optr to corresponding BUILTINOP       */
Static BUILTINOP primOp(optr)
char optr;
{
X  BUILTINOP op;
X  long i;
X
X  op = IFOP;   /* N.B. IFOP is first value in BUILTINOPS */
X  for (i = 1; i < optr; i++)
X    op = (BUILTINOP)((long)op + 1);
X  return op;
}  /* primOp */
X
X
/*****************************************************************
X *                        INPUT                                  *
X *****************************************************************/
X
/* isDelim - check if c is a delimiter                           */
Static boolean isDelim(c)
Char c;
{
X  return (c == ';' || c == ' ' || c == ')' || c == '(');
}  /* isDelim */
X
X
/* skipblanks - return next non-blank position in userinput      */
Static long skipblanks(p)
long p;
{
X  while (userinput[p - 1] == ' ')
X    p++;
X  return p;
}  /* skipblanks */
X
X
/* matches - check if string nm matches userinput[s .. s+leng]   */
Static boolean matches(s, leng, nm)
long s;
char leng;
Char *nm;
{
X  boolean match;
X  long i;
X
X  match = true;
X  i = 1;
X  while (match && i <= leng) {
X    if (userinput[s - 1] != nm[i - 1])
X      match = false;
X    i++;
X    s++;
X  }
X  if (!isDelim(userinput[s - 1]))
X    match = false;
X  return match;
}  /* matches */
X
X
/* nextchar - read next char - filter tabs and comments          */
Local Void nextchar(c)
Char *c;
{
X  Char STR1[256];
X
X  *c = getchar();
X  if (*c == '\n')
X    *c = ' ';
X  if (*c == (Char)TABCODE) {
X    *c = ' ';
X    return;
X  }
X  sprintf(STR1, "%c", *c);
X  if (strcmp(STR1, COMMENTCHAR))
X    return;
X  while (!P_eoln(stdin)) {
X    *c = getchar();
X    if (*c == '\n')
X      *c = ' ';
X  }
X  *c = ' ';
}  /* nextchar */
X
/* readParens - read char's, ignoring newlines, to matching ')'  */
Local Void readParens()
{
X  long parencnt;   /* current depth of parentheses */
X  Char c;
X
X  parencnt = 1;   /* '(' just read */
X  do {
X    if (P_eoln(stdin))
X      fputs(PROMPT2, stdout);
X    nextchar(&c);
X    pos_++;
X    if (pos_ == MAXINPUT) {
X      printf("User input too long\n");
X      longjmp(_JL99, 1);
X    }
X    userinput[pos_ - 1] = c;
X    if (c == '(')
X      parencnt++;
X    if (c == ')')
X      parencnt--;
X  } while (parencnt != 0);   /* readParens */
}
X
Local Void readInput()
{
X  Char c;
X
X  fputs(PROMPT, stdout);
X  pos_ = 0;
X  do {
X    pos_++;
X    if (pos_ == MAXINPUT) {
X      printf("User input too long\n");
X      longjmp(_JL99, 1);
X    }
X    nextchar(&c);
X    userinput[pos_ - 1] = c;
X    if (userinput[pos_ - 1] == '(')
X      readParens();
X  } while (!P_eoln(stdin));
X  inputleng = pos_;
X  userinput[pos_] = ';';   /* sentinel */
}  /* readInput */
X
X
/* reader - read char's into userinput; be sure input not blank  */
Static Void reader()
{
X
X  /* readInput - read char's into userinput                        */
X  do {
X    readInput();
X    pos_ = skipblanks(1L);   /* ignore blank lines */
X  } while (pos_ > inputleng);   /* reader */
}
X
X
/* parseName - return (installed) NAME starting at userinput[pos]*/
Static char parseName()
{
X  NAMESTRING nm;   /* array to accumulate characters */
X  char leng;   /* length of name */
X
X  leng = 0;
X  while ((pos_ <= inputleng) & (!isDelim(userinput[pos_ - 1]))) {
X    if (leng == NAMELENG) {
X      printf("Name too long, begins: %.*s\n", NAMELENG, nm);
X      longjmp(_JL99, 1);
X    }
X    leng++;
X    nm[leng - 1] = userinput[pos_ - 1];
X    pos_++;
X  }
X  if (leng == 0) {
X    printf("Error: expected name, instead read: %c\n", userinput[pos_ - 1]);
X    longjmp(_JL99, 1);
X  }
X  for (; leng < NAMELENG; leng++)
X    nm[leng] = ' ';
X  pos_ = skipblanks((long)pos_);   /* skip blanks after name */
X  return (install(nm));
}  /* parseName */
X
X
Local boolean isDigits(pos)
long pos;
{
X  boolean Result;
X
X  if (!isdigit(userinput[pos - 1]))
X    return false;
X  Result = true;
X  while (isdigit(userinput[pos - 1]))
X    pos++;
X  if (!isDelim(userinput[pos - 1]))
X    return false;
X  return Result;
}  /* isDigits */
X
X
/* isNumber - check if a number begins at pos                    */
Static boolean isNumber(pos)
long pos;
{
X
X  /* isDigits - check if sequence of digits begins at pos          */
X  return (isDigits(pos) | ((userinput[pos - 1] == '-') & isDigits(pos + 1)));
}  /* isNumber */
X
X
/* isValue - check if a number or vector const begins at pos     */
Static boolean isValue(pos)
long pos;
{
X  return ((userinput[pos - 1] == '\'') | isNumber(pos));
}  /* isValue */
X
X
/* parseInt - return number starting at userinput[pos]            */
Local long parseInt()
{
X  long n, sign;
X
X  n = 0;
X  sign = 1;
X  if (userinput[pos_ - 1] == '-') {
X    sign = -1;
X    pos_++;
X  }
X  while (isdigit(userinput[pos_ - 1])) {
X    n = n * 10 + userinput[pos_ - 1] - '0';
X    pos_++;
X  }
X  pos_ = skipblanks((long)pos_);   /* skip blanks after number */
X  return (n * sign);
}  /* parseInt */
X
/* parseVec - return INTLIST starting at userinput[pos]           */
Local INTLISTREC *parseVec()
{
X  INTLISTREC *il;
X
X  if (userinput[pos_ - 1] == ')') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip ') ...' */
X    il = NULL;
X    return il;
X  }
X  il = (INTLISTREC *)Malloc(sizeof(INTLISTREC));
X  il->int_ = parseInt();
X  il->nextint = parseVec();
X  return il;
}  /* parseVec */
X
X
/* parseVal - return APL value starting at userinput[pos]         */
Static APLVALUEREC *parseVal()
{
X  APLVALUEREC *result;
X
X  result = (APLVALUEREC *)Malloc(sizeof(APLVALUEREC));
X  if (userinput[pos_ - 1] == '\'') {
X    result->rnk = VECTOR;
X    pos_ = skipblanks(pos_ + 2L);   /* skip "'(..." */
X    result->intvals = parseVec();
X    result->UU.leng = lengthIL(result->intvals);
X    return result;
X  }
X  result->rnk = SCALAR;
X  result->intvals = (INTLISTREC *)Malloc(sizeof(INTLISTREC));
X  result->intvals->int_ = parseInt();
X  result->intvals->nextint = NULL;
X  return result;
}  /* parseVal */
X
X
Static EXPLISTREC *parseEL PV();
X
X
/* parseExp - return EXP starting at userinput[pos]              */
Static EXPREC *parseExp()
{
X  char nm;
X  EXPLISTREC *el;
X
X  if (userinput[pos_ - 1] == '(') {  /* APEXP */
X    pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X    nm = parseName();
X    el = parseEL();
X    return (mkAPEXP(nm, el));
X  } else if (isValue((long)pos_))
X    return (mkVALEXP(parseVal()));   /* VALEXP */
X  else
X    return (mkVAREXP(parseName()));   /* VAREXP */
}  /* parseExp */
X
X
/* parseEL - return EXPLIST starting at userinput[pos]           */
Static EXPLISTREC *parseEL()
{
X  EXPREC *e;
X  EXPLISTREC *el;
X
X  if (userinput[pos_ - 1] == ')') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X    return NULL;
X  } else {
X    e = parseExp();
X    el = parseEL();
X    return (mkExplist(e, el));
X  }
}  /* parseEL */
X
X
/* parseNL - return NAMELIST starting at userinput[pos]          */
Static NAMELISTREC *parseNL()
{
X  char nm;
X  NAMELISTREC *nl;
X
X  if (userinput[pos_ - 1] == ')') {
X    pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X    return NULL;
X  } else {
X    nm = parseName();
X    nl = parseNL();
X    return (mkNamelist(nm, nl));
X  }
}  /* parseNL */
X
X
/* parseDef - parse function definition at userinput[pos]        */
Static char parseDef()
{
X  char fname;   /* function name */
X  NAMELISTREC *nl;   /* formal parameters */
X  EXPREC *e;   /* body */
X
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X  pos_ = skipblanks(pos_ + 6L);   /* skip 'define ..' */
X  fname = parseName();
X  pos_ = skipblanks(pos_ + 1L);   /* skip '( ..' */
X  nl = parseNL();
X  e = parseExp();
X  pos_ = skipblanks(pos_ + 1L);   /* skip ') ..' */
X  newFunDef(fname, nl, e);
X  return fname;
}  /* parseDef */
X
X
/*****************************************************************
X *                     ENVIRONMENTS                              *
X *****************************************************************/
X
/* emptyEnv - return an environment with no bindings             */
Static ENVREC *emptyEnv()
{
X  return (mkEnv(NULL, NULL));
}  /* emptyEnv */
X
X
/* bindVar - bind variable nm to value a in environment rho      */
Static Void bindVar(nm, a, rho)
char nm;
APLVALUEREC *a;
ENVREC *rho;
{
X  rho->vars = mkNamelist(nm, rho->vars);
X  rho->values = mkValuelist(a, rho->values);
}  /* bindVar */
X
X
/* findVar - look up nm in rho                                   */
Static VALUELISTREC *findVar(nm, rho)
char nm;
ENVREC *rho;
{
X  NAMELISTREC *nl;
X  VALUELISTREC *vl;
X  boolean found;
X
X  found = false;
X  nl = rho->vars;
X  vl = rho->values;
X  while (nl != NULL && !found) {
X    if (nl->head == nm)
X      found = true;
X    else {
X      nl = nl->tail;
X      vl = vl->tail;
X    }
X  }
X  return vl;
}  /* findVar */
X
X
/* assign - assign value a to variable nm in rho                 */
Static Void assign(nm, a, rho)
char nm;
APLVALUEREC *a;
ENVREC *rho;
{
X  VALUELISTREC *varloc;
X
X  varloc = findVar(nm, rho);
X  varloc->head = a;
}  /* assign */
X
X
/* fetch - return number bound to nm in rho                      */
Static APLVALUEREC *fetch(nm, rho)
char nm;
ENVREC *rho;
{
X  VALUELISTREC *vl;
X
X  vl = findVar(nm, rho);
X  return (vl->head);
}  /* fetch */
X
X
/* isBound - check if nm is bound in rho                         */
Static boolean isBound(nm, rho)
char nm;
ENVREC *rho;
{
X  return (findVar(nm, rho) != NULL);
}  /* isBound */
X
X
Local Void prIntlist(il, dim1, dim2)
INTLISTREC *il;
long dim1, dim2;
{
X  long i, j;
X
X  for (i = 1; i <= dim1; i++) {
X    for (j = 1; j <= dim2; j++) {
X      printf("%6ld ", il->int_);
X      il = il->nextint;
X    }
X    putchar('\n');
X  }
}  /* prIntlist */
X
X
/*****************************************************************
X *                     APL VALUES                                *
X *****************************************************************/
X
/* prValue - print APL value a                                   */
Static Void prValue(a)
APLVALUEREC *a;
{
X
X  /* prIntlist - print INTLIST il as dim1 x dim2 matrix            */
X  switch (a->rnk) {
X
X  case SCALAR:
X    prIntlist(a->intvals, 1L, 1L);
X    break;
X
X  case VECTOR:
X    prIntlist(a->intvals, 1L, a->UU.leng);
X    break;
X
X  case MATRIX:
X    prIntlist(a->intvals, a->UU.U2.rows, a->UU.U2.cols);
X    break;
X  }
}  /* prValue */
X
X
/* isTrueVal - return true if first value in a is one            */
Static boolean isTrueVal(a)
APLVALUEREC *a;
{
X  if (a->intvals == NULL)
X    return false;
X  else
X    return (a->intvals->int_ == 1);
}  /* isTrueVal */
X
X
/* Local variables for applyValueOp: */
struct LOC_applyValueOp {
X  APLVALUEREC *result;
} ;
X
/* size - return number of elements in a                         */
Local long size(a, LINK)
APLVALUEREC *a;
struct LOC_applyValueOp *LINK;
{
X  long Result;
X
X  switch (a->rnk) {
X
X  case SCALAR:
X    Result = 1;
X    break;
X
X  case VECTOR:
X    Result = a->UU.leng;
X    break;
X
X  case MATRIX:
X    Result = a->UU.U2.rows * a->UU.U2.cols;
X    break;
X  }
X  return Result;
}  /* size */
X
/* skipover - return pointer to nth record in il                 */
Local INTLISTREC *skipover(n, il, LINK)
long n;
INTLISTREC *il;
struct LOC_applyValueOp *LINK;
{
X  while (n > 0) {
X    il = il->nextint;
X    n--;
X  }
X  return il;
}  /* skipover */
X
Local Void copyrank(a, r)
APLVALUEREC *a, *r;
{
X  r->rnk = a->rnk;
X  switch (r->rnk) {   /* with */
X
X  case SCALAR:
X    /* blank case */
X    break;
X
X  case VECTOR:
X    r->UU.leng = a->UU.leng;
X    break;
X
X  case MATRIX:
X    r->UU.U2.rows = a->UU.U2.rows;
X    r->UU.U2.cols = a->UU.U2.cols;
X    break;
X  }/* case */
}  /* copyrank */
X
/* applyOp - apply VALUEOP op to integer arguments               */
Local long applyOp(op, i, j)
BUILTINOP op;
long i, j;
{
X  long Result;
X
X  switch (op) {
X
X  case PLUSOP:
X    Result = i + j;
X    break;
X
X  case MINUSOP:
X    Result = i - j;
X    break;
X
X  case TIMESOP:
X    Result = i * j;
X    break;
X
X  case DIVOP:
X    Result = i / j;
X    break;
X
X  case MAXOP:
X    if (i > j)
X      Result = i;
X    else
X      Result = j;
X    break;
X
X  case OROP:
X    if (i == 1 || j == 1)
X      Result = 1;
X    else
X      Result = 0;
X    break;
X
X  case ANDOP:
X    if (i == 1 && j == 1)
X      Result = 1;
X    else
X      Result = 0;
X    break;
X
X  case EQOP:
X    if (i == j)
X      Result = 1;
X    else
X      Result = 0;
X    break;
X
X  case LTOP:
X    if (i < j)
X      Result = 1;
X    else
X      Result = 0;
X    break;
X
X  case GTOP:
X    if (i > j)
X      Result = 1;
X    else
X      Result = 0;
X    break;
X  }/* case */
X  return Result;
}  /* applyOp */
X
/* applyIntlis - apply op to two lists, extending appropriately  */
Local INTLISTREC *applyIntlis(op, il1, il2, il1leng, il2leng)
BUILTINOP op;
INTLISTREC *il1, *il2;
long il1leng, il2leng;
{
X  INTLISTREC *il;
X
X  if (il1 == NULL || il2 == NULL)
X    return NULL;
X  else {
X    il = (INTLISTREC *)Malloc(sizeof(INTLISTREC));
X    il->int_ = applyOp(op, il1->int_, il2->int_);
X    if (il1leng == 1) {
X      il->nextint = applyIntlis(op, il1, il2->nextint, il1leng, il2leng);
X      return il;
X    }
X    if (il2leng == 1)
X      il->nextint = applyIntlis(op, il1->nextint, il2, il1leng, il2leng);
X    else
X      il->nextint = applyIntlis(op, il1->nextint, il2->nextint, il1leng,
X				il2leng);
X    return il;   /* with */
X  }
}  /* applyIntlis */
X
/* applyArithOp - apply binary operator to a1 and a2              */
Local Void applyArithOp(op, a1, a2, LINK)
BUILTINOP op;
APLVALUEREC *a1, *a2;
struct LOC_applyValueOp *LINK;
{
X
X  /* copyrank - copy rank and shape of a to r                      */
X  LINK->result = (APLVALUEREC *)Malloc(sizeof(APLVALUEREC));
X  if (a1->rnk == SCALAR)
X    copyrank(a2, LINK->result);
X  else if (a2->rnk == SCALAR)
X    copyrank(a1, LINK->result);
X  else if (size(a1, LINK) == 1)
X    copyrank(a2, LINK->result);
X  else
X    copyrank(a1, LINK->result);
X  LINK->result->intvals = applyIntlis(op, a1->intvals, a2->intvals,
X				      size(a1, LINK), size(a2, LINK));
}  /* applyArithOp */
X
/* Local variables for applyRedOp: */
struct LOC_applyRedOp {
X  struct LOC_applyValueOp *LINK;
X  BUILTINOP op;
} ;
X
Local long applyOp_(op, i, j, LINK)
BUILTINOP op;
long i, j;
struct LOC_applyRedOp *LINK;
{
X  long Result;
X
X  switch (op) {
X
X  case REDPLUSOP:
X    Result = i + j;
X    break;
X
X  case REDMINUSOP:
X    Result = i - j;
X    break;
X
X  case REDTIMESOP:
X    Result = i * j;
X    break;
X
X  case REDDIVOP:
X    Result = i / j;
X    break;
X
X  case REDMAXOP:
X    if (i > j)
X      Result = i;
X    else
X      Result = j;
X    break;
X
X  case REDOROP:
X    if (i == 1 || j == 1)
X      Result = 1;
X    else
X      Result = 0;
X    break;
X
X  case REDANDOP:
X    if (i == 1 && j == 1)
X      Result = 1;
X    else
X      Result = 0;
X    break;
X  }/* case */
X  return Result;
}  /* applyOp */
X
/* redVec - reduce op (argument to applyRedOp) over list         */
Local long redVec(il, leng, LINK)
INTLISTREC *il;
long leng;
struct LOC_applyRedOp *LINK;
{
X  if (leng == 0)
X    return 0;
X  else if (leng == 1)
X    return (il->int_);
X  else
X    return (applyOp_(LINK->op, il->int_, redVec(il->nextint, leng - 1, LINK),
X		     LINK));
}  /* redVec */
X
/* redMat - reduce op (argument to applyRedOp) over matrix       */
Local INTLISTREC *redMat(il, cols, rows, LINK)
INTLISTREC *il;
long cols, rows;
struct LOC_applyRedOp *LINK;
{
X  INTLISTREC *ilnew;
X
X  if (rows == 0)
X    return NULL;
X  else {
X    ilnew = (INTLISTREC *)Malloc(sizeof(INTLISTREC));
X    ilnew->int_ = redVec(il, cols, LINK);
X    ilnew->nextint = redMat(skipover(cols, il, LINK->LINK), cols, rows - 1,
X			    LINK);
X    return ilnew;
X  }
}  /* redmat */
X
/* applyRedOp - apply reduction operator                         */
Local Void applyRedOp(op_, a, LINK)
BUILTINOP op_;
APLVALUEREC *a;
struct LOC_applyValueOp *LINK;
{
X
X  /* applyOp - apply base operator of reduction operator           */
X  struct LOC_applyRedOp V;
X  APLVALUEREC *WITH;
X
X  V.LINK = LINK;
X  V.op = op_;
X  LINK->result = (APLVALUEREC *)Malloc(sizeof(APLVALUEREC));
X  switch (a->rnk) {
X
X  case SCALAR:
X    LINK->result = a;
X    break;
X
X  case VECTOR:
X    WITH = LINK->result;
X    WITH->rnk = SCALAR;
X    WITH->intvals = (INTLISTREC *)Malloc(sizeof(INTLISTREC));
X    WITH->intvals->int_ = redVec(a->intvals, a->UU.leng, &V);
X    WITH->intvals->nextint = NULL;
X    break;
X
X  case MATRIX:
X    WITH = LINK->result;
X    WITH->rnk = VECTOR;
X    WITH->UU.leng = a->UU.U2.rows;
X    WITH->intvals = redMat(a->intvals, a->UU.U2.cols, WITH->UU.leng, &V);
X    break;
X  }/* case */
}  /* applyRedOp */
X
/* append - append il2 to il1; il1 is altered                    */
Local INTLISTREC *append(il1, il2, LINK)
INTLISTREC *il1, *il2;
struct LOC_applyValueOp *LINK;
{
X  INTLISTREC *Result;
X
X  if (il1 == NULL)
X    return il2;
X  Result = il1;
X  while (il1->nextint != NULL)
X    il1 = il1->nextint;
X  il1->nextint = il2;
X  return Result;
}  /* append */
X
/* ncopy - copy elements of src until list has reps elements     */
Local INTLISTREC *ncopy(src, reps, LINK)
INTLISTREC *src;
long reps;
struct LOC_applyValueOp *LINK;
{
X  INTLISTREC *Result, *il, *suffix;
X  long i;
X
X  if (reps == 0)
X    return NULL;
X  il = (INTLISTREC *)Malloc(sizeof(INTLISTREC));
X  Result = il;
X  il->int_ = src->int_;
X  suffix = src->nextint;
X  for (i = 2; i <= reps; i++) {
X    if (suffix == NULL)   /* exhausted src */
X      suffix = src;
X    /* start over */
X    il->nextint = (INTLISTREC *)Malloc(sizeof(INTLISTREC));
X    il = il->nextint;
X    il->int_ = suffix->int_;
X    suffix = suffix->nextint;
X  }
X  return Result;
}  /* ncopy */
X
/* Local variables for compress: */
struct LOC_compress {
X  struct LOC_applyValueOp *LINK;
} ;
X
/* ilcompress - il1 over il2, taking il2 in chunks of size width */
Local INTLISTREC *ilcompress(il1, il2, width, LINK)
INTLISTREC *il1, *il2;
long width;
struct LOC_compress *LINK;
{
X  INTLISTREC *il;
X
X  if (il1 == NULL)
X    return NULL;
X  else if (il1->int_ == 1) {
X    il = ncopy(il2, width, LINK->LINK);
X    il = append(il, ilcompress(il1->nextint, skipover(width, il2, LINK->LINK),
X			       width, LINK), LINK->LINK);
X    return il;
X  } else
X    return (ilcompress(il1->nextint, skipover(width, il2, LINK->LINK), width,
X		       LINK));
}  /* ilcompress */
X
/* countones - count ones in il                                  */
Local long countones(il, LINK)
INTLISTREC *il;
struct LOC_compress *LINK;
{
X  long i;
X
X  i = 0;
X  while (il != NULL) {
X    if (il->int_ == 1)
X      i++;
X    il = il->nextint;
X  }
X  return i;
}  /* countones */
X
/* compress - compress a1 over a2                                */
Local Void compress(a1, a2, LINK)
APLVALUEREC *a1, *a2;
struct LOC_applyValueOp *LINK;
{
X  struct LOC_compress V;
X  long width;
X  APLVALUEREC *WITH;
X
X  V.LINK = LINK;
X  if (a2->rnk == VECTOR)
X    width = 1;
X  else
X    width = a2->UU.U2.cols;
X  LINK->result = (APLVALUEREC *)Malloc(sizeof(APLVALUEREC));
X  WITH = LINK->result;
X  WITH->rnk = a2->rnk;
X  WITH->intvals = ilcompress(a1->intvals, a2->intvals, width, &V);
X  if (WITH->rnk == VECTOR)   /* with */
X    WITH->UU.leng = countones(a1->intvals, &V);
X  else {
X    WITH->UU.U2.cols = a2->UU.U2.cols;
X    WITH->UU.U2.rows = countones(a1->intvals, &V);
X  }
}  /* compress */
X
/* shape - return vector giving dimensions of a                  */
Local Void shape(a, LINK)
APLVALUEREC *a;
struct LOC_applyValueOp *LINK;
{
X  INTLISTREC *il;
X
X  LINK->result = (APLVALUEREC *)Malloc(sizeof(APLVALUEREC));
X  LINK->result->rnk = VECTOR;
X  switch (a->rnk) {
X
X  case SCALAR:
X    LINK->result->UU.leng = 0;
X    LINK->result->intvals = NULL;
X    break;
X
X  case VECTOR:
X    LINK->result->UU.leng = 1;
X    il = (INTLISTREC *)Malloc(sizeof(INTLISTREC));
X    LINK->result->intvals = il;
X    il->int_ = a->UU.leng;
X    il->nextint = NULL;
X    break;
X
X  case MATRIX:
X    LINK->result->UU.leng = 2;
X    il = (INTLISTREC *)Malloc(sizeof(INTLISTREC));
X    LINK->result->intvals = il;
X    il->int_ = a->UU.U2.rows;
X    il->nextint = (INTLISTREC *)Malloc(sizeof(INTLISTREC));
X    il = il->nextint;
X    il->int_ = a->UU.U2.cols;
X    il->nextint = NULL;
X    break;
X  }/* case */
}  /* shape */
X
/* ravel - transform a to a vector without changing elements     */
Local Void ravel(a, LINK)
APLVALUEREC *a;
struct LOC_applyValueOp *LINK;
{
X  long size;
X  APLVALUEREC *WITH;
X
X  LINK->result = (APLVALUEREC *)Malloc(sizeof(APLVALUEREC));
X  switch (a->rnk) {
X
X  case SCALAR:
X    size = 1;
X    break;
X
X  case VECTOR:
X    size = a->UU.leng;
X    break;
X
X  case MATRIX:
X    size = a->UU.U2.rows * a->UU.U2.cols;
X    break;
X  }
X  WITH = LINK->result;
X  WITH->rnk = VECTOR;
X  WITH->UU.leng = size;
X  WITH->intvals = a->intvals;
}  /* ravel */
X
/* restruct - restructure valuevec according to shapevec         */
Local Void restruct(shapevec, valuevec, LINK)
APLVALUEREC *shapevec, *valuevec;
struct LOC_applyValueOp *LINK;
{
X  RANK newrank;
X  long dim1, dim2;
X  APLVALUEREC *WITH;
X
X  if (valuevec->intvals == NULL) {
X    printf("Cannot restructure null vector\n");
X    longjmp(_JL99, 1);
X  }
X  if (shapevec->rnk == SCALAR) {
X    newrank = VECTOR;
X    dim1 = shapevec->intvals->int_;
X    dim2 = 1;
X  } else if (shapevec->UU.leng == 0) {
X    newrank = SCALAR;
X    dim1 = 1;
X    dim2 = 1;
X  } else if (shapevec->UU.leng == 1) {
X    newrank = VECTOR;
X    dim1 = shapevec->intvals->int_;
X    dim2 = 1;
X  } else {
X    newrank = MATRIX;
X    dim1 = shapevec->intvals->int_;
X    dim2 = shapevec->intvals->nextint->int_;
X  }
X  LINK->result = (APLVALUEREC *)Malloc(sizeof(APLVALUEREC));
X  WITH = LINK->result;
X  WITH->rnk = newrank;
X  if (WITH->rnk == VECTOR)
X    WITH->UU.leng = dim1;
X  else if (WITH->rnk == MATRIX) {
X    WITH->UU.U2.rows = dim1;
X    WITH->UU.U2.cols = dim2;
X  }
X  WITH->intvals = ncopy(valuevec->intvals, dim1 * dim2, LINK);   /* with */
X
X  /* with */
}  /* restruct */
X
/* copyIntlis - make a fresh copy of il                          */
Local INTLISTREC *copyIntlis(il, LINK)
INTLISTREC *il;
struct LOC_applyValueOp *LINK;
{
X  return (ncopy(il, lengthIL(il), LINK));
}  /* copyIntlis */
X
/* cat - create a vector by joining ravels of a1 and a2          */
Local Void cat(a1, a2, LINK)
APLVALUEREC *a1, *a2;
struct LOC_applyValueOp *LINK;
{
X  APLVALUEREC *WITH;
X
X  LINK->result = (APLVALUEREC *)Malloc(sizeof(APLVALUEREC));
X  WITH = LINK->result;
X  WITH->rnk = VECTOR;
X  WITH->UU.leng = size(a1, LINK) + size(a2, LINK);
X  WITH->intvals = copyIntlis(a1->intvals, LINK);
X  WITH->intvals = append(WITH->intvals, a2->intvals, LINK);
}  /* cat */
X
/* indx - perform index generation, using first value in a       */
Local Void indx(a, LINK)
APLVALUEREC *a;
struct LOC_applyValueOp *LINK;
{
X  long i;
X  INTLISTREC *il;
X  APLVALUEREC *WITH;
X
X  i = a->intvals->int_;
X  LINK->result = (APLVALUEREC *)Malloc(sizeof(APLVALUEREC));
X  WITH = LINK->result;
X  WITH->rnk = VECTOR;
X  WITH->intvals = NULL;
X  WITH->UU.leng = i;
X  while (i > 0) {   /* with */
X    il = (INTLISTREC *)Malloc(sizeof(INTLISTREC));
X    il->int_ = i;
X    il->nextint = WITH->intvals;
X    WITH->intvals = il;
X    i--;
X  }  /* while */
}  /* indx */
X
/* Local variables for trans: */
struct LOC_trans {
X  struct LOC_applyValueOp *LINK;
} ;
X
/* skiplist - subscript il by cols and rows                      */
Local INTLISTREC *skiplist(il, cols, rows, LINK)
INTLISTREC *il;
long cols, rows;
struct LOC_trans *LINK;
{
X  INTLISTREC *ilnew;
X
X  ilnew = (INTLISTREC *)Malloc(sizeof(INTLISTREC));
X  if (rows == 1) {
X    ilnew->int_ = il->int_;
X    ilnew->nextint = NULL;
X  } else {
X    ilnew->int_ = il->int_;
X    ilnew->nextint = skiplist(skipover(cols, il, LINK->LINK), cols, rows - 1,
X			      LINK);
X  }
X  return ilnew;
}  /* skiplist */
X
/* trans - perform "trans"                                       */
Local Void trans(a, LINK)
APLVALUEREC *a;
struct LOC_applyValueOp *LINK;
{
X  struct LOC_trans V;
X  INTLISTREC *il, *ilnew;
X  long i;
X  APLVALUEREC *WITH;
X  long FORLIM;
X
X  V.LINK = LINK;
X  if (a->rnk != MATRIX || a->intvals == NULL) {
X    LINK->result = a;
X    return;
X  }
X  LINK->result = (APLVALUEREC *)Malloc(sizeof(APLVALUEREC));
X  WITH = LINK->result;
X  WITH->rnk = MATRIX;
X  WITH->UU.U2.cols = a->UU.U2.rows;
X  WITH->UU.U2.rows = a->UU.U2.cols;
X  il = a->intvals;
X  ilnew = NULL;
X  FORLIM = WITH->UU.U2.rows;
X  for (i = 1; i <= FORLIM; i++) {
X    ilnew = append(ilnew,
X		   skiplist(il, WITH->UU.U2.rows, WITH->UU.U2.cols, &V),
X		   LINK);
X    il = il->nextint;
X  }
X  WITH->intvals = ilnew;   /* with */
}  /* trans */
X
/* Local variables for subscript: */
struct LOC_subscript {
X  struct LOC_applyValueOp *LINK;
} ;
X
/* sub - find nth chunk in il, each chunk having width elements  */
Local INTLISTREC *sub(il, n, width, LINK)
INTLISTREC *il;
long n, width;
struct LOC_subscript *LINK;
{
X  long i, j;
X
X  for (i = 1; i < n; i++) {
X    for (j = 1; j <= width; j++)
X      il = il->nextint;
X  }
X  return il;
}  /* sub */
X
/* ilsub - subscript src by subs in chunks of size width         */
Local INTLISTREC *ilsub(src, subs, width, LINK)
INTLISTREC *src, *subs;
long width;
struct LOC_subscript *LINK;
{
X  INTLISTREC *il;
X
X  if (subs == NULL) {
X    il = NULL;
X    return il;
X  }
X  il = sub(src, subs->int_, width, LINK);
X  il = ncopy(il, width, LINK->LINK);
X  il = append(il, ilsub(src, subs->nextint, width, LINK), LINK->LINK);
X  return il;
}  /* ilsub */
X
/* subscript - "[]" operation; a1 a vector or matrix, a2 vector  */
Local Void subscript(a1, a2, LINK)
APLVALUEREC *a1, *a2;
struct LOC_applyValueOp *LINK;
{
X  struct LOC_subscript V;
X  long width;
X  APLVALUEREC *WITH;
X
X  V.LINK = LINK;
X  LINK->result = (APLVALUEREC *)Malloc(sizeof(APLVALUEREC));
X  WITH = LINK->result;
X  WITH->rnk = a1->rnk;
X  if (WITH->rnk == VECTOR) {
X    if (a2->rnk == SCALAR)
X      WITH->UU.leng = 1;
X    else
X      WITH->UU.leng = a2->UU.leng;
X    width = 1;
X  } else {
X    if (a2->rnk == SCALAR)
X      WITH->UU.U2.rows = 1;
X    else
X      WITH->UU.U2.rows = a2->UU.leng;
X    WITH->UU.U2.cols = a1->UU.U2.cols;
X    width = WITH->UU.U2.cols;
X  }
X  WITH->intvals = ilsub(a1->intvals, a2->intvals, width, &V);   /* with */
}  /* subscript */
X
/* arity - return number of arguments expected by op             */
Local long arity(op, LINK)
BUILTINOP op;
struct LOC_applyValueOp *LINK;
{
X  if (((1L << ((long)op)) & (((1L << ((long)GTOP + 1)) - (1 << ((long)PLUSOP))) |
X	 (1 << ((long)COMPRESSOP)) | (1 << ((long)RESTRUCTOP)) |
X	 (1 << ((long)CATOP)) | (1 << ((long)SUBOP)))) != 0)
X    return 2;
X  else
X    return 1;
}  /* arity */
X
X
/* applyValueOp - apply VALUEOP op to arguments in VALUELIST vl  */
Static APLVALUEREC *applyValueOp(op, vl)
BUILTINOP op;
VALUELISTREC *vl;
{
X  struct LOC_applyValueOp V;
X  APLVALUEREC *a1, *a2;
X
X  if (arity(op, &V) != lengthVL(vl)) {
X    printf("Wrong number of arguments to ");
X    prName((int)op + 1);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  a1 = vl->head;   /* 1st actual */
X  if (arity(op, &V) == 2)   /* 2nd actual */
X    a2 = vl->tail->head;
X  switch (op) {
X
X  case PLUSOP:
X  case MINUSOP:
X  case TIMESOP:
X  case DIVOP:
X  case MAXOP:
X  case OROP:
X  case ANDOP:
X  case EQOP:
X  case LTOP:
X  case GTOP:
X    applyArithOp(op, a1, a2, &V);
X    break;
X
X  case REDPLUSOP:
X  case REDMINUSOP:
X  case REDTIMESOP:
X  case REDDIVOP:
X  case REDMAXOP:
X  case REDOROP:
X  case REDANDOP:
X    applyRedOp(op, a1, &V);
X    break;
X
X  case COMPRESSOP:
X    compress(a1, a2, &V);
X    break;
X
X  case SHAPEOP:
X    shape(a1, &V);
X    break;
X
X  case RAVELOP:
X    ravel(a1, &V);
X    break;
X
X  case RESTRUCTOP:
X    restruct(a1, a2, &V);
X    break;
X
X  case CATOP:
X    cat(a1, a2, &V);
X    break;
X
X  case INDXOP:
X    indx(a1, &V);
X    break;
X
X  case TRANSOP:
X    trans(a1, &V);
X    break;
X
X  case SUBOP:
X    subscript(a1, a2, &V);
X    break;
X
X  case PRINTOP:
X    prValue(a1);
X    V.result = a1;
X    break;
X  }/* case */
X  return V.result;
}  /* applyValueOp */
X
X
Static APLVALUEREC *eval PP((EXPREC *e, ENVREC *rho));
X
/* Local variables for eval: */
struct LOC_eval {
X  ENVREC *rho;
} ;
X
/* evalList - evaluate each expression in el                     */
Local VALUELISTREC *evalList(el, LINK)
EXPLISTREC *el;
struct LOC_eval *LINK;
{
X  APLVALUEREC *h;
X  VALUELISTREC *t;
X
X  if (el == NULL)
X    return NULL;
X  else {
X    h = eval(el->head, LINK->rho);
X    t = evalList(el->tail, LINK);
X    return (mkValuelist(h, t));
X  }
}  /* evalList */
X
/* applyUserFun - look up definition of nm and apply to actuals  */
Local APLVALUEREC *applyUserFun(nm, actuals, LINK)
char nm;
VALUELISTREC *actuals;
struct LOC_eval *LINK;
{
X  FUNDEFREC *f;
X  ENVREC *rho;
X
X  f = fetchFun(nm);
X  if (f == NULL) {
X    printf("Undefined function: ");
X    prName(nm);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  if (lengthNL(f->formals) != lengthVL(actuals)) {
X    printf("Wrong number of arguments to: ");
X    prName(nm);
X    putchar('\n');
X    longjmp(_JL99, 1);
X  }
X  rho = mkEnv(f->formals, actuals);
X  return (eval(f->body, rho));
}  /* applyUserFun */
X
/* applyCtrlOp - apply CONTROLOP op to args in rho               */
Local APLVALUEREC *applyCtrlOp(op, args, LINK)
BUILTINOP op;
EXPLISTREC *args;
struct LOC_eval *LINK;
{
X  APLVALUEREC *Result, *a;
X  EXPLISTREC *WITH;
X
X  WITH = args;
X  switch (op) {
X
X  case IFOP:
X    if (isTrueVal(eval(WITH->head, LINK->rho)))
X      Result = eval(WITH->tail->head, LINK->rho);
X    else
X      Result = eval(WITH->tail->tail->head, LINK->rho);
X    break;
X
X  case WHILEOP:
X    a = eval(WITH->head, LINK->rho);
X    while (isTrueVal(a)) {
X      a = eval(WITH->tail->head, LINK->rho);
X      a = eval(WITH->head, LINK->rho);
X    }
X    Result = a;
X    break;
X
X  case SETOP:
X    a = eval(WITH->tail->head, LINK->rho);
X    if (isBound(WITH->head->UU.varble, LINK->rho))
X      assign(WITH->head->UU.varble, a, LINK->rho);
X    else if (isBound(WITH->head->UU.varble, globalEnv))
X      assign(WITH->head->UU.varble, a, globalEnv);
X    else
X      bindVar(WITH->head->UU.varble, a, globalEnv);
X    Result = a;
X    break;
X
X  case BEGINOP:
X    while (args->tail != NULL) {
X      a = eval(args->head, LINK->rho);
X      args = args->tail;
X    }
X    Result = eval(args->head, LINK->rho);
X    break;
X  }/* case and with */
X  return Result;
}  /* applyCtrlOp */
X
X
/*****************************************************************
X *                     EVALUATION                                *
X *****************************************************************/
X
/* eval - return value of expression e in local environment rho  */
Static APLVALUEREC *eval(e, rho_)
EXPREC *e;
ENVREC *rho_;
{
X  struct LOC_eval V;
X  APLVALUEREC *Result;
X  BUILTINOP op;
X
X  V.rho = rho_;
X  switch (e->etype) {
X
X  case VALEXP:
X    Result = e->UU.aplval;
X    break;
X
X  case VAREXP:
X    if (isBound(e->UU.varble, V.rho))
X      Result = fetch(e->UU.varble, V.rho);
X    else if (isBound(e->UU.varble, globalEnv))
X      Result = fetch(e->UU.varble, globalEnv);
X    else {
X      printf("Undefined variable: ");
X      prName(e->UU.varble);
X      putchar('\n');
X      longjmp(_JL99, 1);
X    }
X    break;
X
X  case APEXP:
X    if (e->UU.U2.optr > numBuiltins)
X      Result = applyUserFun(e->UU.U2.optr, evalList(e->UU.U2.args, &V), &V);
X    else {
X      op = primOp(e->UU.U2.optr);
X      if (((1L << ((long)op)) &
X	   ((1 << ((long)BEGINOP + 1)) - (1 << ((long)IFOP)))) != 0)
X	Result = applyCtrlOp(op, e->UU.U2.args, &V);
X      else
X	Result = applyValueOp(op, evalList(e->UU.U2.args, &V));
X    }
X    break;
X  }/* case and with */
X  return Result;
}  /* eval */
X
X
/*****************************************************************
X *                     READ-EVAL-PRINT LOOP                      *
X *****************************************************************/
X
main(argc, argv)
int argc;
Char *argv[];
{  /* apl main */
X  PASCAL_MAIN(argc, argv);
X  if (setjmp(_JL99))
X    goto _L99;
X  initNames();
X  globalEnv = emptyEnv();
X
X  quittingtime = false;
_L99:
X  while (!quittingtime) {
X    reader();
X    if (matches((long)pos_, 4, "quit                ")) {
X      quittingtime = true;
X      break;
X    }
X    if ((userinput[pos_ - 1] == '(') & matches(skipblanks(pos_ + 1L), 6,
X					       "define              ")) {
X      prName(parseDef());
X      putchar('\n');
X    } else {
X      currentExp = parseExp();
X      prValue(eval(currentExp, emptyEnv()));
X      printf("\n\n");
X    }
X  }  /* while */
X  exit(0);
}  /* apl */
X
X
X
X
X
X
/* End. */
SHAR_EOF
  (set 19 90 01 05 18 00 22 'c-distr/apl.c'; eval "$shar_touch") &&
  chmod 0644 'c-distr/apl.c'
if test $? -ne 0
then ${echo} 'restore of c-distr/apl.c failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/apl.c: MD5 check failed'
       ) << SHAR_EOF
ad093ff5e9c45232b49cd80d1c9d6bc6  c-distr/apl.c
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/apl.c'` -ne 41193 && \
  ${echo} 'restoration warning:  size of c-distr/apl.c is not 41193'
  fi
fi
# ============= c-distr/README ==============
if test -f 'c-distr/README' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/README (file already exists)'
else
${echo} 'x - extracting c-distr/README (text)'
  sed 's/^X//' << 'SHAR_EOF' > 'c-distr/README' &&
C versions of the language interpreters from "Programming Languages,
An Interpreter-based Approach," by Sam Kamin
====================================================================
X
This directory contains C versions of the interpreters, produced
by the p2c translator from Cal Tech.  These versions were created, and
the makefile written, by Dirk Grunwald of Univ. of Colorado at
Boulder (thanks, Dirk!).  To compile and test the interpreters,
just say "make" in this directory.
X
The C versions of the interpreters were produced automatically
from the Pascal versions in the distr directory, using p2c, a Pascal-to-C
translator written by Dave Gillespie of Cal Tech.  (p2c can be
obtained by anonymous ftp from csvax.caltech.edu.)  The test
cases included here are identical to those in the distr directory,
and produce identical results.
X
Though p2c does a remarkably good job, these interpreters are not
hand-written, and are somewhat obscure in spots.  So they are
probably not appropriate for the "interpreter modification"
exercises.  For programming in the interpreted languages, on the
other hand, they are perfectly good.
X
The files in this directory are essentially the same as those in
the distr directory.  The interpreters have names xxx.c instead
of xxx.p, the file TEST.INTERPS is omitted (the Makefile takes its
place), and the README file is different.  Also, this directory
includes a subdirectory p2c containing files needed to compile the
C interpreters.  The biggest difference is the omission of the
files related to memory management (lisp.stack.p, lisp.ms-gc.p,
lisp.ss-gc.p, and lisp.refcnt.p, and their associated test files);
since these exist only for expository purposes (the language they
interpret is the same as that interpreted by lisp.c), and the C
versions of the code are not really readable (and are not explained
in the book), there seems no point in including them here.
X
Here is an explanation of the files containing the interpreters and
test cases:
X
1. Interpreters (C source files):
X
X     chap1.c - Chapter 1
X     lisp.c - Lisp
X     apl.c - APL
X     scheme.c - Scheme
X     sasl.c - SASL
X     clu.c - CLU
X     smalltalk.c - Smalltalk
X     prolog.c - Prolog
X
X   "make" will compile these files, leaving binaries called chap1,
X   lisp, etc.
X
2. Code files, including all code from chapters (plus some test cases
X   not appearing in text).  Note that you may be unable to run these
X   files as is due to memory limitations.  In that case, just split them
X   up and run the pieces separately.  (The Prolog code is given in two
X   pieces to avoid the problem of redefining predicates.)
X
X     code.ch1 - Chapter 1
X     code.lsp - Lisp
X     code.apl - APL
X     code.sch - Scheme
X     code.ssl - SASL
X     code.clu - CLU
X     code.smt - Smalltalk
X     code1.pro - Prolog, part 1
X     code2.pro - Prolog, part 2
X        
3. Output of code files.  Use these to check that the interpreters
X   are running correctly.
X
X     code.ch1.out - output from running chap1.p on code.ch1
X     code.lsp.out - output from running lisp.p on code.lsp
X     code.apl.out - output from running apl.p on code.apl
X     code.sch.out - output from running scheme.p on code.sch
X     code.ssl.out - output from running sasl.p on code.ssl
X     code.clu.out - output from running clu.p on code.clu
X     code.smt.out - output from running smalltalk.p on code.smt
X     code1.pro.out - output from running prolog.p on code1.pro
X     code2.pro.out - output from running prolog.p on code2.pro
X
X   "make" will use these files to test whether the interpreters are
X   running correctly.  Aside from that, they have no particular use,
X   as the book says what the correct value is for each expression.
X
PROBLEMS
X
The most likely source of problems when testing the interpreters is running
out of memory.  To alleviate the problem, I have made the following
adjustments:
X
X	code.lsp: The "quit" has been inserted before
X                line 414: "(r-e-p-loop '(", the first line of
X		an 86-line expression whose evaluation uses enormous
X		amounts of memory.
X
X	code.sch: Line 305: "(differentiate '(Dx (+ x c)))" has
X                been commented out.
X
SHAR_EOF
  (set 19 90 01 05 20 25 19 'c-distr/README'; eval "$shar_touch") &&
  chmod 0644 'c-distr/README'
if test $? -ne 0
then ${echo} 'restore of c-distr/README failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/README: MD5 check failed'
       ) << SHAR_EOF
9e7de6dc92bba8e94941a758e916a750  c-distr/README
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/README'` -ne 4149 && \
  ${echo} 'restoration warning:  size of c-distr/README is not 4149'
  fi
fi
# ============= c-distr/out1 ==============
if test -f 'c-distr/out1' && test "$first_param" != -c; then
  ${echo} 'x -SKIPPING c-distr/out1 (file already exists)'
else
${echo} 'x - extracting c-distr/out1 (binary)'
  sed 's/^X//' << 'SHAR_EOF' | uudecode &&
begin 600 c-distr/out1
M+3X@+3X@"BT^(`HM/B`*+3X@"BT^(`HM/B`*+3X@+3X@/B`^(#X@"BT^(`I.
M;W0@<V%T:7-F:65D"@HM/B`*"E-A=&ES9FEE9`H*+3X@"DYO="!S871I<V9I
M960*"BT^(`IY96QL;W<@8FQU92!R960@8FQU92!Y96QL;W<@8FQU90I3871I
M<V9I960*"BT^("T^(`HM/B`*+3X@"DYO="!S871I<V9I960*"BT^(`H*4V%T
M:7-F:65D"@HM/B`*3F]T('-A=&ES9FEE9`H*+3X@"DYO="!S871I<V9I960*
M"BT^("T^(`HM/B`*+3X@"BT^(`HM/B`*4V%T:7-F:65D"@HM/B`*"E-A=&ES
M9FEE9`H*+3X@"BT^(`HM/B`*+3X@"E-A=&ES9FEE9`H*+3X@"@I3871I<V9I
M960*"BT^(`HM/B`*+3X@+3X@"BT^(`HM/B`*3F]T('-A=&ES9FEE9`H*+3X@
M"BAC;VYS(#,@*&-O;G,@-"!N:6PI*0I3871I<V9I960*"BT^(`I.;W0@<V%T
M:7-F:65D"@HM/B`**&-O;G,@,R!N:6PI"E-A=&ES9FEE9`H*+3X@+3X@"BT^
M(`HM/B`*3F]T('-A=&ES9FEE9`H*+3X@"BAC;VYS(#(@*&-O;G,@,2!N:6PI
M*0I3871I<V9I960*"BT^(`I.;W0@<V%T:7-F:65D"@HM/B`**&-O;G,@,B`H
M8V]N<R`Q(&YI;"DI"E-A=&ES9FEE9`H*+3X@+3X@"BT^(`HM/B`*3F]T('-A
M=&ES9FEE9`H*+3X@"BAC;VYS(#,@;FEL*0I3871I<V9I960*"BT^(#X@"DYO
M="!S871I<V9I960*"BT^(`HH8V]N<R`S("AC;VYS(#0@*&-O;G,@-2`H8V]N
M<R`V(&YI;"DI*2D*4V%T:7-F:65D"@HM/B`^(`I.;W0@<V%T:7-F:65D"@HM
M/B`**&-O;G,@-2!N:6PI"E-A=&ES9FEE9`H*+3X@+3X@"BT^(`HM/B`*+3X@
M"DYO="!S871I<V9I960*"BT^(`IL:6UA"E-A=&ES9FEE9`H*+3X@+3X@"BT^
M(`HM/B`*3F]T('-A=&ES9FEE9`H*+3X@"C$U"E-A=&ES9FEE9`H*+3X@"BT^
M(`HM/B`*+3X@"BT^(`HM/B`*+3X@+3X@"BT^(`HM/B`*+3X@+3X@"BT^(#X@
M"BT^("T^(`HM/B`*3F]T('-A=&ES9FEE9`H*+3X@"BAC;VYS(#(@*&-O;G,@
M,R`H8V]N<R`T(&YI;"DI*0I3871I<V9I960*"BT^("T^(`HM/B`*+3X@"BT^
M("T^(`HM/B`^(#X@/B`^(#X@"BT^(#X@"DYO="!S871I<V9I960*"BT^(`HH
M8V]N<R`Q("AC;VYS(#(@*&-O;G,@,R`H8V]N<R`W("AC;VYS(#@@;FEL*2DI
M*2D*4V%T:7-F:65D"@HM/B`M/B`*+3X@"BT^(`I.;W0@<V%T:7-F:65D"@HM
M/B`**&-O;G,@,R`H8V]N<R`T(&YI;"DI"E-A=&ES9FEE9`H*+3X@"DYO="!S
M871I<V9I960*"BT^(`HH9&EF9B`H8V]N<R`S("AC;VYS(#0@6C$I*2!:,2D*
M4V%T:7-F:65D"@HM/B`*+3X@/B`*3F]T('-A=&ES9FEE9`H*+3X@"BAD:69F
F("AC;VYS(#,@*&-O;G,@-"!9*2D@62D*4V%T:7-F:65D"@HM/B`@
`
end
SHAR_EOF
  (set 20 10 08 31 16 47 07 'c-distr/out1'; eval "$shar_touch") &&
  chmod 0644 'c-distr/out1'
if test $? -ne 0
then ${echo} 'restore of c-distr/out1 failed'
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'c-distr/out1: MD5 check failed'
       ) << SHAR_EOF
c19645e96d66c0e688af6797b3cf8a76  c-distr/out1
SHAR_EOF
  else
test `LC_ALL=C wc -c < 'c-distr/out1'` -ne 1298 && \
  ${echo} 'restoration warning:  size of c-distr/out1 is not 1298'
  fi
fi
if rm -fr ${lock_dir}
then ${echo} 'x - removed lock directory `'${lock_dir}\''.'
else ${echo} 'x - failed to remove lock directory `'${lock_dir}\''.'
  exit 1
fi
exit 0
