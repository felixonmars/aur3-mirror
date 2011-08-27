# Makefile for Ceres
#

VERSION=0.56
YEAR=2010

INSTALLPATH+=/usr

SNDLIBWITHJACK=--with-jack

GCC=gcc -Wall

CC=$(GCC)

X11PATH=/usr/include/X11

USEJACK=-DUSEJACK

SOUNDLIBNAME=snd

ADDITIONALCFLAGS= -O3 -g -fPIC --fast-math -I/usr/include
ADDITIONALLDFLAGS= /usr/lib/libsndlib.so -L/usr/lib -lsndfile -ljack -lm -lpthread -dl -L.

PYTHONEXE=/usr/bin/env python2

SHAREPATH=$(INSTALLPATH)/share/ceres

PYGTK1PATH=$(SHAREPATH)

PYPATH="/usr/include/python2.7"

DAS-CFLAGS= -I/usr/lib -I$(X11PATH) -I$(PYPATH) $(ADDITIONALCFLAGS) -DVERSION=$(VERSION) -DYEAR=$(YEAR) $(USEJACK)

MOTIF-LIBS=/usr/lib/libXm.so -lXmu -lXt -lXext -lXp -lXft -lXrender -lfontconfig `freetype-config --libs` -lX11 -ljpeg -lpng

DAS-LDFLAGS= $(MOTIF-LIBS) -L/usr/lib -lXt -lX11 $(ADDITIONALLDFLAGS) -ljack -lsamplerate

ALLDEP=/usr/include/python2.7

OBJS=ceresmain.o export.o extract.o fft.o file.o globals.o graph.o gui.o lpc.o lpc2.o paint.o phasevocoder.o play.o transform.o help.o scales.o drawing.o transform/sieve.o rsynthdata.o $(SOUNDLIBNAME)play.o fftsound.o undo.o diskarray.o tempfile.o diskarraychannel.o cachememhandler.o config.o transform/sshift.o transform/shear.o transform/blur.o transform/comb.o transform/mirror.o transform/expo.o transform/spread.o transform/pshift.o transform/filter.o transform/gain.o transform/threshold.o transform/noisered.o transform/nullphase.o transform/trpeaks.o transform/ltas.o transform/magnet.o transform/convolve.o transform/warp.o python_wrap.o edit.o transform/sshape.o jackplay.o clip.o cutcopypaste.o

ALL= test check ../lib/cerescmodule.so ../bin/ceres.py ../bin/ceresconfig.py ../bin/ceres

all: $(ALL)
	@echo
	@echo "Compilation OK."


clean:
	rm -f *.o *~ */*~ transform/*.o core core.* ../lib/cerescmodule.so ../*/*~ ../*/*.bak ../*/*.pyc ../bin/ceres ../bin/*.py makesource.sh libdummy.a gakk.c gakk.o check libtest.c


test:
	@echo
	@echo "-----------------------------------------------------------------"
	@echo "--- Checking dependencies. See the INSTALL file if this fails ---"
	@echo "-----------------------------------------------------------------"
	@echo
	@echo "--- Checking if python-config is available"
	which python2-config
	@echo
	@echo "--- Checking if glib-config is available"
	which glib-config
	@echo
	@echo "--- Checking if gtk is available"
	which gtk-config
	@echo
	@echo "--- Checking if flex is available"
	which flex
	@echo
	@echo "--- Checking if freetype-config is available"
	which freetype-config
	@echo
	@echo "--- Checking if libraries are available"
	@echo "#include <png.h>" >libtest.c
	@echo "#include <jpeglib.h>" >>libtest.c
	@echo "#include <jack/jack.h>" >>libtest.c
	@echo "#include <samplerate.h>" >>libtest.c
	@echo "#include <X11/X.h>" >>libtest.c
	@echo "#include <X11/Xmu/CharSet.h>" >>libtest.c
	@echo "#include <fontconfig/fontconfig.h>" >>libtest.c
	@echo "#include <xcb/xcb.h> " >>libtest.c
	@echo "int main(){return 0;}" >>libtest.c
	gcc libtest.c -Wall -lXmu -lXt -lXext -lXp -lXft -lXrender -lfontconfig `freetype-config --libs` -lX11 -ljpeg -lpng -ljack -lsamplerate -lXau -lxcb
	@echo
	@echo "-----------------------------------------------------"
	@echo "--- Dependencies seems good. Starting to compile. ---"
	@echo "-----------------------------------------------------"
	@echo

install: $(ALL) 

	mkdir -p $(SHAREPATH)
	mkdir -p $(SHAREPATH)/etc
	mkdir -p $(SHAREPATH)/bin
	mkdir -p $(SHAREPATH)/doc
	mkdir -p $(INSTALLPATH)/bin
	mkdir -p $(INSTALLPATH)/lib/python2.7/site-packages
	cp ../lib/cerescmodule.so $(INSTALLPATH)/lib/python2.7/site-packages
	cp ../etc/ceresconfig.glade $(SHAREPATH)/etc
	cp ../bin/ceres.py $(SHAREPATH)/bin
	cp ../bin/ceresconfig.py $(SHAREPATH)/bin
	cp ../doc/cereshelp.html $(SHAREPATH)/doc
	cp ../bin/ceres $(INSTALLPATH)/bin

	@echo
	@echo --Program installed successfully!--
	@echo "--Now installing Motif configuration file, this might fail in case you are not root, but it's not that important.--"
	@echo
	mkdir -p $(INSTALLPATH)/lib/X11/app-defaults/Ceres
	cp ../etc/Ceres.ad $(INSTALLPATH)/lib/X11/app-defaults/Ceres


uninstall:
	rm -fr $(SHAREPATH)
	rm $(INSTALLPATH)/bin/ceres


dist:
	grep INSTALLPATH Makefile
	echo "\
	cd ..;\
	rm -fr ceres-$(VERSION);\
	mkdir ceres-$(VERSION);\
	cd ceres-$(VERSION);\
	cp -a ../INSTALL ../NEW ../src ../etc ../lib ../doc ../bin .;\
	cd src;\
	make clean;\
	cd ../..;\
	tar cvf ceres-$(VERSION).tar ceres-$(VERSION);\
	rm -f ceres-$(VERSION).tar.gz;\
	gzip -9 ceres-$(VERSION).tar;\
	marcel_upload ceres-$(VERSION).tar.gz\
	" >makesource.sh
	sh makesource.sh
	rm makesource.sh

#	rm -f ../ceres-$(VERSION)ceres *.o *~ */*~ transform/*.o core core.* pypath ../lib/cerescmodule.so

#	mkdir ../ceres-jobb/transform
#	cp Makefile *.c *.h *.py ceres_jobb/
#	cp transform/*c ceres_jobb/transform/
#	cp merknader NEW ceres_jobb/
#	cp -a config ceres_jobb/
#	cp ceres.glade ceres_jobb/
#	rm -f ceres_jobb.tar.gz
#	tar cvf ceres_jobb.tar ceres_jobb
#	gzip -9 ceres_jobb.tar


run:
	python2 ../bin/ceres.py


../bin/ceres: Makefile
#	rm -f ../bin/ceres
	echo "#!/bin/sh" >../bin/ceres
	echo "python2 $(SHAREPATH)/bin/ceres.py \$$@" >>../bin/ceres	
	chmod a+rx ../bin/ceres

../bin/ceres.py: ceres.py Makefile
	rm -f ../bin/ceres.py
	echo "#!$(PYTHONEXE)" >>../bin/ceres.py
	echo "" >>../bin/ceres.py
	echo "#Do not edit, this file is automaticly generated." >>../bin/ceres.py
	echo "" >>../bin/ceres.py
	cat ceres.py >>../bin/ceres.py
	chmod a+rx ../bin/ceres.py

../bin/ceresconfig.py: ceresconfig.py Makefile
	rm -f ../bin/ceresconfig.py
	echo "#!$(PYTHONEXE)" >>../bin/ceresconfig.py
	echo "" >>../bin/ceresconfig.py
	echo "#Do not edit, this file is automaticly generated." >>../bin/ceresconfig.py
	echo "" >>../bin/ceresconfig.py
	echo "import sys, pygtk" >>../bin/ceresconfig.py
	echo "pygtk.require(\"1.2\")" >>../bin/ceresconfig.py
	echo "" >>../bin/ceresconfig.py
	cat ceresconfig.py >>../bin/ceresconfig.py
	chmod a+rx ../bin/ceresconfig.py

../lib/cerescmodule.so: $(OBJS) Makefile
	$(CC) -shared $(OBJS) -o ../lib/cerescmodule.so $(DAS-LDFLAGS)

check: Makefile gakk.o
	$(CC) -shared gakk.o -o check $(DAS-LDFLAGS)

ceresmain.o: ceresmain.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) ceresmain.c -o ceresmain.o
export.o: export.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) export.c
extract.o: extract.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) extract.c
fft.o: fft.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) fft.c
file.o: file.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) file.c
globals.o: globals.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) globals.c
graph.o: graph.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) graph.c
gui.o: gui.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) gui.c
lpc.o: lpc.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) lpc.c
lpc2.o: lpc2.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) lpc2.c
paint.o: paint.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) paint.c
phasevocoder.o: phasevocoder.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) phasevocoder.c
play.o: play.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) play.c
transform.o: transform.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform.c
help.o: help.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) help.c
scales.o: scales.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) scales.c
drawing.o: drawing.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) drawing.c
rsynthdata.o: rsynthdata.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) rsynthdata.c
$(SOUNDLIBNAME)play.o: $(SOUNDLIBNAME)play.c $(ALLDEP) libdummy.a
	$(CC) -c $(DAS-CFLAGS) $(SOUNDLIBNAME)play.c

libdummy.a: Makefile
	cp gakk.o libdummy.a

gakk.o: gakk.c
	$(CC) gakk.c -c

gakk.c: Makefile
	echo "void gakkgakk(void){}"> gakk.c

fftsound.o: fftsound.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) fftsound.c
undo.o: undo.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) undo.c
diskarray.o: diskarray.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) diskarray.c
tempfile.o: tempfile.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) tempfile.c
diskarraychannel.o: diskarraychannel.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) diskarraychannel.c
cachememhandler.o: cachememhandler.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) cachememhandler.c
config.o: config.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) config.c
python_wrap.o: python_wrap.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) -w python_wrap.c

#python_wrap.c: python.h
#	swig -python -module ceresc python.h

edit.o: edit.c
	$(CC) -c $(DAS-CFLAGS) edit.c

jackplay.o: jackplay.c
	$(CC) -c $(DAS-CFLAGS) jackplay.c

#.o: .c
#	$(CC) -c $(DAS-CFLAGS) .c



transform/sieve.o: transform/sieve.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/sieve.c -o transform/sieve.o
transform/sshift.o: transform/sshift.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/sshift.c -o transform/sshift.o
transform/shear.o: transform/shear.c $(ALLDEP)
	$(GCC) -c $(DAS-CFLAGS) transform/shear.c -o transform/shear.o
transform/blur.o: transform/blur.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/blur.c -o transform/blur.o
transform/comb.o: transform/comb.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/comb.c -o transform/comb.o
transform/mirror.o: transform/mirror.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/mirror.c -o transform/mirror.o
transform/expo.o: transform/expo.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/expo.c -o transform/expo.o
transform/spread.o: transform/spread.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/spread.c -o transform/spread.o
transform/pshift.o: transform/pshift.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/pshift.c -o transform/pshift.o
transform/filter.o: transform/filter.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/filter.c -o transform/filter.o
transform/gain.o: transform/gain.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/gain.c -o transform/gain.o
transform/threshold.o: transform/threshold.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/threshold.c -o transform/threshold.o
transform/noisered.o: transform/noisered.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/noisered.c -o transform/noisered.o
transform/nullphase.o: transform/nullphase.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/nullphase.c -o transform/nullphase.o
transform/trpeaks.o: transform/trpeaks.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/trpeaks.c -o transform/trpeaks.o
transform/ltas.o: transform/ltas.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/ltas.c -o transform/ltas.o
transform/magnet.o: transform/magnet.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/magnet.c -o transform/magnet.o
transform/convolve.o: transform/convolve.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/convolve.c -o transform/convolve.o
transform/warp.o: transform/warp.c $(ALLDEP)
	$(CC) -c $(DAS-CFLAGS) transform/warp.c -o transform/warp.o
transform/sshape.o: transform/sshape.c
	$(CC) -c $(DAS-CFLAGS) transform/sshape.c -o transform/sshape.o

clip.o: clip.c
	$(CC) -c $(DAS-CFLAGS) clip.c -o clip.o
cutcopypaste.o: cutcopypaste.c
	$(CC) -c $(DAS-CFLAGS) cutcopypaste.c -o cutcopypaste.o

#.o: .c
#	$(CC) -c $(DAS-CFLAGS) .c -o .o
