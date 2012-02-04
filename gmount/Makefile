PROJECT = gmount
BIN = $(PROJECT).exe

PREFIX = /usr


all: $(BIN)

$(BIN): 
	mcs ArgumentCollector.cs AssemblyInfo.cs Log.cs Main.cs MainWindow.cs \
	aboutData.cs gtk-gui/MainWindow.cs gtk-gui/generated.cs \
	-pkg:glade-sharp-2.0 -r:Mono.Posix \
	-out:$(BIN)

install: all
	install -Dm755 $(BIN) $(DESTDIR)$(PREFIX)/share/$(PROJECT)/$(BIN)
	install -Dm644 icon.png $(DESTDIR)$(PREFIX)/share/pixmaps/$(PROJECT).png

	mkdir -p $(DESTDIR)$(PREFIX)/bin

	echo "#!/bin/bash" > $(DESTDIR)$(PREFIX)/bin/$(PROJECT)
	echo "exec mono $(PREFIX)/share/$(PROJECT)/$(BIN)" \
		>> $(DESTDIR)$(PREFIX)/bin/$(PROJECT)

	chmod 755 $(DESTDIR)$(PREFIX)/bin/$(PROJECT)

clean: 
	rm -f $(BIN)
