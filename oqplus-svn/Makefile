QUAKEDIR=/usr/share/quake

all: pak

pak: 
	qpakman progs.dat qwprogs.dat progs/*.mdl progs/*.spr maps/*.bsp sound/* gfx/*.lmp gfx.wad default.cfg quake.rc end.bin end2.bin -o pak0.pak

install: all
	install -Dm644 pak0.pak $(DESTDIR)/$(QUAKEDIR)/oqplus/pak0.pak

clean:
	rm -f pak0.pak
