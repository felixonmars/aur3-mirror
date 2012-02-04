# "Makefile" for scm Scheme Interpreter
# Copyright (C) 1990-2008, 2010 Free Software Foundation, Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this program.  If not, see
# <http://www.gnu.org/licenses/>.

# Author: Aubrey Jaffer

SHELL = /bin/sh
INSTALL = install
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_INFO = ginstall-info

SCMLIT = ./scmlit
SCMEXE = ./scm
BUILD = ./build -hsystem

TEXI2HTML = /usr/bin/texi2html -split -verbose
TEXI2PDF = texi2pdf
VIEWPDF = evince
MAKEDEV = $(MAKE) -f $(HOME)/makefile.dev
CHPAT = $(HOME)/bin/chpat
RSYNC = rsync -av
Uploadee = csail

#CC = gcc
#CFLAGS = -g
#LIBS =
#LD = $(CC) -g
LD = $(CC)

# VERSION is defined in "patchlvl.h"
# RELEASE is for RPMs
RELEASE = 1

intro:	config.status
	@echo
	@echo "This is the scm $(VERSION) distribution.  Read \"scm.info\""
	@echo "to learn how to build and install SCM.  Or browse"
	@echo "      http://people.csail.mit.edu/jaffer/SCM"
	@echo

# ./configure --distdir=${HOME}/dist/ --snapdir=${HOME}/pub/ --htmldir=${HOME}/public_html/ --pdfdir=${HOME}/public_html/

config.status:
	./configure
Makefile: config.status
include config.status

libscmdir = $(libdir)scm/
windistdir = /c/Voluntocracy/dist/
rpm_prefix = $(HOME)/rpmbuild/
prevdocsdir = prevdocs/

# This should be moved to "config.status"
x11incdir=/usr/include/

# directory where COPYING and InitXXX.scm reside.
#IMPLPATH = `pwd`/
IMPLPATH=$(srcdir)
include patchlvl.h
IMPLINIT = $(IMPLPATH)Init$(VERSION).scm

# If pathname where InitXXX.scm resides is not known in advance then
# SCM_INIT_PATH is the environment variable whose value is the
# pathname where InitXXX.scm resides.

hfiles = scm.h scmfig.h setjump.h patchlvl.h continue.h
cfiles = scmmain.c scm.c time.c repl.c ioext.c scl.c sys.c eval.c	\
	subr.c sc2.c unif.c rgx.c crs.c dynl.c record.c posix.c socket.c\
	unix.c rope.c ramap.c gsubr.c edline.c continue.c	\
	findexec.c script.c debug.c byte.c bytenumb.c differ.c
ufiles = pre-crt0.c ecrt0.c gmalloc.c unexec.c unexelf.c unexhp9k800.c \
	unexsunos4.c unexalpha.c unexsgi.c
#	cxux-crt0.s ecrt0.c gmalloc.c pre-crt0.c unexaix.c unexalpha.c \
#	unexapollo.c unexconvex.c unexec.c unexelf.c unexelf1.c \
#	unexencap.c unexenix.c unexfx2800.c unexhp9k800.c unexmips.c \
#	unexnext.c unexnt.c unexsgi.c unexsni.c unexsunos4.c
ofiles = scm.o time.o repl.o scl.o sys.o eval.o subr.o unif.o rope.o \
	continue.o findexec.o script.o debug.o
# continue-ia64.o
ifiles = Init$(VERSION).scm Transcen.scm Link.scm Macro.scm Macexp.scm \
	Tscript.scm compile.scm Iedline.scm Idiffer.scm
hobfiles = hobbit.scm scmhob.scm scmhob.h
turfiles = turtlegr.c turtle grtest.scm
xafiles = xatoms.scm x11.scm xevent.scm keysymdef.scm
xfiles = x.c x.h xgen.scm xevent.h inc2scm $(xafiles)

tfiles = r4rstest.scm example.scm pi.scm pi.c split.scm bench.scm \
	syntest2.scm syntest1.scm
texifiles = scm.texi fdl.texi indexes.texi platform.txi features.txi
dfiles = ANNOUNCE README COPYING COPYING.LESSER scm.1 scm.doc QUICKREF \
	$(texifiles) scm.info Xlibscm.info Xlibscm.texi \
	hobbit.info hobbit.texi
mfiles = configure Makefile build.scm build build.bat requires.scm \
	.gdbinit mkimpcat.scm disarm.scm scm.spec scm.nsi
sfiles = setjump.mar setjump.s ugsetjump.s continue-ia64.S \
	 get-contoffset-ia64.c
wbfiles = wbtab.scm rwb-isam.scm
afiles = $(dfiles) ChangeLog $(cfiles) $(hfiles) $(ifiles) $(tfiles)	\
	$(mfiles) $(hobfiles) $(sfiles) $(ufiles) $(xfiles)		\
	$(turfiles) version.txi # $(wbfiles)

lsdfiles = $(ifiles) $(hobfiles) COPYING COPYING.LESSER r4rstest.scm	\
	build build.scm mkimpcat.scm patchlvl.h $(xafiles) *.so
#*.sl

ctagfiles = $(hfiles) $(cfiles) $(xfiles)
tagfiles = $(ctagfiles) $(ifiles) $(sfiles) $(mfiles)	\
	Xlibscm.texi hobbit.texi build hobbit.scm
#	# $(ufiles) ChangeLog $(dfiles)

installdirs:
	mkdir -p $(DESTDIR)$(includedir)
	mkdir -p $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(libdir)
	mkdir -p $(DESTDIR)$(libscmdir)
	mkdir -p $(DESTDIR)$(mandir)man1/
	mkdir -p $(DESTDIR)$(infodir)
	mkdir -p $(DESTDIR)$(pdfdir)
	mkdir -p $(DESTDIR)$(dvidir)

platform.txi: build.scm
	$(MAKE) $(SCMLIT)
	$(SCMLIT) -r database-browse -l build.scm \
	-e "(browse build 'platform)" > platform.txi
features.txi: build build.scm
	$(MAKE) $(SCMLIT)
	$(SCMLIT) -l build -e"(make-features-txi)"

scm.dvi: $(texifiles) Makefile
	$(TEXI2DVI) -b -c $<
Xlibscm.dvi: Xlibscm.texi version.txi
	$(TEXI2DVI) -b -c $<
hobbit.dvi: hobbit.texi version.txi
	$(TEXI2DVI) -b -c $<
dvi:	scm.dvi Xlibscm.dvi hobbit.dvi
xdvi:	scm.dvi
	xdvi $<
Xdvi:	Xlibscm.dvi
	xdvi $<
hobdvi:	hobbit.dvi
	xdvi $<
install-dvi: scm.dvi Xlibscm.dvi hobbit.dvi
	$(INSTALL_DATA) $< Xlibscm.dvi hobbit.dvi $(DESTDIR)$(dvidir)

scm.pdf: $(texifiles)
	$(TEXI2PDF) -b -c $<
Xlibscm.pdf: Xlibscm.texi version.txi
	$(TEXI2PDF) -b -c $<
hobbit.pdf: hobbit.texi version.txi
	$(TEXI2PDF) -b -c $<
pdf:	scm.pdf Xlibscm.pdf hobbit.pdf
xpdf:	scm.pdf
	$(VIEWPDF) $<
Xpdf:	Xlibscm.pdf
	$(VIEWPDF) $<
hobpdf:	hobbit.pdf
	$(VIEWPDF) $<
install-pdf: scm.pdf Xlibscm.pdf hobbit.pdf
	$(INSTALL_DATA) $< Xlibscm.pdf hobbit.pdf $(DESTDIR)$(pdfdir)

scm_toc.html: $(texifiles)
	$(TEXI2HTML) $<
$(DESTDIR)$(htmldir)scm_toc.html: scm_toc.html installdirs
	-rm -f scm_stoc.html
	if [ -f $(prevdocsdir)scm_toc.html ]; \
	  then hitch $(prevdocsdir)scm_\*.html scm_\*.html \
		$(DESTDIR)$(htmldir); \
	  else $(INSTALL_DATA) scm_*.html $(DESTDIR)$(htmldir); fi

Xlibscm_toc.html:  Xlibscm.texi version.txi
	$(TEXI2HTML) $<
$(DESTDIR)$(htmldir)Xlibscm_toc.html: Xlibscm_toc.html installdirs
	-rm -f Xlibscm_stoc.html
	chpat '</HEAD>' '<LINK REL="icon" HREF="Logo/SCM.ico">\
<LINK REL="shortcut icon" HREF="Logo/SCM.ico">\
</HEAD>' Xlibscm_*.html
	$(INSTALL_DATA) Xlibscm_*.html $(DESTDIR)$(htmldir)

hobbit_toc.html: hobbit.texi version.txi
	$(TEXI2HTML) $<
$(DESTDIR)$(htmldir)hobbit_toc.html: hobbit_toc.html installdirs
	-rm -f hobbit_stoc.html
	chpat '</HEAD>' '<LINK REL="icon" HREF="Logo/SCM.ico">\
<LINK REL="shortcut icon" HREF="Logo/SCM.ico">\
</HEAD>' hobbit_*.html
	$(INSTALL_DATA) hobbit_*.html $(DESTDIR)$(htmldir)

html: scm_toc.html Xlibscm_toc.html hobbit_toc.html

install-html: $(DESTDIR)$(htmldir)scm_toc.html \
	$(DESTDIR)$(htmldir)Xlibscm_toc.html \
	$(DESTDIR)$(htmldir)hobbit_toc.html

scm-$(VERSION).info: $(texifiles)
	$(MAKEINFO) $< --no-split -o $@
scm.info: scm-$(VERSION).info
	if [ -f $(prevdocsdir)scm.info ]; \
	  then infobar $(prevdocsdir)scm.info $< $@; \
	  else cp $< $@; fi
$(DESTDIR)$(infodir)scm.info: scm.info installdirs
	$(INSTALL_DATA) -p $< $@
	-rm $(DESTDIR)$(infodir)scm.info.gz
	$(POST_INSTALL)    # Post-install commands follow.
	-$(INSTALL_INFO) $@ $(DESTDIR)$(infodir)dir

Xlibscm.info: Xlibscm.texi version.txi
	$(MAKEINFO) $< --no-split -o $@
$(DESTDIR)$(infodir)Xlibscm.info: Xlibscm.info installdirs
	$(INSTALL_DATA) $< $@
	-rm $(DESTDIR)$(infodir)Xlibscm.info*.gz
	$(POST_INSTALL)    # Post-install commands follow.
	-$(INSTALL_INFO) $@ $(DESTDIR)$(infodir)dir

hobbit.info: hobbit.texi version.txi
	$(MAKEINFO) $< --no-split -o hobbit.info
$(DESTDIR)$(infodir)hobbit.info: hobbit.info installdirs
	$(INSTALL_DATA) $< $@
	-rm $(DESTDIR)$(infodir)hobbit.info*.gz
	$(POST_INSTALL)    # Post-install commands follow.
	-$(INSTALL_INFO) $@ $(DESTDIR)$(infodir)dir

install-info: $(DESTDIR)$(infodir)scm.info \
	  $(DESTDIR)$(infodir)Xlibscm.info \
	  $(DESTDIR)$(infodir)hobbit.info
info:	install-info

$(DESTDIR)$(infodir)scm.info.gz: $(DESTDIR)$(infodir)scm.info
	gzip -f $<
$(DESTDIR)$(infodir)Xlibscm.info.gz: $(DESTDIR)$(infodir)Xlibscm.info
	gzip -f $<
$(DESTDIR)$(infodir)hobbit.info.gz: $(DESTDIR)$(infodir)hobbit.info
	gzip -f $<
install-infoz: $(DESTDIR)$(infodir)scm.info.gz \
	  $(DESTDIR)$(infodir)Xlibscm.info.gz \
	  $(DESTDIR)$(infodir)hobbit.info.gz
infoz:	install-infoz

scm.doc: scm.1
	nroff -man $< | ul -tunknown >$@

README:	build build.scm scm.info
	$(SCMEXE) -l build -e"(make-readme)"

docs: README scm.doc install-html install-pdf install-dvi install-infoz

prevdocs: $(prevdocsdir)scm_toc.html $(prevdocsdir)scm.info
$(prevdocsdir)scm_toc.html:
$(prevdocsdir)scm.info:
	cd $(prevdocsdir); unzip -a $(distdir)scm*.zip
	rm $(prevdocsdir)scm/scm.info
	cd $(prevdocsdir)scm; $(MAKE) scm.info; $(MAKE) scm_toc.html
	cd $(prevdocsdir); mv -f scm/scm.info scm/*.html ./
	rm -rf $(prevdocsdir)scm
	-rm -f scm-$(VERSION).info

all:	require.scm
	$(MAKE) mydlls
	$(MAKE) differ.so
#	$(MAKE) db.so
	-$(MAKE) dscm5
	if [ -d /usr/X11R6/lib ]; then $(MAKE) x.so; fi
require.scm:
	cp -p requires.scm require.scm

# SCMLIT -- try making this first!
scmlit:	$(ofiles) scmmain.o require.scm Makefile
	$(LD) -o scmlit $(ofiles) scmmain.o $(LIBS)
	$(MAKE) checklit
scmflags.h:	scmflags
scmflags:
	echo "#ifndef IMPLINIT" > newflags.h
	echo "#define IMPLINIT \"$(IMPLINIT)\"" >> newflags.h
	echo "#endif" >> newflags.h
	echo "#define CHEAP_CONTINUATIONS" >> newflags.h
	echo "#define CAUTIOUS" >> newflags.h
	-if (cmp -s newflags.h scmflags.h) then rm newflags.h; \
		 else mv newflags.h scmflags.h; fi
.c.o:
	$(CC) -c $(CFLAGS) $< -o $@
scm.o:	scm.c scm.h scmfig.h scmflags.h patchlvl.h
scmmain.o:	scmmain.c scm.h scmfig.h scmflags.h patchlvl.h
scl.o:	scl.c scm.h scmfig.h scmflags.h
eval.o:	eval.c scm.h scmfig.h scmflags.h setjump.h
debug.o: debug.c scm.h scmfig.h scmflags.h setjump.h
unif.o:	unif.c scm.h scmfig.h scmflags.h
#ramap.o:	ramap.c scm.h scmfig.h scmflags.h
repl.o:	repl.c scm.h scmfig.h scmflags.h setjump.h
sys.o:	sys.c scm.h scmfig.h scmflags.h setjump.h
time.o:	time.c scm.h scmfig.h scmflags.h
subr.o:	subr.c scm.h scmfig.h scmflags.h
rope.o:	rope.c scm.h scmfig.h scmflags.h
continue.o: continue.c continue.h setjump.h scm.h scmfig.h scmflags.h
continue-ia64.o: continue-ia64.S get-contoffset-ia64.c
	gcc -o get-contoffset-ia64 get-contoffset-ia64.c
	./get-contoffset-ia64 contoffset-ia64.S
	gcc -c -o continue-ia64.o continue-ia64.S

# Simple build with bignums for running JACAL
scm:	scmlit
	$(BUILD) -s $(IMPLPATH) -F cautious bignums arrays # i/o-extensions
	$(MAKE) check

# R4RS interpreter (not dumpable)
scm4.opt:
	echo "-F cautious bignums arrays inexact" >> scm4.opt
	echo "-F engineering-notation dynamic-linking" >> scm4.opt
#	if type gcc; then echo "--compiler-options=\"-fno-guess-branch-probability\"" >> scm4.opt; fi
scm4:	$(cfiles) $(hfiles) build.scm build scm4.opt
	$(BUILD) -f scm4.opt -o scm -s $(IMPLPATH)
	-rm $(ofiles) scmmain.o
	-$(MAKE) check

# R5RS interpreter (not dumpable)
scm5.opt:
	echo "-F cautious bignums arrays inexact" >> scm5.opt
	echo "-F engineering-notation dynamic-linking" >> scm5.opt
	echo "-F macro" >> scm5.opt
#	if type gcc; then echo "--compiler-options=\"-fno-guess-branch-probability\"" >> scm5.opt; fi
scm5:	$(cfiles) $(hfiles) build.scm build scm5.opt
	$(BUILD) -f scm5.opt -o scm -s $(IMPLPATH)
	-rm $(ofiles) scmmain.o
	-$(MAKE) check
	-$(MAKE) checkmacro

# http://www.opensubscriber.com/message/emacs-devel@gnu.org/1007118.html
# Kernels later than 2.6.11 must do (as root) before dumping:
#echo 0 > /proc/sys/kernel/randomize_va_space

# dumpable R4RS interpreter
udscm4.opt:
	echo "-F cautious bignums arrays inexact" >> udscm4.opt
	echo "-F engineering-notation dump dynamic-linking" >> udscm4.opt
#	if type gcc; then echo "--compiler-options=\"-fno-guess-branch-probability\"" >> udscm4.opt; fi
udscm4:	$(cfiles) $(hfiles) build.scm build udscm4.opt
	$(BUILD) -f udscm4.opt -o udscm4 -s $(IMPLPATH)
	-rm $(ofiles) scmmain.o
dscm4:	udscm4 $(ifiles) require.scm
	if [ -f /proc/sys/kernel/randomize_va_space -a\
	     "`cat /proc/sys/kernel/randomize_va_space`" != "0" ]; then {\
	   cat /proc/sys/kernel/randomize_va_space > randomize_va_space.tmp;
#	   echo 0 > /proc/sys/kernel/randomize_va_space;\
	} fi
	-rm -f slibcat implcat scm~
	-mv scm scm~
	echo "(quit)" | $(SETARCH) ./udscm4 -no-init-file -o scm
	if [ -f randomize_va_space.tmp ]; then {\
	   cat randomize_va_space.tmp > /proc/sys/kernel/randomize_va_space;\
	   rm randomize_va_space.tmp;\
	} fi

# dumpable R5RS interpreter
udscm5.opt:
	$(MAKE) udscm4.opt
	cat udscm4.opt >> udscm5.opt
	echo "-F macro" >> udscm5.opt
udscm5:	$(cfiles) $(ufiles) $(hfiles) build.scm build udscm5.opt
	$(BUILD) -f udscm5.opt -o udscm5 -s $(IMPLPATH)
	-rm $(ofiles) scmmain.o
	strip udscm5
dscm5:	udscm5 $(ifiles) require.scm
	echo tp0
#	if [ -f /proc/sys/kernel/randomize_va_space -a\
#	     "`cat /proc/sys/kernel/randomize_va_space`" != "0" ]; then {\
#	   cat /proc/sys/kernel/randomize_va_space > randomize_va_space.tmp;
#	} fi
#	   echo 0 > /proc/sys/kernel/randomize_va_space;\

	echo tp1
#	-rm -f slibcat implcat scm~
#	-mv scm scm~
#	echo "(quit)" | $(SETARCH) ./udscm5 -no-init-file -r5 -o scm
#	if [ -f randomize_va_space.tmp ]; then {\
#	   cat randomize_va_space.tmp > /proc/sys/kernel/randomize_va_space;\
#	   rm randomize_va_space.tmp;\
#	} fi
#	$(MAKE) check
#	$(MAKE) checkmacro

# R5RS interpreter for debugging with GDB.
gdb.opt: udscm5.opt
	cat udscm5.opt > gdb.opt
	echo "-F debug" >> gdb.opt
	echo "--compiler-options=-Wall" >> gdb.opt
	echo "--linker-options=-Wall" >> gdb.opt
	echo "-D NO_ENV_CACHE" >> gdb.opt
#	echo "-DTEST_FARLOC -DTEST_SCM2PTR" >> gdb.opt
udgdbscm: gdb.opt $(cfiles) $(ufiles) $(hfiles) build.scm build
	$(BUILD) -f gdb.opt -o udgdbscm -s $(IMPLPATH)
gdbscm: udgdbscm $(ifiles) require.scm
	echo "(quit)" | $(SETARCH) ./udgdbscm -no-init-file -r5 -o gdbscm

# R4RS interpreter for profiling
pg.opt: udscm4.opt
	cat udscm4.opt >> pg.opt
	echo "--compiler-options=-pg" >> pg.opt
	echo "--linker-options=-pg" >> pg.opt
	echo "-DLACK_SETITIMER" >> pg.opt
udpgscm: pg.opt
	$(BUILD) -f pg.opt -o udpgscm -s $(IMPLPATH)
pgscm:  udpgscm
	echo "(quit)" | $(SETARCH) ./udpgscm -no-init-file -o pgscm

# R4RS SCM library
libscm.opt:
	echo "-F cautious bignums arrays inexact" >> libscm.opt
	echo "-F engineering-notation" >> libscm.opt
	echo "-F dynamic-linking" >> libscm.opt
mylib:	libscm.a
libscm.a:	libscm.opt scm.h scmfig.h
	$(BUILD) -t lib -f libscm.opt
libtest:	libscm.a libtest.c
	$(LD) -o libtest libtest.c libscm.a -ldl -lm -lc
	./libtest

# DLLs for dynamic linking
dlls.opt:
	echo "--compiler-options=-Wall" >> dlls.opt
	echo "--linker-options=-Wall" >> dlls.opt
mydlls:	dlls.opt bytenumb.so
	$(BUILD) -t dll -f dlls.opt -c ramap.c
	$(BUILD) -t dll -f dlls.opt -c record.c
	$(BUILD) -t dll -f dlls.opt -c gsubr.c
	$(BUILD) -t dll -f dlls.opt -c byte.c
	$(BUILD) -t dll -f dlls.opt -c sc2.c
	$(BUILD) -t dll -f dlls.opt -c ioext.c
	$(BUILD) -t dll -f dlls.opt -c posix.c
	$(BUILD) -t dll -f dlls.opt -c socket.c
	$(BUILD) -t dll -f dlls.opt -c unix.c
	$(BUILD) -t dll -f dlls.opt -F curses
	$(BUILD) -t dll -f dlls.opt -c rgx.c
	if [ -f /usr/lib/libreadline.so ]; \
	  then $(BUILD) -t dll -f dlls.opt -F edit-line; fi

rwb-isam.scm wbtab.scm: ../wb/rwb-isam.scm ../wb/wbtab.scm
	-cp -f ../wb/rwb-isam.scm ../wb/wbtab.scm ./
db.so: dlls.opt build.scm scm.h scmfig.h ../wb/c/*.c $(wbfiles)
	$(MAKE) $(SCMLIT)
	$(BUILD) -t dll -f dlls.opt -F wb
	$(SCMLIT) -lmkimpcat.scm

bytenumb.so:	bytenumb.c scm.h scmfig.h
	$(BUILD) -t dll -f dlls.opt -F byte-number inexact bignums
differ.so:		differ.c scm.h scmfig.h
	$(BUILD) -t dll -f dlls.opt -F differ
myturtle:	dlls.opt scm.h scmfig.h
	$(BUILD) -t dll -f dlls.opt -F turtlegr

x.so:	x.c x.h xevent.h dlls.opt scm.h scmfig.h
	$(BUILD) -t dll -f dlls.opt -F x 

# Generate x11 include and Scheme files
x11.scm:	inc2scm Makefile
	rm -f x11.scm
	$(SCMLIT) -l inc2scm x11.scm x: $(x11incdir) \
	 X11/X.h X11/cursorfont.h X11/Xlib.h X11/Xutil.h
keysymdef.scm:	inc2scm Makefile
	rm -f keysymdef.scm
	$(SCMLIT) -l inc2scm keysymdef.scm x: $(x11incdir) \
	 X11/keysym.h X11/keysymdef.h
xevent.h xevent.scm xatoms.scm:	xgen.scm Makefile
	$(SCMLIT) -l xgen.scm $(x11incdir)X11/Xlib.h
# x.h:	x.c xevent.h
# 	if [ -x "$(CPROTO)" ]; then $(CPROTO) x.c > x.h; fi

# Check SCM; SCMLIT function.
checklit: require.scm
	$(SCMLIT) -fr4rstest.scm -e'(test-sc4)(test-delay)(gc)' \
	-e '(or (null? errs) (quit 1))'
Checklit: require.scm
	$(SCMLIT) --no-symbol-case-fold -fr4rstest.scm -e'(test-sc4)(test-delay)(gc)' \
	-e '(or (null? errs) (quit 1))'
check:	r4rstest.scm require.scm
	$(SCMEXE) -fr4rstest.scm -e'(test-sc4)(test-cont)(test-delay)(gc)' \
	-e '(or (null? errs) (quit 1))'
Check:	r4rstest.scm require.scm
	$(SCMEXE) --no-symbol-case-fold -fr4rstest.scm -e'(test-sc4)(test-cont)(test-delay)(gc)' \
	-e '(or (null? errs) (quit 1))'
checkmacro: syntest1.scm syntest2.scm r4rstest.scm
	$(SCMEXE) -rmacro -fsyntest1.scm -fsyntest2.scm \
	 -fr4rstest.scm -e'(test-sc4)(test-cont)(test-delay)' -fsyntest1 \
	-e '(or (null? errs) (quit 1))'

# Measuare running speed of SCM; SCMLIT.  Results are appended to file
# "BenchLog"
bench:
	echo `whoami`@`hostname` testing scm \
	 `$(SCMEXE) -e'(display *scm-version*)'` >> BenchLog
	echo  on `date` >> BenchLog
	ls -l scm >> BenchLog
	size scm >> BenchLog
	uname -a >> BenchLog
	$(SCMEXE) -lbench.scm
	-cat prng.log >> BenchLog
	echo >> BenchLog
	-cat pi.log >> BenchLog
	echo >> BenchLog
	echo
	tail -20 BenchLog
	-rm -f pi.log prng.log
benchlit:
	echo `whoami`@`hostname` testing scmlit \
	 `$(SCMLIT) -e'(display *scm-version*)'` >> BenchLog
	echo  on `date` >> BenchLog
	ls -l scmlit >> BenchLog
	size scmlit >> BenchLog
	uname -a >> BenchLog
	$(SCMLIT) -lbench.scm
	-cat prng.log >> BenchLog
	echo >> BenchLog
	-cat pi.log >> BenchLog
	echo >> BenchLog
	echo
	tail -20 BenchLog
	-rm -f pi.log prng.log
report:
	$(SCMLIT) -e"(slib:report #t)"
	$(SCMEXE) -e"(slib:report #t)"

################ INSTALL DEFINITIONS ################

install-man: scm.1 installdirs
	-$(INSTALL_DATA) $< $(DESTDIR)$(mandir)man1/

install-lib: $(lsdfiles) installdirs
	$(INSTALL_DATA) $(lsdfiles) $(DESTDIR)$(libscmdir)
	test -f $(DESTDIR)$(libscmdir)require.scm || \
		$(INSTALL_DATA) requires.scm $(DESTDIR)$(libscmdir)require.scm

install: install-man install-lib install-infoz installdirs
	$(INSTALL_PROGRAM) scm scmlit $(DESTDIR)$(bindir)
	-strip $(DESTDIR)$(bindir)scmlit
	$(INSTALL_DATA) scm.h scmfig.h scmflags.h $(DESTDIR)$(includedir)
	$(INSTALL_DATA) libscm.a $(DESTDIR)$(libdir)libscm.a

uninstall:
	$(PRE_UNINSTALL)     # Pre-uninstall commands follow.
	-$(INSTALL_INFO) --delete $(DESTDIR)$(infodir)scm.info $(DESTDIR)$(infodir)dir
	-$(INSTALL_INFO) --delete $(DESTDIR)$(infodir)Xlibscm.info $(DESTDIR)$(infodir)dir
	-$(INSTALL_INFO) --delete $(DESTDIR)$(infodir)hobbit.info $(DESTDIR)$(infodir)dir
	$(NORMAL_UNINSTALL)  # Normal commands follow.
	-rm $(DESTDIR)$(bindir)scm $(DESTDIR)$(bindir)scmlit
	-rm $(DESTDIR)$(mandir)man1/scm.1
	-rm $(DESTDIR)$(includedir)scm.h \
	    $(DESTDIR)$(includedir)scmfig.h \
	    $(DESTDIR)$(includedir)scmflags.h
	-rm $(DESTDIR)$(libdir)libscm.a
	-(cd $(DESTDIR)$(libscmdir); rm $(lsdfiles) require.scm)
	-rm $(DESTDIR)$(infodir)scm.info.gz \
	    $(DESTDIR)$(infodir)Xlibscm.info.gz \
	    $(DESTDIR)$(infodir)hobbit.info.gz
	$(POST_UNINSTALL)     # Post-uninstall commands follow.
	-rmdir $(DESTDIR)$(libscmdir)

################ WINDOWS INSTALLER DEFINITIONS ################

winscm5.opt:
	echo "-F arrays array-for-each byte i/o-extensions" >> winscm5.opt
	echo "-F bignums inexact engineering-notation" >> winscm5.opt
	echo "-F cautious rev2-procedures macro" >> winscm5.opt
	echo "-F wb-no-threads" >> winscm5.opt
gw32scmwb.sh:	scmlit winscm5.opt build.scm Makefile version.txi
	./build -p gnu-win32 -f winscm5.opt -w gw32scmwb.sh
scm.exe:	gw32scmwb.sh
	./gw32scmwb.sh

hobbit.html: hobbit.texi
	$(MAKEINFO) --html --no-split --no-warn hobbit.texi
scm.html: $(texifiles)
	$(MAKEINFO) --html --no-split --no-warn --force scm.texi

## to build a windows installer
## make sure makeinfo and NSIS are available on the commandline
w32install:	scm.exe hobbit.html scm.html
	makensis scm.nsi

#### Stuff for maintaining SCM below ####

ver = $(VERSION)

temp/scm:	$(afiles)
	-rm -rf temp
	mkdir -p temp/scm
	ln $(afiles) temp/scm

release:	dist pdf	# rpm
	cvs tag -F scm-$(VERSION)
	$(INSTALL_DATA) ANNOUNCE $(htmldir)SCM_ANNOUNCE.txt
	$(RSYNC) $(htmldir)SCM.html $(htmldir)SCM_ANNOUNCE.txt	\
	 $(Uploadee):public_html/
	$(RSYNC) $(distdir)README $(distdir)scm-$(VERSION).zip		\
	 $(distdir)scm-$(VERSION)-$(RELEASE).*.rpm			\
	 $(htmldir)hobbit.pdf $(htmldir)Xlibscm.pdf $(Uploadee):dist/
# upload $(distdir)README $(distdir)scm-$(VERSION).zip ftp.gnu.org:gnu/jacal/
#	 $(distdir)scm-$(VERSION)-$(RELEASE).x86_64.rpm

upzip:	$(snapdir)scm.zip
	$(RSYNC) $(snapdir)scm.zip $(Uploadee):pub/
	$(RSYNC) r4rstest.scm $(HOME)/dist/
	$(RSYNC) r4rstest.scm $(Uploadee):dist/

dist:	$(distdir)scm-$(VERSION).zip
$(distdir)scm-$(VERSION).zip:	temp/scm
	$(MAKEDEV) DEST=$(distdir) PROD=scm ver=-$(VERSION) zip

rpm:	pubzip
	cp -f $(snapdir)scm.zip $(rpm_prefix)SOURCES/scm-$(VERSION).zip
	rpmbuild -ba scm.spec	# --clean --target i386
	rm $(rpm_prefix)SOURCES/scm-$(VERSION).zip
	mv $(rpm_prefix)RPMS/*/scm-$(VERSION)-$(RELEASE).*.rpm	\
	   $(rpm_prefix)SRPMS/scm-$(VERSION)-$(RELEASE).src.rpm	\
	   $(distdir)

shar:	scm.shar
scm.shar:	temp/scm
	$(MAKEDEV) PROD=scm shar
dclshar:	scm.com
com:	scm.com
scm.com:	temp/scm
	$(MAKEDEV) PROD=scm com
zip:	scm.zip
scm.zip:	temp/scm
	$(MAKEDEV) PROD=scm zip
doszip:	$(windistdir)scm-$(VERSION).zip
$(windistdir)scm-$(VERSION).zip: temp/scm turtle turtlegr.c grtest.scm SCM.ico scm.html hobbit.html
	cp -f ../wb/wbtab.scm ../wb/rwb-isam.scm temp/scm/
	$(MAKEDEV) DEST=$(windistdir) PROD=scm ver=-$(VERSION) zip
	-cd ..; zip -9ur $(windistdir)scm-$(VERSION).zip \
		scm/turtle scm/turtlegr.c scm/grtest.scm \
		scm/SCM.ico \
		scm/scm.html scm/hobbit.html
	zip -d $(windistdir)scm-$(VERSION).zip scm/scm.info scm/Xlibscm.info scm/hobbit.info
pubzip:	$(snapdir)scm.zip
$(snapdir)scm.zip:	temp/scm
	$(MAKEDEV) DEST=$(snapdir) PROD=scm zip

diffs:	pubdiffs
pubdiffs:	temp/scm
	$(MAKEDEV) DEST=$(snapdir) PROD=scm pubdiffs
distdiffs:	temp/scm
	$(MAKEDEV) DEST=$(distdir) PROD=scm ver=$(ver) distdiffs

CITERS = ANNOUNCE hobbit.texi hobbit.scm \
	../jacal/ANNOUNCE ../jacal/jacal.texi \
	../wb/ANNOUNCE ../wb/README ../wb/wb.texi \
	../synch/ANNOUNCE \
	$(distdir)README \
	$(windistdir)unzipall.bat $(windistdir)buildall \
	$(htmldir)JACAL.html $(htmldir)README.html \
	$(htmldir)SIMSYNCH.html $(htmldir)SLIB.html \
	$(htmldir)FreeSnell/ANNOUNCE $(htmldir)FreeSnell/index.html
CITES = scm.spec scm.nsi ../wb/wb.spec $(htmldir)SCM.html

updates:	Init$(ver).scm
	$(CHPAT) scm-$(VERSION) scm-$(ver) $(CITERS)
	$(CHPAT) $(VERSION) $(ver) $(CITES)
	$(MAKE) README

Init$(ver).scm:
	mv -f Init$(VERSION).scm Init$(ver).scm
	$(CHPAT) $(VERSION) $(ver) patchlvl.h Init$(ver).scm

new:	updates
	echo @set SCMVERSION $(ver) > version.txi
	echo @set SCMDATE `date +"%B %Y"` >> version.txi
	echo `date -I` \ Aubrey Jaffer \ \<`whoami`@`hostname`\>> change
	echo>> change
	echo \	\* patchlvl.h \(SCMVERSION\): Bumped from $(VERSION) to $(ver).>>change
	echo>> change
	cat ChangeLog >> change
	mv -f change ChangeLog
	cvs remove Init$(VERSION).scm
	cvs add Init$(ver).scm
	cvs commit -m 'Init$(VERSION).scm changed to Init$(ver).scm' \
		Init$(VERSION).scm Init$(ver).scm
	cvs commit -m '(SCMVERSION): Bumped from $(VERSION) to $(ver).'
	cvs tag -F scm-$(ver)

lint:	lints
lints:	$(cfiles) $(hfiles)
	lint $(CPPFLAGS) $(ALL_CFLAGS) $(cfiles) | tee lints
#	lint $(CPPFLAGS) $(ALL_CFLAGS) $(cfiles) | tee lintes

#seds to help find names not unique in first 8 characters (name8s)
# for BSD nm format
SED_TO_STRIP_NM=sed -e '/.*\.o$$/d' -e 's/.* _//' -e 's/.* T //'
#old, bad for T [^_] on suns: SED_TO_STRIP_NM=sed -e '/.*\.o$$/d' -e 's/.* _//'
# For a System V nm where plain C identifiers have _ prepended:
#SED_TO_STRIP_NM=sed -e '/^_[A-Za-z][A-za-z0-9_]*[	 |].*|extern|!d' -e 's/|/ /g' -e 's/^_//'
# For a System V nm where plain C identifiers have nothing prepended:
#SED_TO_STRIP_NM=sed -e '/^[A-Za-z][A-za-z0-9_]*[	 |].*|extern|!d' -e 's/|/ /g'

name8:	name8s
name8s:	scmlit
	nm scmlit |\
	$(SED_TO_STRIP_NM) |\
	sort -u|\
	awk '{	if (substr(l,1,8)==substr($$1,1,8)) {\
			if (p) print l;\
			print $$1;p=0;stat=1\
		}else p=1;\
		l=$$1\
	     }END{exit stat}' -

ctags:	$(ctagfiles)
	etags $(ctagfiles)

TAGS:	$(tagfiles)
	etags $(tagfiles)
tags:	TAGS

mostlyclean:
clean:
	-rm -f core a.out ramap.o ramap.obj $(ofiles) scmmain.o lints
	-rm -rf *temp
distclean:	clean
	-rm -f $(EXECFILES) *.o *.obj a.out TAGS implcat slibcat gdbscm
realclean:	distclean
	-rm -f scm.doc scm.html hobbit.html scm.exe scmlit.exe scm~ SCM-*.exe
realempty:	temp/scm
	-rm -f $(afiles)
myclean:	clean
	-rm -f *~ *.bak *.orig *.rej tmp* \#* *\#
