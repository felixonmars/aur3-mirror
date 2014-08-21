.PHONY: install clean

all:
	$(CC) $(CFLAGS) -o cleanup-rules cleanup-rules.c
	$(CC) $(CFLAGS) -o combinator combinator.c
	$(CC) $(CFLAGS) -o combinator3 combinator3.c
	$(CC) $(CFLAGS) -o combipow combipow.c
	$(CC) $(CFLAGS) -o cutb cutb.c
	$(CC) $(CFLAGS) -o expander expander.c
	$(CC) $(CFLAGS) -o gate gate.c
	$(CC) $(CFLAGS) -o generate-rules generate-rules.c
	$(CC) $(CFLAGS) -o hcstatgen hcstatgen.c -lm
	$(CC) $(CFLAGS) -o len len.c
	$(CC) $(CFLAGS) -o mli2 mli2.c
	$(CC) $(CFLAGS) -o morph morph.c
	$(CC) $(CFLAGS) -o permute permute.c
	$(CC) $(CFLAGS) -o permute_exist permute_exist.c
	$(CC) $(CFLAGS) -o prepare prepare.c
	$(CC) $(CFLAGS) -o req-include req-include.c
	$(CC) $(CFLAGS) -o req-exclude req-exclude.c
	$(CC) $(CFLAGS) -o rli rli.c
	$(CC) $(CFLAGS) -o rli2 rli2.c
	$(CC) $(CFLAGS) -o splitlen splitlen.c

install:
	# Compiled stuff
	install -Dm0755 cleanup-rules $(DESTDIR)usr/bin/cleanup-rules
	install -Dm0755 combinator $(DESTDIR)usr/bin/combinator
	install -Dm0755 combinator3 $(DESTDIR)usr/bin/combinator3
	install -Dm0755 combipow $(DESTDIR)usr/bin/combipow
	install -Dm0755 cutb $(DESTDIR)usr/bin/cutb
	install -Dm0755 expander $(DESTDIR)usr/bin/expander
	install -Dm0755 gate $(DESTDIR)usr/bin/gate
	install -Dm0755 generate-rules $(DESTDIR)usr/bin/generate-rules
	install -Dm0755 hcstatgen $(DESTDIR)usr/bin/hcstatgen
	install -Dm0755 len $(DESTDIR)usr/bin/len
	install -Dm0755 mli2 $(DESTDIR)usr/bin/mli2
	install -Dm0755 morph $(DESTDIR)usr/bin/morph
	install -Dm0755 permute $(DESTDIR)usr/bin/permute
	install -Dm0755 permute_exist $(DESTDIR)usr/bin/permute_exist
	install -Dm0755 prepare $(DESTDIR)usr/bin/prepare
	install -Dm0755 req-include $(DESTDIR)usr/bin/req-include
	install -Dm0755 req-exclude $(DESTDIR)usr/bin/req-exclude
	install -Dm0755 rli $(DESTDIR)usr/bin/rli
	install -Dm0755 rli2 $(DESTDIR)usr/bin/rli2
	install -Dm0755 splitlen $(DESTDIR)usr/bin/splitlen
	# Perl stuff
	install -Dm0755 seprule.pl $(DESTDIR)usr/bin/seprule
	install -Dm0755 tmesis.pl $(DESTDIR)usr/bin/tmesis
	install -Dm0755 topmorph.pl $(DESTDIR)usr/bin/topmorph

clean:
	rm -f *.exe *.bin cleanup-rules combinator combinator3 combipow cutb expander gate generate-rules hcstatgen len mli2 morph permute permute_exist prepare req-include req-exclude rli rli2 splitlen
