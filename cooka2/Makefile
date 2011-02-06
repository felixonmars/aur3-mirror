PROJECT=cooka2

PREFIX=/usr


all: $(PROJECT)

$(PROJECT): 
	mcs ckaMainClass.cs -linkresource:ckaFolder.png -linkresource:logo_v1_about.png -linkresource:startup.png \
	-linkresource:logo_v1_ico.png -linkresource:na.png -linkresource:gui.glade -pkg:glade-sharp-2.0 \
	-out:$(PROJECT).exe

clean: 
	rm -f *.exe

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/share/$(PROJECT)
	cp -rf $(PROJECT).exe ckaFolder.png logo_v1_ico.png gui.glade na.png logo_v1_about.png startup.png \
	gtk-gui/ $(DESTDIR)$(PREFIX)/share/$(PROJECT)/

	install -Dm644 $(PROJECT).exe $(DESTDIR)$(PREFIX)/share/$(PROJECT)/
	mkdir -p $(DESTDIR)$(PREFIX)/bin

	echo '#!/bin/sh' > $(DESTDIR)$(PREFIX)/bin/$(PROJECT)
	echo >> $(DESTDIR)$(PREFIX)/bin/$(PROJECT)
	echo exec mono $(PREFIX)/share/$(PROJECT)/$(PROJECT).exe >> $(DESTDIR)$(PREFIX)/bin/$(PROJECT)

	chmod 755 $(DESTDIR)$(PREFIX)/bin/$(PROJECT)
