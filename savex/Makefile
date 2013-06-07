svx_version = savex-$$(./svx -V)

PBUILD = svx_link/PKGBUILD

CPPFLAGS = -Wall -g

all : build

build : svx

.c.o :
	$(CC) -c $(CPPFLAGS) $< -o $@
..o :
	$(CC) $(CPPFLAGS) $< -o $@

clean :
	rm -f svx
	rm -f *.o

# I occassionally make a few typos, so that's why the clena target exists.  
clena : clean

install : svx
	install -Dm 755 svx $(DESTDIR)/usr/bin/savex
	install -d $(DESTDIR)/usr/share/docs/savex
	install -m 644 -t $(DESTDIR)/usr/share/docs/savex COPYING BUGS release_notes

pkgfiles = BUGS COPYING release_notes svx.cpp Makefile

old_ver = $$(cat $(PBUILD) | grep -m 1 pkgver | sed 's/.*=// ; s/\s.*$$// ; s/^-//g')

new_ver = $$(echo -n $(svx_version) | sed 's/savex-//')

omd5 = $$(cat $(PBUILD) | grep -P "md5sums=\(" | sed 's/md5sums=(// ; s/)// ; s/^-//g')

nmd5 = $$(md5sum $(svx_version).tar.gz | sed 's/\s.*$$// ; s/\\//')

release : svx
	@echo $(svx_version)
	rm -rf $(svx_version)
	mkdir -v $(svx_version)
	for file in $(pkgfiles) ;\
	    do \
	    cp -vu $$file $(svx_version)/$$file ;\
	    done
	tar -czf $(svx_version).tar.gz $(svx_version) --quoting-style=escape
	rpl  "$(old_ver)" "$(new_ver)" $(PBUILD)
	rpl  "$(omd5)" "$(nmd5)" $(PBUILD)
