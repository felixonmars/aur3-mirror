BIN=update-mirrorlist
CONF=update-mirrorlist.conf

install: $(BIN) $(CONF)
	install -D -m755 $(BIN) $(DESTDIR)/usr/bin/$(BIN)
	install -D -m644 $(CONF) $(DESTDIR)/etc/pacman.d/$(CONF)
