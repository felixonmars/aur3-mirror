all:
	./BUILD

install:
	./install.sh $(DESTDIR)

clean:
	(cd ./Odin; ./CLEAN)
	if test -f Eli/Makefile; then (cd ./Eli; make clean); fi
	rm -rf bin doc CACHE

distclean:
	(cd ./Odin; ./CLEAN)
	(cd ./Odin; rm -f *.log config.status)
	(cd ./Odin/pkg/config; rm -f boot.sh config.dg version)
	rm -f ./Odin/pkg/odin/inc/config.hh
	if test -f Eli/Makefile; then (cd ./Eli; make distclean); fi
	rm -f *.log config.cache config.status Makefile
	rm -rf bin doc online CACHE

nobrowsers:
	./BUILD -nobrowsers

quick:
	./BUILD -notest -nobrowsers

# Targets below here are mainly of use to developers of Eli

predist: quick docs

docs:   doc
	(DESTDIR=`pwd`; export DESTDIR; \
	 ELIDOC=$$DESTDIR/doc/Eli; export ELIDOC; \
	 cd ./Eli; \
	 $(MAKE) DESTDIR=$$DESTDIR ELIDOC=$$ELIDOC ELISYS=`pwd` predist)

doc:
	-mkdir doc
	-mkdir doc/Eli
