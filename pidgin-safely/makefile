BIN=pidgin-safely
CONF=pidgin-safely.conf
DESKTOP=pidgin-safely.desktop

install: $(BIN) $(CONF) $(DESKTOP)
	install -D -m755 $(BIN) $(DESTDIR)/usr/bin/$(BIN)
	install -D -m644 $(CONF) $(DESTDIR)/etc/conf.d/$(CONF)
	install -D -m644 $(DESKTOP) $(DESTDIR)/usr/share/applications/$(DESKTOP)
