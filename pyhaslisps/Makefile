DESTDIR=
PKGNAME=$(REALNAME)
REALNAME=


all : install

install :
	install -Dm 644 $(REALNAME).1 $(DESTDIR)/usr/share/man/man1/$(REALNAME).1
	install -Dm 755 $(REALNAME).py $(DESTDIR)/usr/bin/$(REALNAME)
	install -Dm 644 license $(DESTDIR)/usr/share/licenses/$(PKGNAME)/license
	install -Dm 644 README  $(DESTDIR)/usr/share/doc/$(PKGNAME)/README
