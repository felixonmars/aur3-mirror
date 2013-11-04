#!/bin/sh
# This is a shell archive (produced by GNU sharutils 4.13.5).
# To extract the files from this archive, save it to some FILE, remove
# everything before the '#!/bin/sh' line above, then type 'sh FILE'.
#
lock_dir=_sh16182
# Made on 2013-11-03 15:14 HKT by <ying@i7>.
# Source directory was '/mnt/rd1/apli/src'.
#
# Existing files will *not* be overwritten, unless '-c' is specified.
#
# This shar contains:
# length mode       name
# ------ ---------- ------------------------------------------
#    779 -rw-r--r-- apli/test.lisp
#    434 -rw-r--r-- apli/Makefile
#   6895 -rw-r--r-- apli/misc.c
#  21913 -rw-r--r-- apli/io.c
#  14093 -rw-r--r-- apli/kernel.h
#   9026 -rw-r--r-- apli/init.c
#   2488 -rw-r--r-- apli/sym.c
#   9493 -rw-r--r-- apli/eval.c
#   7385 -rw-r--r-- apli/flow.c
#  11786 -rw-r--r-- apli/list.c
#   2970 -rw-r--r-- apli/iter.c
#    779 -rw-r--r-- apli/test/test.lisp
#     20 -rw-r--r-- apli/test/arith.lisp
#    559 -rw-r--r-- apli/README
#   1574 -rw-r--r-- apli/vec.c
#   2442 -rw-r--r-- apli/symt.c
#   2993 -rw-r--r-- apli/str.c
#   5265 -rw-r--r-- apli/set.c
#   3014 -rw-r--r-- apli/prop.c
#   3088 -rw-r--r-- apli/map.c
#   4836 -rw-r--r-- apli/logic.c
#     91 -rw-r--r-- apli/kern.c
#   8205 -rw-r--r-- apli/kcomp.c
#   3790 -rw-r--r-- apli/globals.c
#   6494 -rw-r--r-- apli/cellt.c
#   6656 -rw-r--r-- apli/arith.c
#
MD5SUM=${MD5SUM-md5sum}
f=`${MD5SUM} --version | egrep '^md5sum .*(core|text)utils'`
test -n "${f}" && md5check=true || md5check=false
${md5check} || \
  echo 'Note: not verifying md5sums.  Consider installing GNU coreutils.'
if test "X$1" = "X-c"
then keep_file=''
else keep_file=true
fi
echo=echo
save_IFS="${IFS}"
IFS="${IFS}:"
gettext_dir=
locale_dir=
set_echo=false

for dir in $PATH
do
  if test -f $dir/gettext \
     && ($dir/gettext --version >/dev/null 2>&1)
  then
    case `$dir/gettext --version 2>&1 | sed 1q` in
      *GNU*) gettext_dir=$dir
      set_echo=true
      break ;;
    esac
  fi
done

if ${set_echo}
then
  set_echo=false
  for dir in $PATH
  do
    if test -f $dir/shar \
       && ($dir/shar --print-text-domain-dir >/dev/null 2>&1)
    then
      locale_dir=`$dir/shar --print-text-domain-dir`
      set_echo=true
      break
    fi
  done

  if ${set_echo}
  then
    TEXTDOMAINDIR=$locale_dir
    export TEXTDOMAINDIR
    TEXTDOMAIN=sharutils
    export TEXTDOMAIN
    echo="$gettext_dir/gettext -s"
  fi
fi
IFS="$save_IFS"
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

if   touch -am -t ${st1} ${f} >/dev/null 2>&1 && \
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
  ${echo} 'WARNING: not restoring timestamps.  Consider getting and
installing GNU '\''touch'\'', distributed in GNU coreutils...'
  echo
fi
rm -f ${st1} ${st2} ${st2tr} ${st3} ${f}
#
if test ! -d ${lock_dir} ; then :
else ${echo} "lock directory ${lock_dir} exists"
     exit 1
fi
if mkdir ${lock_dir}
then ${echo} "x - created lock directory ${lock_dir}."
else ${echo} "x - failed to create lock directory ${lock_dir}."
     exit 1
fi
# ============= apli/test.lisp ==============
if test ! -d 'apli'; then
  mkdir 'apli'
if test $? -eq 0
then ${echo} "x - created directory apli."
else ${echo} "x - failed to create directory apli."
     exit 1
fi
fi
if test -n "${keep_file}" && test -f 'apli/test.lisp'
then
${echo} "x - SKIPPING apli/test.lisp (file already exists)"

else
${echo} "x - extracting apli/test.lisp (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/test.lisp' &&
X./kern
X
;; ch01
(+ 5 10)
(+ five 10)
X
(ss)
X
(+ 5)
eof
(reset)
(exit)
X
(car '(a b (c d) e))
(car (quote (a b (c d) e)))
X
;;ng
(fun atoms (expr)
X		 (cond [(null? expr) 0]    ;; empty expression.
X					 [(atom? expr) 1]    ;; exactly one atom.
X					 [t (+ (atoms (car expr)) (atoms (cdr expr)))]))
X
X
(atoms '(a b (c d) e))
;;ng
X
(def atoms 
X		 (lam (expr)
X		 (cond [(null? expr) 0] 
X					 [(atom? expr) 1]
X					 [t (+ (atoms (car expr)) (atoms (cdr expr)))])))
X
;; ng
(atoms '(a b (c d) e))
;; ng
X
(atoms (quote (a b (c d) e)))
X
X
(fun incr (expr) (+ 1 expr)) 
(incr 3)
X
((lam (n) (+ n 1)) 3)
X
;; ch10
(void (+ 10 2)) 
X
;; ng
(quote a)
(quote (3 4 5))
X
;; ng
'a
;; ng
X
(kwote (+ 10 20))
;; ng
X
(def square (lam (x) (* x x)))
(square 3) 
X
(fun square (x) (* x x)) 
(square 3) 
(reset)
SHAR_EOF
  (set 20 13 11 03 15 11 52 'apli/test.lisp'
   eval "${shar_touch}") && \
  chmod 0644 'apli/test.lisp'
if test $? -ne 0
then ${echo} "restore of apli/test.lisp failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/test.lisp': 'MD5 check failed'
       ) << \SHAR_EOF
4a10b1d5f5e631e5d5d50b79d9f12648  apli/test.lisp
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/test.lisp'` -ne 779 && \
  ${echo} "restoration warning:  size of 'apli/test.lisp' is not 779"
  fi
fi
# ============= apli/Makefile ==============
if test ! -d 'apli'; then
  mkdir 'apli'
if test $? -eq 0
then ${echo} "x - created directory apli."
else ${echo} "x - failed to create directory apli."
     exit 1
fi
fi
if test -n "${keep_file}" && test -f 'apli/Makefile'
then
${echo} "x - SKIPPING apli/Makefile (file already exists)"

else
${echo} "x - extracting apli/Makefile (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/Makefile' &&
SRC = arith.c cellt.c eval.c flow.c globals.c init.c io.c iter.c \
X			list.c logic.c map.c misc.c prop.c set.c str.c sym.c symt.c vec.c
OBJS = $(SRC:.c=.o)
CC = cc
LIBS = -lm
CFLAGS = -w
#CFLAGS = -w -m32
X
X.SILENT:
X
all: kern kcomp
X
kern: $(OBJS) kern.o
X	$(CC) -o $@ $(CFLAGS) $(LIBS) $(OBJS) $@.o
X
kcomp: $(OBJS) kcomp.o
X	$(CC) -o $@ $(CFLAGS) $(LIBS) $(OBJS) $@.o
X
%.o:%.c
X	$(CC) -c $(CFLAGS) $< -o $@
X
clean:
X	rm -f *o kern kcomp
X
SHAR_EOF
  (set 20 13 11 03 15 10 21 'apli/Makefile'
   eval "${shar_touch}") && \
  chmod 0644 'apli/Makefile'
if test $? -ne 0
then ${echo} "restore of apli/Makefile failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/Makefile': 'MD5 check failed'
       ) << \SHAR_EOF
f0cac5e4c9f4c756315e1afda3c2ff18  apli/Makefile
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/Makefile'` -ne 434 && \
  ${echo} "restoration warning:  size of 'apli/Makefile' is not 434"
  fi
fi
# ============= apli/misc.c ==============
if test -n "${keep_file}" && test -f 'apli/misc.c'
then
${echo} "x - SKIPPING apli/misc.c (file already exists)"

else
${echo} "x - extracting apli/misc.c (text)"
  sed 's/^X//' << 'SHAR_EOF' | uudecode &&
begin 600 apli/misc.c
M"B\J(#$S-"!-:7-C96QL86YE;W5S("HO"@HO*B!M:7-C+F,@*B\*"B-I;F-L
M=61E(")K97)N96PN:"(*"@EK97)N8V5L;`I5=F]I9"@I("\J("AV;VED(%ME
M>'!R72D@*B\*>PH):V5R;F-E;&P@;&ES="`](&%R9W-T:UMA<F=T;W!=.PH*
M"6EF("AL:7-T+3Y#14Q,8V1R("$]($Y)3"D*"0EE<G)O<B`H=F]I9'-Y;2P@
M97)R7V%R9W,L(#`I.PH*"7)E='5R;B`H;&ES="T^0T5,3&-A<BD["@I]("\J
M(%5V;VED("HO"@H):V5R;F-E;&P*57%U;W1E("@I("\J("AQ=6]T92!E>'!R
M*2`J+PI["@EK97)N8V5L;"!L:7-T(#T@87)G<W1K6V%R9W1O<%T["@H):68@
M*&QI<W0@/3T@3DE,('Q\(&QI<W0M/D-%3$QC9'(@(3T@3DE,*2`*"0EE<G)O
M<B`H<75O=&5S>6TL(&5R<E]A<F=S+"`P*3L*"@ER971U<FX@*&UK8V5L;"`H
M<75O=&5S>6TL(&QI<W0I("D["@I]("\J(%5Q=6]T92`J+PH*:V5R;F-E;&P*
M"DQK=V]T92`H*2`O*B`H:W=O=&4@(F5X<'(I("HO"GL*"4-(14-+;&%R9W,@
M*&MW;W1E<WEM+"`Q*3L*"@ER971U<FX@*&UK8V5L;"`H<75O=&5S>6TL(&UK
M8V5L;"A!4D=N=6TQ+$Y)3"D@*2`I.PH*?2\J($QK=V]T92`J+PH*:V5R;F-E
M;&P*561E9B`H*2`O*B`H9&5F(&YA;64@*'1Y<&4@87)G,6ES="!E>'!R,2`N
M+BX@97AP<FXI*2`J+PI["@EK97)N8V5L;"!L:7-T(#T@87)G<W1K6V%R9W1O
M<%T["@H):V5R;G-Y;2!S>6T@/2!#3TY6<WEM*&QI<W0M/D-%3$QC87(I.PH*
M"4-(14-+<WEM,B`H9&5F<WEM+"!S>6TI.PH*"7-Y;2T^9FQA9R`]($953D-4
M24]..PH*"7-Y;2T^8FEN9"`](&QI<W0M/D-%3$QC9'(M/D-%3$QC87(["@H)
M<F5T=7)N("A#3TY68V5L;"`H<WEM*2`I.PH*?2\J(%5D968@*B\*"B\J(#$S
M-2!-:7-C96QL86YE;W5S("HO"@EK97)N8V5L;`I-9G5N("@I("\J"2AF=6X@
M;F%M92!;='EP95T@87)G,6ES="!E>'!R,2`N+BX@97AP<FXI("HO"GL*"6ME
M<FYC96QL(&QI<W0@/2!A<F=S=&M;87)G=&]P73L*"@ER971U<FX@*&UK8V5L
M;"`H9&5F<WEM+`H)"0D)*$E3<WEM*&QI<W0M/D-%3$QC9'(M/D-%3$QC87(I
M("8F"@D)"0D@;&ES="T^0T5,3&-D<BT^0T5,3&-A<B`A/2!.24P*"0D)"2`_
M(&UK8V5L;"`H;&ES="T^0T5,3&-A<BQM:V-E;&P@*&QI<W0M/D-%3$QC9'(L
M3DE,*2`I"@D)"0D@.FUK8V5L;"`H;&ES="T^0T5,3&-A<BP*"0D)"0D@;6MC
M96QL("AM:V-E;&P@*&QA;7-Y;2P@;&ES="T^0T5,3&-D<BDL($Y)3"DI*2DI
M.PH*?2\J($UF=6X@*B\*"@EK97)N8V5L;"`*3&%R9R`H*2`O*B`H87)G("=A
M<F=N=6TI("HO"GL*"@EK97)N8V5L;"!A<F<@/2!!4D=N=6TQ.PH*"6EN="!A
M<F=N=6TL(&ED>#L*"@E#2$5#2VQA<F=S("AA<F=S>6TL(#$I.PH*"6%R9VYU
M;2`]($=%5&EN="`H87)G<WEM+"!A<F<I.PH*"6EF("@@87)G=&]P(#P@,"D*
M"0EE<G)O<B`H87)G<WEM+"`B;W5T<VED92!A('9L86T@<V-O<&4B+"`P*3L*
M"@EI9'@@/2!#3TY6:6YT("AA<F=S=&M;(&%R9W1O<%TI.PH*"6EF("AA<F=N
M=6T@/"`Q('Q\(&%R9VYU;2`^(%]A<F=T;W`@+2!I9'@I"@D)97)R;W(@*&%R
M9W-Y;2P@(F%R9W5M96YT7V]U='-L9&4@<F%N9V4B+&%R9RD["@H)<F5T=7)N
M("AA<F=S=&M;:61X("L@87)G;G5M("T@,5TI.PH*?2\J3&%R<2HO"@HO*B`Q
M,S8@*B\*:V5R;F-E;&P*"DUL970@*"D@+RH@*&QE="!;*'9A<C$@:6YI=&PI
M("`@=F%R;ET@97AP<FP@("!E>'!R;BD@"@D)"0D@*B!E>'!A;F1S('1O.B`H
M*&QA;2`H=F%R;"!V87)N"@D)"0D@97AP<FP@("!E>'!R;BDI:6YI=#$@("!N
M:6PI("HO"GL*"6ME<FYC96QL(&QI<W0@/2!A<F=S=&M;87)G=&]P73L*"@EK
M97)N8V5L;"!P87)S(#T@3DE,.PH*"6ME<FYC96QL(&EN:71S(#T@3DE,.PH*
M"7)E9VES=&5R(&ME<FYC96QL('9A<G,L('9A<CL*"@EV87)S(#T@;&ES="T^
M0T5,3&-A<CL*"@EI9B`H(4E3;&ES="AV87)S*2`F)B!V87)S("$]($Y)3"D*
M"0EE<G)O<BAL971S>6TL(F)A9"!V87)I86)L92!L:7-T(B`L=F%R<RD["@H)
M=VAI;&4@*$E3;&ES="`H=F%R<RD@*2!["@H)"6EF("A)4VQI<W0H=F%R(#T@
M=F%R<RT^0T5,3&-A<BDI('L*"@D)"6EF("@A25-S>6TH=F%R+3Y#14Q,8V%R
M*2!\?"!V87(M/D-%3$QC9'(M/D-%3$QC9'(@(3T@3DE,*3L*"0D)"65R<F]R
M("AL971S>6TL(")B860@=F%R:6%B;&4@9F]R;2(L('9A<BD["@H)"0EP87)S
M(#T@;6MC96QL("AV87(M/D-%3$QC87(L<&%R<RD["@H)"0EI;FET<R`](&UK
M8V5L;"`H=F%R+3Y#14Q,8V1R+3Y#14Q,8V%R+"!I;FET<RD["@D)?0H)"65L
M<V4@:68@*$E3<WEM*'9A<BDI('L*"@D)"7!A<G,@/2!M:V-E;&PH=F%R+'!A
M<G,I.PH)"0EI;FET<R`](&UK8V5L;"`H3DE,+"!I;FET<RD["@D)?0H)"65L
M<V4*"0D)97)R;W(@*&QE='-Y;2P@(F)A9"!V87)I86)L92!F;W)M(BP@=F%R
M*3L*"0EV87)S(#T@=F%R<RT^0T5,3&-D<CL*"7T*"7)E='5R;B`H;6MC96QL
M("AM:V-E;&P@*&QA;7-Y;2P@"@D)"0D);6MC96QL("AD<F5V97)S92`H<&%R
M<RD@+"!L:7-T+3Y#14Q,8V1R*2`I("P@"@D)"0ED<F5V97)S92`H:6YI=',I
M("D@*3L*?2\J36QE="`J+PH*+RH@,3,W($UI<V-E;&QA;F5O=7,@*B\*"6ME
M<FYC96QL"DQS970@*"D@+RH@*'-E="`G<WEM("=E>'!R*2`J+PI["@EK97)N
M8V5L;"!A<F<Q(#T@05)';G5M,3L*"@EK97)N8V5L;"!A<F<R(#T@05)';G5M
M,CL*"@E#2$5#2VQA<F=S("AS971S>6TL(#(I.PH*"4-(14-+<WEM,B`H<V5T
M<WEM+"!A<F<Q*3L*"@E#3TY6<WEM*&%R9S$I+3YF;&%G(#T@5D%224%"3$4[
M"@H)<F5T=7)N("A#3TY6<WEM*&%R9S$I("T^8FEN9"`](&%R9S(I.PH*?2`O
M*B!,<V5T("HO"@H):V5R;F-E;&P@"E5S971Q("@I("\J("AS971Q('-Y;3$@
M)V5X<'(Q("XN+B!S>6TQ("=E>'!R:2D@*B\*>PH)<F5G:7-T97(@:V5R;F-E
M;&P@;&ES="`](&%R9W-T:UMA<F=T;W!=.PH):V5R;G-Y;2!S>6T["@EK97)N
M8V5L;"!R97,["@H):68@*&QI<W0M/D-%3$QC9'(@/3T@3DE,*2`*"0EE<G)O
M<B`H<V5T<7-Y;2P@97)R7V%R9W,L(#`I.PH*"7=H:6QE("A)4VQI<W0@*&QI
M<W0I("D@>PH*"0ES>6T@/2!#3TY6<WEM*&QI<W0M/D-%3$QC87(I.PH*"0E#
M2$5#2W-Y;3(@*'-E='%S>6TL('-Y;2D["@H)"6EF("@@(4E3;&ES="`H;&ES
M="`](&QI<W0M/D-%3$QC9'(I*0H)"0EE<G)O<B`H<V5T<7-Y;2P@97)R7V%R
M9W,L(#`I.PH*"0ES>6TM/F9L86<@/2!605))04),13L*"@D)<F5S(#T@<WEM
M+3YB:6YD(#T@979A;"`H;&ES="T^0T5,3&-A<BD["@H)"6QI<W0@/2!L:7-T
M+3Y#14Q,8V1R.PH)?0H)<F5T=7)N("AR97,I.PH*?2`O*B!5<V5T<2`J+PH*
M"B\J(#$S."!-:7-C96QL86YE;W5S("HO"@IK97)N8V5L;`I58V]N<W0H*2`O
M*B`H8V]N<W0@<WEM,2`G97AP<C$@<WEM:2`G97AP<FDI("HO"GL*"7)E9VES
M=&5R(&ME<FYC96QL(&QI<W0@/2!A<F=S=&M;87)G=&]P73L*"6ME<FYS>6T@
M<WEM.PH):V5R;F-E;&P@<F5S.PH*"6EF("AL:7-T+3Y#14Q,8V1R(#T]($Y)
M3"D@"@D)97)R;W(@*&-O;G-T<WEM+&5R<E]A<F=S+#`I.PH*"7=H:6QE("A)
M4VQI<W0@*&QI<W0I*2!["@D)<WEM(#T@0T].5G-Y;2AL:7-T+3Y#14Q,8V%R
M*3L*"@D)0TA%0TMS>6TR("AC;VYS='-Y;2P@<WEM*3L*"@D):68@*"%)4VQI
M<W0H;&ES="`](&QI<W0M/D-%3$QC9'(I*0H)"0EE<G)O<B`H8V]N<W1S>6TL
M(&5R<E]A<F=S+"`P*3L*"@D)<WEM+3YF;&%G(#T@0T].4U1!3E0["@D)<F5S
M(#T@<WEM+3YB:6YD(#T@979A;"AL:7-T+3Y#14Q,8V%R*3L*"0EL:7-T(#T@
M;&ES="T^0T5,3&-D<CL*"7T*"7)E='5R;B`H<F5S*3L*"GTO*B!58V]N<W0@
M*B\*"B\J(#$S.2!-:7-C96QL86YE;W5S("HO"@EK97)N8V5L;"`*5G-S("@I
M("\J("AS<R!;)V9R86UE<UTI("HO"GL*"7)E9VES=&5R(&EN="!N9G)A;65S
M+"!E=F%L:61X.PH):6YT(&QE;B`["@EK97)N8V5L;"!A<F<L('!R978@/2!.
M54Q,.PH)<F5G:7-T97(@:V5R;F-E;&P@9G)A;64["@H)0TA%0TMV87)G<S(@
M*'-S<WEM+"`Q*3L*"@EN9G)A;65S(#T@*&%R9W1O<"`]/2!!4D=I9'@Q(#\@
M159!3%-42U-)6D4@*R`Q(`H)"0DZ*&%R9R`]($%21VYU;3$L($=%5&EN="AS
M<W-Y;2QA<F<I*2D["@H)9F]R("AE=F%L:61X/65V86QT;W`M,CL@;F9R86UE
M<R`^(#`@)B8@979A;&ED>"`^/2`P.R`*"0D)+2UN9G)A;65S+"`M+65V86QI
M9'@I('L*"@D);&5N(#T@8G5F<')I;G0H4%))3E0L(%]O=71C:&%N+");)3`R
M9%T@(B`L979A;&ED>"D["@D)9G)A;64@/2!E=F%L<W1K(%ME=F%L:61X73L*
M"@D):68@*"`A($E3;&ES="`H9G)A;64I("D@"@D)"7!R:6YT875X("A04DE.
M5"P@9G)A;64L7V]U=&-H86XI.PH*"0EE;'-E('L*"@D)"6QE;B`K/2!B=69P
M<FEN="A04DE.5"Q?;W5T8VAA;BPB*"(I.PH*"0D)=VAI;&4@*$E3;&ES="`H
M9G)A;64I("D@>PH*"0D)"6EF("AF<F%M92T^0T5,3&-A<B`]/2!P<F5V*2`*
M"0D)"0EL96X@*ST@8G5F<')I;G0@*%!224Y4+%]O=71C:&%N+"`B/"HJ/B(I
M.PH*"0D)"65L<V4@:68@*&QE;B`K('!R:6YT875X*$Q%3D=42"P@9G)A;64M
M/D-%3$QC87(L7V]U=&-H86XL(`H)"0D)"0D)34%80T],4R`M(&QE;BD@/B!-
M05A#3TQ3*2![(`H)"0D)"6)U9G!R:6YT("A04DE.5"Q?;W5T8VAA;BP@(BXN
M+B(I.PH)"0D)"6)R96%K.PH)"0D)?0H)"0D)96QS90H*"0D)"0EL96X@*ST@
M<')I;G1A=7@@*%!224Y4+"!F<F%M92T^0T5,3&-A<BQ?;W5T8VAA;BD["@H)
M"0D):68@*$E3;&ES="`H9G)A;64@/2!F<F%M92T^0T5,3&-D<BDI(`H)"0D)
M"6)U9G!R:6YT("A04DE.5"Q?;W5T8VAA;BP@(B`B*3L*"0D)?0H)"0EB=69P
M<FEN="`H4%))3E0L7V]U=&-H86XL("(I(BD["@D)?0H)"7!R978@/2!E=F%L
M<W1K(%ME=F%L:61X73L*"0E415)04DEO=70@*"D["@E]"@ER971U<FX@*%14
M5"D["@I]("\J('-S("HO"@H):V5R;F-E;&P*5FQO860@*"D@+RH@*&QO860@
M)VYA;64@6R=V97)B;W-E72D@*B\*>PH):6YT('9E<F)O<V4["@ER96=I<W1E
M<B!K97)N8V5L;"!A<F<Q(#T@05)';G5M,3L*"@E#2$5#2W9A<F=S("AL;V%D
M<WEM+"`Q+"`R*3L*"@EV97)B;W-E(#T@*&%R9W1O<"`M($%21VED>#$@/3T@
M,B`F)B!!4D=N=6TR("$]($Y)3"D["@H):68@*$E3;&ES="`H87)G,2D@*0H)
M"7=H:6QE("A)4VQI<W0@*&%R9S$I*2!["@H)"0EL;V%D("AA<F<Q+3Y#14Q,
M8V%R+"!V97)B;W-E*3L*"0D)87)G,2`](&%R9S$M/D-%3$QC9'(["@D)?0H)
M96QS90H)"6QO860@*&%R9S$L('9E<F)O<V4I.PH)<F5T=7)N("A45%0I.PI]
M("\J5FQO860J+PH*"B\J(#$T,"!-:7-C96QL86YE;W5S("HO"FQO860@*&YA
M;64L=F5R8F]S92D@+RH@875X:6QL87)Y("HO"@EK97)N8V5L;"!N86UE.R`*
M"6EN="!V97)B;W-E.PI["@EC:&%R("IS='(@/2!'151S='(@*&QO861S>6TL
M(&YA;64I.PH):6YT"6QE;B`]('-T<FQE;B`H<W1R*3L*"49)3$4@*F9I;&4L
M("IF;W!E;B`H*3L*"6EO8VAA;B!C:&%N+"!O<&5N8VAA;B`H*3L*"7)E9VES
M=&5R(&ME<FYC96QL(&]B:CL*"@EI9B`H;&5N(#P@,R!\?"!S=');;&5N+3)=
M("$]("`G+B<@?'P@<W1R6VQE;BTQ72`A/2`G:R<I"@D)97)R;W(@*&QO861S
M>6TL(")B860@9FEL92!N86UE(B`L;F%M92D["@H):68@*"AF:6QE(#T](&9O
M<&5N*'-T<BPB<B(I*2`]/2!.54Q,*0H)"65R<F]R*&QO861S>6TL(F-A;N*`
MF'0@;W!E;B!F:3%E(BQN86UE*3L*"6-H86X@/2!O<&5N8VAA;B`H9FEL92P@
M24Y#2$%.*3L*"@EW:&EL92`H*&]B:B`M(')E861A=7@H8VAA;BPP*2D@(3T@
M0T].5F-E;&PH96]F<WEM*2D@>PH*"0EO8FH@/2!E=F%L*&]B:BD["@H)"6EF
M("AV97)B;W-E("8F(&]B:B`A/2!.24PI('L*"0D)4%))3E1O=70@("AO8FHI
M.PH*"0D)5$524%));W5T*"D["@D)?0H)?0H)8VQO<V5C:&%N*&-H86XI.PI]
M("\J(&QO860@*B\*"@HO*B`Q-#$@36ES8V5L;&%N96]U<R`J+PH*(VEF9&5F
M(%5.25@*(VEN8VQU9&4@/'-I9VYA;"YH/@H*"6ME<FYC96QL(`I5<VAE;&P@
M*"D@+RH@*"$@245)25%32BD@*B\*>PH)<F5G:7-T97(@:V5R;F-E;&P@;&ES
M="`](&%R9W-T:UMA<F=T;W!=.PH)8VAA<B`J<W1R+"`J<V)U9B`]('-T<F)U
M9CL*"6EN="!L96X@/3`["@H)=VAI;&4@*$E3;&ES="`H;&ES="DI('L*"@D)
M<W1R(#T@1T54<W1R*'-H96QL<WEM+"!L:7-T+3Y#14Q,8V%R*3L*"@D):68@
M*"AL96X@*ST@<W1R;&5N*'-T<BD@*R`Q*2`^(%-44D)51E-)6D4I"@D)"65R
M<F]R("AS:&5L;'-Y;2P@(G-T<FEN9R!B=69F97(@;W9E<F9L;W<B+"`P*3L*
M"@D)<W!R:6YT9BAS8G5F+"`B)7,@(BP@<W1R*3L*"@D)<V)U9B`]('-T<F)U
M9B`K(&QE;CL*"@D);&ES="`](&QI<W0M/D-%3$QC9'(["@E]"@ES8G5F6VQE
M;ET@/2`P.PH*"7)E='5R;B`H;6MI;G5M("AS=6)S:&5L;"`H<W1R8G5F*2`I
M("D["@H*?2`O*B!5<VAE;&P@*B\*"G-U8G-H96QL("AS='(I("\J(&-R96%T
M92!A('-U8G-H96QL("HO"@EC:&%R*B!S='(["GL*"6EN="`@*"H@<V%V95]I
M;G1R*2`H*2`L('!R;V-I9"P@<W1A='5S.PH)<F5G:7-T97(@:6YT(&EW86ET
M.PH*"7-A=F5?:6YT<B`]('-I9VYA;"A324=)3E0L4TE'7TE'3BD[("\J('-A
M=F4@:6YT97)R=7!T("HO"@H):68@*"AP<F]C:60@/2!F;W)K*"DI(#T](#`I
M('L*"@D)<VEG;F%L("A324=)3E0L(&]R9U]I;G1E<G)U<'0I.R`O*B!R97-T
M;W)E(&]R:6=I;F%L(&EN=&5R<G5P="`J+PH)"65X96-L("@B+V)I;B\@<V@B
M+"`B<V@B+"`B+6,B("P@<W1R+"`P*3L*"@D)97AI="`H,3(W*3L*"7T*"7=H
M:6QE("@H:7=A:70@/2!W86ET*"9S=&%T=7,I*2`A/2!P<F]C:60@)B8@:7=A
M:70@(3T@+3$I("`*"0D["@H)<VEG;F%L*%-)1TE.5"P@<V%V95]I;G1R*3L@
M+RH@<F5S=&]R92!S879E9"!I;G1E<G)U<'0@*B\*"7)E='5R;B`H(&EW86ET
M(#T]("TQ(#\@+3$@.B!S=&%T=7,I.PI]("\J('-U8G-H96QL("HO"@HC96YD
*:68@54Y)6"`*"C$@
`
end
SHAR_EOF
  (set 20 13 11 03 15 08 08 'apli/misc.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/misc.c'
if test $? -ne 0
then ${echo} "restore of apli/misc.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/misc.c': 'MD5 check failed'
       ) << \SHAR_EOF
30b83e48dd01276d069202649456c01f  apli/misc.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/misc.c'` -ne 6895 && \
  ${echo} "restoration warning:  size of 'apli/misc.c' is not 6895"
  fi
fi
# ============= apli/io.c ==============
if test -n "${keep_file}" && test -f 'apli/io.c'
then
${echo} "x - SKIPPING apli/io.c (file already exists)"

else
${echo} "x - extracting apli/io.c (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/io.c' &&
/* p44 
X * io.c */
X
#include "kernel.h" 
#include <math.h>
#include <stdarg.h>
X
#define EOL '\n' 
#define TAB '\t' 
#define SPACE ' '
#define ESCAPE 033
X
#define  LPARENTOK 1  /* ( */ 
#define  RPARENTOK 2  /* ) */ 
#define  LBRACKTOK 3  /* [ */ 
#define  RBRACKTOK 4  /* ] */ 
#define  LBRACETOK 5  /* { */ 
#define  RBRACETOK 6  /* } */ 
#define  QUOTETOK  7  /* ' */ 
#define  BQUOTETOK 8  /* ` */ 
#define  COMMATOK  9  /* , */ 
#define  ATTOK     10 /* @ */ 
#define  HASHTOK   11 /* # */ 
#define  STRTOK    12 /* string token */ 
#define  SYMTOK    13 /* symbol token */ 
#define  EOLTOK    14 /* end-of-line token */ 
#define  EOFTOK    15 /* end-of-file token */ 
#define  INUMTOK   16 /* integer number token */ 
#define  RNUMTOK   17 /* real number token */
X
X
#define NEXTtok(chan) ((chan)->tok = nexttok(chan)) 
#define ISdigit(ch) ((ch) >= '0' && (ch) <= '9') 
#define DIGITvalue(ch) ((ch) - '0')
X
int inumber = 0; 
real rnumber = 0.0;
X
/* for use by pp: */ 
int ppcols = MAXCOLS; /* maximum no. of columns on the screen */ 
int ppgap = MAXCOLS;  /* free gap for printing */ 
int llimit = MAXCOLS - 30; /* left limit */ 
int rlimit = MAXCOLS + 15; /* right limit */
X
kerncell readaux1 (register iochan, int); /* read an s-expression: for internal use ONLY */ 
X
bufprint( int, iochan, char*, ...);
X
/* 45 */
X	iochan 
openchan (file,mode) /* open channel */
X	FILE *file; 
X	int mode;
{
X
X	register iochan chan;
X
X	chan = CONVchan (new(sizeof (struct channel) ) ); 
X
X	chan->buf = new(CHANBUFSIZE+2); 
X
X	chan->ch = EOL; 
X
X	chan->tok = EOLTOK; 
X
X	chan->pos = chan->len = 0; 
X
X	chan->mode = mode; 
X
X	chan->file = file; 
X
X	return(chan); 
X
} /* openchan */
X
X
closechan (chan) /* close channel */
X	iochan chan; 
{
X
X	if (chan->mode == OUTCHAN  && chan->len > 0) 
X		bufprint (PRINT, chan, "\n"); /* flush the buffer */
X
X	fclose (chan->file); 
X	free (chan->buf ); 
X	free (chan); 
X
} /* closechan */
X
X
initio () /* initialize I/O channels */
{
X	inchan = mkchan (_inchan   = openchan (stdin, INCHAN)); 
X	outchan = mkchan(_outchan  = openchan (stdout,OUTCHAN)); 
X	errchan = mkchan(_errchan  = openchan (stderr, OUTCHAN));
} /* initio */ 
X
/* 46 */
X	char 
nextch (chan) /* returns the next character fram chan */
X	register iochan chan;
{
X
X	register char ch;
X
X	if (chan->pos < chan->len) /* more chars in buffer'P */ 
X
X		return (chan->ch = chan->buf [chan->pos++] ); 
X
X	chan->pos = chan->len = 0; 
X
X	while ((ch = getc(chan->file) ) != EOL && ch != EOF) 
X
X		if (chan->len < CHANBUFSIZE) /* store it in the buffer */ 
X
X			chan->buf[chan->len++] = ch; 
X
X		else {
X
X			chan->buf [chan->len] = 0; 
X
X			while ((ch = getc(chan->file) ) != EOL && ch != EOF) 
X				; /* skip till end of line */ 
X
X			error(readsym,"line too long", _mkstr(chan->buf));
X		} 
X
X	if (chan->len == 0) /* empty line? */
X		return (chan->ch = ch); /* ch is one of EOL, EOF */
X	chan->buf[ chan->len++] = EOL; /* put a newline at the end */
X
X	chan->buf[chan->len] = 0; /* null the end of string */
X
X	return (chan->ch = chan->buf[chan->pos++]);
} /* nextch */
X
X
/* 47 */
nexttok (chan) /* fetch and return the next token fran chan */
X	register iochan chan;
{
start: 
X
X	while (chan->ch == SPACE || chan->ch == TAB) /* skip blanks */
X
X		nextch (chan); 
X
X	switch (chan->ch) {
X
X		case '(': nextch(chan); return(LPARENTOK); 
X
X		case ')': nextch(chan); return(RPARENTOK); 
X
X		case '[': nextch (chan); return (LBRACKTOK); 
X
X		case ']': nextch(chan); return (RBRACKTOK); 
X
X		case '{': nextch (chan); return (LBRACETOK); 
X
X		case '}': nextch (chan); return (RBRACETOK); 
X
X		case '\\': nextch (chan); return (QUOTETOK); 
X
X		case '`': nextch(chan); return(BQUOTETOK); 
X
X		case ',': nextch (chan); return (COMMATOK); 
X
X		case '@': nextch (chan); return (ATTOK); 
X
X		case '#': nextch (chan); return (HASHTOK); 
X
X		case ';': chan->pos = chan->len = 0; /* ignore comments */
X							nextch (chan); 
X							goto start;
X
X		case '"':
X							{ register int i = 0; /* string is stored in strbuf */ 
X
X								while (nextch(chan) != '"' && 
X										chan->ch != EOL && chan->ch != EOF) 
X
X									strbuf [i++] = (chan->ch == '\\' ? nextch(chan): chan->ch); 
X
X								strbuf [i] = 0; 
X
X								if (chan->ch == EOL || chan->ch == EOF) 
X									error (readsym, "broken string", _mkstr(strbuf) ); 
X
X								nextch(chan); 
X
X								return (STRTOK);
X							}
X
X		case '|':
X							{
X								register int i = 0; /* strange atom is stored in strbuf */
X
X								strbuf [i++] = chan->ch; 
X
X								while (nextch(chan) != '|' && 
X										chan->ch != EOL && chan->ch != EOF) 
X
X									strbuf[i++] = (chan->ch == '\\' ? nextch(chan): chan->ch);
X
X								/* 48 */
X								strbuf [i++] = '|'; 
X
X								strbuf [i] = 0; 
X
X								if (chan->ch == EOL || chan->ch == EOF) 
X									error (readsym, "broken atom", _mkstr(strbuf ) ); 
X								nextch (chan); 
X
X								return(SYMTOK);
X							}
X
X		case EOL: return (EOLTOK); /* end-of-line is reported */ 
X		case EOF: return (EOFTOK); /* end-of-file is reported */ 
X		case ESCAPE: nextch (chan); /* ignore escapes */
X								 goto start;
X
X		default: 
X								 {
X									 register int i = 0; /* nums and syms are stored in strbuf */
X
X									 strbuf [i++] = chan->ch; 
X
X									 while (nextch(chan) != '(' && chan->ch != ')' 
X											 && chan->ch != '['     && chan->ch != ']' 
X											 && chan->ch != '(' 		&& chan->ch != '}' 
X											 && chan->ch != SPACE 	&& chan->ch != TAB 
X											 && chan->ch != EOL 		&& chan->ch !=  EOF)
X
X										 strbuf [i++] = chan->ch; 
X									 strbuf [i] = 0;
X									 return (atomkind(strbuf));
X								 } 
X	} /* switch */ 
} /* nexttok */
X
skipeoltok (chan, flag) /* skip eol token and return the next token */
X	register iochan chan; 
X	int flag; 
{
X	if (flag) 
X		NEXTtok(chan); 
X
X	while (chan->tok == EOLTOK) { /* skip eol's */
X		nextch(chan); 
X		NEXTtok(chan);
X	}
X	return(chan->tok); 
} /* skipeoltok */
X
/* P. 49 */
atomkind (name) /* work out whether name is a number or symbol */
X	register char *name;
{
X
X	int sign = 1, frac = 0, places = 0; 
X	double pow ();
X
X	if (isnum(name)) {
X
X		rnumber = inumber = 0; 
X
X		if (*name == '+' || *name == '-') /* signed rnumber? */
X			sign = (*name++ == '+' ? 1 : -1); 
X
X		while (*name && *name != '.') {
X			inumber = 10*inumber + DIGITvalue (*name); 
X			++name;   
X		} 
X
X		if (*name == '.') {
X			++name;   
X
X			while (*name && ISdigit (*name) ) { /* work out fraction */
X				frac = 10*frac + DIGITvalue(*name); 
X				++name;
X				++places; 
X			}
X			rnumber = (float) (sign*(inumber+((double) frac) * 
X						pow(10.0, - (double) places))); 
X			return (RNUMTOK); /* real number */
X		}
X		inumber *= sign; 
X		return (INUMTOK); /* integer number */ 
X	} 
X	return (SYMTOK); /* symbol */
} /* atomkind */
X
X
isnum (name) /* is name a number string? */
X	register char *name;
{
X	int decpoint = 0;
X
X	if (*name == '+' || *name == '-' )
X
X		/* empty name can't be number */ 
X		if (*name == 0) 
X			return (0); 
X
X	while (*name && (ISdigit (*name) ||  *name == '.')) {
X
X		if (*name == '.') { /* at most 1 decimal point allowed */ 
X
X			if (decpoint) 
X				return (0); 
X
X			decpoint = 1;
X		}
X		++name; /* skip all digits and decimal point */ 
X	}
X	return (*name == 0); /* there most be nothing left */
X
} /* isnum */
X
X
X
X
/* P. 51 
X	 4.2 Internal I/O functfons
X	 */
X
X	kerncell 
readaux(chan,bq) /* read an suppression fran chan */ 
X	iochan chan; 
X	int bq; /* non-zero when in a back-quoted s-expression */
{
X	int save_celltop = celltop; /* save top of cell stack */
X	kerncell obj;
X
X	if (chan == _inchan && _outchan->len > 0) {
X		fprintf (_outchan->file,"%s", _outchan->buf); /* flush output */
X		_outchan->len = 0;
X	}
X
X	obj = readaux1 (chan,bq); 
X	celltop = save_celltop; /* restore top of cell stack */
X	return (CELLpush(obj)); 
} /* readaux */
X
X
X	kerncell 
readaux1 (chan, bq) /* read an s-expression: for internal use ONLY */ 
X	register iochan chan; 
X	int bq; /* non-zero when in a back-quoted s-expression */
{
X	kerncell obj;
X
start:
X
X	skipeoltok (chan, 0); 
X
X	switch (chan->tok) {
X
X		case SYMTOK: 
X			obj = CONVcell (mksym(strbuf) ); 
X			NEXTtok (chan); 
X			break; 
X
X		case INUMTOK: 
X			obj = mkinum(inumber); 
X			NEXTtok (chan); 
X			break; 
X
X		case RNUMTOK: 
X			obj = mkrnum(rnumber); 
X			NEXTtok (chan); 
X			break; 
X
X		case STRTOK: 
X			obj = mkstr(strbuf); 
X			NEXTtok (chan); 
X			break; 
X
X		case LPARENTOK: 
X		case LBRACKTOK:
X			{ /* NOTE: ) matches ( only, and ] matches [ only */ 
X				int right = (chan->tok == LPARENTOK ? RPARENTOK : RBRACKTOK);
X				register kerncell list; 
X
X				if (skipeoltok (chan, 1) == right) { 
X					NEXTtok (chan); 
X					return (NIL);
X				}  /* () */
X
X				/* P. 52 */
X				obj = list = mkcell (readaux1(chan,bq), nil); /* (* ... ) */
X
X				while (skipeoltok(chan, 0), 
X						chan->tok != RPARENTOK && chan->tok != RBRACKTOK 
X						&& chan->tok != EOFTOK) {
X
X					list->CELLcdr = mkcell (readaux1 (chan,bq), nil); 
X
X					list = list->CELLcdr;
X				}
X				if (chan->tok == EOFTOK) 
X					error (readsym, "unexpected end of file", 0); 
X
X				if (chan->tok != right) {
X					if (chan->tok == RPARENTOK) 
X						error(readsym,"[ ... ) is not allowed",0); 
X					else 
X						error(readsym,"( ... ] is not allowed",0);
X				}
X				NEXTtok(chan); 
X				break;
X			} 
X
X		case LBRACETOK:
X			{ register kerncell set; 
X
X				if (skipeoltok (chan, 1) == RBRACETOK) {
X					NEXTtok (chan); 
X					return (NIL); /* {} */
X				}
X				obj = set = mkset(readaux1(chan,bq),nil); /* (* ... ) */
X				while (skipeoltok (chan, 0), 
X						chan->tok != RBRACETOK && chan->tok != EOFTOK) {
X					set->CELLcdr = mkset (readaux1 (chan, bq), nil); 
X					set = set->CELLcdr;
X				}
X
X				if (chan->tok ==  EOFTOK) 
X					error (readsym, "unexpected end of file",0); 
X				obj = remrep(obj); 
X				NEXTtok (chan); 
X				break;
X			}
X
X		case QUOTETOK: 
X			NEXTtok (chan); 
X			obj = mkcell (quotesym, mkcell (readaux1 (chan,bq), nil) ); 
X			break; 
X
X		case BQUOTETOK: 
X			NEXTtok (chan); 
X			obj = transform(readaux1 (chan, 1) ); 
X			break; 
X
X		case COMMATOK:
X			NEXTtok(chan); 
X			if (!bq) 
X				error (readsym, " ', ' outside a back-quoted s-expression", 0); 
X			obj = mkcell (_commasym, readaux1 (chan,bq) ); 
X			break; 
X
X		case ATTOK:
X			NEXTtok (chan);
X			/* P. 53 */
X			if (! bq) 
X				error (readsym, "'@' outside a back-quoted expression",0); 
X			obj = mkcell(_atsym, readaux1(chan,bq)); 
X			break; 
X
X		case HASHTOK: 
X			NEXTtok(chan); 
X			obj = eval(readaux1 (chan,bq) ); 
X			break; 
X
X		case EOLTOK: 
X			chan->ch = SPACE;
X			NEXTtok (chan); 
X			goto start; 
X
X		case EOFTOK: 
X			return (CONVcell (eofsym) ); 
X
X		case RPARENTOK: 
X			NEXTtok (chan); 
X			error (readsym, "unexpected ')'", 0); 
X
X		case RBRACKTOK: 
X			NEXTtok (chan); 
X			error (readsym, "unexpected ']'", 0); 
X
X		case RBRACETOK: 
X			NEXTtok (chan); 
X			error (readsym, "unexpected '}'", 0); 
X
X		default: 
X			NEXTtok (chan); 
X			return (NIL); 
X
X	} /* switch */ 
X	return (obj); 
} /* readaux1 */
X
X
hasmacro (expr) /* returns non-zero when expr contains ',' or '@' */
X	register kerncell expr;
{
X	if (! ISlist (expr) )
X		return (0);
X	if (expr->CELLcar == CONVcell(_commasym) || 
X			expr->CELLcar == CONVcell(_atsym))
X		return (1);
X
X	while (ISlist (expr) ) {
X		if (hasmacro (expr->CELLcar) )
X			return (1);
X		expr = expr->CELLcdr;
X	}
X	return (0); 
} /* hasmacro */
X
X
/* 54 */
kerncell 
transform (list) /* transform back-quoted s-expressions */
X	kerncell list;
{
X
X	kerncell obj;
X
X	if (list == NIL) 
X	return (NIL); 
X
X	if (! hasmacro(list) ) 
X		return (mkcell(quotesym, mkcell (list, nil) ) ); 
X
X	if (! ISlist(obj = list->CELLcar) ) { 
X		if (obj == CONVcell(_commasym) || obj == CONVcell(_atsym) ) 
X			return (eval(transform(list->CELLcdr) ) ); 
X
X		return (mkcell(conssym, 
X					mkcell(mkcell (quotesym, mkcell (obj, nil) ), 
X						mkcell (transform(list->CELLcdr, nil))))); 
X	}
X	if (obj->CELLcar == CONVcell(_commasym)) 
X		return (mkcell(conssym, 
X					mkcell(eval(transform(obj->CELLcdr)), 
X						mkcell (transform(list->CELLcdr), nil) ) ) ); 
X
X	if (obj->CELLcar == CONVcell(_atsym)) 
X		return (mkcell(concsym, 
X					mkcell(eval(transform(obj->CELLcdr) ), 
X						mkcell (transform(list->CELLcdr), nil))));
X
X	return (mkcell (conssym, 
X				mkcell (transform(obj), 
X					mkcell(transform(list->CELLcdr), nil))));
} /* transform */
X
/* 55 */
printaux (flag, expr, chan, max) /* auxiliary */
X	int flag; 
X	register kerncell expr; 
X	iochan chan; 
X	int max; /* max specifies an upper bound when flag is LENGTH */
{
X	//	printf("\tIn printaux\n");
X	//	printf("\tb4 ISsym\n");;
X	if (ISsym(expr)) /* is expr a symbol? */ 
X	{
//		printf("\tIt is symbol\n");
X		return(bufprint((flag ==  PRINC && *CONVsym(expr)->name == '|' 
X						? STRIP: flag), 
X					chan, "%s", CONVsym(expr)->name));
X	}
X	/* 56
X		 Input and Output 
X		 */
X
X	//		printf("\tb4 switch\n");;
X	switch (expr->flag) { 
X
X		case INTOBJ: {
//									 printf("\tIt is integer\n");
X									 return (bufprint (flag, chan, "%ld", expr->CELLinum) ); 
X								 }
X		case REALOBJ:
X								 { 
//									 printf("\tIt is real\n");
X									 return (bufprint (flag, chan, "%f", expr->CELLrnum) ); 
X								 }
X		case STROBJ: 
X								 {
//									 printf("\tIt is string\n");
X									 return (bufprint (flag, chan, 
X												 (flag == PRINC ? "%s" : "\"%s\""), 
X												 expr->CELLstr) ); 
X								 }
X		case CHANOBJ: 
X								 {
//									 printf("\tIt is channel\n");
X									 return (bufprint (flag, chan, "<channel:%1d>", expr->CELLchan)); 
X								 }
X
X		case VECTOROBJ: 
X								 {
//									 printf("\tIt is vector\n");
X									 return (bufprint (flag, chan, "vector [Old] ", 
X												 expr->CELLdim->CELLinum)); 
X								 }
X		case LISTOBJ:
X								 { 
//									 printf("\tIt is list\n");
X									 if (expr->CELLcar ==  CONVcell (quotesym)) {
X										 bufprint (flag, chan, " ' "); 
X										 return(1 + printaux(flag, expr->CELLcdr->CELLcar, chan, max));
X									 }
X								 }
X		case SETOBJ: /* handles lists and sets */ 
X								 { int size; 
X									 int oflag = expr->flag; 
X
//									 printf("\tIt is object\n");
X									 size = bufprint(flag, chan,(oflag ==  LISTOBJ ? "(" : "{"));
X									 if (flag ==  LENGTH && size > max) 
X										 return(size); 
X									 do {
X										 size += printaux(flag,expr->CELLcar,chan,max); 
X										 if ((expr = expr->CELLcdr) != NIL) {
X											 if (expr->flag != oflag) {
X												 if (flag  == LENGTH && size > max) 
X													 return(size); 
X
X												 size += bufprint(flag, chan, " . "); 
X												 size += printaux(flag,expr,chan,max); 
X												 break; 
X											 }
X											 else 
X												 size += bufprint (flag, chan, " ");
X										 }
X									 } while (expr != NIL); 
X
X									 size += bufprint(flag, chan, (oflag == LISTOBJ ? ")" : "}")); 
X									 return (size); 
X								 }
X		default: 
X								 return(bufprint( flag, chan, "<@:%1d>", expr->CELLcar));
X
X	} /* switch */ 
X
} /* printauc */
X
X
/* 57 */
X
extern int count_percent( char *);
X
bufprint (int flag, iochan chan, char *format, ...) /* buffered print */
X	/*
X		 int flag; 
X		 iochan chan; 
X		 char *format; 
X		 */
{
X	static char outputbuf [CHANBUFSIZE+2]; 
X	char *outbuf = outputbuf;
X	va_list args;
X	va_start( args, format); /* variable length argument */
X	// int len;	
X	//  len = count_percent( format );
X	vsprintf (outbuf, format, args); 
X	va_end(args);
X
X	if (flag == LENGTH) 
X		return (strlen (outputbuf ) ); 
X	else if (flag == STRIP) {  /* strip (symbol) to symbol */
X		++outbuf; 
X		*(outbuf + strlen(outbuf) - 1) = 0;
X	}
X
X	if (chan->len > 0) 
X		--(chan->len); /* get rid of the last null char */
X
X	do { 
X		*(chan->buf + chan->len++) = *outbuf; 
X
X		if (*outbuf == EOL || chan->len > CHANBUFSIZE) {
X			*(chan->buf + chan->len) = 0; 
X			fprintf (chan->file, "%s" , chan->buf ); 
X			chan->len = 0; 
X
X			if (!*(outbuf + 1)) 
X				break;
X		} 
X
X	} while (*outbuf++); 
X
X	return (strlen(outputbuf)); 
} /* bufprint */
X
/* 58 */
X	kerncell 
Lopen () /* (open 'name 'mode) */
{
X
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs(opensym, 2); 
X	return (openaux( 
X				GETstr(opensym, arg1), 
X				GETstr(opensym, arg2))); 
X
} /* Lopen */
X
X
X	kerncell 
openaux (name,mode) /* open a channel */
X	char *name, *mode;
{
X
X	FILE *file, *fopen();
X
X	if ((file = fopen(name, mode) ) == NULL) 
X		error (opensym, "can't open file", mkstr (name) ); 
X	return (mkchan (openchan (file, 
X					(*mode  == 'r'
X					 ? (*++mode != 0 ? INOUTCHAN: INCHAN) 
X					 : OUTCHAN))));
X
} /* openaux */
X
X	kerncell 
Lclose () /* (close 'chan) */
{
X	kerncell arg  = ARGnum1;
X
X	CHECKlargs ( closesym, 1);
X
X	closechan (GETchan(closesym, arg) ); 
X
X	arg->flag = VOID; /* arg is no more a channel */ 
X
X	return (TTT); 
X
} /* Lclose */
X
/* 59 */
X	kerncell 
Vflush () /* (flush ['chan]) */
{
X	kerncell arg; 
X	iochan chan;
X
X	CHECKvargs2 (flushsym, 1); 
X
X	chan = (ARGidx1 == argtop 
X			? _outchan 
X			: (arg = ARGnum1, GETchan(flushsym,arg) ) ); 
X
X	if (chan->len ==  0) 
X		return (TTT); 
X
X	if (chan->mode == OUTCHAN ||  chan->mode ==  INOUTCHAN)
X		bufprint (PRINT, chan, "\n"); 
X
X	else 
X		chan->len = 0; 
X	return(TTT); 
} /* Vflush */
X
X	kerncell 
Vread () 
{
X
X	/* (read ['chan]) */
X
X	kerncell arg;
X
X	CHECKvargs2 (readsym, 1); 
X
X	if (argtop == ARGidx1) 
X		return (readaux (_inchan,0) ) ; 
X
X	else { 
X
X		if ( !ISchan( arg= ARGnum1) || arg->CELLchan->mode == OUTCHAN) 
X			error(readsym, err_chan2, arg); 
X
X		return (readaux ( arg->CELLchan, 0)); 
X	}
} /* Vread */
X
/* 60 */
X	kerncell 
Vprint () /* (print 'expr ['chan]) */
{
X	kerncell arg2;
X
X	CHECKvargs(printsym, 1, 2); 
X
X	if (argtop - ARGidx1 == 1) 
X		printaux (PRINT, ARGnum1, outchan, 2); 
X
X	else { 
X		if (! ISchan(arg2 = ARGnum2) ||  arg2->CELLchan->mode == INCHAN)
X			error (printsym, err_chan2, arg2); 
X
X		printaux(PRINC, ARGnum1, arg2->CELLchan, 2);
X	}
X	return (TTT); 
X
} /* Vprint */
X
X	kerncell 
Vprinc () /* (princ 'expr ['chan]) */
{
X	kerncell arg2;
X
X	if (argtop - ARGidx1 == 1) 
X		printaux (PRINC, ARGnum1, outchan, 2); 
X
X	else { 
X		if (! ISchan(arg2 = ARGnum2) ||  arg2->CELLchan->mode == INCHAN) 
X			error (princsym, err_chan2, arg2); 
X		printaux(PRINC, ARGnum1, arg2->CELLchan, 2);
X	}
X	return (TTT); 
} /* Vprinc */
X
/* 61 */
X	kerncell 
Vtab () /* (tab 'column f'chan]) */
{
X	kerncell arg1 = ARGnum1, arg2; 
X	iochan chan;
X
X	CHECKvargs (tabsym, 1, 2); 
X
X	if (argtop - ARGidx1 ==  1) 
X		chan = _outchan; 
X
X	else { 
X		if (! ISchan (arg2 = ARGnum2) ||  arg2->CELLchan->mode == INCHAN) 
X			error (tabsym, err_chan2, arg2); 
X		chan = arg2->CELLchan;
X	}
X
X	arg1 = ARGnum1; 
X
X	tab (GETint (tabsym, arg1), chan); 
X
X	return (TTT); 
} /* Vtab */
X
X
tab (column, chan) /* tab */
X	int column; 
X	iochan chan;
{
X	if (column > CHANBUFSIZE) 
X		column = CHANBUFSIZE; 
X
X	if (chan->len > column) 
X		bufprint (PRINT, chan, "\n"); 
X
X	if (column < 0) 
X		return; 
X
X	while (chan->len < column) 
X		*(chan->buf + chan->len++) = SPACE ;
X	*(chan->buf + chan->len) = 0; 
X
} /* tab */
X
X	kerncell 
Vterpri () /* (terpri ['chan]} */
{
X
X	kerncell arg;
X
X	CHECKvargs2 (terprisym, 1); 
X
X	if (argtop ==  ARGidx1) 
X		bufprint (PRINT, outchan, "\n"); 
X
X	if ( !ISchan(arg = ARGnum1) || arg->CELLchan->mode ==  INCHAN) 
X		error (terprisym, err_chan2, arg); 
X
X	bufprint (PRINT, arg->CELLchan, "\n");
X
X	return (TTT); 
X
} /* Vterpri */
X
/* 62 */
X	kerncell 
Vprlen () /* (prlen 'expr ['max] } */
{
X	kerncell arg2; 
X	int max;
X
X	CHECKvargs (prlensym, 1, 2); 
X
X	max = (argtop - ARGidx1 == 1 
X			? MAXCOLS 
X			: (arg2 = ARGnum2, GETint (prlensym,arg2) ) ); 
X
X	return (mkinum(printaux (LENGTH, ARGnum1, outchan,max) ) ) ; 
} /* vprlen */
X
X	kerncell 
Viobuf () /* (iobuf ['chan]) */
{
X
X	kerncell arg;
X
X	CHECKvargs2 (iobufsym,1 ); 
X	return (mkinum(ARGidx1 == argtop
X				?_outchan->len 
X				:(arg =  ARGnum1, GETchan (iobufsym, arg)->len) ) );
X
} /* Viobuf */
X
X	kerncell
Lchanp() /* (chan? 'expr) */
{
X	CHECKlargs (chanpsym, 1); 
X	return(ISchan(ARGnum1) ? TTT : NIL) ;
X
} /* Lchanp */
X
/* 63 */
X	kerncell 
Vpp() /* (pp 'expr ['chan]) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2;
X
X	CHECKvargs (ppsym, 1, 2); 
X	ppgap = MAXCOLS; 
X
X	pp ( (ISfun(arg1) ? CONVsym(arg1)->bind : arg1), 
X			(argtop - ARGidx1 == 1 
X			 ? outchan 
X			 : (!ISchan (arg2 = ARGnum2) ||  arg2->CELLchan->mode  == INCHAN
X				 ? CONVchan (error (ppsym,err_chan2, arg2) ) 
X				 : arg2->CELLchan) ), 
X			0,0); 
X	return (TTT); 
X
} /* Vpp */
X
/* 64 */
X
pp (expr, chan, lmar, rmar) /* pretty print expr within the margins */
X	register kerncell expr; 
X	iochan chan; 
X	int lmar, rmar;
{
X	int flag = expr->flag; 
X	int lmarl;
X
X	if (lmar > llimit && printaux(LENGTH,expr,chan,rlimit) > rlimit) {
X		bufprint (PRINT, chan, "\n; <<=== continued left ===<<");
X		pp(expr, chan, 4, 0); 
X		bufprint (PRINT, chan, "\n; >>=== continued right ===>>\n"); 
X		return;
X	}
X	tab (lmar, chan); 
X
X	if (! ISlist (expr) ) {
X		printaux (PRINT, expr, chan, 2); 
X
X		return;
X	}
X	bufprint(PRINT, chan, (flag == LISTOBJ ? "(" : "{")); 
X	if (printlen(expr, chan, rmar) < ppgap) 
X
X		do { 
X			pp (expr->CELLcar, chan, chan->len, rmar); 
X
X			if ((expr = expr->CELLcdr) != NIL) 
X				if (expr->flag != flag) { 
X					bufprint(PRINT,chan," . "); /* dotted pair */
X					pp(expr, chan, chan->len, rmar); 
X					break;
X				} 
X				else 
X
X					bufprint(PRINT, chan, " ") ;
X
X		} while (expr != NIL); 
X	else { 
X
X		if (! ISlist(expr->CELLcar) && ISlist(expr->CELLcdr->CELLcdr)) {;
X
X			pp(expr->CELLcar, chan, chan->len, rmar); 
X			bufprint(PRINT, chan, " ") ;
X			expr =  expr->CELLcdr;
X		}
X
X		/* 65 
X			 43 Kernel Ilo funcaons
X			 */
X
X		lmarl =  chan->len; /* freeze left margin */
X
X		do { 
X			pp (expr->CELLcar, chan, lmarl, 
X					(expr->CELLcdr == NIL ? rmar + 1: rmar) ); 
X
X			if ( (expr =  expr->CELLcdr) != NIL) {
X				if (expr->flag != flag) {
X					bufprint (PRINT, chan," . "); /* dotted pair */
X					pp(expr, chan, lmarl, rmar); 
X					break;
X				}
X				else 
X					bufprint (PRINT, chan, " ");
X			} 
X		} while (expr != NIL);
X	}
X	bufprint (PRINT, chan, (flag = LISTOBJ ? ") ": "}") ); 
X
} /* pp */
X
printlen (expr, chan, rmar) /* length of expr */
X	kerncell expr; 
X	iochan chan; 
X	int rmar;
{
X
X	int len;
X	ppgap = ppcols - chan->len; 
X
X	len = printaux (LENGTH, expr, chan, ppgap); 
X
X	return(rmar + (len > ppgap ? ppgap: len) ); 
} /* printlen */
X
SHAR_EOF
  (set 20 13 11 03 15 05 17 'apli/io.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/io.c'
if test $? -ne 0
then ${echo} "restore of apli/io.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/io.c': 'MD5 check failed'
       ) << \SHAR_EOF
d6941965b62ff3231038aef1b11a066b  apli/io.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/io.c'` -ne 21913 && \
  ${echo} "restoration warning:  size of 'apli/io.c' is not 21913"
  fi
fi
# ============= apli/kernel.h ==============
if test -n "${keep_file}" && test -f 'apli/kernel.h'
then
${echo} "x - SKIPPING apli/kernel.h (file already exists)"

else
${echo} "x - extracting apli/kernel.h (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/kernel.h' &&
/* p160 */
// Appendix A
// Global Definitions
X
//#define DEBUG
/* debugging macros */
#ifdef DEBUG
# define DBG(s) printf("%s\n", (s));
#else
# define DBG(s) ;
#endif DEBUG
X
/* kernel.h */ 
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
X
X
#define UNIX YES
/* scalar constants: */
X
#define HASHTABSIZE 	256 		/* size of hash table */ 
#define CELLTABSIZE 	1024 		/* Size of cell table */
#define BLOCKSIZE   	512 		/* block size for cell allocation */
#define EVALSTKSIZE 	1024 		/* size of evaluation stack */
#define VARSTKSIZE  	1024 		/* size of variable stack */ 
#define ARGSTKSIZE  	1024 		/* size of argument stack */
#define CATSTKSIZE  	256 		/* size of catch stack */
#define CHANBUFSIZE 	126 		/* size of channel buffer */
#define STRBUFSIZE  	126 		/* size of string buffer */
#define MAXCOLS 			80 			/* max no. of columns on the screen */
#define SMALLINTLOW  	-128 		/* least small integer */
#define SMALLINTHIGH 	127 		/* greatest small integer */ 
X
/* values for flag in symbol structure: */
#define UNBOUND  0  /* unbound symbol */ 
#define CONSTANT 1  /* constant - cannot be changed */
#define VARIABLE 2  /* bound variable */
#define FUNCTION 3  /* non-binary function */
#define LBINARY  4  /* binary lam */
#define VBINARY  5  /* binary vlam */
#define UBINARY  6  /* binary ulam */
#define MBINARY  7  /* binary mlam */
#define INTERNAL 8  /* internal object - not in symbol table */
X
/* values for flag in cell structure: */
#define VOID 			10 /* void dbject */
#define INTOBJ 		11 /* integer number */
#define REALOBJ 	12 /* real number */
#define STROBJ 		13 /* string */
#define CHANOBJ 	14 /* channel for I/O */
#define VECTOROBJ 15 /* vector */
X
/* p.161 */
X
#define LISTOBJ 16  /* list */
#define SETOBJ 	17  /* set */
#define MARK 		128 /* mark bit - for garbage collection */
#define MASK7 	127 /* for masking bit 7 in flag */
X
/* channel kinds: */
#define INCHAN 		0 /* input channel flag */
#define OUTCHAN 	1 /* output channel flag */
#define INOUTCHAN 2 /* input-Output channel flag */
X
/* values for flag in printaux and bufprint: */
#define PRINT 	0 /* flag === PRINT ===> prim; */
#define PRINC 	1 /* flag == PRINC ==> princ */
#define LENGTH 	2 /* flag == LENGTH ==> prlen */
#define STRIP  	3 /* |symbol => symbol */
X
typedef unsigned char byte; 		/* the basic byte unit */
typedef union	{int i,*j;} word; /* the basic word.unit */
typedef float real; 						/* real type - can be changed.to double */
X
struct symbol { 				/* symbol structure */
X  byte flag; 	  				/* symbol type, always < VOID */
X  struct cell *bind; 		/* symbol handing */
X  struct cell *prop; 	 	/* symbol property list */
X  char *name; 			 	 	/* symbol name */
X  struct symbol *link; 	/* link to next symbol */
}; 
X
struct cell { /* cons-cell structure */
X  byte flag; 	/* cell type, always >= VOID */
X  union {
X    int inum; 						/* integer number */
X    real rnum; 						/* real number */
X    char *str; 						/* string */ 
X    struct channel *chan; /* channel */
X    struct { 							/* for list/set construction */
X      struct cell *car; 	/* car pointer */
X      struct cell *cdr; 	/* cdr pointer */
X    } pair;
X    struct { 							/* for vector construction */
X      struct cell *dim; 	/* vector dinension */
X      struct cell **vec; 	/* vector block */
X    } vect;
X  } part; 
};
X
struct channel { 					/* I/O channel structure */
X  char ch; 								/* current character */
X  unsigned short int tok; /* current token */
X  unsigned short int pos; /* current position in buf */ 
X  unsigned short int len; /* no. of chars in buf */
X  char *buf; 							/* channel buffer */
X  byte mode; 							/* one of INCHAN,OUTCHAN,INOUTCHAN */
X
X  /* p162 */
X  FILE *file; 						/* the file associated with channel */ 
};
X
struct variable { 		/* variable structure for variable stack */
X  struct symbol *sym; /* variable symbo1 */ 
X  byte flag; 					/* its flag */ 
X  struct cell *bind; 	/* its binding */
};
X
typedef struct symbol *kernsym; /* symbol pointer */ 
typedef struct cell *kerncell; 	/* cell pointer */ 
typedef struct channel *iochan; /* I/O channel */
X
/* macros */ 
X
#define ISnotbinary(p)	((p)->flag < LBINARY)
#define ISunbound(p) 		((p)->flag  == UNBOUND)
#define ISconst(p) 			((p)->flag  == CONSTANT)
#define ISvar(p) 				((p)->flag  == VARIABLE)
#define ISfun(p) 				((p)->flag  == FUNCTION)
#define ISlbin(p)				 ((p)->flag  == LBINARY)
#define ISvbin(p)				 ((p)->flag  == VBINARY)
#define ISubin(p)				 ((p)->flag  == UBINARY)
#define ISmbin(p)				 ((p)->flag  == MBINARY)
#define ISinternal(p)		 ((p)->flag  == INTERNAL)
X
#define	ISsym(p)		 ((p)->flag < VOID) 
#define	IScell(p)		 ((p)->flag >= VOID) 
#define	ISvoid(p)		 ((p)->flag == VOID) 
#define	ISint(p)		 ((p)->flag == INTOBJ) 
#define	ISreal(p)		 ((p)->flag == REALOBJ) 
#define	ISstr(p)		 ((p)->flag == STROBJ) 
#define	ISchan(p)		 ((p)->flag == CHANOBJ) 
#define	ISvector(p)	 ((p)->flag == VECTOROBJ) 
#define	ISlist(p)		 ((p)->flag >= LISTOBJ) 
#define	ISset(p)		 ((p)->flag == SETOBJ) 
#define	ISmarked(p)	 (((p)->flag & MARK) == MARK)
X
#define CELLinum 	part.inum
#define CELLrnum 	part.rnum
#define CELLstr 	part.str 
#define CELLchan 	part.chan
#define CELLcar 	part.pair.car
#define CELLcdr	 part.pair.cdr
#define CELLdim	 part.vect.dim  
#define CELLvec	 part.vect.vec
X
#define CONVbyte(p) ((byte) (p)) 
#define CONVint(p) 	((int) (p)) 
#define CONVintp(p) ((int *) (p)) 
#define CONVreal(p) ((real) (p)) 
#define CONVstr(p)	((char *) (p)) 
#define CONVchan(p) ((iochan) (p))
X
X
X
/* 163  Global Definitions */
X
#define CONVsym(p) 			((kernsym) (p) ) 
#define CONVcell(p) 		((kerncell) (p) ) 
#define CONVvector(p) 	((kerncell *) (p) ) 
#define NIL ((kerncell) nil) 
#define TTT ((kerncell) ttt)
X
#define READin() 						readaux(_inchan, 0) 
#define READchan(chan)	 		readaux((chan)->KELLchan,0) 
#define PRINTout(p) 				printaux(PRINT, (p), _outchan) 
#define PRINTchan(p, chan)	 printaux(PRINT, (p), (chan)->CELLchan) 
#define TERPRIout() 				bufprint(PRINT, _outchan, "\n", 0) 
#define TERPRIchan(chan)		 bufprint(PRINT, (chan)->CELLchan, "\n", 0) 
#define INTERNALsym(isym) \
X 	(isym = CONVsym(new(sizeof(struct symbol))))->flag = INTERNAL
X
#define CHECKlargs(fun, n)													\
X  if (argtop - CONVint (argstk [argtop] ) != (n) )	\
X    error(fun, err_args,0) 
X
#define CHECKvargs(fun, m, n)										\
X  if (argtop - CONVint(argstk[argtop]) < (m) || \
X      argtop - CONVint(argstk[argtop]) > (n) )	\
X    error(fun, err_args, 0) 
X
#define CHECKvargs1(fun, n)												\
X  if (argtop - CONVint(argstk [argtop] ) < (n) )	\
X    error(fun, err_args, 0) 
X
#define CHECKvargs2(fun, n)												\
X  if (argtop - CONVint(argstk [argtop] ) > (n) )	\
X    error(fun, err_args, 0) 
X
X
#define	EVALpush(obj)															\
X  (++evaltop < celltop ? evalstk[evaltop] = (obj)	\
X   : CONVcell(faterr(err_evalstk)))
X
#define	EVALpop() --evaltop 
X
#define	CELLpush(obj)															\
X  (--celltop > evaltop ? evalstk[celltop] = (obj)	\
X   : CONVcell (faterr (err_evalstk))) 
X
#define	CELLpop() ++celltop 
X
#define VARpush(s, f,b)						\
X  if (++vartop < VARSTKSIZE){			\
X    varstk[vartop].sym = (s);			\
X      varstk[vartop].flag = (f);	\
X    varstk [vartop].bind = (b);		\
X  } else faterr(err_varstk); 
X
#define VARpop()																			\
X  { varstk[vartop].sym->flag = varstk[vartop].flag;		\
X    varstk[vartop].sym->bind = varstk [vartop--].bind; }
X
#define ARGpush(obj)																		\
X  if (++argtop < EVALSTKSIZE) argstk [argtop] = (obj);	\
X  else faterr(err_argstk);
X
#define ARGpop() --argtop 
X
#define ARGSpop()		argtop=CONVint(argstk[argtop])-1
X
#define ARGidx1 CONVint(argstk[argtop]) 
#define ARGnum1	argstk[ARGidx1]
X
/* 164 Appendix */
X
#define ARGnum2 argstk [ARGidx1 + 1] 
#define ARGnum3 argstk [ARGidx1 + 2] 
#define ARGnum4 argstk [ARGidx1 + 3]
X
#define GETint(yyy, xxx)						\
X  (ISint(xxx) ? xxx->CELLinum: CONVint(error(yyy, err_int, xxx))) 
X
#define  GETreal(yyy, xxx)					\
X  (ISreal(xxx) ? (xxx)->CELLrnum: CONVint(error(yyy, err_real, xxx))) 
X
#define GETnum(yyy, xxx)						\
X  (ISint(xxx) ? (xxx)->CELLinum			\
X   :(ISreal(xxx) ? (xxx)->CELLrnum	\
X     : CONVint(error((yyy), err_num, (xxx))))) 
X
#define  GETstr(yyy, xxx)							\
X	(ISstr(xxx) ? xxx->CELLstr					\
X	 :(ISsym(xxx) ? CONVsym(xxx)->name	\
X		 : CONVstr(error((yyy),err_str,(xxx)))))
X
#define  GETchan(yyy, xxx)						\
X	(ISchan(xxx) ? (xxx)->CELLchan : CONVchan(error((yyy),err_chan1,xxx)))
X
#define  CHECKsym1(yyy, xxx)					\
X	if (xxx->flag > VOID) error (yyy, err_sym1, xxx) 
X
#define CHECKsym2(yyy, xxx)												\
X	if (xxx->flag >= VOID || xxx->flag == CONSTANT)	\
error (yyy, err_sym2, xxx) 
X
#define CHECKpair(yyy, xxx)						\
X	if (xxx->flag < LISTOBJ) error(yyy, err_pair, xxx) 
X
#define	CHECKlist(yyy, xxx)						\
X	if (xxx->flag < LISTOBJ && xxx != NIL) error(yyy,err_list,xxx)
X
/* ---- external declarations ------ */
X
extern char 
*err_args, *err_pars,
X	*err_evalstk, *err_varstk, *err_argstk, *err_catstk, 
X	*err_memory, *err_list, 
X	*err_int, *err_real, *err_num, *err_str, *err_chan1, *err_chan2,
X	*err_sym1, *err_sym2, *err_pair, *err_list, *err_var, *err_dom;
X
extern kerncell catres; 
extern kerncell golabel; 
extern kerncell _tempstr; 
extern kerncell inchan, outchan, errchan; 
extern iochan _inchan, _outchan, _errchan; 
extern char strbuf []; 
extern struct variable varstk []; 
extern kerncell evalstk[], argstk[]; 
extern int evaltop, celltop, vartop, argtop, _argtop; 
extern kerncell read_and_eval, top_lev_call, top_lev_tags; 
extern int (* org_interrupt) (); /* original interrupt handler */
X
X
/* internals: */ 
extern kernsym _bquotesym, _commasym, _atsym, 
X			 _toptagsym, _errtagsym, _rettagsym, _gotagsym, 
X			 _tempsym, _cxxrsym;
X
X
/* 165 Global Definitions */
X
/* constants: */ 
extern kernsym nil, ttt, eofsym, inchansym, outchansym, errchansym;
X
/* unbounds: */ 
extern kernsym lamsym,vlamsym, ulamsym, mlamsym;
X
/* symt.c: */ 
extern kernsym addsym(), findsym(), mksym(), _mksym(), newsym();
X
/* cellt.c: */ 
extern char *new() ;
extern kerncell freshcell(), oo1lectgarb(), mkinum(), mkrnum(),
X			 mkstr(), _mkstr(), mkchan(), mkcell(), mkset();
X
/* eval.c: */
extern kernsym evalsym, callsym, applysym;
X
extern kerncell Leval(), eval(), Vcall(), Lapply(), evalcall(),
X			 evallamm(), evalvlam(), eva1ulam(), evalmlam(),
X			 expand(), evalvector(), mkargslist();
X
/* io.c: */
extern kernsym opensym, closesym, flushsym, readsym, printsym, princsym,
X			 tabsym, terprisym, prlensym, iobufsym, chanpsym, ppsym;
X
extern kerncell readaux() , readaux1() , transform() ,
X			 Lopen(), openaux(), Lclose(), Vflush(), Vread(), Vprint(),
X			 Vprinc(), Vtab(), Vterpri(), Vprlen(), Viobuf(), Lchanp(),
X			 Vpp();
X
/* arith.c: */
X
extern kernsym plussym, minussym, timessym, divsym, sumsym, prodsym, remsym,
X			 powsym, incsym, decsym, abssym, negsym, intsym, realsym,
X			 a_ltsym, a_gtsym, a_lesym, a_gesym, a_eqsym, a_nesym,
X			 numberpsym, intpsym, realpsym;
X
extern kerncell Lplus(), Lminus(), Ltimes(), Ldiv(), Vsum(), Vprod(),
X			 Lrem(), Lpow(), Linc(), Ldec(),
X			 Labs(), Lneg(), Lint(), Lreal(),
X			 La_lt(), La_gt(), La_le(), La_ge(), La_eq(), La_ne(),
X			 Lnumberp(), Lintp(), Lrealp(), Lposp(), Lnegp();
X
/* str.c: */
extern kernsym s_ltsym, s_gtsym, s_eqsym, strcmpsym, nthcharsym, substrsym,
X			 strlensym, strconcsym, nilstrpsym, stringpsym;
X
extern kerncell Ls_lt(), Ls_gt(), Ls_eq(),
X			 Lstrcmp(), Lnthchar(), Lsubstr(), Lstrlen(),
X			 Lstrconc(), Lnilstrp(), Lstringp();
X
/* sym.c: */
extern kernsym symnamesym, synonymsym, gensymsym, concatsym, bindingsym,
X			 symbolpsym, boundpsym;
X
extern kerncell Lsymname(), Usynonym(), Lgensym(), Vconcat(), Lbinding(),
X			 Lsymbolp (), Lboundp();
X
/* 1ist.c: */
extern kernsym carsym, cdrsym, nthelemsym, nthpairsym, rplacasym,
X			 rplacdsym, lastelemsym, lastpairsym, conssym, listsym,
X			 lengthsym, concsym, dconcsym, removesym, dremovesym,  
X			 substsym, dsubstsym, reversesym, dreversesym, membersym, 
X			 memqsym, equalsym, nequalsym, eqsym, neqsym, atompsym,
X			 listpsym, pairpsym, nullpsym;
X
extern kerncell Lcar(),  Lcdr(), Lcxxr(), Lnthelem(), Lnthpair(),
X			 Lrplaca(), Lrplacd(), Llastelem(), Llastpair(), lastpair(),
X
X			 /* p.166 Appendix A */
X
X			 Lcons(), Vlist(), Llength(), Vconc(), Vdconc(),  copytop(),
X			 Lremove(), Ldremove(), Lsubst(), subst(), Ldsubst(), dsubst(),
X			 Lreverse(), Ldreverse(), dreverse(), 
X			 Lmember(), Lmemq(), Lequal(), Lnequal(), Leq(), Lneq(), 
X			 Latomp(), Llistp(), Lpairp(),  Lnullp();
X
/* set.c: */ 
extern kernsym	convsetsym, dconvsetsym, convlistsym, dconvlistsym, 
X			 esetsym, isetsym, unionsym, intsecsym, diffsym, subsetsym;
X
extern kerncell Lconvset(),  Ldconvset() , Lconvlist() , Ldconvlist(),
X			 Veset(), Uiset(), iset(), unionaux(), remreP(),
X			 Vunion(), Vintsec(), Ldiff(), Lsubset();
X
/* 1ogic.c: */ 
extern kernsym 	notsym, andsym, orsym, condsym, implysym, equivsym,
X			 allsym, existsym, onesym;
X
extern kerncell	Lnot(), Uand(), Uor(), Ucond(), Limply(), Lequiv(),
X			 Uall(), all(), Uexist(), exist(), Uone();
X
/* prop.c: */ 
extern kernsym 	putpropsym, rempropsym, getsym, plistsym, setplistsym,
X			 assocsym, assqsym;
X
extern kerncell	Lputprop(), Lremprop(), Lget() , Lplist() , Lsetplist() ,
X			 Lassoc(), Lassq();
X
/* vec.c: */
extern kernsym vectorsym, storesym, dimensionsym, vectorpsym;
X
extern kerncell Lvector(), Ustore(), Ldimension(), Lvectorp();
X
/* flow.c: */
extern kernsym  catchsym, throwsym, caperrsym, errorsym, toplevelsym,
X			 resetsym, exitsym;
X
extern kerncell catch(), throw(), caperr(), 
X			 Ucatch(), Vthrow(), Ucaperr(), Verror(), Ltoplevel(),
X			 Lreset(), Vexit();
X
/* iter.c: */
extern kernsym progsym, gosym, returnsym, dosym; 
X
extern kerncell Uprog(), prog(), progaux(), Ugo(), Vreturn(), Udo();
X
/* map.c: */
extern kernsym mapcarsym, mapasym, mapcdrsym, mapdsym;
X
extern kerncell Vmapcar(), Vmapa(), Vmapcdr(), Vmapd();
X
/* misc.c: */
extern kernsym voidsym, quotesym, kwotesym, defsym, funsym, argsym, letsym,
X			 setsym, setqsym, constsym, sssym, loadsym, shellsym;
X
extern kerncell Uvoid(), Uquote(), Lkwote(), Udef(), Mfun(), Larg(), Mlet(),
X			 Lset(), Usetq(), Uconst(), Vss(), Vload(), Ushell ();
SHAR_EOF
  (set 20 13 11 03 15 03 27 'apli/kernel.h'
   eval "${shar_touch}") && \
  chmod 0644 'apli/kernel.h'
if test $? -ne 0
then ${echo} "restore of apli/kernel.h failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/kernel.h': 'MD5 check failed'
       ) << \SHAR_EOF
9341213eea72e875b95562499a78b644  apli/kernel.h
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/kernel.h'` -ne 14093 && \
  ${echo} "restoration warning:  size of 'apli/kernel.h' is not 14093"
  fi
fi
# ============= apli/init.c ==============
if test -n "${keep_file}" && test -f 'apli/init.c'
then
${echo} "x - SKIPPING apli/init.c (file already exists)"

else
${echo} "x - extracting apli/init.c (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/init.c' &&
/* 143
init.c
*/
X
#include "kernel.h"
X
#ifdef UNIX 
#include <signal.h> 
void _interrupt() 
{
X	error(0, "interrupted - to exit type (exit)", 0); 
} /* interrupt */ 
#endif UNIX
X
initialize ()
{
X	initcelltab(); 
X	initsymtab(); 
X	initio(); 
X
X	catres = mkcell(nil, nil); /* catch result pair */
X
X	/* internals: */ 
X
X	_bquotesym = CONVsym(&_bquotesym); 
X	_commasym	 = CONVsym(&_commasym); 
X	_atsym		 = CONVsym(&_atsym); 
X
X	INTERNALsym(_toptagsym); _toptagsym->bind	 = CONVcell (_toptagsym); 
X	INTERNALsym(_errtagsym); _errtagsym->bind	 = CONVcell (_errtagsym); 
X	INTERNALsym(_rettagsym); _rettagsym->bind	 = CONVcell (_rettagsym); 
X	INTERNALsym(_gotagsym);	 _gotagsym->bind	 = CONVcell (_gotagsym); 
X	INTERNALsym(_tempsym);	 _tempsym->bind		 = CONVcell (_tempsym); 
X	INTERNALsym(_cxxrsym);	 _cxxrsym->name		 = "c..r";
X
X	_tempstr = mkstr(""); 
X
X	/* constants: */ 
X	nil			= newsym("nil", CONSTANT,0); nil->bind = nil->prop = NIL;
X	ttt			= newsym("t", CONSTANT,0);	 ttt->bind = TTT; 
X	eofsym  = newsym("eof", CONSTANT,0); eofsym->bind = CONVcell (eofsym); 
X
X	inchansym 	= newsym("inchan", CONSTANT, inchan); 
X	outchansym  = newsym("outchan", CONSTANT, outchan); 
X	errchansym  = newsym("errchan", CONSTANT, errchan); 
X	/* unbounds: */
X
X	/* 144
X		 initialization, Integration and Compilation
X		 */
X
X	lamsym  = newsym("lam", 	UNBOUND, nil); 
X	vlamsym = newsym("vlam" , UNBOUND, nil); 
X	ulamsym = newsym("ulam" , UNBOUND, nil) ; 
X	mlamsym = newsym("mlam",  UNBOUND, nil); 
X
X	/* eval.c: */ 
X	evalsym  = newsym("eval",	 LBINARY, Leval); 
X	callsym  = newsym("call",	 VBINARY, Vcall); 
X	applysym = newsym("apply", LBINARY, Lapply); 
X
X	/* io.c: */ 
X	opensym  = newsym("open",	 LBINARY, Lopen); 
X	closesym = newsym("close", LBINARY, Lclose); 
X	flushsym = newsym("flush", VBINARY, Vflush); 
X	readsym  = newsym("read",	 VBINARY, Vread); 
X	printsym = newsym("print", VBINARY, Vprint); 
X	princsym = newsym("princ", VBINARY, Vprinc); 
X	tabsym 	 = newsym("tab",	 VBINARY, Vtab); 
X	terprisym = newsym("terpri", VBINARY, Vterpri); 
X	prlensym = newsym("prlen", VBINARY, Vprlen); 
X	iobufsym = newsym("iobuf", VBINARY, Viobuf); 
X	chanpsym = newsym("chan?", LBINARY, Lchanp); 
X	ppsym		 = newsym("pp",		 VBINARY, Vpp); 
X
X	/* arith.c: */ 
X	plussym 	= newsym("+", 	LBINARY,Lplus); 
X	minussym 	= newsym("-", 	LBINARY,Lminus); 
X	timessym 	= newsym("*", 	LBINARY, Ltimes); 
X	divsym 		= newsym("/",		LBINARY, Ldiv); 
X	sumsym 		= newsym("sum", VBINARY,Vsum); 
X	prodsym 	= newsym("prod",VBINARY, Vprod); 
X	remsym 		= newsym("%",		 LBINARY, Lrem); 
X	powsym 		= newsym("^",		 LBINARY, Lpow); 
X	incsym 		= newsym("++",	 LBINARY, Linc); 
X	decsym 		= newsym("--", 		LBINARY, Ldec); 
X	abssym 		= newsym("abs",	 LBINARY, Labs); 
X	negsym 		= newsym("neg",	 LBINARY, Lneg); 
X	intsym 		= newsym("int",	 LBINARY, Lint); 
X	realsym   = newsym("real", LBINARY, Lreal); 
X	a_ltsym 	= newsym("<",		 LBINARY,La_lt); 
X	a_gtsym	  = newsym(">",		 LBINARY,La_gt); 
X	a_lesym	  = newsym("<=",	 LBINARY,La_le); 
X	a_lesym	  = newsym("> ",	 LBINARY,La_ge); 
X	a_eqsym	  = newsym("=",		 LBINARY, La_eq); 
X	a_nesym	  = newsym("/=",	 LBINARY, La_ne); 
X	numberpsym = newsym("number?", LBINARY, Lnumberp); 
X	intpsym 	= newsym("int?", LBINARY,Lintp); 
X	realpsym 	= newsym("real?", LBINARY, Lrealp); 
X
X	/* str.c: */ 
X	s_ltsym		 = newsym("<<", 		LBINARY,  Ls_lt); 
X	s_gtsym		 = newsym(">>", 		LBINARY,  Ls_gt); 
X	s_eqsym		 = newsym("==", 		LBINARY,  Ls_eq); 
X	strcmpsym  = newsym("strcmp", LBINARY,  Lstrcmp); 
X	nthcharsym = newsym("nthchar", LBINARY, Lnthchar); 
X	substrsym  = newsym("substr", LBINARY,  Lstrlen); 
X	strlensym  = newsym("strlen", LBINARY,  Lstrlen); 
X	strconcsym = newsym("strconc", LBINARY, Lstrconc); 
X	nilstrpsym = newsym("nilstrp", LBINARY, Lnilstrp); 
X	stringpsym = newsym("string?", LBINARY, Lstringp) ; 
X
X	/* sym.c: */ 
X
X	/* 145
X		 11.1 Initialization
X		 */
X
X	symnamesym = newsym("symname", LBINARY, Lsymname);
X	synonymsym = newsym("synonym", UBINARY, Usynonym); 
X	gensymsym  = newsym("gensym",	 LBINARY,	Lgensym); 
X	concatsym  = newsym("concat",	 VBINARY,	Vconcat); 
X	bindingsym = newsym("binding", LBINARY, Lbinding); 
X	symbolpsym = newsym("symbol?", LBINARY, Lsymbolp); 
X	boundpsym  = newsym("bound?",	 LBINARY, Lboundp); 
X
X	/* list.c: */ 
X	carsym 			= newsym("car", 		LBINARY,Lcar); 
X	cdrsym 			= newsym("cdr", 		LBINARY, Lcdr); 
X	nthelemsym  = newsym("nthelem", LBINARY, Lnthelem); 
X	nthpairsym  = newsym("nthpair", LBINARY, Lnthpair); 
X	rplacasym   = newsym("rplaca",	 LBINARY, Lrplaca); 
X	rplacdsym   = newsym("rplacd", 	LBINARY,Lrplacd); 
X	lastelemsym = newsym("lastelem", LBINARY, Llastelem); 
X	lastpairsym = newsym("lastpair", LBINARY, Llastpair); 
X	conssym	    = newsym("cons",		 LBINARY, Lcons); 
X	listsym		  = newsym("list",		 VBINARY,Vlist); 
X	lengthsym 	= newsym("length",	 LBINARY, Llength); 
X	concsym 		= newsym("conc",		 VBINARY,Vconc); 
X	dconcsym 		= newsym("*conc",		 VBINARY,Vdconc); 
X	removesym	  = newsym("rerreve",	 LBINARY,Lremove); 
X	dremovesym  = newsym("*rermve",	 LBINARY,Ldremove); 
X	substsym	  = newsym("subst",		 LBINARY,Lsubst); 
X	dsubstsym	  = newsym("*subst",	 LBINARY,Ldsubst); 
X	reversesym 	= newsym("reverse",	 LBINARY,Lreverse); 
X	dreversesym	= newsym("reverse",		LBINARY,Ldreverse); 
X	membersym 	= newsym("member",	 LBINARY, Lmember); 
X	memqsym 		= newsym("memq",		 LBINARY, Lmemq); 
X	equalsym 		= newsym("equal",		 LBINARY, Lequal); 
X	nequalsym 	= newsym("nequal",	 LBINARY, Lnequal); 
X	eqsym  			= newsym("eq",			 LBINARY, Leq); 
X	neqsym 	 		= newsym("neq",			 LBINARY, Lneq); 
X	atompsym  	= newsym("atom?",		 LBINARY, Latomp); 
X	listpsym 		= newsym("list?",		 LBINARY, Llistp); 
X	pairpsym	  = newsym("pair?",		 LBINARY, Lpairp); 
X	nullpsym 		= newsym("null?",		 LBINARY, Lnullp); 
X
X	/* set.c: */ 
X	convsetsym 		= newsym("convset", 	LBINARY, 	Lconvset); 
X	dconvsetsym	 	= newsym("*convset", 	LBINARY,	Ldconvset); 
X	convlistsym		= newsym("convlist", 	LBINARY,	Lconvlist); 
X	dconvlistsym	= newsym("*convlist",	LBINARY,	Ldconvlist); 
X	esetsym				= newsym("eset", 			VBINARY,	Veset); 
X	isetsym			 = newsym("iset", UBINARY,Uiset); 
X	unionsym		 = newsym("union", VBINARY,Vunion); 
X	intsecsym		 = newsym("intsec", VBINARY,Vintsec); 
X	diffsym 		= newsym("diff", LBINARY,Ldiff); 
X	subsetsym		 = newsym("subset", LBINARY, Lsubset); 
X
X	/* logic.c: */ 
X	notsym = newsym("not", LBINARY,Lnot); 
X	andsym = newsym("and", UBINARY,Uand); 
X	orsym = newsym("or", UBINARY,Uor); 
X	condsym = newsym("cond", UBINARY,Ucond); 
X	implysym = newsym("imply", UBINARY,Limply); 
X	equivsym = newsym("equiv", UBINARY,Lequiv); 
X	allsym = newsym("all", UBINARY,Uall); 
X	existsym = newsym("exist", UBINARY,Uexist);
X
X
X	/* 146
X		 Initialization, Integration and Compilation
X		 */
X	onesym = newsym("one", UBINARY, Uone);
X
X	/* prop.c */ 
X	putpropsym = newsym("putprop", LBINARY, Lputprop); 
X	rempropsym = newsym("remprop", LBINARY, Lremprop); 
X	getsym = newsym("get", LBINARY, Lget); 
X	plistsym = newsym("plist", LBINARY, Lplist); 
X	setplistsym = newsym("setplist", LBINARY, Lsetplist); 
X	assocsym = newsym("assoc", LBINARY, Lassoc); 
X	assqsym = newsym("assq", LBINARY,Lassq); 
X
X	/* vec.c: */ 
X	vectorsym = newsym("vector", LBINARY, Lvector); 
X	storesym = newsym("store", UBINARY,Ustore); 
X	dimensionsym = newsym("dimension",LBINARY,Ldimension); 
X	vectorpsym = newsym("vector?", LBINARY,Lvectorp); 
X
X	/* flow.c: */ 
X	catchsym = newsym("catch", UBINARY,Ucatch); 
X	throwsym = newsym("thrower", VBINARY,Vthrow); 
X	caperrsym = newsym("caperr", UBINARY, Ucaperr); 
X	errorsym = newsym("error", VBINARY, Verror); 
X	toplevelsym= newsym("toplevel", LBINARY, Ltoplevel); 
X	resetsym = newsym("reset", LBINARY, Lreset); 
X	exitsym = newsym("exit", VBINARY,Vexit); 
X
X	/* iter.c: */ 
X	progsym = newsym("prog", UBINARY, Uprog); 
X	gosym = newsym("go", UBINARY, Ugo); 
X	returnsym = newsym("return", VBINARY,Vreturn); 
X	dosym = newsym("do", UBINARY, Udo); 
X
X	/* map.c: */ 
X	mapcarsym = newsym("mapcar", VBINARY,Vmapcar); 
X	mapasym = newsym("mapa", VBINARY,Vmapa); 
X	mapcdrsym = newsym("mapcdr", VBINARY,Vmapcdr); 
X	mapdsym = newsym("mapd", VBINARY, Vmapd); 
X
X	/* misc c */ 
X	voidsym = newsym("void", UBINARY,Uvoid); 
X	quotesym = newsym("quote", UBINARY, Uquote); 
X	kwotesym = newsym("kwote", LBINARY, Lkwote); 
X	defsym = newsym("def", UBINARY, Udef ); 
X	funsym = newsym("fun", MBINARY, Mfun ); 
X	argsym = newsym("arg", LBINARY, Larg); 
X	letsym = newsym("let", MBINARY,Mlet); 
X	setsym = newsym("set", LBINARY, Lset); 
X	setqsym = newsym("setq", UBINARY, Usetq); 
X	constsym = newsym("const", UBINARY, Uconst); 
X	sssym = newsym("ss", VBINARY, Vss); 
X	loadsym = newsym("load", VBINARY,Vload); 
X
#ifdef UNIX
X	shellsym = newsym("!", UBINARY, Ushell); 
#endif UNIX 
X
X	/* globals: */ 
X
X	read_and_eval = mkcell(evalsym,mkcell(mkcell(readsym, nil), nil)); 
X	top_lev_call  = mkcell(toplevelsym, nil); 
X	top_lev_tags  = mkcell(_toptagsym, mkcell(_errtagsym, nil)); 
X
#ifdef UNIX
X	org_interrupt = signal(SIGINT, SIG_IGN); 
X	signal(SIGINT, _interrupt);
#endif UNIX 
X
} /* initialize */
/*
#ifdef UNIX 
#include <signal.h> 
_interrupt() 
{
X	error(0, "interrupted - to exit type (exit)", 0); 
} 
#endif UNIX
*/
SHAR_EOF
  (set 20 13 11 03 15 01 36 'apli/init.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/init.c'
if test $? -ne 0
then ${echo} "restore of apli/init.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/init.c': 'MD5 check failed'
       ) << \SHAR_EOF
171b5586ffaa122bae45a0a930cff2c6  apli/init.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/init.c'` -ne 9026 && \
  ${echo} "restoration warning:  size of 'apli/init.c' is not 9026"
  fi
fi
# ============= apli/sym.c ==============
if test -n "${keep_file}" && test -f 'apli/sym.c'
then
${echo} "x - SKIPPING apli/sym.c (file already exists)"

else
${echo} "x - extracting apli/sym.c (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/sym.c' &&
/* 79 5.9 Symbol functions */
/* sym.c */
X
#include "kernel.h"
X
X	kerncell 
Lsymname () /* (symnane 'syn) */
{
X	kerncell arg = ARGnum1;
X
X	CHECKlargs (symnamesym, 1); 
X
X	CHECKsym1 (symnamesym, arg); 
X
X	return (mkstr (CONVsym(arg) ->name) ); 
} /* Lsymnane */
X
X	kerncell 
Usynonym () /* (synonym sym1 sym2) */
{
X	kerncell list = argstk[argtop]; 
X	kernsym sym1, sym2;
X
X		if (list->CELLcdr == NIL ||  list->CELLcdr->CELLcdr != NIL) 
X			error (synonymsym, err_args, 0); 
X
X	sym1 = CONVsym(list->CELLcar); 
X	sym2 = CONVsym(list->CELLcdr->CELLcar); 
X
X	CHECKsym2 (symnamesym, sym1); 
X	CHECKsym1 (symnamesym, sym2); 
X
X	sym1->flag = sym2->flag; 
X	sym1->bind = sym2->bind; 
X	sym1->prop = sym2->prop; 
X
X	return (CONVcell (sym1) ); 
X
} /* Usynonym */
X
X	kerncell 
Lgensym () /* (gensym) */
{
X	static int num = 0;
X
X	CHECKlargs (gensymsym, 0); 
X
X	sprintf (strbuf, "g%04d", num++); 
X
X		return (CONVcell (mksym(strbuf ) ) ); 
} /* Lgensym */
X
/* Arithmetic, Strings and Symbols p.80 */
X	kerncell 
Vconcat () /* (concat 'strl ... 'strn) */
{
X
X	kerncell arg; 
X	register int idx = ARGidx1; 
X
X	int len= 0; 
X
X	char *str; 
X	char *buf = strbuf;
X
X	CHECKvargs1 (concatsym, 1); 
X
X	while (idx < argtop) {
X
X		arg = argstk [idx++] ; 
X		str = GETstr (concatsym, arg); 
X
X		if ((len += strlen(str) ) > STRBUFSIZE) 
X			error (concatsym, "string buffer overflow", 0); 
X
X		sprintf (buf, "%s", str); 
X		buf =	strbuf + len;
X	}
X	return (CONVcell(mksym(strbuf) ) ); 
} /* Vconcat */
X
X	kerncell 
Lbinding () /* (binding 'expr) */
{
X
X	kerncell arg = ARGnum1;
X
X	CHECKlargs (bindingsym, 1);
X
X
X	/* 81 5.3 Symbol functions */
X
X	switch (arg->flag) { 
X
X		case CONSTANT: 
X		case VARIABLE: 
X		case FUNCTION: 
X			return (CONVsym(arg)->bind); 
X
X		case LBINARY: 
X			sprintf (strbuf, "lam#%1d",CONVsym(arg)->bind); 
X			return (mkstr (strbuf ) ); 
X
X		case VBINARY: 
X			sprintf (strbuf, "vlam#%1d",CONVsym(arg)->bind); 
X			return (mkstr (strbuf ) ); 
X
X		case UBINARY: 
X			sprintf (strbuf, "ulam#%1d", CONVsym(arg)->bind); 
X			return (mkstr (strbuf ) ); 
X
X		case MBINARY: 
X			sprintf (strbuf, "mlam#%1d",CONVsym(arg)->bind); 
X			return (mkstr (strbuf ) ); 
X
X		default: 
X			return (NIL);
X	}
} /* Lbinding */
X
X	kerncell 
Lsymbolp () /* (symbol? 'expr) */
{
X	kerncell arg = ARGnum1;
X
X	CHECKlargs (symbolpsym, 1); 
X	return(ISsym(arg) ? TTT: NIL); 
X
} /* Lsymbolp */
X
X	kerncell 
Lboundp () /* (bound? 'sym) */
{
X	kerncell arg = ARGnum1;
X
X	CHECKlargs (boundpsym, 1); 
X	CHECKsym1 (boundpsym, arg); 
X
X	return (ISunbound(arg) ? NIL: TTT); 
} /* Lboundp */
X
SHAR_EOF
  (set 20 13 11 03 14 41 27 'apli/sym.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/sym.c'
if test $? -ne 0
then ${echo} "restore of apli/sym.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/sym.c': 'MD5 check failed'
       ) << \SHAR_EOF
078f616725fc443f062c9f5c7ffb83fa  apli/sym.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/sym.c'` -ne 2488 && \
  ${echo} "restoration warning:  size of 'apli/sym.c' is not 2488"
  fi
fi
# ============= apli/eval.c ==============
if test -n "${keep_file}" && test -f 'apli/eval.c'
then
${echo} "x - SKIPPING apli/eval.c (file already exists)"

else
${echo} "x - extracting apli/eval.c (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/eval.c' &&
/* eval.c */
X
#include "kernel.h"
X
extern kernsym evalsym;
extern error( kerncell, char*, kerncell);
kerncell evalcall (kerncell, kerncell, int );
kerncell evallam (kerncell, kerncell, int );
X
X	kerncell 
eval (expr) /* evaluate expr */
X	kerncell expr;
{
X
X	if (ISsym(expr)) {
X
X		if ( ISconst(expr) || ISvar(expr) || ISinternal (expr) ) 
X			return (CONVsym(expr)->bind); 
X
X		error( evalsym, "unbound symbol", EVALpush(expr));
X	}
X	else if (ISlist(expr) ) 
X
X	{ int save_celltop = celltop; /* save top of cell stack */ 
X
X		kerncell save = evalcall (expr->CELLcar, EVALpush(expr), 0); 
X		EVALpop(); 
X		celltop = save_celltop;  /* restore top of cell stack */
X		return(save);
X	} 
X	else 
X		return (expr); /* any other object evaluates to itself */
} /* eval */
X
X
X
X	kerncell 
evalcall (head, list, stacked) /* evaluate a function call */
X	register kerncell head, list; 
X	int stacked; /* non-zero when args are already stacked */
{
X	kerncell fox; 
X	kerncell (* fun) (); 
X
X	int arg1;
X
start: 
X	if (ISlist(head)) { /* ((...) arg1 ... argn) */ 
X
X		if ( (fox = head->CELLcar) == CONVcell(lamsym) ) 
X			return (evallam(head, list->CELLcdr, stacked) ); 
X
X		if (fox == CONVcell(vlamsym) ) 
X			return (evalvlam(head, list->CELLcdr, stacked) ); 
X
X		if (fox == CONVcell(ulamsym) ) 
X			return (expand (head, list, stacked) ); 
X
X		if (fox ==  CONVcell(mlamsym) ) 
X			return (eval(expand (head, list, stacked) ) ); 
X
X		head = evalcall (head->CELLcar, head, 0);
X	}
X
X	if (ISsym(head) ) { /* (head arg1 ... argn) */ 
X
X		if (head == CONVcell (quotesym) ) /* < expr */ 
X			return (list->CELLcdr->CELLcar); 
X
X		switch (head->flag) { /* what, kind of symbol is head? */ 
X			case FUNCTION: 
X				head = CONVsym(head)->bind; /* function binding */
X				goto start; 
X
X			case LBINARY: 
X			case VBINARY: 
X				if (!stacked) { 
X					arg1 = argtop+1; 
X					list = list->CELLcdr; 
X					while (ISlist(list)) {
X						fox = eval(list->CELLcar); /* evaluate args */ 
X						ARGpush(fox); /* push args onto arg stack */ 
X						list = list->CELLcdr;
X					}
X					ARGpush(CONVcell(arg1) ); /* push position of 1st arg */
X				}
X				fox = ((fun = CONVsym(head)->bind) != CONVcell(Lcxxr) 
X						? (* fun) () 
X						: (* fun) (CONVsym(head)->name));
X
X				if (!stacked) 
X					ARGSpop(); 
X				return (fox); 
X
X			case UBINARY: 
X				fox = (stacked ? mkargslist () : list->CELLcdr);
X				ARGpush (fox); 
X				fun = CONVsym(head) ->bind; 
X				fox = (* fun) (); 
X				ARGpop(); 
X				return (fox); 
X
X			case MBINARY: 
X				fox = (stacked ? mkargslist () : list->CELLcdr);
X				ARGpush (fox); 
X				fun = CONVsym(head) ->bind; 
X				fox = (* fun) (); 
X				ARGpop(); 
X				return(eval(stacked 
X							? fox /* substitute the result */
X							:(ISlist(fox) 
X								? (list->CELLcar = fox->CELLcar,
X									list->CELLcdr = fox->CELLcdr, list) 
X								:(list->CELLcar =  CONVcell(voidsym), 
X									list->CELLcdr =  mkcell (fox, nil)))));
X
X		} /* switch */
X	}
X	if (ISvector(fox = head) || /* indexed vector? */ 
X			ISvar (fox) && ISvector (fox = CONVsym(fox)->bind) ) 
X
X		return (evalvector (fox, list->CELLcdr, stacked)); 
X
X	error(evalsym, "undefined function", head); 
X
} /* evalcall */
X
/* 36 */
kerncell 
X
evallam (lam, args, stacked) /* evaluate a lam application */ 
X	register kerncell lam, args; 
X	int stacked; /* non-zero when args are already stacked */
{
X	int arg1, nvars; 
X	kerncell obj, vars; 
X	register kerncell vs;
X
X	lam = lam->CELLcdr; /* drop lam head */
X
X	if ((vars = lam->CELLcar) != NIL && ! ISlist(vars) ) 
X
X		error (evalsym, err_pars,vars); 
X
X	nvars = checkvars (vars); /* check that vars are all symbols */
X
X	if (!stacked) {
X
X		arg1 = argtop + 1; 
X
X		while (ISlist (args) ) { 
X			obj = eval (args->CELLcar); /* evaluate each argument and */ 
X			ARGpush(obj); /* push it onto arg stack */
X			args = args->CELLcdr;
X		}
X
X		ARGpush (CONVcell (arg1) ); /* push position of 1st arg */
X
X	} else 
X		arg1 = ARGidx1;
X
X	CHECKlargs(lamsym, nvars); /* check number of args */
X	savevars(vars); /* save current binding of vars */ 
X	for (vs=vars; ISlist(vs); vs=vs->CELLcdr) /* bind  the vars to args */ 
X
X		CONVsym(vs->CELLcar)->bind = argstk[arg1++]; 
X	obj = NIL;
X	lam = lam->CELLcdr; 
X
X	while (ISlist(lam) ) { 
X
X		obj= eval (lam->CELLcar); /* eval each form in lam body */
X		lam = lam->CELLcdr; 
X	} 
X
X	restorevars (vars); /* restore the binding of vars */
X
X	if(! stacked) 
X		ARGSpop(); /* pop argutents */
X	return(obj); /* return the value of last form */
} /* evallam */
X
/* 37 */
X	kerncell 
evalvlam (vlam, args, stacked) /* evaluate a vlam application */ 
X	register kerncell vlam, args; 
X	int stacked; /* non-zero when args are already stacked */
{
X
X	int arg1, save_argtop = argtop; /* for nested vlam calls */
X	kerncell obj, vars;
X
X	vlam = vlam->CELLcdr; /* drop vlam head */ 
X
X	if (! ISlist(vars = vlam->CELLcar) || checkvars(vars) != 1) 
X		error (evalsym, err_pars, vars); 
X
X	if (! stacked) {
X		arg1 = argtop+1; 
X		while (ISlist (args) ) { 
X			obj = eval (args->CELLcar); /* evaluate each argument and */ 
X			ARGpush (obj); /* push it onto arg stack */
X			args = args->CELLcdr;
X		}
X
X		/* 38 */
X		ARGpush (CONVcell (arg1) ); 
X
X	} else 
X		arg1 = ARGidx1; 
X
X	_argtop = argtop; /* save argtop - for use by 'arg' function: */ 
X	savevars (vars); /* save current. binding of var */ 
X	/* var is set t,o the number of arguments: */ 
X
X	CONVsym(vars->CELLcar)->bind = mkinum(argtop - arg1);
X	obj = NIL; 
X
X	vlam = vlam->CELLcdr;
X
X	while (ISlist(vlam)) { 
X		obj = eval(vlam->CELLcar); /* eval each form in vlam body */ 
X		vlam = vlam->CELLcdr;
X	}
X	restorevars(vars); /* restore argtop */
X	_argtop  = save_argtop; /* restore the binding of var */
X
X	if (! stacked) 
X		ARGSpop (); /* pop arguments */
X
X	return (obj); /* retrunr the value of last form */ 
X
} /* evalvlam */
X
/* 39 
X	 3.2 Internal evaluation functions
X	 */
X
kerncell 
X
expand (fun, list, stacked) /* expand ulam/mlam application */
X	register kerncell fun; 
X	kerncell list; 
X	int stacked;
{
X	kerncell fox, vars; 
X
X	int ismacro = fun->CELLcar == CONVcell(mlamsym);
X
X	fun = fun->CELLcdr; /* drop ulam/mQam */ 
X
X	if ( !ISlist(vars = fun->CELLcar) || checkvars (vars) != 1) 
X		error (evalsym, err_pars , vars); 
X
X	/* the list of arguments is treated as 1 arg: */ 
X	fox = (stacked ? mkargslist (): list->CELLcdr); 
X	ARGpush (fox); 
X
X	savevars (vars); 
X
X	CONVsym(vars->CELLcar) ->bind = argstk [argtop]; 
X
X	fox = NIL; 
X
X	fun = fun->CELLcdr; 
X
X	while (ISlist (fun) ) { /* evaluate body */ 
X
X		fox = eval (fun->CELLcar); 
X
X		fun = fun->CELLcdr;
X	}
X
X	restorevars (vars); 
X	ARGpop(); 
X
X	return(ismacro && !stacked 
X			? (ISlist (fox) /* substitute the result */
X				? (list->CELLcar = fox->CELLcar, 
X					list->CELLcdr = fox->CELLcdr, list) 
X				: (list->CELLcar = CONVcell (voidsym), 
X					list->CELLcdr = mkcell(fox,nil), list))
X			: fox);
X
} /* expand */
X
X	kerncell 
evalvector (head, tail, stacked) /* vector application */
X	kerncell head, tail; 
X	int stacked; /* non-zero when args are already stacked */
X
{
X	kerncell index;
X
X	if (stacked ? (argtop - ARGidx1 != 1 || !ISint(index = ARGnum1)) 
X			:(tail == NIL ) || tail->CELLcdr != nil 
X			|| !ISint (index = eval (tail->CELLcar))) 
X
X		error (evalsym, "bad vector index", index); 
X
X	if (index->CELLinum < 0 || 
X			index->CELLinum >= head->CELLdim->CELLinum)
X		error (evalsym, "vector index out of range", index); 
X
X	if (stacked) 
X		ARGSpop(); 
X
X	return (* (head->CELLvec + index->CELLinum) ); 
} /* mralvector */
X
/* 40 */
checkvars (vars) /* check that elements of vars are all symbols */ 
X	register kerncell vars; /* returns the length of the vars list */
{
X	int count = 0;
X
X	while (ISlist (vars) ) {
X		++count; 
X
X		if (!ISsym(vars->CELLcar) ||  ISconst(vars->CELLcar)) 
X
X			error (evalsym, err_pars, vars->CELLcar ); 
X
X		vars = vars->CELLcdr;
X	}
X	return (count); 
} /* checkvars */
X
savevars (vars) /* save the bindings of vars in varstk */
X	register kerncell vars; 
{
X
X	register kernsym var;
X
X	while (ISlist (vars) ) {
X
X		var = CONVsym(vars->CELLcar); 
X
X		/* NOTE: property lists are not stacked: */ 
X
X		VARpush(var, var->flag, var->bind); 
X
X		var->flag = VARIABLE; 
X
X		vars = vars->CELLcdr;
X	}
} /* savevars */
X
restorevars (vars) /* restore the binding of variables */
X	register kerncell vars;
{
X
X	while (ISlist(vars) ) {
X		VARpop(); 
X
X		vars = vars->CELLcdr;
X	}
} /* restorevars */
X
X
/* 41 */
X
X	kerncell 
mkargslist () /* make an argument list using the entries on argstk */ 
{
X
X	register int argi = ARGidx1; 
X	register kerncell arglist = NIL, list;
X
X	while (argi < argtop) 
X		if (arglist == NIL) 
X			arglist = list = mkcell(argstk[argi++],nil); 
X		else 
X			list = list->CELLcdr = mkcell(argstk[argi++],nil); 
X
X	return(arglist); 
X
} /* mkargslist */
X
X	kerncell 
Leval () /* (eval 'expr) */
{
X
X	CHECKlargs (evalsym, 1); 
X	return (eval(ARGnum1)) ; 
X
} /* Leval */
X
/* 42 */
X
X	kerncell 
Vcall () /* (call 'fun 'argl ... 'argn) */
{
X
X	kerncell fox;
X
X	CHECKvargs1 (callsym, 1); 
X
X	fox = ARGnum1; /* the function to be called */ 
X
X	argstk[argtop] = CONVcell(CONVint(argstk[argtop]) + 1); 
X
X	fox = evalcall(fox,nil,1); /* do the call */ 
X
X	argstk [argtop] = CONVcell (CONVint (argstk [argtop] ) - 1); 
X
X	return (fox); 
X
} /* Vcall */
X
X	kerncell
Lapply () /* (apply 'fun 'arglist) */
{
X
X	kerncell arg1 = ARGnum1; 
X
X	register kerncell arg2 = ARGnum2; 
X	kerncell fox = CONVcell (argtop + 1);
X
X	CHECKlargs (applysym, 2); 
X	CHECKlist (applysym, arg2); 
X
X	while (ISlist (arg2) ) { /* stack the arguments */
X
X		ARGpush(arg2->CELLcar); 
X
X		arg2 = arg2->CELLcdr;
X	} 
X
X	ARGpush (fox); 
X	fox = evalcall(arg1, nil, 1); 
X	ARGSpop(); 
X
X	return ( fox); 
X
} /* Lapply */
SHAR_EOF
  (set 20 13 11 03 14 27 18 'apli/eval.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/eval.c'
if test $? -ne 0
then ${echo} "restore of apli/eval.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/eval.c': 'MD5 check failed'
       ) << \SHAR_EOF
64a1836492c391000ca8b790082f84bf  apli/eval.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/eval.c'` -ne 9493 && \
  ${echo} "restoration warning:  size of 'apli/eval.c' is not 9493"
  fi
fi
# ============= apli/flow.c ==============
if test -n "${keep_file}" && test -f 'apli/flow.c'
then
${echo} "x - SKIPPING apli/flow.c (file already exists)"

else
${echo} "x - extracting apli/flow.c (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/flow.c' &&
/* 118 ItIonstandard Flow of Control and Iteratton */
/* flow.c */
X
#include "kernel.h" 
#include <setjmp.h>
X
#define CATpush() 										\
X	if (++cattop < CATSTKSIZE) { 				\
X		catstk[cattop].evaltop = evaltop; \
X		catstk[cattop].celltop = celltop; \
X		catstk[cattop].vartop  = vartop; 	\
X		catstk[cattop].argtop  = argtop; 	\
X		catstk[cattop]._argtop = _argtop; \
X	} else faterr(err_catstk) ;
X
#define CATpop() --cattop
X
struct catframe {          /* catch frame */ 
X	jmp_buf				jmp;       /* for setjmp and longjmp */ 
X	int           evaltop;   /* evaltop at the tirade of setjmp */ 
X	int           celltop;   /* celltop at the tine of setjmp */ 
X	int           vartop;    /* vartop at the timbre of setjmp */ 
X	int           argtop;    /* argtop at the tim of setjmp */ 
X	int           _argtop;   /* argtop of the last vlam */
}; 
X
struct catframe catstk[CATSTKSIZE]; /* the catch stack */ 
int cattop  = -1; 					/* top of jump stack */ 
int errtrap = 0;  					/* no error capture when zero */ 
int errshow = 1;  					/* errors are reported when -non-zero */ 
int errocc  = 0;  					/* set when an error occurs */ 
int level   = 0;  					/* kernel level */ 
X
X	kerncell 
Ucatch () /* (catch 'expr ['tag]) */
{
X	kerncell list = argstk [argtop];
X
X	if (list == NIL ||  list->CELLcdr != NIL) 
X		error (catchsym, err_args,0); 
X
X	return(catch (list->CELLcar, eval(list->CELLcdr->CELLcar),NULL));
} /* Ucatch */
X
X
/* 119 9.1 Nonstandard flow of control
*/
X	kerncell 
catch (expr, tag, more) /* catch throws during evaluation */
X	kerncell expr, tag; 
X	word more;
{
X
X	CATpush(); 
X
X	/* get ready for throws: */ 
X	int res = setjmp(catstk[cattop].jmp);
X
X	if ( !CONVcell( res )) {
X		if (more.i) 
X		{ 
X			kerncell (* cfun) () = expr; 
X			expr = (* cfun) (); /* cfun may have throws */
X
X			expr = (* cfun) (more); /* cfun may have throws */
X		}
X		else {
X			expr = eval(expr); /* expr may contain throws */ 
X		}
X	}
X	else if (tag == NIL 
X			&& !ISinternal(CONVsym(catres->CELLcar)) 
X			|| catres->CELLcar == NIL 
X			&& !ISinternal(tag) 
X			&& !ISlist (tag)
X			||	catres->CELLcar == tag 
X			||		ISlist (tag) 
X			&& memq(catres->CELLcar, tag)) { 
X
//	DBG("catch 20")
X		cleanup (); 
X
X		CATpop (); /* catch the throw and */ 
X
X		return (catres->CELLcdr); /* return its result */
X	}
//	DBG("catch 30")
X	else if (cattop < 1) /* one catch is reserved for top level */ 
X		error(catchsym,"no catch for this tag",catres->CELLcar); 
X	else { 
X		cleanup(); 
X
X		longjmp (catstk [CATpop () ] . jmp, catres); /* try another catch */
X	}
X	DBG("end catch")
X	CATpop(); /* there was no throw, so ignore the catch */
X	return (expr); 
} /* catch */
X
X
/* 120 Nonstandard Flow of Control and IteraMn */
cleanup () /* clean up stacks after a throw */
{
X	register int vtop = catstk[cattop].vartop;
X
X	while (vtop < vartop) /* restore non-global vars */
X		VARpop(); 
X
X	evaltop = catstk[cattop].evaltop; /* restore eval stack */ 
X	celltop = catstk[cattop].celltop; /* restore eval stack */  
X	argtop  = catstk[cattop].argtop;  /* restore arg stack */   
X	_argtop = catstk[cattop]._argtop; /* restore _argtop */     
} /* cleanup */
X
X
X	kerncell 
Vthrow () /* (throw 'obj ['tag]) */
{
X	CHECKvargs (throwsym, 1,2); 
X
X	return(throw(ARGnum1, (argtop - ARGidx1 == 1 ? NIL: ARGnum2) ) ) ; 
X
} /* Vthrow */
X
X
X	kerncell 
throw (expr,tag) /* evaluate and throw expr, plus its tag */
X	kerncell expr, tag; 
{
X
X	catres->CELLcar = tag; 
X	catres->CELLcdr = expr; 
X	longjmp(catstk[cattop].jmp, catres);
} /* throw */ 
X
X
X
/* 121 kl Nonstandard flow of control */
X
X	kerncell 
Ucaperr() /* (caperr 'expr [hide]) */
{
X	kerncell list = argstk[argtop];
X
X	if (list == NIL ||  list->CELLcdr->CELLcdr != NIL) 
X		error (caperrsym, err_args, 0); 
X
X	return (caperr(list->CELLcar, list->CELLcdr->CELLcar, NULL) ); 
} /* Ucaperr*/
X
X
X	kerncell 
caperr(expr, hide,more) /* captures errors during evaluation of expr */ 
X	kerncell expr, hide; /* when hide is non-nil error messages are hidden */
X	word more;
{
X
X	int savetrap = errtrap; /* save the values of errtrap, */
X	int saveshow = errshow; /* errshow, and */
X	int saveocc = errocc;   /* errocc */
X	kerncell res;
X
X	errtrap = 1; /* came here when error occurs */ 
X
X	errshow = eval(hide) == NIL; /* activate/hide error messages */
X
X	errocc = 0; /* pretend there were no previous errors */ 
X
X	res = catch(expr, _errtagsym,more); /* evaluate r */ 
X
X	res = (errocc ? NIL : mkcell(res,NIL)); /* result depends on error */ 
X
X	errtrap = savetrap; /* restore the things we changed */ 
X
X	errshow = saveshow; 
X
X	errocc = saveocc; 
X
X	return (res); 
X
} /* caperr_*/
X
/* 122 Nonstandard Flow of Control and Iteration */
X	kerncell 
Verror () /* (error 'source 'message ['extra]) */
{
X	kerncell arg2;
X
X	printf("start of Verror\n");
X	CHECKvargs (errorsym, 2, 3); 
X	printf("check vargs\n");
X
X	arg2 = ARGnum2; 
X
X	error (ARGnum1, GETstr (errorsym, arg2), 
X			(argtop == ARGidx1 == 2 ? 0 : ARGnum3)) ;
X
X	return (TTT); 
X
} /* Verror */
X
error (source, message, extra) /* error handling routine */
X	kerncell source; 
X	char *message; 
X	kerncell extra;
{
X	errocc = 1 ; /* set error flag */
X
X	/* p123 9.1 Nonstandard flow of control */
X	if (errshow) { /* error to be shown? */
X		/*bufprint(PRINT, _outchan, "ERROR, "); */
X		bufprint(PRINT, _errchan,"ERROR, ");
X
X		if (source != 0) {
X
X			PRINTchan (source, errchan); 
X			bufprint (PRINT, _errchan, ": ");
X		}
X
X		bufprint (PRINT, _errchan, "%s", message); 
X
X		if (extra != 0) {
X
X			bufprint (PRINT, _errchan,": ", 0); 
X
X			PRINTchan (extra, errchan);
X		}
X		bufprint (PRINT, _errchan, "\n", 0) ;
X	}
X	if (errtrap) /* error to be trapped? */ 
X	{
X		throw (NIL, _errtagsym); /* throw this to the catch of capexx */ 
X	}
X	else 
X		EVALpush (CONVcell (errorsym) ); 
X
X	errlevel (); /* enter error level */
} /* error */
X
errlevel () /* error level's read-eval-print */
{
X	kerncell obj;
X
X	++level ; /* increment the level */
X
X	for (;;) { /* read-eval-print */
X
X		bufprint(PRINT, _outchan, "=%1d=> ",level); /* prompt */
X
X		obj = catch(read_and_eval, _errtagsym, NULL); 
X
X		if (obj == CONVcell (eofsym) ) { /* quit this level? */
X
X			--level; 
X			throw(NIL, _errtagsym); /* go to previous level */
X		}
X
X		PRINTout(obj); 
X		bufprint (PRINT,_outchan, "\n", 0);
X	}
} /* errlevel */
X
faterr(message) /* fatal error handling */
X	char *message;
{
X	printf ("FATAL ERROR: %s\n", message);
X	exit (1); 
X
} /* faterr_*/
X
X
X
/* 125 9.2 Explicit iteration function */
X
X
topexec () /* kernel executive */
{
X	bufprint (PRINT, _outchan, "KERNEL V1, Aug 1987\n"); 
X	for (;;) { 
X
X		errtrap = errocc = 0; 
X
X		errshow = 1; 
X
X		level = 0; /* top level: level is zero */ 
X
X	
X		catch(top_lev_call, top_lev_tags, NULL); 
X
X		bufprint(PRINT, _outchan,"[KERNEL, top level]\n");
X	}
} /* topexec */
X
X	kerncell 
Ltoplevel() /* (toplevel} */
{
X	kerncell obj;
X
X	CHECKlargs (toplevelsym, 0); 
X
X	for (;;) { /* read-eval-print loop */
X
X		bufprint (PRINT, _outchan, "=> ") ;
X
X
X		if ( (obj = eval (read_and_eval) ) == CONVcell (eofsym) ) { 
X			bufprint (PRINT, _outchan, "\n"); 
X
X			exit (0);
X		}
X
X		PRINTout (obj); 
X		bufprint (PRINT,_outchan, "\n");
X	}
} /* Ltoplevel */
X
X
X
X	kerncell 
Lreset () /* (reset) */
{
X	CHECKlargs (resetsym, 0); 
X	throw (NIL, _toptagsym); 
X
} /* Lreset */
X
X	kerncell 
Vexit () /* (exit ['code]) */
{
X	kerncell arg; 
X
X	int idx1 = ARGidx1; 
X	int exitcode = 0;
X
X	CHECKvargs2 (exitsym, 1); 
X	if (argtop == idx1 + 1) { 
X
X		arg = ARGnum1; 
X
X		exitcode = GETint(exitsym, arg);
X	}
X	exit (exitcode); 
X
} /* Vexit */
X
X
SHAR_EOF
  (set 20 13 11 03 13 54 05 'apli/flow.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/flow.c'
if test $? -ne 0
then ${echo} "restore of apli/flow.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/flow.c': 'MD5 check failed'
       ) << \SHAR_EOF
0465ad2d8c35b93281a375b7fb8deca5  apli/flow.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/flow.c'` -ne 7385 && \
  ${echo} "restoration warning:  size of 'apli/flow.c' is not 7385"
  fi
fi
# ============= apli/list.c ==============
if test -n "${keep_file}" && test -f 'apli/list.c'
then
${echo} "x - SKIPPING apli/list.c (file already exists)"

else
${echo} "x - extracting apli/list.c (text)"
  sed 's/^X//' << 'SHAR_EOF' | uudecode &&
begin 600 apli/list.c
M+RH@.#,@-BXQ($QA<W0@9G5N8W1I;VYS("HO"@HO*B!L:7-T+F,@*B\*"B-I
M;F-L=61E(")K97)N96PN:"(*"@EK97)N8V5L;`I,8V%R*"D@+RH@*&-A<B`G
M;&ES="D@*B\*>PH):V5R;F-E;&P@87)G(#T@05)';G5M,3L*"@E#2$5#2VQA
M<F=S("AC87)S>6TL(#$I.PH*"7)E='5R;B`H25-L:7-T("AA<F<I"@D)"3\@
M87)G+3Y#14Q,8V%R"@D)"3H@*&%R9R`]/2!.24P@/R!.24P*"0D)"3H)0T].
M5F-E;&P@*&5R<F]R("AC87)S>6TL(&5R<E]L:7-T+"!A<F<I("D@*2`I.PH*
M?2`O*DQC87(@*B\*"@EK97)N8V5L;`I,8V1R("@I("\J("AC9'(@)VQI<W0I
M("HO"GL*"6ME<FYC96QL(&%R9R`]($%21VYU;3$["@H)0TA%0TML87)G<R`H
M8V1R<WEM+"`Q*3L*"@ER971U<FX@*$E3;&ES="`H87)G*0H*"0D)/R!A<F<M
M/D-%3$QC9'(*"0D).BAA<F<@/3T@3DE,(#\@3DE,"@D)"0DZ($-/3E9C96QL
M("AE<G)O<B`H8V1R<WEM+"!E<G)?;&ES="P@87)G*2`I("D@*3L*"GTO*B!,
M8V1R("HO"@H):V5R;F-E;&P*3&-X>'(@*'AX*2`O*B`H8RXN<B`G;&ES="D@
M*B\*"7)E9VES=&5R(&-H87(@*GAX.PI["@ER96=I<W1E<B!K97)N8V5L;"!A
M<F<@/2!!4D=N=6TQ.PH*"4-(14-+;&%R9W,@*%]C>'AR<WEM+"`Q*3L*"@EX
M>"`]('AX("L@<W1R;&5N("AX>"D@+2`R.R`O*B!X>"!N;W<@<&]I;G1S('1O
M('1H92!L87-T("=A)R!O<B`G9"<@*B\*"@EW:&EL92`H*GAX("$]("=C)RD@
M>PH)"6EF("A)4VQI<W0@*&%R9RD@*0H)"0EA<F<@/2`H*GAX+2T@/3T@)V$G
M(#\@87)G+3Y#14Q,8V%R(#H@87)G+3Y#14Q,8V1R*3L*"@D)96QS92!I9B`H
M87)G(#T]($Y)3"D*"0D)<F5T=7)N("A.24PI.PH*"0EE;'-E(`H)"0EE<G)O
M<BA?8WAX<G-Y;2P@97)R7VQI<W0L87)G*3L*"7T*"7)E='5R;B`H87)G*3L*
M"GTO*B!)8WAX<B`J+PH*+RH@.#0@*B\*"FME<FYC96QL(`I,;G1H96QE;2`H
M*2`O*B`H;G1H96QE;2`G;&ES="`G;BD@*B\*>PH)<F5G:7-T97(@:V5R;F-E
M;&P@87)G,2`]($%21VYU;3$["@EK97)N8V5L;"!A<F<R(#T@05)';G5M,CL*
M"7)E9VES=&5R(&EN="!N=6T["@I#2$5#2VQA<F=S("AN=&AE;&5M<WEM+"`R
M*3L*"D-(14-+;&ES="`H;G1H96QE;7-Y;2P@87)G,2D["@IN=6T@/2!'151I
M;G0@*&YT:&5L96US>6TL(&%R9S(I.PH*"7=H:6QE("AN=6TM+2`^(#$I('L*
M"@D):68@*&%R9S$@/3T@3DE,*2`*"0D)"7)E='5R;B`H3DE,*3L*"@D)"0EA
M<F<Q(#T@87)G,2T^0T5,3&-D<CL*"7T*"7)E='5R;B`H87)G,2`]($Y)3"`_
M($Y)3"`Z(&%R9S$M/D-%3$QC87(I.PI]("\J($QN<G1H96QE;B`J+PH*"6ME
M<FYC96QL"DQN=&AP86ER("@I("\J("AN=&AP86ER("=L:7-T("=N*2`J+PI[
M"@ER96=I<W1E<B!K97)N8V5L;"!A<F<Q(#T@05)';G5M,3L*"6ME<FYC96QL
M(&%R9S(@/2!!4D=N=6TR.PH)<F5G:7-T97(@:6YT(&YU;3L*"@E#2$5#2VQA
M<F=S("AN=&AP86ER<WEM+"`R*3L*"@E#2$5#2VQI<W0@*&YT:'!A:7)S>6TL
M(&%R9S$I.PH*"6YU;2`]($=%5&EN="AN=&AP86ER<WEM+"!A<F<R*3L*"@EW
M:&EL92`H;G5M+2T@/B`Q*2!["@D):68@*&%R9S$@/3T@3DE,*0H)"0ER971U
M<FX@*$Y)3"D["@D)87)G,2`](&%R9S$M/D-%3$QC9'(["@E]"@ER971U<FX@
M*&%R9S$I.PI]+RH@("!,;G1H<&%I<B`J+PH*+RH@.#4@-BXQ($QI<W0@9G5N
M8W1I;VYS("HO"@HO*B`H<G!L86-A("=L:7-T("=N97=H96%D*2`J+PH*"6ME
M<FYC96QL"DQR<&QA8V$@*"D@"GL*"6ME<FYC96QL(&%R9S$@/2!!4D=N=6TQ
M.PH*"4-(14-+;&%R9W,H<G!L86-A<WEM+"`R*3L*"@E#2$5#2W!A:7(H<G!L
M86-A<WEM+"!A<F<Q*3L*"@EA<F<Q+3Y#14Q,8V%R(#T@05)';G5M,CL*"@ER
M971U<FX@*&%R9S$I.PI](`H*+RH@3')P;&%C82`J+PH*"6ME<FYC96QL"DQR
M<&QA8V0@*"D@+RH@*')P;&%C9"`G;&ES="`G;F5W=&%I;"D@*B\*>PH):V5R
M;F-E;&P@87)G,2`]($%21VYU;3$["@H)0TA%0TML87)G<R`H<G!L86-D<WEM
M+"`R*3L*"@E#2$5#2W!A:7(@*')P;&%C9'-Y;2P@87)G,2D["@H)87)G,2T^
M0T5,3&-D<B`]($%21VYU;3(["@H)<F5T=7)N("AA<F<Q*3L*"GT@+RH@3')P
M;&%C9"`J+PH*"6ME<FYC96QL"DQL87-T<&%I<B`H*2`O*B`H;&%S='!A:7(@
M)VQI<W0I("HO"GL*"6ME<FYC96QL(&%R9R`]($%21VYU;3$["@H)0TA%0TML
M87)G<R`H;&%S='!A:7)S>6TL(#$I.PH*"4-(14-+;&ES="`H;&%S='!A:7(L
M(&%R9RD["@H)<F5T=7)N("AL87-T<&%I<B`H87)G*2`I.PH*?2\J($QL87-T
M<&%I<B`J+PH*+RH@.#8@3'IS=',@86YD(%-E=',@*B\*"6ME<FYC96QL"FQA
M<W1P86ER("AL:7-T*2`O*B!L87-T<&%I<BAL:7-T*2`J+PH)<F5G:7-T97(@
M:V5R;F-E;&P@;&ES=#L*>PH):68@*&QI<W0@/2!.24PI"@D)<F5T=7)N("A.
M24PI.PH*"7=H:6QE("A)4VQI<W0@*&QI<W0M/D-%3$QC9'(I("D*"0EL:7-T
M(#T@;&ES="T^0T5,3&-D<CL*"@ER971U<FX@*&QI<W0I.PH*?2\J(&QA<W1P
M86ER("`J+PH*"6ME<FYC96QL"DQL87-T96QE;2`H("D@+RH@*&QA<W1E;&%N
M("<@;&ES="D@*B\*>PH):V5R;F-E;&P@87)G(#T@05)';G5M,3L*"@E#2$5#
M2VQA<F=S("AL87-T96QE;7-Y;2P@,2D[.PH*"4-(14-+;&ES="`H;&%S=&5L
M96US>6TL(&%R9RD["@H)<F5T=7)N("AA<F<@/3T@3DE,(#\@3DE,(#H@;&%S
M='!A:7(@*&%R9RD@+3Y#14Q,8V%R*3L*"GT@+RH@3&QA<W1E;&5M("HO"@H)
M:V5R;F-E;&P*3&-O;G,H*2`O*B`H8V]N<R`G97AP<B`G;&ES="D@*B\*>PH)
M:V5R;F-E;&P@87)G,B`]($%21VYU;3(["@EK97)N8V5L;"!N97=C96QL.PH*
M"4-(14-+;&%R9W,@*&-O;G-S>6TL(#(I.PH)0TA%0TML:7-T("AC;VYS<WEM
M+"!A<F<R*3L*"@EN97=C96QL(#T@9G)E<VAC96QL("@I.PH*"6YE=V-E;&PM
M/F9L86<@/2!,25-43T)*.PH*"6YE=V-E;&PM/D-%3$QC87(@/2!!4D=N=6TQ
M.PH*"6YE=V-E;&PM/D-%3$QC9'(@/2!A<F<R.PH*"7)E='5R;B`H;F5W8V5L
M;"D["@I]+RI,;V]N<RHO"@HO*B`X-R`V+C$@3&%S="!F=6YC=&EO;G,@*B\*
M"6ME<FYC96QL"E9L:7-T*"D@+RH@*&QI<W0@)V5X<'(Q("XN("=E>'!R;BD@
M*B\*>PH)<F5G:7-T97(@:V5R;F-E;&P@;&ES=#L*"6ME<FYC96QL(')E<R`]
M($Y)3#L*"7)E9VES=&5R(&EN="!I9'@["@H):68@*"AI9'@@/2!!4D=I9'@Q
M*2`]/2!A<F=T;W`I"@D)<F5T=7)N("A.24PI.PH*"7=H:6QE("AI9'@@/"!A
M<F=T;W`I('L*"@D):68@*')E<R`]/2!.24PI(`H)"0ER97,@/2!L:7-T(#T@
M9G)E<VAC96QL("@I.PH*"0EE;'-E('L*"0D);&ES="T^0T5,3&-D<B`](&9R
M97-H8V5L;"`H*3L*"0D);&ES="`](&QI<W0M/D-%3$QC9'(["@D)?0H)"6QI
M<W0M/F9L86<@/2!,25-43T)*.PH*"0EL:7-T+3Y#14Q,8V%R(#T@87)G<W1K
M(%MI9'@K*UT["@E]"@ER971U<FX@*')E<RD["GT@+RH@=FQI<W0@*B\*"@EK
M97)N8V5L;`I,;&5N9W1H("@I("\J("AL96YG=&@@)VQI<W0I("HO"GL*"7)E
M9VES=&5R(&ME<FYC96QL(&%R9R`]($%21VYU;3$["@ER96=I<W1E<B!I;G0@
M;&5N.PH*"4-(14-+;&%R9W,@*&QE;F=T:'-Y;2P@,2D["@E#2$5#2VQI<W0@
M*&QE;F=T:'-Y;2P@87)G*3L*"@EF;W(@*&QE;CTP.R!)4VQI<W0@*&%R9RD@
M.R`K*VQE;BD*"0EA<F<@/2!A<F<M/D-%3$QC9'(["@H)<F5T=7)N("AM:VEN
M=6T@*&QE;BD@*3L*"GTO*B!,;&5N9W1H("HO"@HO*B`X."`J+PH):V5R;F-E
M;&P*5F-O;F,H*2`O*B`H8V]N8R`G;&ES=#$@+BXN("=L:7-T;BD@*B\*>PH)
M<F5G:7-T97(@:V5R;F-E;&P@;&ES=#L*"6ME<FYC96QL(')E<R`]($Y)3"P@
M87)G.PH)<F5G:7-T97(@:6YT(&ED>#L*"@E#2$5#2W9A<F=S,2`H8V]N8W-Y
M;2P@,BD["@H)9F]R("AI9'@]05)':61X,3L@:61X(#P@87)G=&]P+3$[("LK
M:61X*2!["@D):68@*"AA<F<@+2!A<F=S=&M;:61X72D@/3T@3DE,*2`O*B!I
M9VYO<F4@;FEL)W,@*B\*"0D)8V]N=&EN=64["@H)"4-(14-+;&ES="`H8V]N
M8W-Y;2P@87)G*3L*"@D):68@*&QI<W0@/3T@5%14*2`O*B!T:&ES(&AA<'!E
M;G,@9F]R('1H92!L<W0@;F]N+6YL;"!A<F<@;VYL>2`J+PH*"0D)<F5S(#T@
M;&ES="`](&-O<'ET;W`@*&%R9RD["@D)96QS92`*"0D)*&QI<W0@/2!L87-T
M<&%I<B`H;&ES="DI+3Y#14Q,8V1R(#T@8V]P>71O<"`H87)G*3L*"7T*"7)E
M='5R;B`H<F5S(#T]($Y)3"`_(&%R9W-T:UMI9'A="@H)"0DZ("AL87-T<&%I
M<BAL:7-T*2T^0T5,3&-D<B`](&%R9W-T:UMI9'A=("P@<F5S*2D["GTO*B!6
M8V]N8R`J+R`*"@EK97)N8V5L;`I69&-O;F,@*"D@+RH@*"IC;VYC("<@;&ES
M=&P@;&ES=&XI("HO"GL*"7)E9VES=&5R(&ME<FYC96QL(&QI<W0@/2!45%0[
M"@EK97)N8V5L;"!R97,@/2!.24PL(&%R9SL*"7)E9VES=&5R(&EN="!I9'@[
M"@H)0TA%0TMV87)G<S$@*&1C;VYC<WEM+"`R*3L*"@D)9F]R("AI9'@]05)'
M:61X,3L@:61X(#P@87)G=&]P+3$[("LK:61X*2!["@H)"0EI9B`H("AA<F<@
M/2!A<F=S=&M;:61X72D@/3T@3DE,*2`O*B!I9VYO<F4@;FEL)W,@*B\*"0D)
M"6-O;G1I;G5E.PH*"0D)0TA%0TML:7-T("AD8V]N8W-Y;2P@87)G*3L*"@D)
M"6EF("AL:7-T(#T]("!45%0I("\J('1H:7,@:&%P<&5N<R!F;W(@=&AE(&QS
M="!N;VXM;CI\7VP@87)G(&]N;'D@*B\*"0D)"7)E<R`](&QI<W0@/2!A<F<[
M"@H)"0EE;'-E"@D)"0DH;&ES="`](&QA<W1P86ER*&QI<W0I*2T^0T5,3&-D
M<B`](&%R9SL*"0E]"@ER971U<FX@*')E<R`]/2!.24P@/R!A<F=S=&M;:61X
M70H)"0DZ*&QA<W1P86ER*&QI<W0I+3Y#14Q,8V1R(#T@87)G<W1K6VED>%TL
M(')E<RDI.PH*?2\J(%9D8V]N8R!U9B\*"B\J(#@Y(#8N,2!,87-T(&9U;F-T
M:6]N<R`J+PH*"6ME<FYC96QL"F-O<'ET;W`@*&%R9RD@+RH@8V]P>71O<"AA
M<F<I("HO"@ER96=I<W1E<B!K97)N8V5L;"!A<F<[(`I["@ER96=I<W1E<B!K
M97)N8V5L;"!L:7-T.PH):V5R;F-E;&P@<F5S(#T@3DE,.PH*"7=H:6QE("A)
M4VQI<W0@*&%R9RD@*2!["@H)"6EF("AR97,@/3T@3DE,*0H)"0ER97,@/2!L
M:7-T(#T@9G)E<VAC96QL("@I.PH*"0EE;'-E>PH)"0EL:7-T+3Y#14Q,8V1R
M(#T@9G)E<VAC96QL("@I.PH)"0EL:7-T(#T@;&ES="T^0T5,3&-D<CL*"0E]
M"@D);&ES="T^9FQA9R`]($Q)4U1/0DH["@D);&ES="T^0T5,3&-A<B`](&%R
M9RT^0T5,3&-A<CL*"0EA<F<@/2!A<F<M/D-%3$QC9'(["@E]"@ER971U<FX@
M*')E<RD["@I]("\J(&-O<'ET;W`@*B\*"@EK97)N8V5L;`I,<F5M;W9E("@I
M("\J("AR96UO=F4@)V5L96T@)VQI<W0I("HO"GL*"6ME<FYC96QL(&%R9S$@
M/2!!4D=N=6TQ.R`*"7)E9VES=&5R(&ME<FYC96QL(&%R9S([(`H)<F5G:7-T
M97(@:V5R;F-E;&P@;&ES=#L*"@EK97)N8V5L;"!R97,@/2!.24P["@H)0TA%
M0TML87)G<R`H<F5M;W9E<WEM+"`R*3L*"4-(14-+;&ES="`H<F5M;W9E<WEM
M+"!A<F<R*3L*"@D)=VAI;&4@*$E3;&ES="`H87)G,BD@*2!["@H)"0EI9B`H
M97%U86P@*&%R9S(M/D-%3$QC87(L(&%R9S$I("D@>PH)"0D)87)G,B`](&%R
M9S(M/D-%3$QC9'(["@D)"0EC;VYT:6YU93L*"0D)?0H)"0EI9B`H<F5S(#T]
M($Y)3"D*"0D)"7)E<R`](&QI<W0@/2!F<F5S:&-E;&P@*"D["@H)"0EE;'-E
M>PH)"0D);&ES="T^0T5,3&-D<B`](&9R97-H8V5L;"`H*3L*"0D)"6QI<W0@
M/2!L:7-T+3Y#14Q,8V1R.PH)"0E]"@D)"6QI<W0M/F9L86<@/2!,25-43T)*
M.PH)"0EL:7-T+3Y#14Q,8V%R(#T@87)G,BT^0T5,3&-A<CL*"0D)87)G,B`]
M(&%R9S(M/D-%3$QC9'(["@D)?0H)<F5T=7)N("AR97,I.PH*?2`O*B!,<F5M
M;W9E("HO"@H*+RH@.3`@3&ES=',@86YD(%-E=',@*B\*"6ME<FYC96QL(`I,
M9')E;6]V92`H*2`O*B`H*G)E;6]V92#B@)AE;&5M("=L:7-T*2`J+PI["@EK
M97)N8V5L;"!A<F<Q(#T@05)';G5M,3L*"7)E9VES=&5R(&ME<FYC96QL(&%R
M9S(@/2!!4D=N=6TR.PH):V5R;F-E;&P@<F5S(#T@87)G,CL*"@E#2$5#2VQA
M<F=S("AD<F5M;W9E<WEM+"`R*3L*"4-(14-+;&ES="`H9')E;6]V97-Y;2P@
M87)G,BD["@H)=VAI;&4@*$E3;&ES="`H87)G,BT^0T5,3&-D<BD@*0H)"6EF
M("AE<75A;"AA<F<R+3Y#14Q,8V1R+3Y#14Q,8V%R+"!A<F<Q*2`I"@D)"6%R
M9S(M/D-%3$QC9'(@/2!A<F<R+3Y#14Q,8V1R+3Y#14Q,8V1R.PH)"65L<V4*
M"0D)87)G,B`]/2!A<F<R+3Y#14Q,8V1R.PH)<F5T=7)N("AE<75A;"`H<F5S
M+3Y#14Q,8V%R+&%R9S$I(#\@<F5S+3Y#14Q,8V1R(#H@<F5S*3L*"GTO*B!,
M9')E;6]V92`J+PH*:V5R;F-E;&P*"DQS=6)S="@I("\J("AS=6)S="`G=&AI
M<R`G=&AA="#B@)AL:7-T*2`J+PI["@EK97)N8V5L;"!A<F<S(#T@05)';G5M
M,SL*"@E#2$5#2VQA<F=S("AS=6)S='-Y;2P@,RD["@E#2$5#2VQI<W0@*'-U
M8G-T<WEM+"!A<F<S*3L*"@ER971U<FX@*'-U8G-T("A!4D=N=6TQ+$%21VYU
M;3(L(&%R9S,I*3L*"GTO*FYS=6)S,3LJ+PH*:V5R;F-E;&P*"B\J(#DQ(#8N
M,2!,:7-T(&9U;F-T:6]N<R`J+PH*<W5B<W0@*&%R9S$L87)G,BP@87)G,RD@
M+RH@<W5B<W0@*#$Z:&ES+'1H870L,6ES,3HI("HO"@EK97)N8V5L;"!A<F<Q
M+"!A<F<R.PH)<F5G:7-T97(@:V5R;F-E;&P@87)G,SL*>PH)<F5G:7-T97(@
M:V5R;F-E;&P@;&ES=#L*"6ME<FYC96QL(')E<R`]($Y)3#L*"@EW:&EL92`H
M25-L:7-T("AA<F<S*2`I('L*"@D):68@*')E<R`]/2!.24PI"@D)"7)E<R`]
M(&QI<W0@/2!F<F5S:&-E;&P@*"D["@H)"65L<V4@>PH)"0EL:7-T+3Y#14Q,
M8V1R(#T@9G)E<VAC96QL("@I.PH)"0EL:7-T(#T@;&ES="T^0T5,3&-D<CL*
M"0E]"@D);&ES="T^9FQA9R`]($Q)4U1/0DH["@D);&ES="T^0T5,3&-A<B`]
M("AE<75A;"`H87)G,RT^0T5,3&-A<BP@87)G,BD*"0D)"3\@87)G,0H)"0D)
M.BA)4VQI<W0@*&%R9S,M/D-%3$QC87(I"@D)"0D)/R!S=6)S="`H87)G,2P@
M87)G,BP@87)G,RT^0T5,3&-A<BD*"0D)"0DZ87)G,RT^0T5,3&-A<BD@*3L*
M"@D)87)G,R`](&%R9S,M/D-%3$QC9'(["@E]"@ER971U<FX@*')E<RD["GTO
M*B!S=6)S="`J+PH*"6ME<FYC96QL"DQD<W5B<W0@*"D@+RH@*"IS=6)S="`G
M=&AI<R`G=&AA="#B@)AL:7-T*2`J+PI["@EK97)N8V5L;"!A<F<S(#T@05)'
M;G5M,SL*"@E#2$5#2VQA<F=S("AD<W5B<W1S>6TL(#,I.PH)0TA%0TML:7-T
M("AD<W5B<W1S>6TL(&%R9S,I.PH*"7)E='5R;B`H(&1S=6)S="`H05)';G5M
M,2P@05)';G5M,B`L(&%R9S,I("D["@I]("\J($QD<W5B<W0@*B\*"@EK97)N
M8V5L;"`*9'-U8G-T("AA<F<Q+"!A<F<R("P@87)G,RD@+RH@9'-U8G-T("AT
M:&ES+"!T:&%T+"!L:7-T*2`J+PH):V5R;F-E;&P@87)G,2P@87)G,CL*"7)E
M9VES=&5R(&ME<FYC96QL(&%R9S,["GL*"6ME<FYC96QL(')E<R`](&%R9S,[
M"@EW:&EL92`H25-L:7-T("AA<F<S*2`I('L*"@D):68@*&5Q=6%L("AA<F<S
M+3Y#14Q,8V%R+"!A<F<R*2`I"@D)"6%R9S,M/D-%3$QC87(@/2!A<F<Q.PH*
M"0EE;'-E(&EF("A)4VQI<W0@*&%R9S,M/D-%3$QC87(I("D*"0D)9'-U8G-T
M("AA<F<Q("P@87)G,B`L(&%R9S,M/D-%3$QC87(I.PH*"0EA<F<S(#T@87)G
M,RT^0T5,3&-D<CL*"7T*"7)E='5R;B`H<F5S*3L*"GT@+RH@9'-U8G-T("HO
M"@HO*B`Y,B#B@JP@3'IS=',@86YD(%-E=',@*B\*"6ME<FYC96QL"DQR979E
M<G-E("@I("\J("AR979E<G-E("=L:7-T*2`J+PI["@ER96=I<W1E<B!K97)N
M8V5L;"!A<F<@/2!!4D=N=6TQ.PH*"6ME<FYC96QL(')E<R`]($Y)3#L*"@E#
M2$5#2VQA<F=S("AR979E<G-E<WEM+"`Q*3L*"4-(14-+;&ES="`H<F5V97)S
M97-Y;2P@87)G*3L*"@EW:&EL92`H25-L:7-T("AA<F<I*2!["@H)"7)E<R`]
M(&UK8V5L;"`H87)G+3Y#14Q,8V%R+"!R97,I.PH*"0EA<F<@/2!A<F<M/D-%
M3$QC9'(["@E]"@ER971U<FX@*')E<RD["@I]("\J($QR979E<G-E("HO"@H)
M:V5R;F-E;&P*3&1R979E<G-E("@I("\J(')E=F5R<V4@)VQI<W0I("HO"GL*
M"6ME<FYC96QL(&%R9R`]($%21VYU;3$["@H)0TA%0TML87)G<R`H9')E=F5R
M<V5S>6TL(#$I.PH)0TA%0TML:7-T("AD<F5V97)S97-Y;2P@87)G*3L*"@ER
M971U<FX@*&1R979E<G-E("AA<F<I("D["@I]("\J($QD<F5V97)S92`J+PH*
M"6ME<FYC96QL"F1R979E<G-E("AL:7-T*2`O*@ED<F5V97)S92`H;&ES="D@
M*B\*"7)E9VES=&5R(&ME<FYC96QL(&QI<W0["GL*"6ME<FYC96QL('!R978@
M/2!.24PL('-A=F4@/2!L:7-T.PH*"7=H:6QE("A)4VQI<W0@*&QI<W0I*2![
M"@D);&ES="`](&QI<W0M/D-%3$QC9'(["@D)<V%V92T^0T5,3&-D<B`]('!R
M978["@H)"7!R978@/2!S879E.PH)"7-A=F4@/2!L:7-T.PH)?0H)<F5T=7)N
M("AP<F5V*3L*?2`O*B!D<F5V97)S92`J+PH*+RH@.3,@-BXQ($QI<W0@9G5N
M8W1I;VYS("HO"@EK97)N8V5L;`I,;65M8F5R*"D@+RH@*&UE;6)E<B`G97AP
M<B`G;&ES="D@*B\*>PH):V5R;F-E;&P@87)G,2`]($%21VYU;3$["@ER96=I
M<W1E<B!K97)N8V5L;"!A<F<R(#T@05)';G5M,CL*"@E#2$5#2VQA<F=S("AM
M96UB97)S>6TL(#(I.PH)0TA%0TML:7-T("AM96UB97)S>6TL(&%R9S(I.PH*
M"7=H:6QE("A)4VQI<W0@*&%R9S(I*2!["@H)"6EF("AE<75A;"`H87)G,2P@
M87)G,BT^0T5,3&-A<BD@*0H)"0ER971U<FX@*&%R9S(I.PH*"0EA<F<R(#T@
M87)G,BT^0T5,3&-D<CL*"7T*"7)E='5R;B`H3DE,*3L*?2`O*B!,;65M8F5R
M("HO.PH*"6ME<FYC96QL"DQM96UQ*"D@+RH@*&UE;7$@)V5X<'(@)VQI<W0I
M("HO"GL*"6ME<FYC96QL(&%R9S$@/2!!4D=N=6TQ.PH)<F5G:7-T97(@:V5R
M;F-E;&P@87)G,B`]($%21VYU;3(["@H)0TA%0TML87)G<R`H;65M<7-Y;2P@
M,BD["@E#2$5#2VQI<W0@*&UE;7%S>6TL(&%R9S(I.PH*"7=H:6QE("A)4VQI
M<W0@*&%R9S(I*2!["@H)"6EF("AA<F<Q(#T@87)G,BT^0T5,3&-A<BD*"0D)
M<F5T=7)N("AA<F<R*3L*"@D)87)G,B`](&%R9S(M/D-%3$QC9'(["@E]"@ER
M971U<FX@*$Y)3"D["GT@+RH@3&UE;7$@*B\*"@IM96UB97(@*&5X<'(L(&QI
M<W0I("\J(&Q3(&5X<'(@82!M96UB97(@;V8@;&ES=#\@*B\*"6ME<FYC96QL
M(&5X<'(["@ER96=I<W1E<B!K97)N8V5L;"!L:7-T.PI["@DO*B`Y-"!,87-T
M<R!A;F0@4V5T<R`J+PH)=VAI;&4@*$E3;&ES="`H;&ES="D@*2!["@H)"6EF
M("AE<75A;"`H97AP<BP@;&ES="T^0T5,3&-A<BD@*0H)"0ER971U<FX@*#$I
M.PH*"0EL:7-T(#T@;&ES="T^0T5,3&-D<CL*"7T*"7)E='5R;B`H,"D["GT*
M+RH@;65M8F5R("HO"@IM96UQ*&5X<'(L(&QI<W0I("\J(&AA<R!L:7-T(&%N
M(&5L96UE;G0@:61E;G1I8V%L('1O(&5X<'(_("HO"@EK97)N8V5L;"!E>'!R
M.PH)<F5G:7-T97(@:V5R;F-E;&P@;&ES=#L*>PH)=VAI;&4@*$E3;&ES="`H
M;&ES="D@*2!["@H)"6EF("AE>'!R(#T](&QI<W0M/D-%3$QC87(I"@D)"7)E
M='5R;B`H,2D["@H)"6QI<W0@/2!L:7-T+3Y#14Q,8V1R.PH)?0H)<F5T=7)N
M*#`I.PI]("\J(&UE;7$@*B\*"@EK97)N8V5L;"`*3&5Q=6%L*"D@+RH@*&5Q
M=6%L("=E>'!R,2`G97AP<C(I("HO"GL*"4-(14-+;&%R9W,@*&5Q=6%L<WEM
M+"`R*3L*"@ER971U<FXH97%U86PH05)';G5M,2Q!4D=N=6TR*2`_(%145"`Z
M($Y)3"D["@I]+RH@3&5Q=6%L("HO"@H):V5R;F-E;&P*3&5Q*"D@+RH@*&5Q
M("=E>'!R,2`G97AP<C(I("HO"GL*"4-(14-+;&%R9W,@*&5Q<WEM+"`R*3L*
M"7)E='5R;BA!4D=N=6TQ(#T]($%21VYU;3(@/R!45%0@.B!.24PI.PH*?2\J
M($QE<2`J+PH*97%U86P@*&5X<'(Q+"!E>'!R,BD@+RH@97%U86P@*&5X<'(Q
M+&5X<'(R*2`J+PH)<F5G:7-T97(@:V5R;F-E;&P@97AP<C$L(&5X<'(R.PI[
M"@EI9B`H97AP<C$@+2!E>'!R,BD*"0ER971U<FX@*#$I.PH*"2\J(#DU(#8N
M,2!,:7-T(&9U;F-T:6]N<R`J+PH*"6EF("AE>'!R,2T^9FQA9R`]/2!E>'!R
M,BT^9FQA9RD*"0ER971U<FX@*#`I.PH*"7-W:71C:"`H97AP<C$M/F9L86<I
M('L*"@D)8V%S92!)3E1/0DHZ"@D)"7)E='5R;B`H97AP<C$M/D-%3$QI;G5M
M(#T](&5X<'(R+3Y#14Q,:6YU;2D["@H)"6-A<V4@4D5!3$]"2CH*"0D)<F5T
M=7)N("AE>'!R,2T^0T5,3')N=6T@/3T@97AP<C(M/D-%3$QR;G5M*3L*"@D)
M8V%S92!35%)/0DHZ"@D)"0ER971U<FX@*'-T<F-M<"`H97AP<C$M/D-%3$QS
M='(L(&5X<'(R+3Y#14Q,<W1R*2`]/2`P*3L*"@D)8V%S92!#2$%.3T)*.@H)
M"0ER971U<FX@*&5X<'(Q+3Y#14Q,8VAA;B`]/2!E>'!R,BT^0T5,3&-H86XI
M.PH*"0EC87-E(%9%0U1/4D]"2CH*"0D)>R!R96=I<W1E<B!I;G0@9&EM(#T@
M97AP<C$M/D-%3$QD:6TM/D-%3$QI;G5M.PH*"0D)"0EI9B`H9&EM("$](&5X
M<'(R+3Y#14Q,9&EM+3Y#14Q,:6YU;2D*"0D)"0ER971U<FXH,"D["@H)"0D)
M"7=H:6QE("@M+61I;2D*"0D)"0D):68@*"%E<75A;"@J*&5X<'(Q+3Y#14Q,
M=F5C("L@9&EM*2P*"0D)"0D)"0D)*B`H97AP<C(M/D-%3$QV96,@*R!D:6TI
M("D@*0H)"0D)"0D)<F5T=7)N("@P*3L*"0D)"0ER971U<FXH,2D["@D)"7T*
M"0EC87-E($Q)4U1/0DHZ"@D)"7=H:6QE("A)4VQI<W0@*&5X<'(Q*2`I"@D)
M"0EI9B`H25-L:7-T("AE>'!R,BD@)B8*"0D)"0D)97%U86P@*&5X<'(Q+3Y#
M14Q,8V%R+"!E>'!R,BT^0T5,3&-A<BD@*2!["@H)"0D)"65X<'(Q(#T@97AP
M<C$M/D-%3$QC9'(["@D)"0D)97AP<C(@/2!E>'!R,BT^0T5,3&-D<CL*"@D)
M"0E](&5L<V4*"0D)"0ER971U<FX@*#`I.PH*"0D)"7)E='5R;B`H97AP<C$@
M/3T@3DE,(#\@97AP<C(@/3T@3DE,(#H@97%U86PH97AP<C$L97AP<C(I*3L*
M"@D)8V%S92!3151/0DHZ"@D)"0EW:&EL92`H25-L:7-T*&5X<'(Q*2`F)B!M
M96UB97(H97AP<C$M/D-%3$QC87(L97AP<C(I*0H)"0D)"65X<'(Q(#T@97AP
M<C$M/D-%3$QC9'(["@H)"0D)<F5T=7)N("AE>'!R,2`]/2!.24PI.PH)"61E
M9F%U;'0Z"@D)"0ER971U<FX@*#`I.PH)?0I]+RIE<75A;"HO"@H):V5R;F-E
M;&P*3&YE<75A;"@I("\J("AN97%L86P@)V5X<'(Q("=E>'!R,BD@*B\*>PH*
M"4-(14-+;&%R9W,@*&YE<75A;'-Y;2P@,BD["@H)<F5T=7)N("AE<75A;"`H
M05)';G5M,2Q!4D=N=6TR*2`_($Y)3"`Z(%145"D["@I]+RH@3&YE<75A;"`J
M+PH*"6ME<FYC96QL"DQN97$@*"D@+RH@*$QN97$@)V5X<'(Q("=E>'!R,BD@
M*B\*>PH*"4-(14-+;&%R9W,@*&YE<7-Y;2P@,BD["@ER971U<FX@*$%21VYU
M;3$@/2!!4D=N=6TR(#\@3DE,(#H@5%14*3L*?0HO*B!,;F5Q("HO"@HO*B`Y
M-B!,87-T<R!A;F0@4V5T<R`J+PH):V5R;F-E;&P*3&%T;VUP("@I("\J("AA
M=&]M/R`G97AP<BD@*B\*>PH):V5R;F-E;&P@87)G(#T@05)';G5M,3L*"@E#
M2$5#2VQA<F=S("AA=&]M<'-Y;2P@,2D["@H)<F5T=7)N("A)4W-Y;2`H87)G
M*2`*"0D)?'P@25-I;G0@*&%R9RD@?'P@"@D)"4E3<F5A;"AA<F<I('Q\($E3
M<W1R*&%R9RD@/R!45%0@.B!.24PI.PH*?2`O*B!,871C>&YP("HO"@H):V5R
M;F-E;&P*3&QI<W1P("@I("\J("AL:7-T/R`G97AP<BD@*B\*>PH):V5R;F-E
M;&P@87)G(#T@05)';G5M,3L*"@E#2$5#2VQA<F=S("AL:7-T<'-Y;2P@,2D[
M"@H)<F5T=7)N*$E3;&ES="`H87)G*2!\?"!A<F<@/3T@3DE,(#\@5%14(#H@
M3DE,*3L*"GT@+RH@3&QI<W1P("HO"@H):V5R;F-E;&P*3'!A:7)P*"D@+RH@
M*'!A:7(_("=E>'!R*2`J+PI["@E#2$5#2VQA<F=S("AP86ER<'-Y;2P@,2D[
M"@H)<F5T=7)N*$E3;&ES="A!4D=N=6TQ*2`_(%145"`Z($Y)3"D["@I]+RH@
M3'!A:7)P("HO"@H):V5R;F-E;&P*3&YU;&QP("@I("\J*&YU;&P_("=E>'!R
M*2`J+PI["@E#2$5#2VQA<F=S("AN=6QL<'-Y;2P@,2D["@H)<F5T=7)N*$%2
I1VYU;3$@/3T@3DE,/R!45%0@.B!.24PI.PH*?2\J(&YU;&QP("HO"@IN
`
end
SHAR_EOF
  (set 20 13 11 03 13 46 01 'apli/list.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/list.c'
if test $? -ne 0
then ${echo} "restore of apli/list.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/list.c': 'MD5 check failed'
       ) << \SHAR_EOF
2e08bf80446ffef362d09942540c5f02  apli/list.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/list.c'` -ne 11786 && \
  ${echo} "restoration warning:  size of 'apli/list.c' is not 11786"
  fi
fi
# ============= apli/iter.c ==============
if test -n "${keep_file}" && test -f 'apli/iter.c'
then
${echo} "x - SKIPPING apli/iter.c (file already exists)"

else
${echo} "x - extracting apli/iter.c (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/iter.c' &&
/* 126 Nonstandard Flow of Control and Iteration */
/* iter.c */
X
#include "kernel.h"
X
X	kerncell
Uprog () /* (prog (...vars...) ...body...) */
{
X	kerncell list = argstk[argtop]; 
X	register kerncell vars, save; 
X	kerncell fox; 
X	register kernsym sym;
X
X	/* 127 9.2 Explicit iteration functions */
X
X	if (list == NIL || (!ISlist (vars = list->CELLcar) && vars != NIL)) 
X		error (progsym, "bad variable list" ,vars);
X
X	save = vars; /* save a pointer to vars */
X
X	while (ISlist (vars) ) { /* Process variable */
X
X		if (ISsym(fox = vars->CELLcar) && !ISconst(CONVsym(fox))) {
X
X			VARpush (sym = CONVsym(fox) , sym->flag, sym->bind);
X
X			sym->flag = VARIABLE;
X
X			sym->bind = NIL; /* in which case it is bound to nil */
X		}
X
X		else if (ISlist(fox)) { /* or a llst: (var init) */
X
X			/* some bugs to fix, since w/o the brace, compile error apppears */
X			if (ISsym(sym = CONVsym(fox->CELLcar)) && !ISconst(sym)) { /* this brace for prevent
X																																		compiler error */
X				VARpush (sym, sym->flag, sym->bind);
X			}
X			else
X				error (progsym, err_var, sym);
X			sym->flag = VARIABLE; /* in which case lt is bound to init */
X			sym->bind = eval (fox->CELLcdr->CELLcar);
X		}
X		else
X			error (progsym, err_var, fox);
X
X		vars = vars->CELLcdr;
X	}
X	fox = catch (prog, _rettagsym, list->CELLcdr) ; /* take care of returns */
X	while (ISlist (save) ) { /* restore varlable bindings, etc. */
X
X		VARpop();
X		save = save->CELLcdr;
X	}
X	return (fox);
}/* Uprog */
X
X	kerncell 
prog (list) /* list lS the body of the prog */
X	register kerncell list;
{
X	kerncell save = list;
X
start: 
X	/* catch go's: */
X
X	if (catch (progaux,_gotagsym, list) == CONVcell( _gotagsym)) {
X
X		for (list=save; ISlist (list) ; list=list->CELLcdr)
X			if (list->CELLcar == golabel) {
X
X				list = list->CELLcdr;
X				goto start;
X			}
X		error (gosym, "no such label", golabel);
X	}
X	else
X
X		return (NIL);
X
} /* prog */
X
/* 128 */
X	kerncell
progaux (list) /* auxilliary */
X	register kerncell list;
{
X	while (ISlist (list)) { /* evaluate each list, but */
X		if (ISlist (list->CELLcar) ) 
X			eval (list->CELLcar);
X
X		list = list->CELLcdr;
X	}
X	return (NIL); 
}/* progaux */
X
X	kerncell 
Ugo() /* (G0 label) */
{
X	if (!ISlist (argstk [argtop ] )) 
X		error (gosym, "label required", 0);
X
X	golabel = argstk [argtop] ->CELLcar;
X
X	throw(_gotagsym,_gotagsym);
X
}/*Uq0*/
X
X	kerncell
Vreturn () /* (return ['result]) */
{
X	CHECKvargs2 (returnsym, 1);
X
X	throw((ARGidx1 == argtop ? NIL : ARGnum1), _rettagsym);
X
} /* vreturn */
X
X
/* 129 9.3 Implicit iteration functions */
X
X	kerncell
Udo () /* (do n exprl   exprn) */
{
X
X	kerncell list = argstk[argtop];
X	kerncell res = NIL;
X	register kerncell fox;
X	register int times;
X
X	if (list->CELLcdr == NIL) 
X		error (dosym, err_args, 0);
X
X	fox = eval (list->CELLcar);
X
X	times = GETint (dosym, fox);
X
X	list = list->CELLcdr;
X
X	while (times-- > 0) {
X
X		fox = list;
X
X		while (ISlist (fox) ) {
X
X			res = eval (fox->CELLcar);
X
X			fox = fox->CELLcdr;
X		}
X	}
X	return (res);
}/* Udo */
X
SHAR_EOF
  (set 20 13 11 03 13 45 16 'apli/iter.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/iter.c'
if test $? -ne 0
then ${echo} "restore of apli/iter.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/iter.c': 'MD5 check failed'
       ) << \SHAR_EOF
0a6b8c778688dc9b8fa45ef1c445e0b8  apli/iter.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/iter.c'` -ne 2970 && \
  ${echo} "restoration warning:  size of 'apli/iter.c' is not 2970"
  fi
fi
# ============= apli/test/test.lisp ==============
if test ! -d 'apli/test'; then
  mkdir 'apli/test'
if test $? -eq 0
then ${echo} "x - created directory apli/test."
else ${echo} "x - failed to create directory apli/test."
     exit 1
fi
fi
if test -n "${keep_file}" && test -f 'apli/test/test.lisp'
then
${echo} "x - SKIPPING apli/test/test.lisp (file already exists)"

else
${echo} "x - extracting apli/test/test.lisp (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/test/test.lisp' &&
X./kern
X
;; ch01
(+ 5 10)
(+ five 10)
X
(ss)
X
(+ 5)
eof
(reset)
(exit)
X
(car '(a b (c d) e))
(car (quote (a b (c d) e)))
X
;;ng
(fun atoms (expr)
X		 (cond [(null? expr) 0]    ;; empty expression.
X					 [(atom? expr) 1]    ;; exactly one atom.
X					 [t (+ (atoms (car expr)) (atoms (cdr expr)))]))
X
X
(atoms '(a b (c d) e))
;;ng
X
(def atoms 
X		 (lam (expr)
X		 (cond [(null? expr) 0] 
X					 [(atom? expr) 1]
X					 [t (+ (atoms (car expr)) (atoms (cdr expr)))])))
X
;; ng
(atoms '(a b (c d) e))
;; ng
X
(atoms (quote (a b (c d) e)))
X
X
(fun incr (expr) (+ 1 expr)) 
(incr 3)
X
((lam (n) (+ n 1)) 3)
X
;; ch10
(void (+ 10 2)) 
X
;; ng
(quote a)
(quote (3 4 5))
X
;; ng
'a
;; ng
X
(kwote (+ 10 20))
;; ng
X
(def square (lam (x) (* x x)))
(square 3) 
X
(fun square (x) (* x x)) 
(square 3) 
(reset)
SHAR_EOF
  (set 20 13 11 03 15 12 01 'apli/test/test.lisp'
   eval "${shar_touch}") && \
  chmod 0644 'apli/test/test.lisp'
if test $? -ne 0
then ${echo} "restore of apli/test/test.lisp failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/test/test.lisp': 'MD5 check failed'
       ) << \SHAR_EOF
4a10b1d5f5e631e5d5d50b79d9f12648  apli/test/test.lisp
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/test/test.lisp'` -ne 779 && \
  ${echo} "restoration warning:  size of 'apli/test/test.lisp' is not 779"
  fi
fi
# ============= apli/test/arith.lisp ==============
if test ! -d 'apli/test'; then
  mkdir 'apli/test'
if test $? -eq 0
then ${echo} "x - created directory apli/test."
else ${echo} "x - failed to create directory apli/test."
     exit 1
fi
fi
if test -n "${keep_file}" && test -f 'apli/test/arith.lisp'
then
${echo} "x - SKIPPING apli/test/arith.lisp (file already exists)"

else
${echo} "x - extracting apli/test/arith.lisp (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/test/arith.lisp' &&
(+ 1 2)
(+ 1.2 3.4)
SHAR_EOF
  (set 20 13 11 03 13 22 50 'apli/test/arith.lisp'
   eval "${shar_touch}") && \
  chmod 0644 'apli/test/arith.lisp'
if test $? -ne 0
then ${echo} "restore of apli/test/arith.lisp failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/test/arith.lisp': 'MD5 check failed'
       ) << \SHAR_EOF
7ebf088a59e15274372ae521365d9631  apli/test/arith.lisp
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/test/arith.lisp'` -ne 20 && \
  ${echo} "restoration warning:  size of 'apli/test/arith.lisp' is not 20"
  fi
fi
# ============= apli/README ==============
if test -n "${keep_file}" && test -f 'apli/README'
then
${echo} "x - SKIPPING apli/README (file already exists)"

else
${echo} "x - extracting apli/README (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/README' &&
It is the source code of the book :
LISP A Portable Implementation
X Sharam Hekmatpour/1989
X
X The license of the code is belonged to the author of the book.
X
Since the original floppy disk is lost, the only way is to type or ocr. 
I used several weeks to ocr and compile the source code.
X
During the process, I learn a lot from the source code and the book.
It was compile under linux with gcc v4.5.1/amd64. I think it should work under 32bits also.
Tcc is not working well, may be some days to fix the bugs. Any improve/fix is welcome.
X
perlawk, 2010-Sep-25
X
SHAR_EOF
  (set 20 10 09 19 22 34 27 'apli/README'
   eval "${shar_touch}") && \
  chmod 0644 'apli/README'
if test $? -ne 0
then ${echo} "restore of apli/README failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/README': 'MD5 check failed'
       ) << \SHAR_EOF
99cb31c982127f1e4b59e5a835a3ec26  apli/README
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/README'` -ne 559 && \
  ${echo} "restoration warning:  size of 'apli/README' is not 559"
  fi
fi
# ============= apli/vec.c ==============
if test -n "${keep_file}" && test -f 'apli/vec.c'
then
${echo} "x - SKIPPING apli/vec.c (file already exists)"

else
${echo} "x - extracting apli/vec.c (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/vec.c' &&
/* vec.c */
/* 115 83 Vector ficnctions */
X
#include "kernel.h"
X
X	kerncell 
Lvector () /* (vector 'dim) */
{
X	kerncell arg = ARGnum1; 
X	kerncell vector, *vec; 
X	register int dim;
X
X	CHECKlargs (vectorsym, 1); 
X
X	if ( !ISint(arg) || (dim = arg->CELLinum) <= 0) 
X		error (vectorsym, "bad dimension", arg); 
X
X	vec = CONVvector(new(sizeof (kerncell) * dim) ); 
X
X	vector = freshcell (); 
X
X	vector->flag = VECTOROBJ; 
X
X	vector->CELLdim = arg; 
X	vector->CELLvec = vec; 
X
X	while (dim-- )  /* initialize all slots to nil */
X		*vec++ = NIL;
X
X	return (vector); 
X
} /* Lvector */
X
X
X
/* 116 Property Lists Association Lists and Vectors */
X	kerncell 
Ustore () /* (stor (vector idx) 'expr) */
{
X
X	kerncell list = argstk [argtop]; 
X	kerncell slot = list->CELLcar; 
X	kerncell vector, index;
X
X	if (!ISlist(slot) || !ISvector(vector = eval(slot->CELLcar))
X			|| !ISint(index = eval(slot->CELLcdr->CELLcar)))
X		error(storesym, "bad slot", slot); 
X
X	if (index->CELLinum < 0 ||
X			index->CELLinum >= vector->CELLdim->CELLinum) 
X		error (storesym, "index out of range", index); 
X	return ( *(vector->CELLvec + index->CELLinum) 
X			= eval (list->CELLcdr->CELLcar) );
X
} /* Ustore */
X
X
kerncell 
X
Ldimension () /* (dimension 'vector) */
{
X
X	kerncell arg = ARGnum1; 
X	kerncell *vec;
X
X	CHECKlargs (dimensionsym, 1); 
X
X	if (! ISvector (arg) ) 
X
X		error (dimensionsym, "non-vector argument", arg); 
X
X	return (arg->CELLdim); 
X
} /* Ldimension */
X
X	kerncell 
Lvectorp () /* (vector? 'expr) */
{
X
X	kerncell arg = ARGnum1;
X
X	CHECKlargs(vectorpsym,1); 
X	return(ISvector (arg) ? TTT: NIL); 
X
} /* vectorp */
X
X
SHAR_EOF
  (set 20 10 09 19 22 18 43 'apli/vec.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/vec.c'
if test $? -ne 0
then ${echo} "restore of apli/vec.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/vec.c': 'MD5 check failed'
       ) << \SHAR_EOF
adbe04b3f663596948c00decb5231010  apli/vec.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/vec.c'` -ne 1574 && \
  ${echo} "restoration warning:  size of 'apli/vec.c' is not 1574"
  fi
fi
# ============= apli/symt.c ==============
if test -n "${keep_file}" && test -f 'apli/symt.c'
then
${echo} "x - SKIPPING apli/symt.c (file already exists)"

else
${echo} "x - extracting apli/symt.c (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/symt.c' &&
/* ------------ symt.c -------------- */
X
#include "kernel.h" 
extern kernsym _tempsym;
X
kernsym symtab [HASHTABSIZE]; /* symbol table */
X
/* initialize the symbol table */
X
initsymtab ()
{
X	register int i;
X
X	for (i=0; i < HASHTABSIZE; ++i) 
X		symtab[i] = NULL; 
X
} /* initsymtab */
X
hash (name) /* the hash function */
X	register char *name;
{
X	register int hashaddr = 0;
X
X	while (*name)
X		hashaddr += *name++;
X	return (hashaddr % HASHTABSIZE);
} /* hash */
X
X	kernsym 
addsym (name) /* add a symbol to the symbol table */
X	char *name;
{
X	int hashaddr = hash(name); 
X	int len; 
X	register kernsym newsym, sym;
X
X	newsym = CONVsym(new(sizeof(struct symbol))); 
X
X	newsym->flag = UNBOUND; 
X
X	newsym->name = new((len = strlen(name)) + 1); 
X	strcpy (newsym->name, name); 
X	*(newsym->name + len) = 0; 
X
X	if ((sym = symtab[hashaddr])== NULL || strcmp(name, sym->name) <0) {
X		/* insert in front of list */
X		symtab [hashaddr] = newsym; 
X		newsym->link = sym;
X	} else if (sym->link == NULL) { /* append to the end of list */ 
X		sym->link = newsym; 
X		newsym->link = NULL; 
X	} else { /* insert in list */ 
X		while( strcmp(name, sym->link->name) > 0 && (sym = sym->link)->link ) 
X			;
X		newsym->link = sym->link; 
X		sym->link = newsym;
X	} 
X	newsym->prop = NIL; 
X
X	return (newsym); 
} /* addsym */
X
X	kernsym 
findsym (name) /* find a symbol in the symbol table */
X	char *name;
{
X	register kernsym sym = symtab [hash(name)]; 
X	int cmp;
X
X	while (sym != NULL && (cmp = strcmp(name, sym->name)) > 0) 
X		sym = sym->link; 
X
X	if (sym == NULL || cmp < 0) /* not found */
X		return (NULL); 
X
X	return (sym); /* found */
} /* findsym */
X
X
X
X	kernsym /* make a symbol object */
mksym (name) 
X	register char *name; 
{
X	kernsym sym = findsym(name) ;
X
X	if ( sym == NULL && ISunbound( sym = addsym(name)) && *name == 'c') { 
X		while (*++name == 'a' || *name == 'd'); /* look for c..r form */ 
X		if (*name == 'r' && *++name == 0) { 
X			sym->flag = LBINARY; 
X			sym->bind = CONVcell (Lcxxr); /* see evalca11 in eval.c */
X		}
X	} 
X	return (sym); 
} /* mksym */
X
X	kernsym 
_mksym (name) /* make a temporary symbol */
X	char *name;
{
X
X	_tempsym->name = name;
X
X	return ( _tempsym); 
X
} /* _mksym */
X
X	kernsym 
newsym (name, flag, bind) /* make a new symbol object */ 
X	char *name; /* asks that symbol is not already in the symbol table */ 
X	byte flag;
X	kerncell bind;
{
X	kernsym sym;
X
X	sym = addsym(name); 
X	sym->flag = flag; 
X	sym->bind = bind ;
X
X	return (sym) ; 
} /* newsym */
X
X
SHAR_EOF
  (set 20 10 09 19 22 18 43 'apli/symt.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/symt.c'
if test $? -ne 0
then ${echo} "restore of apli/symt.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/symt.c': 'MD5 check failed'
       ) << \SHAR_EOF
1d5903a9b5becbcbba92f94380ff0300  apli/symt.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/symt.c'` -ne 2442 && \
  ${echo} "restoration warning:  size of 'apli/symt.c' is not 2442"
  fi
fi
# ============= apli/str.c ==============
if test -n "${keep_file}" && test -f 'apli/str.c'
then
${echo} "x - SKIPPING apli/str.c (file already exists)"

else
${echo} "x - extracting apli/str.c (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/str.c' &&
X
/* 75
X	 $.2 String functions
X	 str.c
X	 */
X
#include "kernel.h"
X
X	kerncell 
Ls_lt () /* (<< 'str1 'str2) */
{
X
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs(s_ltsym, 2); 
X
X	return (strcmp (GETstr (s_ltsym, arg1), 
X
X				GETstr(s_ltsym,arg2)) < 0 ? TTT: NIL);
X
} /* Ls_lt */
X
X	kerncell 
Ls_gt () /* (>> 'strl 'str2) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs(s_gtsym,2); 
X
X	return (strcmp (GETstr (s_gtsym, arg1), 
X				GETstr(s_gtsym,arg2)) > 0 ? TTT: NIL);
X
} /* Ls_gt */
X
X
X	kerncell 
Ls_eq () /* ( ==  'strl 'str2) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs(s_eqsym, 2); 
X
X	return (strcmp (GETstr (s_eqsym, arg1), 
X				GETstr (s_eqsym,arg2) ) == 0 ? TTT: NIL);
X
} /* Ls_eq */
X
X	kerncell 
Lstrcmp () /* (strcmp 'strl 'str2) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs(strcmpsym, 2); 
X
X	return (mkinum(strcmp (GETstr (strcmpsym, arg1),
X					GETstr(strcmpsym, arg2))));
X
} /* Lstrcmp */
X
X
/* 76
X	 Arithmetic, Strings_and SYmbols
X	 */
X	kerncell 
Lnthchar () /* (nthchar 'str 'n) */
{
X
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2; 
X	register char *str; 
X	register int n;
X
X	CHECKlargs(nthcharsym, 2); 
X
X	str = GETstr (nthcharsym, arg1); 
X	n = GETint(nthcharsym, arg2); 
X
X	while (n > 0 && *str != 0) { 
X		--n;
X		++str;
X	}
X	return (mkinum(CONVint(*str))); 
} /* Lnthchar */
X
kerncell 
Lsubstr () /* (substr 'str 'i 'j) */
{
X
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2; 
X	kerncell arg3 = ARGnum3; 
X	register char *str;
X
X	/* 77
X		 5.2 Strfng functions
X		 */
X
X	register int m, n;
X
X	CHECKlargs(substrsym, 3);
X	str = GETstr (substrsym, arg1); 
X	m = GETint (substrsym, arg2); 
X	n = GETint (substrsym, arg3); 
X	while (m > 0 && *str != 0) { /* skip the first m chars_*/
X		--m;
X		++str;
X	}
X	if ((m = 0) >n) /* negative rarxye? */
X		strbuf[0] = 0; 
X
X	else { /* copy the substring to strbuf */
X
X		while (m < n && *str) 
X			strbuf[m++] = *str++; 
X
X		strbuf [m] = 0;
X	} 
X	return (mkstr (strbuf ) ); 
} /* Lsubstr */
X
X
X
X
X	kerncell 
Lstrlen () /* (strlen 'str) */
{
X	kerncell arg = ARGnum1;
X
X	CHECKlargs(strlensym, 1); 
X	return (mkinum(strlen(GETstr (strlensym, arg)))); 
X
} /* Lstrlen */
X
X	kerncell 
Lstrconc () /* (strconc 'strl 'str2) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2; 
X	char *strl, *str2; 
X	int m, n;
X
X	CHECKlargs(strconcsym, 2); 
X	m = strlen (strl = GETstr(strconcsym, arg1) ); 
X	n = strlen(str2 = GETstr(strconcsym,arg2)); 
X
X	if (m+n > STRBUFSIZE) 
X		error (strconcsym, "string overflow", 0); 
X
X	strcpy (strbuf, strl); 
X	strcpy (strbuf, str2); 
X	strbuf [m + n] = 0; 
X
X	return (mkstr (strbuf ) ); 
X
} /* Lstrconc */
X
/* 78 Arithmetic, Strings_and Symbols
*/
X	kerncell 
Lnilstrp () /* (nilstr? 'str) */
{
X	kerncell arg = ARGnum1;
X
X	CHECKlargs(nilstrpsym, 1); 
X
X		return(*(GETstr(nilstrpsym, arg)) == 0 ? TTT: NIL); 
} /* Lnilstrp */
X
X	kerncell 
Lstringp () /* (string? 'str) */
{
X	CHECKlargs(stringpsym, 1); 
X		return(ISstr(ARGnum1) ? TTT: NIL); 
X
} /* Lstringp */
X
X
X
SHAR_EOF
  (set 20 10 09 19 22 18 43 'apli/str.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/str.c'
if test $? -ne 0
then ${echo} "restore of apli/str.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/str.c': 'MD5 check failed'
       ) << \SHAR_EOF
ac2e03b08891d0f4a7662d97f494572d  apli/str.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/str.c'` -ne 2993 && \
  ${echo} "restoration warning:  size of 'apli/str.c' is not 2993"
  fi
fi
# ============= apli/set.c ==============
if test -n "${keep_file}" && test -f 'apli/set.c'
then
${echo} "x - SKIPPING apli/set.c (file already exists)"

else
${echo} "x - extracting apli/set.c (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/set.c' &&
/* 97 */
X
/* Set.C */
X
#include "kernel.h"
X
X	kerncell remrep (kerncell); /* remove repetitions frcm set */
X
X	kerncell 
Lconvset () /* (convset 'list) */
{
X	register kerncell arg = ARGnum1;
X
X	kerncell res = NIL;
X
X	CHECKlargs (convsetsym, 1);;
X
X	CHECKlist (convsetsym, arg);
X
X	while (ISlist (arg) ) {
X
X		if (!member (arg->CELLcar, arg->CELLcdr) )
X			mkset (arg->CELLcar, res);
X
X		arg = arg->CELLcdr;
X	}
X	return (res);
X
} /* convset */
X
X
/* 98 */
kerncell
Ldconvset ( ) /* (*convset ' list) */
{
X	register kerncell arg = ARGnum1;
X
X		kerncell res;
X
X		CHECKlargs (dconvsetsym, 1);
X
X		CHECKlist (dconvsetsym, arg);
X
X		while (member (arg->CELLcar, arg->CELLcdr) ) 
X			arg = arg->CELLcdr;
X				res = arg;
X
X	while (ISlist (arg->CELLcdr) )  {
X
X		if (member(arg->CELLcdr->CELLcar, arg->CELLcdr->CELLcdr) ) 
X			arg->CELLcdr = arg->CELLcdr->CELLcdr;
X
X		else {
X
X				arg->flag = SETOBJ;
X				arg = arg->CELLcdr;
X		}
X	}
X	if (ISlist (arg) ) 
X		arg->flag = SETOBJ;
X
X	return (res); 
}/* Ldconvset */
X
kerncell 
Lconvlist () /* (convlist 'set) */
{
X	register kerncell arg = ARGnum1;
X
X	kerncell res = NIL;
X
X	CHECKlargs (convlistsym, 1);
X
X	CHECKlist (convlistsym, arg);
X
X	/* 99 */
X
X	while (ISlist (arg)) {
X		res = mkcell (arg->CELLcar, res);
X
X		arg = arg->CELLcdr;
X	}
X	return (res);
} /* Lconvlist */
X
X	kerncell 
Ldconvlist () /* (*C0nvlist '8et) */
{
X	register kerncell arg = ARGnum1;
X
X	kerncell res = arg;
X
X	CHECKlargs (dconvlistsym, 1);
X
X	CHECKlist (dconvlistsym, arg);
X
X	while (ISlist (arg) ) {
X
X		arg->flag = LISTOBJ;
X
X		arg = arg->CELLcdr;
X	}
X	return (res);
} /* Ldconvllst */
X
kerncell
Veset () /* (eset 'expr1 ... exprn) */
{
X	register int idx = ARGidx1;
X
X	register kerncell res = NIL;
X
X	while (idx < argtop) 
X		res = mkset (argstk[idx++] ,res);
X
X	return (remrep (res) );
} /* Veset */
X
X	kerncell
remrep (set) /* remove repetitions frcm set */
X	register kerncell set;
{
X	kerncell res;
X
X	while (member (set->CELLcar, set->CELLcdr) )
X		set = set->CELLcdr;
X
X	res = set;
X
X	while (ISlist (set->CELLcdr) ) {
X
X		if (member (set->CELLcdr->CELLcar, set->CELLcdr->CELLcdr) ) 
X			set->CELLcdr = set->CELLcdr->CELLcdr;
X
X		else 
X			set = set->CELLcdr;
X	}
X	return (res);
} /* remrep */
X
X
/* 100 */
X	kerncell
Uiset () /* (iset expr (varl doml exprl exprfl) */
{
X	kerncell list = argstk[argtop];
X
X	if (checkdoms (list->CELLcdr->CELLcar) )
X		error (isetsym, err_dom, 0);
X
X	return (iset (list->CELLcar,
X				list->CELLcdr->CELLcar, 
X				list->CELLcdr->CELLcdr) );
X
} /* Uiset */
X
X	kerncell 
iset (gen, doms,  body) /* lmplicii' set construction */
X	kerncell gen, doms, body;
{
X	kernsym sym = CONVsym(doms->CELLcar);
X
X	register kerncell dom = eval (doms->CELLcdr->CELLcar);
X
X	register kerncell list;
X
X	kerncell tmp, res = NIL;
X
X	VARpush (sym, sym->flag, sym->bind);
X
X	sym->flag = VARIABLE;
X
X	doms = doms->CELLcdr->CELLcdr;
X
X	if (!ISlist(dom) && dom != NIL) 
X		error (isetsym, err_dom, 0);
X
X	while (ISlist(dom)) {
X		sym->bind = dom->CELLcar;
X
X		/* 101 */
X
X		if (ISlist (doms) )
X			res = unionaux(iset (gen,doms,body) ,res);
X
X		else{
X			list= body;
X			while (ISlist (list)) {
X				tmp = eval (list->CELLcar);
X				list = list->CELLcdr;
X			}
X			if (tmp != NIL)
X				res = mkset (eval (gen) , res);
X		}
X		dom = dom->CELLcdr;
X	}
X	VARpop();
X	return(ISlist(doms) ? res : remrep(res));
}/* 1Set */
X
X	kerncell
unionaux (set1, set2) /* unlon or setl and set2 */
X	register kerncell set1, set2;
{
X	while (ISlist (set1) ) {
X
X		if (!member(set1->CELLcar, set2) ) 
X			set2 = mkset (set1->CELLcar, set2);;
X
X		set1 = set1->CELLcdr;
X	}
X	return ( set2);
} /* unlonaux */
X
X	kerncell
Vunion () /* (union ' setl setn) */
{
X	register int idx = ARGidx1;
X	register kerncell argi;
X	kerncell res;
X
X	if (idx == argtop)
X		return (NIL);
X
X	if (idx+1 == argtop)
X		return (ARGnum1);
X
X	res = ARGnum1;
X
X	CHECKlist (unionsym, res);
X
X	while (++idx < argtop) {
X		argi = argstk [idx];
X
X		CHECKlist (unionsym, argi);
X
X		while (ISlist (argi) ) {
X
X			if (!member(argi->CELLcar, res) )
X				res = mkset(argi->CELLcar, res);
X
X			argi = argi->CELLcdr;
X		}
X	}
X	return (res);
}/* Vunion */
X
X
/* 102 */
X
X	kerncell 
Vintsec () /* (intsec ' setl setn) */
{
X	register int idx = ARGidx1;
X	register kerncell argi;
X	kerncell tmp, res;
X
X	if (idx == argtop )
X		return (NIL);
X
X	if (idx+1 == argtop)
X		return (ARGnum1);
X
X	tmp=ARGnum1;
X
X	CHECKlist (intsecsym, tmp);
X
X	while (++idx < argtop ) {
X
X		argi = argstk [idx];
X
X		CHECKlist (intsecsym, argi);
X		res =NIL;
X
X		while (ISlist (argi)) {
X
X			if (member(argi->CELLcar,tmp) )
X				res = mkset(argi->CELLcar, res);
X
X			argi = argi->CELLcdr;
X		}
X		tmp = res;
X	}
X	return (res);
X
} /* Vintsec */
X
/* 103 */
X	kerncell
Ldiff () /* (diff 'set1 'set2) */
{
X	register kerncell arg1 = ARGnum1;
X	kerncell arg2 = ARGnum2;
X	kerncell res = NIL;
X
X	CHECKlargs (diffsym, 2);
X	CHECKlist (diffsym, arg1);
X	CHECKlist (diffsym, arg2);
X
X	while (ISlist (arg1)) {
X
X		if (!member(arg1->CELLcar, arg2) )
X			res = mkset (arg1->CELLcar, res);
X
X		arg1 = arg1->CELLcdr;
X	}
X	return (res);
} /* Ldiff */
X
X	kerncell
Lsubset () /* (subset 'set1 'set2) */
{
X	register kerncell arg1 = ARGnum1;
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs (subsetsym,-2);
X	CHECKlist (subsetsym, arg1);
X	CHECKlist (subsetsym, arg2);
X
X	while (ISlist (arg1) ) {
X
X		if (!member(arg1->CELLcar,arg2) ) 
X			return (NIL);
X
X		arg1 = arg1->CELLcdr;
X	}
X	return (TTT);
X
} /* LSubSet */
X
SHAR_EOF
  (set 20 10 09 19 22 18 43 'apli/set.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/set.c'
if test $? -ne 0
then ${echo} "restore of apli/set.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/set.c': 'MD5 check failed'
       ) << \SHAR_EOF
ab9c444703c1f8af14454ea6671d80a5  apli/set.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/set.c'` -ne 5265 && \
  ${echo} "restoration warning:  size of 'apli/set.c' is not 5265"
  fi
fi
# ============= apli/prop.c ==============
if test -n "${keep_file}" && test -f 'apli/prop.c'
then
${echo} "x - SKIPPING apli/prop.c (file already exists)"

else
${echo} "x - extracting apli/prop.c (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/prop.c' &&
/* 112 
Property Lists, Association Lists and Vectors
*/
X
#include "kernel.h"
X
X	kerncell 
Lputprop () /* (putprop 'sym 'value 'property) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2; 
X	kerncell arg3 = ARGnum3; 
X	register kerncell plist;
X
X	CHECKlargs (putpropsym, 3); 
X
X	CHECKsym1 (putpropsym, arg1); 
X
X	plist = CONVsym(arg1)->prop; 
X
X	while (ISlist (plist) ) {
X
X		if (equal (plist->CELLcar, arg3) ) 
X			return (plist->CELLcdr->CELLcar = arg2); 
X
X	plist = plist->CELLcdr->CELLcdr; 
X	}
X	CONVsym(arg1)->prop = mkcell (arg3,mkcell (arg2, CONVsym(arg1)->prop) ); 
X
X	return (arg2); 
X
} /* Lputprop */
X
X
X	kerncell 
Lremprop () /* (remprop 'sym 'property) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2; 
X	register kerncell plist; 
X	kerncell res;
X
X	CHECKlargs (rempropsym,2); 
X
X	CHECKsym1 (rempropsym, arg1); 
X
X	plist = CONVsym(arg1) ->prop; 
X
X	if (equal(plist->CELLcar, arg2) ) {
X		CONVsym(arg1) ->prop = plist->CELLcdr->CELLcdr; 
X
X		return (plist);
X	}
X	else { 
X		plist = plist->CELLcdr; 
X
X		while (ISlist (plist->CELLcdr) ) {
X			if (equal (plist->CELLcdr->CELLcar, arg2) ) {
X
X				res = plist->CELLcdr; 
X
X				plist->CELLcdr = plist->CELLcdr->CELLcdr->CELLcdr; 
X
X				return (res);
X			}
X			plist = plist->CELLcdr->CELLcdr;
X		}
X	}
X	return (NIL); 
} /* Lrenprcp */
X
/* 113 8.1 Property lists
*/
X
X	kerncell 
Lget () /* {get 'sym 'property) */
{
X	register kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs (getsym, 2); 
X
X	CHECKsym1 (getsym, arg1); 
X
X	arg1 = CONVsym(arg1) ->prop; 
X	while (ISlist (arg1) ) {
X
X		if (equal (arg1->CELLcar, arg2) ) 
X
X				return (arg1->CELLcdr->CELLcar); 
X
X				arg1 = arg1->CELLcdr->CELLcdr;
X	}
X	return (NIL); 
} /* Lremprop */
X
kerncell 
Lplist () /* (plist 'sym) */
{
X	kerncell arg = ARGnum1;
X
X	CHECKlargs (plistsym, 1); 
X
X	CHECKsym1 (plistsym, arg); 
X
X	return (CONVsym(arg) ->prop); 
} /* Lplist */
X
X	kerncell 
Lsetplist () /* (setplist 'sym 'plist} */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs (setplistsym, 2); 
X
X	CHECKsym1 (setplistsym, arg1); 
X
X	CHECKlist (setplistsym, arg2); 
X
X	return (CONVsym(arg1) ->prop = arg2); 
} /* setplist */
X
X
X
/* 114 Property Lists, Association Lists and Vectors
*/
X	kerncell 
Lassoc () /* (assoc 'key 'alist) */
{
X	kerncell arg1 = ARGnum1; 
X	register kerncell arg2 = ARGnum2;
X
X	CHECKlargs (assocsym, 2); 
X	CHECKlist (assocsym, arg2); 
X
X	while (ISlist (arg2) ) { 
X		if ( !ISlist (arg2->CELLcar) ) 
X	error(assocsym, "bad alist element", arg2->CELLcar);
X
X				if (equal (arg1, arg2->CELLcar->CELLcar) ) 
X					return (arg2->CELLcar); 
X
X		arg2 = arg2->CELLcdr;
X	}
X	return (NIL); 
X
} /* Lassoc */
X
X	kerncell 
Lassq () /* (assq 'key 'enlist) */
{
X	kerncell arg1 = ARGnum1; 
X	register kerncell arg2 = ARGnum2;
X
X		CHECKlargs(assqsym, 2); 
X	CHECKlist (assqsym, arg2); 
X
X	while (ISlist(arg2)) { 
X
X		if ( !ISlist (arg2->CELLcar) ) 
X			error(assqsym, "bad alist element", arg2->CELLcar);
X
X		if (arg1 == arg2->CELLcar->CELLcar) 
X			return (arg2->CELLcdr);
X
X		arg2 = arg2->CELLcdr;
X	}
X	return(NIL); 
} /* Lassq */
X
SHAR_EOF
  (set 20 10 09 19 22 18 43 'apli/prop.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/prop.c'
if test $? -ne 0
then ${echo} "restore of apli/prop.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/prop.c': 'MD5 check failed'
       ) << \SHAR_EOF
6d5a2a50ca3e030cad16b410f603f7a1  apli/prop.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/prop.c'` -ne 3014 && \
  ${echo} "restoration warning:  size of 'apli/prop.c' is not 3014"
  fi
fi
# ============= apli/map.c ==============
if test -n "${keep_file}" && test -f 'apli/map.c'
then
${echo} "x - SKIPPING apli/map.c (file already exists)"

else
${echo} "x - extracting apli/map.c (text)"
  sed 's/^X//' << 'SHAR_EOF' | uudecode &&
begin 600 apli/map.c
M+RH@,3,P($YO;G-T86YD87)D($9L;W<@;V8@0V]N=')O;"!A;F0@271E<F%A
M;VX@*B\*+RH@;6%P+F,@*B\*"B-I;F-L=61E(")K97)N96PN:"(*"@EK97)N
M8V5L;`I6;6%P82`H*2`O*B`H;6%P82`G9G5N(.*`F&QI<W1L(&QI<W1N*2`J
M+PI["@EK97)N8V5L;"!F=6X@/2!!4D=N=6TQ.PH*"6EN="!A<F<Q(#T@05)'
M:61X,2`K(#$["@H):6YT(&%R9VX@/2!A<F=T;W`["@H)<F5G:7-T97(@:6YT
M(&D["@H):V5R;F-E;&P@<F5S(#T@87)G<W1K6V%R9S%=.PH*"4-(14-+=F%R
M9W,Q("AM87!A<WEM+"`R*3L@+RH@870@;&5A<W0@,B!A<F=S(')E<75L<F5D
M("HO"@H)9F]R("AI/6%R9S$[(#$@/"!A<F=N.R`K*VDI(`H)"4-(14-+;&ES
M="`H;6%P87-Y;2P@87)G<W1K(%MI72`I.PH*"4%21W!U<V@@*&9U;BD["@H)
M9F]R*#L[*2![("\J(&UA<"!O=F5R('1H92`Q,7-T("A3*2`J+PH*"0EI9B`H
M87)G<W1K6V%R9S%=(#T]($Y)3"D@"@D)"6)R96%K.PH*"0EF;W(@*&D]87)G
M,3L@,2`\(&%R9VX[("LK:2D@>R`O*B!P<F5P87)E(&%R9W,@*B\*"@D)"4%2
M1W!U<V@@*&%R9W-T:R!;:5T@+3Y#14Q,8V%R*3L*"@D)"6%R9W-T:R!;:5T@
M/3T@87)G<W1K6VE=("T^0T5,3&-D<CL*"0E]"@D)05)'<'5S:"`H0T].5F-E
M;&P@*&%R9VX@*R`Q*2`I.PH*"0E68V%L;"`H*3L@+RH@87!P;'D@=&AE(&9U
M;F-T:6]N("HO"@H)"6%R9W1O<"`](&%R9VXK,3L@+RH@:V5E<"!F=6X@;VX@
M=&AE('-T86-K("HO"@E]"@EA<F=T;W`@/2!A<F=N.R`O*B!R97-T;W)E(&%R
M9W1O<"`J+PH*"7)E='5R;B`H<F5S*3L*?2`O*B!6;6%P82`J+PHO*B`Q,S$@
M.2XS($EM<&QI8VET(&ET97)A=6]N9G5N8W1I;VYS"BHO"@H):V5R;F-E;&P@
M"E9M87!C87(@*"D@+RH@56UP8V%R("=F=6X@)S$Q(%-T;"!*:7-T;BD@*B\*
M>PH):V5R;F-E;&P@9G5N(#T@05)';G5M,3L*"6ME<FYC96QL(')E<R`]($Y)
M3#L*"6EN="!A<F<Q(#T@05)':61X,2`K(#$["@EI;G0@87)G;B`](&%R9W1O
M<#L*"@ER96=I<W1E<B!I;G0@:3L*"@E#2$5#2W9A<F=S,2`H;6%P8V%R<WEM
M+"`R*3L@+RH@870@;&5A<W0@,B!A<F=S(')E<75L<F5D("HO"@H)9F]R("AI
M/6%R9S$[(&D@/"!A<F=N.R`K*VDI(`H)"4-(14-+;&ES="`H;6%P8V%R<WEM
M+"!A<F=S=&L@6VE=("D["@H)05)'<'5S:"`H9G5N*3L*"@EF;W(@*#L[*2![
M("\J(&UA<"!O=F5R('1H92!L:7-T*',I("HO"@H)"6EF("AA<F=S=&L@6V%R
M9S%=(#T]($Y)3"D@"@D)"6)R96%K.PH*"0EF;W(@*&D]87)G,3L@,2`\(&%R
M9VX[("LK:2D@>R`O*B!0<F5P87)E(&%R9W,@*B\@"@D)"4%21W!U<V@@*&%R
M9W-T:R!;:5T@+3Y#14Q,8V%R*3L*"@D)"6%R9W-T:R!;:5T@/2!A<F=S=&L@
M6VE=+3Y#14Q,8V1R.PH)"7T*"0E!4D=P=7-H*$-/3E9C96QL*&%R9VX@*R`Q
M*2`I.PH)"7)E<R`](&UK8V5L;"A68V%L;"@I("QR97,I.R`O*B!A<'!L>2!T
M:&4@9G5N8W1I;VX@*B\*"0EA<F=T;W`@/2!A<F=N*S$[("\J(&ME97`@9G5N
M(&]N('1H92!S=&%C:R`J+PH*"7T*"6%R9W1O<"`](&%R9VX[("\J(')E<W1O
M<F4@87)G=&]P("HO"@ER971U<FX@*&1R979E<G-E("AR97,I*3L*"GTO*B!6
M;6%P8V%R("HO"@H):V5R;F-E;&P@"E9M87!D*"D@+RH@;6%P82`G9G5N("=L
M:7-T;"!L:7-T;BD@*B\*>PH):V5R;F-E;&P@9G5N(#T@05)';G5M,3L*"6EN
M="!A<F<Q(#T@05)':61X,2L@,3L*"6EN="!A<F=N(#T@87)G=&]P.PH)<F5G
M:7-T97(@:6YT(&D["@EK97)N8V5L;"!R97,@/2!A<F=S=&L@6V%R9S%=.PH*
M"4-(14-+=F%R9W,Q("AM87!D<WEM+"`R*3L@+RH@870@;&5A<W0@,B!A<F=S
M(')E<75L<F5D("HO"@H)9F]R("AI/6%R9S$[(#$@/"!A<F=N.R`K*VDI(`H)
M"4-(14-+;&ES="`H;6%P9'-Y;2P@87)G<W1K(%MI72`I.PH*"4%21W!U<V@@
M("AF=6XI.PH*"69O<B`H.SLI('L@+RH@;6%P(&]V97(@=&AE(&QI<W0@*',I
M("HO"@H)"6EF("AA<F=S=&L@6V%R9S%=(#T]($Y)3"D@"@D)"6)R96%K.PH*
M"0EF;W(@*&D]87)G,3L@,2`\(&%R9VX[("LK:2D@>R`O*B!P<F5P87)E(&%R
M9W,@*B\*"0D)05)'<'5S:"`H87)G<W1K(%MI72`I.PH*"0D)87)G<W1K(%MI
M72`](&%R9W-T:R!;:5T@+3Y#14Q,8V1R.PH)"7T*"0E!4D=P=7-H("A#3TY6
M8V5L;"`H87)G;B`K(#$I("D["@H)"59C86QL("@I.R`O*B!A<'!L>2!T:&4@
M9G5N8W1I;VX@*B\*"@D)87)G=&]P(#T@87)G;B`K(#$[("\J(&O#J65P(&9U
M;B!O;B!T:&4@<W1A8VL@*B\*"@E]"@EA<F=T;W`@/2!A<F=N.R`O*B!R97-T
M;W)E(&%R9W1O<"`J+PH)<F5T=7)N("AR97,I.PI]+RH@5FUA<&0@*B\*"B\J
M(#$S,B!.;VYS=&%N9&%R9"!&;&]W(&]F($-O;G1R;VP@86YD($ET97)A=&EO
M;B`J+PH):V5R;F-E;&P*5FUA<&-D<B`H*2`O*B`H;6%P8V1R("<@9G5N(.*`
MF"!L:7-T;"!L:7-T;BD@*B\*>PH*"6ME<FYC96QL(&9U;B`]($%21VYU;3$[
M"@EK97)N8V5L;"!R97,@/2!.24P["@EI;G0@87)G,2`]($%21VED>#$@*R`Q
M.PH):6YT(&%R9VX@/2!A<F=T;W`["@H)<F5G:7-T97(@:6YT(&D["@H)0TA%
M0TMV87)G<S$@*&UA<&-D<G-Y;2P@,BD[("\J(&%T(&QE87-T(#(@87)G<R!R
M97%U;')E9"`J+PH*"69O<B`H:3UA<F<Q.R!I(#P@87)G;CL@*RMI*0H)"4-(
M14-+;&ES="`H;6%P8V1R<WEM+"!A<F=S=&L@6VE=("D["@H)05)'<'5S:"`H
M9G5N*3L*"@EF;W(@*#L[*2![("\J(&UA<"!O=F5R('1H92!L:7-T*',I("HO
M"@D):68@*&%R9W-T:R!;87)G,5T@/3T@3DE,("D@"@D)"6)R96%K.PH*"0EF
M;W(@*&D]87)G,3L@:2`\(&%R9VX[("LK:2D@>R`O*B!P<F5P87)E(&%R9W,@
M*B\*"@D)"4%21W!U<V@@*&%R9W-T:R!;:5T@*3L*"@D)"6%R9W-T:R!;:5T@
M/2!A<F=S=&L@6VE=("T^0T5,3&-D<CL*"0E]"@D)05)'<'5S:"`H0T].5F-E
M;&P@*&%R9VX@*R`Q*2`I.PH*"0ER97,@/2!M:V-E;&P@*%9C86QL*"D@+"!R
M97,I.R`O*B!A<'!L>2!T:&4@9G5N8W1I;VX@*B\*"@D)87)G=&]P(#T@87)G
M;BLQ.R`O*B!K965P(&9U;B!O;B!T:&4@<W1A8VL@*B\*"7T*"6%R9W1O<"`]
M(&%R9VX[("\J(')E<W1O<F4@87)G=&]P("HO"@H)<F5T=7)N("AD<F5V97)S
<92`H<F5S*2`I.PH*?2\J(%9M87!C9'(@*B\*"@H)
`
end
SHAR_EOF
  (set 20 10 09 19 22 18 43 'apli/map.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/map.c'
if test $? -ne 0
then ${echo} "restore of apli/map.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/map.c': 'MD5 check failed'
       ) << \SHAR_EOF
2193261ceb6cc5ccd489630423ba0641  apli/map.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/map.c'` -ne 3088 && \
  ${echo} "restoration warning:  size of 'apli/map.c' is not 3088"
  fi
fi
# ============= apli/logic.c ==============
if test -n "${keep_file}" && test -f 'apli/logic.c'
then
${echo} "x - SKIPPING apli/logic.c (file already exists)"

else
${echo} "x - extracting apli/logic.c (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/logic.c' &&
/* Condionals and logic
X	 105 */
/*
X	 logic.c
X	 */
#include "kernel.h"
X
X	kerncell 
Ucond () /* (cond --clause1 ... --clausen-- ) */
{
X
X	register kerncell list  = argstk [ argtop]; 
X	register kerncell clause; 
X
X	kerncell obj;
X
X	while (ISlist (list) ) { 
X
X		clause = list->CELLcar; 
X
X		CHECKlist(condsym, clause); 
X
X		if ((obj = eval(clause->CELLcar) ) != NIL) {
X
X			while (ISlist(clause = clause->CELLcdr) ) 
X
X				obj = eval (clause->CELLcar); 
X
X			return (obj);
X		}
X		list = list->CELLcdr;
X	}
X	return (NIL); 
X
} /* Ucond */
X
X	kerncell 
Lnot () /* (not 'expr) */
{
X
X	CHECKlargs (notsym, 1); 
X
X	return(ARGnum1 == NIL ? TTT : NIL); 
} /* Lnot */
X
X
X	kerncell 
Uand () /* (and exprl ... exprn ) */
{
X	register kerncell list = argstk[argtop]; 
X	kerncell obj = NIL;
X
X	while (ISlist (list) ) {
X
X		if ((obj = eval (list->CELLcar) ) == NIL)
X			return (NIL); 
X
X		list = list->CELLcdr;
X	}
X
X	return (obj); 
} /* Uand */
X
X
/* 106 Conditionals and Logic
*/
X	kerncell 
Uor () /* (or expr1 ... exprn) */
{
X	register kerncell list = argstk [argtop]; 
X	kerncell obj;
X
X	while (ISlist (list) ) {
X
X		if ((obj = eval(list->CELLcar) ) != NIL) 
X			return (obj); 
X
X		list = list->CELLcdr;
X	}
X	return (NIL); 
X
} /* Uor */
X
X	kerncell 
Limply () /* ( > 'expr1 'expr2) */
{
X	CHECKlargs (implysym, 2); 
X	return(ARGnum1 == NIL || ARGnum2 != NIL ? TTT : NIL); 
X
} /* Limply */
X
X	kerncell 
Lequiv () /* (< > 'expr1 'expr2) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs (equivsym,2); 
X
X	return (arg1 == arg2 || 
X			arg1 != NIL && arg2 !=  NIL ? TTT: NIL);
X
} /* Lequiv */
X
X
/* 107 Condirionah and logic */
X
X	kerncell 
Uall () /* (all (var1 dcxal ... varn domn) expr1 ... exprn) */
{
X	kerncell list = argstk [argtop];
X
X	if (list == NIL || checkdoms (list->CELLcar) ) 
X		error (allsym, err_dom,0); 
X
X	return (all (list->CELLcar, list->CELLcdr) ); 
} /* Uall */
X
X
checkdoms (doms) /* check domain designators */
X	register kerncell doms;
{
X	if (! ISlist (doms) ) 
X		return (1); 
X
X	do { 
X
X		if (! ISsym(doms->CELLcar) ||  ISconst (doms->CELLcar) ||  
X				! ISlist (doms = doms->CELLcdr) ) 
X			return (1); 
X
X	} while (ISlist (doms = doms->CELLcdr) ); 
X
X	return (0); 
X
} /* checkdoms */
X
X	kerncell 
all (doms,body) /* universal quantifier */
X	kerncell doms, body;
{
X
X	kernsym sym = CONVsym(doms->CELLcar); 
X	register kerncell dom = eval(doms->CELLcdr->CELLcar); 
X	register kerncell list; 
X
X	kerncell res = TTT;
X
X	VARpush (sym, sym->flag, sym->bind); 
X	sym->flag = VARIABLE;
X
X	/* 108 conditionals and Logic
X	*/
X
X	doms = doms->CELLcdr->CELLcdr; 
X
X	if (!ISlist(dom) && dom != NIL) 
X		error (allsym, err_dom, 0); 
X
X	while (ISlist (dom) ) { 
X
X		sym->bind = dom->CELLcar; 
X
X		if (ISlist (doms) ) 
X			res = all(doms, body); 
X
X		else { 
X			list = body ;
X
X			while (ISlist (list) ) {
X				res = eval (list->CELLcar); 
X				list = list->CELLcdr; 
X			}
X		}
X		if (res == NIL) 
X			break; 
X
X		dom = dom->CELLcdr;
X	}
X	VARpop(); 
X
X	return(res); 
X
} /* all */
X
X	kerncell 
Uexist () /* (exist (var1 dc' [vari dc'.] ) expr ) */
{
X	kerncell list = argstk [argtop];
X
X	if (list == NIL ||  checkdoms (list->CELLcar) ) 
X		error (existsym, err_dom, 0); 
X
X	return  (exist ( list->CELLcar, list->CELLcdr ) ) ; 
} /* Uexist */
X
/* 109 */
X
X	kerncell 
exist (doms, body) /* existential quantifier */ 
X	kerncell doms, body; 
{
X	kernsym sym = CONVsym(doms->CELLcar) ; 
X	register kerncell dom = eval(doms->CELLcdr->CELLcar);
X	register kerncell list; 
X	kerncell res =  NIL;
X
X	VARpush (sym, sym->flag, sym->bind); 
X	sym->flag = VARIABLE; 
X
X	doms = doms->CELLcdr->CELLcdr; 
X	if (! ISlist (dom) && dom != NIL) 
X		error (existsym, err_dom, 0); 
X
X	while (ISlist (dom) ) { 
X
X		sym->bind = dom->CELLcar; 
X
X		if (ISlist (doms) ) 
X			res = exist (doms,body); 
X
X		else {
X			list = body; 
X
X			while (ISlist (list) ) {
X
X				res = eval (list->CELLcar); 
X
X				list = list->CELLcdr;
X			}
X		} 
X
X		if (res != NIL) 
X			break; 
X
X		dom = dom->CELLcdr;
X	}
X	VARpop(); 
X
X	return (res); 
} /* exist */
X
kerncell 
X
Uone () /* (one (var1 doml deflt) exprl ... exprn) */
{
X	register kerncell list = argstk[argtop]; 
X	register kerncell dom; 
X
X	kerncell body, deflt, res; 
X
X	kernsym sym;
X
X	if (list == NIL ||  !ISlist(dom = list->CELLcar) ||  
X			! ISsym(sym = CONVsym(dom->CELLcar) ) ||  ISconst (sym) ) 
X		error (onesym, err_dom,0); 
X
X	deflt = eval(dom->CELLcdr->CELLcdr->CELLcar); 
X	VARpush (sym, sym->flag, sym->bind); 
X
X	sym->flag = VARIABLE; 
X
X	dom = eval(dom->CELLcdr->CELLcar); 
X
X	if (! ISlist (dom) && dom != NIL) 
X		error (onesym, err_dom, 0); 
X
X	body = list->CELLcdr; 
X
X	while (ISlist (dom) ) {
X
X		/* 110 Conditionals and Logic */
X
X		sym->bind = dom->CELLcar; 
X		list = body; 
X
X		while (ISlist(list)) {
X			res = eval(list->CELLcar); 
X			list = list->CELLcdr;
X		}
X		if (res != NIL) 
X			break; 
X
X		dom = dom->CELLcdr;
X	}
X	VARpop (); 
X
X	return (ISlist (dom) ? dom->CELLcar: deflt); 
} /* one */
X
X
X
X
X
X
X
X
X
X
X
X
X
X
X
SHAR_EOF
  (set 20 10 09 19 22 18 43 'apli/logic.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/logic.c'
if test $? -ne 0
then ${echo} "restore of apli/logic.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/logic.c': 'MD5 check failed'
       ) << \SHAR_EOF
ad94a3c0751fa82b812ffd49e8c084fd  apli/logic.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/logic.c'` -ne 4836 && \
  ${echo} "restoration warning:  size of 'apli/logic.c' is not 4836"
  fi
fi
# ============= apli/kern.c ==============
if test -n "${keep_file}" && test -f 'apli/kern.c'
then
${echo} "x - SKIPPING apli/kern.c (file already exists)"

else
${echo} "x - extracting apli/kern.c (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/kern.c' &&
/*
kern.c 
*/
#include "kernel.h" 
main () 
{
initialize (); 
topexec (); 
} /* main */
X
X
X
SHAR_EOF
  (set 20 10 09 19 22 18 43 'apli/kern.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/kern.c'
if test $? -ne 0
then ${echo} "restore of apli/kern.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/kern.c': 'MD5 check failed'
       ) << \SHAR_EOF
08db03171ebb5dd811c2e2ec1807526b  apli/kern.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/kern.c'` -ne 91 && \
  ${echo} "restoration warning:  size of 'apli/kern.c' is not 91"
  fi
fi
# ============= apli/kcomp.c ==============
if test -n "${keep_file}" && test -f 'apli/kcomp.c'
then
${echo} "x - SKIPPING apli/kcomp.c (file already exists)"

else
${echo} "x - extracting apli/kcomp.c (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/kcomp.c' &&
/* 148 kcomp.c */
X
#include "kernel.h"
#include "stdlib.h"
X
typedef struct snode { /* symbol/string node */
X
X	char *str; /* string/symbol name */
X	kernsym sym; /* denoting variable */
X	struct snode *left, *right; /* child nodes */
X
} *stree;
X
typedef struct inode { /* integer node */
X
X	int inum; /* integer value */
X	kernsym sym; /* denoting variable */
X	struct inode *left, *right; /* child nodes */
X
} *itree;
X
typedef struct rnode { /* real node */
X
X	real rnum; /* real value */
X	kernsym sym; /* denoting Variable */
X	struct rnode *left, *right; /* child nodes */
X
} *rtree;
X
stree symtree = NULL; /* symbol tree */
stree strtree = NULL; /* string tree */
itree inumtree = NULL; /* integer tree */
rtree rnumtree = NULL; /* real tree */
kernsym lastsym; /* last symbol */ 
X
char *source, *target; /* source and target file names */
X
main (argn, argv) /* main */
X	int argn;
X	char *argv[];
{
X
X	int len;
X	// char *malloc();
X
X	kerncell compile();
X
X	/* 149 */
X	if (argn <= 1) {
X		fprintf (stderr, "no source file\n");
X		exit (1);
X	}
X
X	if ((len = strlen(source = argv[1])) < 3 || /* check source */
X			source[len-2] != '.' || source[len-1] != 'k') {
X
X		fprintf (stderr, "bad source file\n");
X
X		exit (1);
X	}
X
X	if (argn >= 3) {
X
X		if ((len = strlen (target = argv[2])) < 3 || /* check target */
X				target [len-2] != '.' || target[len-1] != 'c') {
X
X			fprintf (stderr, "bad target file\n");
X
X			exit (1);
X		}
X	}
X	/* default tarqet */
X
X	else {
X
X		target = malloc (len + 1);
X
X		strcpy (target, source);
X
X		target [len-1] = 'c';
X
X		target [len] = 0;
X
X		initialize ();
X	}
X	if (catch(compile, _toptagsym, 1) == NIL) {
X
X		fprintf (stderr, "compilation aborted\n");
X
X		exit (1);
X	}
X	exit(0);
X
}/* main */
X
X	kerncell
compile () /* compile  */
{
X
X	kerncell compaux ();
X
X	return (caperr(compaux,NIL, 1) );
X
} /* compile */
X
/* 150 */
X
X	kerncell
compaux() /* auxiliary */
{
X	kerncell schan, tchan;
X	register kerncell form, forms = NIL;
X	kerncell  procform();
X
X	schan = openaux (source, "r"); /* open source file */
X
X	tchan = openaux (target, "w"); /* open target file .*/
X
X	while (eval (readaux(schan->CELLchan, 0)) != CONVcell (eofsym));
X
X	closechan (schan->CELLchan); /* close source file */
X
X	schan = openaux (source, "r"); /* re-open source file */
X
X	while ((form = readaux(schan->CELLchan, 0)) != CONVcell(eofsym));
X
X	forms = mkcell(procform(form, 1) ,forms);
X
X	closechan (schan->CELLchan); /* close source file */
X
X	forms = dreverse (forms);
X
X	bufprint (PRINC, tchan->CELLchan, /* produce object code: */
X			"#include \" /user/hekmat/kern/kernel.h\"\n");
X
X	bufprint (PRINC, tchan->CELLchan, "auxillary ()\n{\n");
X
X	gensyms (symtree, tchan->CELLchan); /* generate symbols */
X
X	genstrs (strtree, tchan->CELLchan); /* generate strings */
X
X	geninums (inumtree, tchan->CELLchan); /* generate :Lntegers */
X
X	genrnums (rnumtree,tchan->CELLchan); /* generate reals */
X
X	gencode (forms , tchan->CELLchan); /* qenerate code for the forms */
X
X	bufprint (PRINC, tchan->CELLchan, "}\n");
X
X	bufprint (PRINC, tchan->CELLchan, /* main functlon */
X			"main() {initialize(); auxiliary(); topexec();}\n");
X
X	closechan (tchan->CELLchan);
X
X	return (NIL);
} /* compaux */
X
/* 151 */
X
X	kerncell
procform (form, expd) /* process a fonn */
X	register kerncell form;
X	int expd;
{
X	kerncell convert (), head;
X	stree   addstr ();
X	itree addinum();
X	rtree addrnum();
X
X	if (ISsym(form)) {
X		symtree = addstr (symtree, CONVsym( form) ->name);
X		return (CONVcell (lastsym) );
X	}
X
X	if (ISstr (form) ) {
X		strtree = addstr (strtree, form->CELLstr);
X		return (CONVcell (lastsym) );
X	}
X	if (ISint (form)) {
X		inumtree = addinum(inumtree, form->CELLinum);
X		return (CONVcell (lastsym) );
X	}
X	if (ISreal (form) ) {
X		rnumtree = addrnum(rnumtree, form->CELLrnum);
X		return (CONVcell (lastsym) );
X	}
X
X	if ((form->CELLcar) == CONVcell(quotesym) )
X		return (convert (form, 0) );
X
X	if (expd &&
X			((ISfun(form->CELLcar) &&
X				((head = CONVsym(form->CELLcar)->bind)->CELLcar)
X				== CONVcell(mlamsym)) ||
X			 (ISlist(head = form->CELLcar) &&
X				(head->CELLcar == CONVcell(mlamsym)))))
X		procform (expand (head, form, 0) , expd);
X
X	return (convert (form, expd) );
} /* procform */
X
/* 152 */
X
X	kerncell 
convert (form, expd) /* convert a form */
X	kerncell form;
X	int expd;
{
X	if (form = NIL) 
X		return (NIL);
X
X	return (mkcell (procform (form->CELLcar, expd), 
X				convert (form->CELLcdr, expd) ) );
} /* convert */
X
X	stree
addstr (tree, str) /* add string/ symbol to string/ symbol tree */
X	stree tree;
X	char *str;
{
X	kernsym gensym();
X	//	char *malloc();
X	int cmp;
X
X	if (tree == NULL) {
X
X		if ((tree = (struct snode *)malloc(sizeof (struct snode))) == NULL){
X			fprintf (stderr, "insufficient memory\n");
X			exit(1);
X		}
X		tree->str = str;
X		tree->sym = lastsym = gensym();
X		tree->left = tree->right = NULL;
X	}
X	else if ((cmp - strcmp(str,tree->str)) < 0)
X		tree->left = addstr (tree->left, str);
X
X	else if(cmp>0)
X		tree->right = addstr (tree->right, str);
X
X	else
X		lastsym = tree->sym;
X
X	return (tree);
}/*addstr*/
X
/* 153 */
X
X	itree 
addinum (tree, inum) /* add integer to integer tree */
X
X	itree tree;
X
X	int inum; 
{
X	kernsym gensym();
X
X	/* char *malloc (); */
X
X	if (tree == NULL) {
X
X		if ((tree= (struct inode *)malloc(sizeof(struct inode))) == NULL) {
X			fprintf (stderr, "insufficient memory\n");
X			exit(1);
X		}
X		tree->inum = inum;
X		tree->sym = lastsym = gensym();
X		tree->left =  tree->right = NULL;
X	}
X	else if (inum < tree->inum)
X		tree->left = addinum(tree->left,inum);
X
X	else if (inum > tree->inum)
X		tree->right = addinum(tree->right, inum);
X
X	else
X		lastsym = tree->sym;
X
X	return (tree);
} /* addinum */
X
X	rtree
addrnum (tree, rnum) /*'add real to real tree */
X	rtree tree;
X	real rnum;
{
X	kernsym gensym();
X	/* char *malloc (); */
X
X	if (tree == NULL) {;
X
X		if ((tree= (struct rnode *)malloc(sizeof (struct rnode))) == NULL) {
X			fprintf (stderr, "insufficient memory\n");
X			exit (1);
X		}
X		tree->rnum = rnum;
X		tree->sym = lastsym = gensym();
X		tree->left = tree->right = NULL;
X	}
X	else if (rnum < tree->rnum)
X		tree->left = addrnum(tree->left,rnum);
X
X	else if (rnum > tree->rnum)
X		tree->right = addrnum(tree->right,rnum);
X
X	else
X		lastsym = tree->sym;
X
X	return (tree);
} /* addrnum */
X
X
/* 154 */
X	kernsym 
gensym () /* generate a new symbol */
{ 
X	static int num = 0;
X
X	sprintf (strbuf, "s%04d" , num++ );
X
X	return (mksym(strbuf) );
X
}/* gensym */
X
X
gencode (forms, chan) /* generate code for forms */
X	kerncell forms;
X	iochan chan;
{
X	while (ISlist (forms)) {
X
X		bufprint (PRINC, chan, "eval (");
X		gencells (forms->CELLcar, chan);
X
X		bufprint (PRINC, chan, ");\n");
X
X		forms = forms->CELLcdr;
X	}
}/* genoode */
X
gencells (form, chan) /* qenerate cells for fonn */ 
X	kerncell form;
X	iochan chan;
{
X	if (ISlist (form) ) {
X		bufprint (PRINC, chan, "mkcell(");
X
X		gencells (form->CELLcar, chan);
X
X		bufprint (PRINC, chan, ",");
X
X		gencells (form->CELLcdr, chan);
X
X		bufprint (PRINC, chan, "> ");
X	}
X	else
X		printaux (PRINC, form, chan);
} /* gencells */
X
/* 155 */
X
gensyms (tree, chan) /* generate code for making symbols */
X	stree tree; 
X	iochan chan;
{
X	if (tree != NULL) {
X		bufprint (PRINC, chan, "kernsym %s = ",tree->sym->name);
X
X		bufprint (PRINC, chan, "mksym(\"%s\") i\n" , tree->str);
X
X		gensyms (tree->left, chan);
X
X		gensyms (tree->right, chan);
X	}
} /* gensyms */
X
X
genstrs (tree, chan) /* generate code for making strings */
X	stree tree; 
X	iochan chan;
{
X	if (tree != NULL) {
X
X		bufprint (PRINC, chan, "kerncell %s = ", tree->sym->name);
X
X		bufprint (PRINC, chan, "mkstr (\"%s\");\n", tree->str);
X		genstrs (tree->left , chan);
X
X		genstrs (tree->right, chan);
X	}
} /* genstrs */
X
X
geninums (tree, chan) /* generate code for making :integers */
X	itree tree;
X	iochan chan ;
{
X	if (tree != NULL) {
X		bufprint (PRINC, chan, "kerncell %s = " , tree->sym->name);
X
X		bufprint (PRINC, chan, "mkinum (%1d);\n", tree->inum);
X		geninums (tree->left, chan);
X		geninums (tree->right, chan);
X	}
}/* genlrrums */
X
/* 156 */
X
genrnums (tree, chan) /* generate code for makinq reals */
X	rtree tree;
X	iochan chan;
{
X	if (tree != NULL) {
X
X		bufprint(PRINC, chan, "kerncell %s = ",tree->sym->name);
X		bufprint (PRINC, chan, "mkrnum (%f);\n" , tree->rnum);
X
X		genrnums (tree->left, chan);
X
X		genrnums (tree->right, chan);
X	}
} /* genrnums */
X
SHAR_EOF
  (set 20 10 09 19 22 18 43 'apli/kcomp.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/kcomp.c'
if test $? -ne 0
then ${echo} "restore of apli/kcomp.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/kcomp.c': 'MD5 check failed'
       ) << \SHAR_EOF
301453a05f1a81f7294b067075fedd8a  apli/kcomp.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/kcomp.c'` -ne 8205 && \
  ${echo} "restoration warning:  size of 'apli/kcomp.c' is not 8205"
  fi
fi
# ============= apli/globals.c ==============
if test -n "${keep_file}" && test -f 'apli/globals.c'
then
${echo} "x - SKIPPING apli/globals.c (file already exists)"

else
${echo} "x - extracting apli/globals.c (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/globals.c' &&
/* g1obals.c */
#include "kernel.h"
char *err_args    = "incorrect number of arguments";
char *err_pars    = "bad parameter(s)";
char *err_evalstk = "evaluation stack overflow";
char *err_varstk  = "variable stack overflow";
char *err_argstk  = "arguxrent stack overflow" ;
char *err_catstk  = "catch stack overflow";
char *err_memory  = "memory space exhausted";
char *err_int 	  = "integer number expected" ;
X
/* p167 */
X
char *err_real 	= "real nurber expected";
char *err_num 	= "number expected";
char *err_str 	= "string expected";
char *err_chan1 = "channel expected";;
char *err_chan2 = "bad channel";
char *err_sym1 	= "symbol expected" ;
char *err_sym2 	= "non-constant syrrbol expected";
char *err_pair 	= "non-nil list expected";
char *err_list 	= "list expected";
char *err_var 	= "bad variable"; 
char *err_dom		= "bad domain designator";
X
kerncell catres; 												/* catch result pair */
kerncell golabel;												 /* label specified by go in prog */
kerncell _tempstr; 
kerncell read_and_eval, top_lev_call, top_lev_tags; 
kerncell inchan, outchan, errchan;
iochan _inchan, _outchan, _errchan;
char  strbuf [STRBUFSIZE+2] ;						 /* string buffer */
struct variable varstk[VARSTKSIZE+1] ;	 /* variable stack */
kerncell evalstk [EVALSTKSIZE+1];				 /* evaluation stack (also cell stack) */
X
kerncell argstk[ARGSTKSIZE+1]; 						/* argument stack */
int evaltop = -1; 												/* top of evaluation stack */
int celltop = EVALSTKSIZE; 								/* top of cell stack */
int vartop 	= -1;													 /* top of variable stack */
int argtop 	= -1;													 /* top of argument stack */
int _argtop = -1;													 /* argtop for the last vlam */
int (* org_interrupt) () ;								 /* original interrupt handler */
X
kernsym /* internals: */
_bquotesym, _commasym, _atsym,
_toptagsym, _errtagsym, _rettagsym, _gotagsym, _tempsym, _cxxrsym;
X
kernsym /* constants: */ 
nil, ttt, eofsym, inchansym, outchansym, errchansym;
X
kernsym /* unbounds: */
lamsym, vlamsym, ulamsym, mlamsym;
X
kernsym /* eval.c: */
evalsym, callsym, applysym;
X
kernsym /* io.c: */ 
opensym, closesym, flushsym, readsym, printsym, princsym, tabsym,
X	terprisym, prlensym, iobufsym, chanpsym, ppsym;
X
kernsym /* arith.c: */
plussym, minussym, timessym, divsym, sumsym, prodsym, remsym,
X	powsym, incsym, decsym, abssym, negsym, intsym,realsym,
X	a_ltsym, a_gtsym, a_lesym,a_gesym, a_eqsym, a_nesym,
X	numberpsym, intpsym, realpsym;
X
kernsym /* str.c: */
s_ltsym, s_gtsym, s_eqsym, strcmpsym, nthcharsym, substrsym,
X	strlensym, strconcsym, nilstrpsym, stringpsym;
X
kernsym  /* sym.c: */
symnamesym, synonymsym, gensymsym, concatsym, bindingsym,
X
X	/* p.168 */
X
X	/* Appendix A */
X
X	symbolpsym, boundpsym;
X
X	kernsym /* list.c: */ 
X	carsym, cdrsym, nthelemsym, nthpairsym, rplacasym, rplacdsym,
X	lastelemsym, lastpairsym, conssym, listsym, lengthsym, concsym,
X	dconcsym, removesym, dremovesym, substsym, dsubstsym, reversesym,
X	dreversesym, membersym, memqsym, equalsym, nequalsym, eqsym, neqsym,
X	atompsym, listpsym, pairpsym, nullpsym;
X
kernsym /* set.c: */ 
convsetsym, dconvsetsym, convlistsym, dconvlistsym, 
X	esetsym, isetsym, unionsym, intsecsym, diffsym, subsetsym;
X
kernsym /* logic.c: */ 
notsym, andsym, orsym, condsym, implysym, equivsym,
X	allsym, existsym, onesym; 
X
kernsym /* prop.c: */
putpropsym, rempropsym, getsym, plistsym, setplistsym,
X	assocsym, assqsym; 
X
kernsym /* vec.c: */ 
vectorsym, storesym, dimensionsym, vectorpsym;
X
kernsym /* flow.c: */
catchsym, throwsym, caperrsym, errorsym, toplevelsym, 
X	resetsym, exitsym; 
X
kernsym /* iter.c: */
progsym, gosym, returnsym, dosym;
X
kernsym /* map.c: */
mapcarsym, mapasym, mapcdrsym, mapdsym;
X
kernsym /* misc.c: */ 
voidsym, quotesym, kwotesym, defsym, funsym, argsym, letsym, 
X	setsym, setqsym, constsym, sssym, loadsym, shellsym;
X
SHAR_EOF
  (set 20 10 09 19 22 18 43 'apli/globals.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/globals.c'
if test $? -ne 0
then ${echo} "restore of apli/globals.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/globals.c': 'MD5 check failed'
       ) << \SHAR_EOF
1f5dd1b3cb2b752a411c792c50201df6  apli/globals.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/globals.c'` -ne 3790 && \
  ${echo} "restoration warning:  size of 'apli/globals.c' is not 3790"
  fi
fi
# ============= apli/cellt.c ==============
if test -n "${keep_file}" && test -f 'apli/cellt.c'
then
${echo} "x - SKIPPING apli/cellt.c (file already exists)"

else
${echo} "x - extracting apli/cellt.c (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/cellt.c' &&
/* p21 */
#include "kernel.h"
X
extern kerncell _tempstr;
extern kernsym symtab []; 
kerncell celltab [CELLTABSIZE];   /* cell table */ 
int celltabsize = CELLTABSIZE;   	/* cell table size */ 
int celltabidx = 0;     					/* current index to cell table */ 
int blockidx;     								/* index to a cell in current block */ 
int phase1 = 1;     							/* block allocation phase */ 
kerncell blockptr;     						/* block pointer */ 
kerncell inumblock;     					/* small inum block */ 
kerncell freelist = NULL;     		/* used only after garbage collection */
kerncell collectgarb();
X
X	char * 
new (size) /* allocates 'size' bytes */
X	int size; 
{
X	char *res; /* *malloc(); */
X
X	if ((res = malloc(size) )  ==   NULL) {
X		phase1 = 0; 	   /* terminate block allocation phase */
X		celltabsize = celltabidx;  /* freeze celltab's growth */
X		collectgarb(); 
X		if ((res = (char *)malloc(size)) == NULL ) 	/* try again */
X			faterr (err_memory);
X	}
X
X	return (res); 
} /* new */
X
X
X
/* p22 */
initcelltab ()   /* initialize the cell table */
{
X	int range = SMALLINTHIGH - SMALLINTLOW; 
X	register int blkidx; 
X	register kerncell blkptr;
X
X	if (range >= BLOCKSIZE) 
X		faterr("BLOCKSIZE is too small" ); 
X
X	if ( (celltab [celltabidx] = blkptr = inumblock = 
X				(kerncell) malloc (sizeof (struct cell) * BLOCKSIZE) ) == NULL)
X		faterr (err_memory); 
X
X	for (blkidx=0; blkidx < range; ++blkidx) {        /* small inums */
X		blkptr->flag = INTOBJ; 
X		(blkptr++)->CELLinum = SMALLINTLOW + blkidx;
X	}
X
X	blockidx = blkidx;
X	blockptr = blkptr + 1; 
} /* initcelltab */
X
X
/* p23 */
X	kerncell
freshcell ()  /* returns a fresh cons-cell */
{
X	static kerncell freecell; 
X	if (phase1) { /* in this phase storage is still available */ 
X		if (blockidx++ < BLOCKSIZE) { /* get it fran current block */ 
X			blockptr->CELLcdr = NIL; 
X			return (CELLpush(blockptr++) );
X		}
X		if (++celltabidx < celltabsize) {  /* create a new block */ 				      
X			if ((celltab[celltabidx] = blockptr = (kerncell) 
X						malloc(sizeof(struct cell) * BLOCKSIZE)) == NULL) {
X				celltabsize = celltabidx; 			
X				goto phase2;      /* run out of storage > phase2 */
X			}											 
X			blockidx = 1; 
X			blockptr->CELLcdr = NIL; 
X			return (CELLpush (blockptr++));
X		}
phase2:  /* in this phase storage is exhausted */											
X		phase1 = 0;
X	}
X	if (freelist == NULL) 
X		if (collectgarb() == NULL) /* try garbage collecting */ 
X			faterr ("cons-cell storage exhausted"); 
X	freecell = freelist; 
X	freelist = freelist->CELLcdr; 
X	freecell->CELLcdr = NIL; 
X	return (CELLpush ( freecell) ); 
} /* freshcell */
X
X
/* p24 Storage Management */
X
/* collect garbage */
X	kerncell 
collectgarb ()
{
X	register int i, cidx; 
X	register kernsym entry; 
X	register kerncell blockptr;
X
X	/**** mark ****/ 
X	for (i<0; i < HASHTABSIZE; ++i) {
X		entry = symtab [i]; 
X		while (entry) {               /* mark every symbol's refs. */
X			if (ISnotbinary (entry) ) 
X				mark (entry->bind); /* mark bindings */
X			mark (entry->prop); /* mark property lists */
X			entry = entry->link;
X		}
X	}
X
X	for (i=0; i <= vartop; ++i) /* mark bindings of vars on var stack */
X		mark (varstk [i] .bind);
X	for (i=0; i <= argtop; ++i) { /* mark args on arg stack */
X		if (CONVint(argstk[i]) > ARGSTKSIZE) /* ignore indices */
X			mark (argstk [i] );
X	}
X	for (i=celltop; i < EVALSTKSIZE; ++i) /* mark cells on cell stack */ 
X		mark (evalstk [i] );
X
X	/**** sweep ****/ 
X	blockptr = celltab [0]; 
X	for (i=0; i < BLOCKSIZE; ++i) /* unmark small integers */
X		(blockptr++) ->flag &= MASK7; 
X	for (cidx=1; cidx < celltabsize; ++cidx) { /* sweep */
X		blockptr = celltab [cidx]; 
X		for (i=0; i < BLOCKSIZE; ++i) {
X			if (ISmarked(blockptr)) /* cell in use? */
X				(blockptr++)->flag &= MASK7; /* unmark it */
X			else { /* cell not in use */
X				blockptr->CELLcdr = freelist; /* free it */
X				freelist = blockptr; 
X				switch (blockptr->flag) {
X					case STROBJ: free (blockptr->CELLstr); 
X											 break; 
X					case CHANOBJ: closechan(blockptr->CELLchan); 
X												break; 
X					case VECTOROBJ: free (blockptr->CELLvec); 
X													break;
X				}
X				++blockptr;
X			} 
X		} 
X	} 
X	return (freelist); 
} /* collectgarb */
X
X
X
/* p26 */
X
mark (obj) /* mark cells that are in use */
X	register kerncell obj;
{
X
X	if ( 
X			ISsym(obj) 
X			|| 
X			ISmarked(obj) 
X		 ) /* symbols need no marking */
X		return; 
X	switch (obj->flag) {
X		case VECTOROBJ: 
X			{ register int dim = obj->CELLdim->CELLinum;
X				register kerncell *vec = obj->CELLvec; 
X				obj->flag != MARK;  /* mark vector */
X				obj->CELLdim->flag != MARK;     /* mark vector dimension */
X				while (dim-- ) mark(*vec++);      /* mark vector elements */
X				return;
X			}
X		case LISTOBJ: /* sets are treated as lists */
X		case SETOBJ: 
X			while (ISlist (obj)) { 
X				obj->flag != MARK; /* mark this cell */ 
X				mark (obj->CELLcar);   /* mark list element */
X				obj = obj->CELLcdr;
X			}
X			if (obj != NIL) /* dotted pair'? */
X				mark (obj); 
X			return;
X		default: /* mark elementary object */ 
X			obj->flag != MARK;
X			return;
X	}
} /* mark */
X
X	kerncell 
mkinum(inum) 
X	int inum;
{
X	/* make an integer object */
X	kerncell obj;
X	if (inum >= SMALLINTLOW && inum < SMALLINTHIGH) 
X		return (inumblock + inum - SMALLINTLOW); 
X	obj = freshcell(); 
X	obj->flag = INTOBJ; 
X	obj->CELLinum = inum; 
X	return (obj); 
} /* mkinum */
X
X
X
/* p27 */
X	kerncell 
mkrnum(rnum) 
X	real rnum;
{
X	/* make a real object */
X	kerncell obj = freshcell ();
X	obj->flag = REALOBJ; 
X	obj->CELLrnum = rnum; 
X	return (obj); 
} /* mkrnum */
X
X	kerncell 
mkstr (str) /* make a string object */
X	char *str;
{
X	kerncell obj = freshcell(); 
X	char *newstr; 
X	int len = strlen(str);
X	newstr = new(len + 1); 
X	strcpy (newstr, str ); 
X	*(newstr + len) = 0; 
X	obj->flag = STROBJ; 
X	obj->CELLstr = newstr; 
X	return (obj); 
} /* mkstr */
X
X	kerncell 
_mkstr (str) 
X	char *str;
{
X	/* make a temporary string object */
X	_tempstr->CELLstr = str; 
X	return ( _tempstr); 
} /* mkstr */
X
X
/* p28 */
X	kerncell 
mkchan (chan) /* make a channel object */
X	iochan chan; 
{
X
X	kerncell obj = freshcell ();
X	obj->flag = CHANOBJ; 
X	obj->CELLchan = chan;
X	return (obj); 
} /* mkchan */
X
X	kerncell 
mkcell (head, tail) /* make a new cons-cell */
X	kerncell head, tail;
{
X
X	kerncell obj = freshcell();
X	obj->flag = LISTOBJ; 
X	obj->CELLcar = head; 
X	obj->CELLcdr = tail; 
X	return (obj); 
} /* mkcell */
X
X	kerncell 
mkset (head, tail) /* make a new cons-cell */
X	kerncell head, tail; 
{
X
X	kerncell obj = freshcell();
X	obj->flag = SETOBJ; 
X	obj->CELLcar = head;
X	obj->CELLcdr = tail;
X	return (obj); 
} /* mkset */
SHAR_EOF
  (set 20 10 09 19 22 18 43 'apli/cellt.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/cellt.c'
if test $? -ne 0
then ${echo} "restore of apli/cellt.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/cellt.c': 'MD5 check failed'
       ) << \SHAR_EOF
35ae0743768222234ecff982b5263c99  apli/cellt.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/cellt.c'` -ne 6494 && \
  ${echo} "restoration warning:  size of 'apli/cellt.c' is not 6494"
  fi
fi
# ============= apli/arith.c ==============
if test -n "${keep_file}" && test -f 'apli/arith.c'
then
${echo} "x - SKIPPING apli/arith.c (file already exists)"

else
${echo} "x - extracting apli/arith.c (text)"
  sed 's/^X//' << 'SHAR_EOF' > 'apli/arith.c' &&
/* 67
5.1 Arithmetic functions
arith.c
*/
X
#include "kernel.h"
X
kerncell 
Lplus () /* (+ 'num1 'num2) */
{
X	kerncell tos = argstk[argtop];
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs (plussym, 2); 
X	if (ISint(arg1) || ISreal(arg1) ) { 
X		if (ISint (arg2) ) 
X			return(ISint(arg1) ? mkinum(arg1->CELLinum + arg2->CELLinum) 
X					: mkrnum(arg1->CELLrnum + arg2->CELLinum) );
X
X		if (ISreal (arg2) ) 
X			return(ISint (arg1) ? mkrnum(arg1->CELLinum + arg2->CELLrnum) 
X					: mkrnum(arg1->CELLrnum + arg2->CELLrnum) ) ;
X
X		arg1 = arg2;
X	}
X	error(plussym, err_num, arg1); 
} /* Lplus */
X
X	kerncell 
Lminus () /* (- 'num1 'num2) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs(minussym, 2); 
X
X	if (ISint(arg1) || ISreal(arg1) ) { 
X
X		if (ISint (arg2) ) 
X			return (ISint (arg1) ? mkinum(arg1->CELLinum - arg2->CELLinum) 
X					: mkrnum(arg1->CELLrnum - arg2->CELLinum) );
X
X		if (ISreal (arg2) ) 
X			return (ISint (arg1) ? mkrnum(arg1->CELLinum - arg2->CELLrnum) 
X					: mkrnum(arg1->CELLrnum - arg2->CELLrnum) );
X
X		arg1 = arg2;
X	} 
X	error (minussym, err_num, arg1); 
X
} /* Lminus */
X
X	kerncell 
Ltimes () /* (* 'num1 'num2) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs(timessym, 2);
X	if (ISint (arg1 = ARGnum1) ||  ISreal (arg1) ) {
X
X		if (ISint(arg2 = ARGnum2)) 
X			return(ISint(arg1) ? mkinum(arg1->CELLinum * arg2->CELLinum) 
X					: mkrnum(arg1->CELLrnum * arg2->CELLinum) );
X
X		/*
X			 Arthmettc Stnngs and Symbols
X			 68
X			 */
X
X		if (ISreal (arg2) ) 
X			return(ISint (arg1) ? mkrnum(arg1->CELLinum * arg2->CELLrnum) 
X					: mkrnum(arg1->CELLrnum * arg2->CELLrnum) ) ;
X
X		arg1 = arg2;
X	}
X	error(timessym, err_num, arg1); 
X
} /* Ltimes */
X
X	kerncell 
Ldiv () /* (/ 'num1 'num2) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs (divsym, 2); 
X
X	if (ISint(arg1) ||  ISreal(arg1) ) {
X		if (ISint(arg2) ) 
X			return (ISint (arg1) ? mkinum(arg1->CELLinum / arg2->CELLinum) 
X					: mkrnum(arg1->CELLrnum / arg2->CELLrnum) );
X
X		if (ISreal(arg2)) 
X			return (ISint (arg1) ? mkrnum(arg1->CELLinum / arg2->CELLinum) 
X					: mkrnum(arg1->CELLrnum / arg2->CELLrnum) );
X
X		arg1 = arg2;
X	}
X	error (divsym, err_num, arg1); 
X
}						/* ldiv */
X
X	kerncell 
Vsum () /* (sum 'num1 ... 'numb) */
{
X
X	double sum = 0 ; 
X
X	int has_real = 0 ; 
X	register int idx = ARGidx1; 
X	register kerncell arg;
X
X	while (idx < argtop) { 
X		if (ISint(arg = argstk[idx++])) 
X			sum += arg->CELLinum;
X		else if (ISreal(arg) ) { 
X			has_real = 1; 
X			sum += arg->CELLrnum;
X		}
X		else 
X			error(sumsym, err_num, arg);
X	}
X	return(has_real ? mkrnum((real) sum) 
X			: mkinum((int) sum));
X
} /* Vsum */
X
/* 69
X	 5.1 Arithmetic functions
X	 */
X
X	kerncell 
Vprod () /* (prod 'num1 ... 'numn} */
{
X
X	double prod = 1; 
X
X	int has_real = 0; 
X	register int idx = ARGidx1; 
X	register kerncell arg;
X
X	while (idx < argtop) {
X
X		if (ISint (arg = argstk [idx++] ) ) 
X			prod *= arg->CELLinum; 
X		else if (ISreal (arg) ) { 
X			has_real = 1; 
X			prod *= arg->CELLrnum;
X		}
X		else 
X			error (prodsym, err_num, arg);
X	}
X	return (has_real ? mkrnum((real) prod) 
X			: mkinum( (int) prod) );
X
} /* prod */
X
X	kerncell 
Lrem () /* (% 'znum1 'znum2) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs (remsym, 2); 
X	return (mkinum(GETint(remsym, arg1) % GETint (remsym, arg2) ) ); 
X
} /* Lrem */
X
X
/* 70
X	 Arithmetic, Strings und Symbols
X	 */
X
X	kerncell 
Lpow () /* (^ 'num1 'num2) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2; 
X	double pow ();
X
X	CHECKlargs (powsym, 2); 
X
X	return (mkrnum( (real) pow ( (double) GETnum(powsym, arg1), 
X
X					(double) GETnum(powsym, arg2) ) ) );
X
} /* Lpow */
X
X	kerncell 
Linc() /* (++ 'inurn) */
{
X	kerncell arg = ARGnum1;
X
X	CHECKlargs (incsym, 1); 
X	return (mkinum(GETint (incsym, arg) + 1) ); 
X
} /* Linc */
X
X	kerncell 
Ldec () /* (-- 'inum) */
{
X	kerncell arg = ARGnum1;
X
X	CHECKlargs(decsym, 1); 
X
X	return(mkinum(GETint (decsym, arg) - 1) ) ;
} /* Ldec */ 
X
/* 71 */
X	kerncell 
Labs () /* (abs 'num) */
{
X
X	kerncell arg = ARGnum1;
X
X	CHECKlargs (abssym, 1); 
X
X	if (ISint (arg) ) 
X		return (arg->CELLinum >= 0 ? arg : mkinum(-arg->CELLinum) ); 
X
X	if (ISreal (arg) ) 
X		return (arg->CELLrnum >= 0 ? arg: mkrnum(-arg->CELLrnum) ); 
X
X	error (abssym, err_num, arg); 
X
} /* Labs */
X
X
X	kerncell 
Lneg () /* (neg 'inurn) */
{
X	kerncell arg = ARGnum1;
X	CHECKlargs (negsym, 1); 
X
X	if (ISint (arg) ) 
X		return (mkinum(-arg->CELLinum)); 
X
X	if (ISreal(arg) ) 
X		return (mkrnum(-arg->CELLrnum) ); 
X
X	error (negsym, err_num, arg); 
} /* Lneg */
X
X	kerncell 
Lint () /* (int 'num) */
{
X	kerncell arg = ARGnum1; 
X	double floor ();
X
X	CHECKlargs (intsym, 1); 
X	return (mkinum( (int) floor(GETreal(intsym, arg) + 0.0) ) ); 
X
} /* Lint */
X
/* 72 */
X	kerncell 
Lreal () /* (real 'inurn) */
{
X
X	kerncell arg = ARGnum1;
X	CHECKlargs (realsym, 1); 
X
X	return(mkrnum((real) (GETint(realsym,arg) + 0.0))); 
} /* Lreal */
X
X	kerncell 
La_lt () /* (< 'num1 'num2) */
{
X
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs (a_ltsym, 2); 
X	return(GETnum(a_ltsym,arg1) < GETnum(a_ltsym,arg2) ? TTT: NIL); 
X
} /* La_lt */
X
X	kerncell 
La_gt () /* (> 'num1 'num2) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs (a_gtsym,2); 
X
X	return(GETnum(a_gtsym, arg1) > GETnum(a_gtsym, arg2) ? TTT : NIL);
} /* La_gt */ 
X
/* 73
X	 5.1 Arithmetic functions
X	 */
X
X	kerncell 
La_le () /* (< 'num1 'num2) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs (a_lesym, 2); 
X	return(GETnum(a_lesym, arg1) <= GETnum(a_lesym, arg2) ? TTT: NIL); 
X
} /* La_le */
X
kerncell 
X
La_ge () /* (>= 'num1 'num2) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs (a_gesym, 2); 
X
X	return(GETnum(a_gesym, arg1) >= GETnum(a_gesym, arg2) ? TTT: NIL); 
X
} /*La_ge*/
X
X	kerncell 
La_eq () /* (= 'num1 'num2) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs (a_eqsym, 2); 
X	return (GETnum(a_eqsym, arg1) == GETnum(a_eqsym,arg2) ? TTT: NIL);
X
}/* La eq */
X
X
X	kerncell 
La_ne () /* (/= 'num1 'num2) */
{
X	kerncell arg1 = ARGnum1; 
X	kerncell arg2 = ARGnum2;
X
X	CHECKlargs (a_nesym, 2); 
X
X	return(GETnum(a_nesym,arg1) != GETnum(a_nesym,arg2) ? TTT: NIL); 
} /*La_ne */
X
X
X	kerncell 
Lnumberp () /* (number? 'expr) */
{
X	kerncell arg = ARGnum1;
X
X	CHECKlargs( numberpsym, 1);
X
X	return(ISint(arg) ||  ISreal(arg) ? TTT: NIL) ; 
} /* Lnumberp */
X
/* 74 
X	 Arithmetic, Strings and Symbols
X	 */
X
X
X	kerncell
Lintp () /* (int? 'expr) */
{
X	CHECKlargs (intpsym, 1); 
X	return(ISint(ARGnum1) ? TTT: NIL); 
X
} /* Lintp */
X
/* (real? 'expr) */
X
X	kerncell
Lrealp () /* (real? 'expr) */
{
X	CHECKlargs (realpsym, 1); 
X	return(ISreal(ARGnum1) ? TTT: NIL); 
X
} /* Lrealp */
X
SHAR_EOF
  (set 20 10 09 19 22 18 43 'apli/arith.c'
   eval "${shar_touch}") && \
  chmod 0644 'apli/arith.c'
if test $? -ne 0
then ${echo} "restore of apli/arith.c failed"
fi
  if ${md5check}
  then (
       ${MD5SUM} -c >/dev/null 2>&1 || ${echo} 'apli/arith.c': 'MD5 check failed'
       ) << \SHAR_EOF
9197b8cca2085574a60fea8f7d8db733  apli/arith.c
SHAR_EOF

else
test `LC_ALL=C wc -c < 'apli/arith.c'` -ne 6656 && \
  ${echo} "restoration warning:  size of 'apli/arith.c' is not 6656"
  fi
fi
if rm -fr ${lock_dir}
then ${echo} "x - removed lock directory ${lock_dir}."
else ${echo} "x - failed to remove lock directory ${lock_dir}."
     exit 1
fi
exit 0
