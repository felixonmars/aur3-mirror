# You know, there are pre-compile DEBs of this...

DESTDIR =


build:
	pyuic4 -o ./src/ui_mainw.py ./src/mainw.ui
	pyuic4 -o ./src/ui_settingsw.py ./src/settingsw.ui
	pyrcc4 -o ./src/icons_rc.py ./src/icons/icons.qrc
	pylupdate4 -verbose src/lang/lang.pro
	lrelease src/lang/lang.pro
	make -C fst
	make -C fst -f Makefile.info

clean:
	rm -f *~ src/*~ src/*.pyc src/*_rc.py src/ui_*.py src/lang/*.qm fst/*.exe fst/*.exe.so
	make clean -C fst
	make clean -C fst -f Makefile.info

install:
	# Make directories
	install -d $(DESTDIR)/usr/bin/
	install -d $(DESTDIR)/usr/share/applications/
	install -d $(DESTDIR)/usr/share/pixmaps/
	install -d $(DESTDIR)/usr/share/festige/
	install -d $(DESTDIR)/usr/share/festige/fst/
	install -d $(DESTDIR)/usr/share/festige/lang/
	# Install files
	install -m 655 festige $(DESTDIR)/usr/bin/
	install -m 644 festige.desktop $(DESTDIR)/usr/share/applications/
	install -m 644 festige.xpm $(DESTDIR)/usr/share/pixmaps/
	install -m 644 src/*.py src/*.png $(DESTDIR)/usr/share/festige/
	install -m 655 fst/*.exe fst/*.exe.so $(DESTDIR)/usr/share/festige/fst/
	install -m 655 src/lang/*.qm $(DESTDIR)/usr/share/festige/lang/

uninstall:
	rm -rf $(DESTDIR)/usr/bin/festige
	rm -rf $(DESTDIR)/usr/share/applications/festige.desktop
	rm -rf $(DESTDIR)/usr/share/pixmaps/festige.xpm
	rm -rf $(DESTDIR)/usr/share/festige/
