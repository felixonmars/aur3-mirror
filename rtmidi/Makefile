CC=gcc

bin:
	mkdir bin

jack:   bin
	sed -i 's|@@LIBRTMIDI@@|-L../lib -lrtmidi-jack|' tests/Makefile
	$(CC) $(CFLAGS) -fPIC -D__LINUX_JACK__ -o lib/librtmidi-jack.so.0.0.0 -shared -Wl,-soname=librtmidi-jack.so.0 $(LDFLAGS) -ljack RtMidi.cpp
	ln -s librtmidi-jack.so.0.0.0 lib/librtmidi-jack.so
	ln -s librtmidi-jack.so.0.0.0 lib/librtmidi-jack.so.0
	make -C tests
	for bin in `find tests -type f -perm 755`; do mv $$bin bin/rtmidi-`basename $$bin`-jack; done;

alsa:   bin
	sed -i 's|@@LIBRTMIDI@@|-L../lib -lrtmidi|' tests/Makefile
	$(CC) $(CFLAGS) -fPIC -D__LINUX_ALSASEQ__ -o lib/librtmidi.so.0.0.0 -shared -Wl,-soname=librtmidi.so.0 $(LDFLAGS) -lasound -lpthread RtMidi.cpp
	ln -s librtmidi.so.0.0.0 lib/librtmidi.so
	ln -s librtmidi.so.0.0.0 lib/librtmidi.so.0
	make -C tests
	for bin in `find tests -type f -perm 755`; do mv $$bin bin/rtmidi-`basename $$bin`; done;

clean:
	make -C tests clean
	rm tests/Makefile

install:
	install -d $(DESTDIR)/usr/bin
	install -d $(DESTDIR)/usr/lib
	install -d $(DESTDIR)/usr/lib/pkgconfig
	install -d $(DESTDIR)/usr/include/rtmidi
	install -d $(DESTDIR)/usr/share/doc/rtmidi
	cp -a bin/* $(DESTDIR)/usr/bin
	cp -a lib/* $(DESTDIR)/usr/lib
	cp *.{h,cpp} $(DESTDIR)/usr/include/rtmidi
	cp *.pc $(DESTDIR)/usr/lib/pkgconfig
	cp -a doc/html $(DESTDIR)/usr/share/doc/rtmidi