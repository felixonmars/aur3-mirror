# tpp Makefile by Nico Golde <nico@ngolde.de>
# Latest Change: junglepeanut - May 21, 2007 
#################################################

BIN = tpp  
INSPATH= $(prefix)/bin/
DOCPATH = $(prefix)/share/doc/tpp
MANPATH = $(prefix)/man/man1
WORKPATH = $(PWD)/tpp-1.3.1
all:
	@echo "TPP doesn't need to be built. Run \`make install' in order to install it."

install :
	mkdir -p $(DOCPATH)
	mkdir -p $(INSPATH)
	mkdir -p $(MANPATH)	
	install -m644 $(WORKPATH)/DESIGN $(WORKPATH)/CHANGES $(WORKPATH)/COPYING $(WORKPATH)/README $(WORKPATH)/THANKS  $(DOCPATH)	
	install -m644 $(WORKPATH)/doc/tpp.1 $(MANPATH)
	install $(WORKPATH)/tpp.rb $(INSPATH)$(BIN)		
	mkdir -p $(DOCPATH)/contrib
	mkdir -p $(DOCPATH)/examples
	install -m644 $(WORKPATH)/examples/* $(DOCPATH)/examples/
	install -m644 $(WORKPATH)/contrib/* $(DOCPATH)/contrib/

uninstall : 
	rm -f $(INSPATH)$(BIN)
	rm -rf $(DOCPATH)
	rm -f $(MANPATH)/tpp.1*
