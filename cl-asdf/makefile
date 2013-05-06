DESTDIR=
PKGVER=
PKGNAME=
REALNAME=
IFLAGS=
CL=
SRC=

clean : 
	rm -rf bin/asdf.lisp

ready : 
	ln -s ../build/asdf.lisp


install : clean
	# install copyright
		install -Dm 644 doc/copyright $(DESTDIR)/usr/share/licenses/$(PKGNAME)/copyright
	# install asdf-pkgver.info
		install -Dm 644 doc/$(REALNAME)-$(PKGVER).info $(DESTDIR)/usr/share/info/$(REALNAME)-$(PKGVER).info
	# install asdf.asd
		install -Dm 644 $(REALNAME).asd $(DESTDIR)/usr/share/common-lisp/source/$(REALNAME)/$(REALNAME).asd
	# install asdf.lisp
		install -Dm 644 build/$(REALNAME).lisp $(DESTDIR)/usr/share/common-lisp/source/$(REALNAME)/$(REALNAME).lisp
		install -Dm 644 build/$(REALNAME).lisp $(DESTDIR)/usr/share/common-lisp/source/$(REALNAME)/build/$(REALNAME).lisp # for abcl, mkcl, ecl, and sbcl
	# install *.lisp
		install -d $(DESTDIR)/usr/share/common-lisp/source/$(REALNAME)
		install -m 644 -t $(DESTDIR)/usr/share/common-lisp/source/$(REALNAME) *.lisp
	# remove contrib/debug.lisp and copy uiop/contrib/debug.lisp to contrib/
	rm contrib/debug.lisp 
	cp uiop/contrib/debug.lisp contrib/debug.lisp 
	# install uiop
	install -Dm 644 uiop/contrib/debug.lisp $(DESTDIR)/usr/share/common-lisp/source/$(REALNAME)/uiop/contrib/debug.lisp 
	rm -rf uiop/contrib
	install -m 644 -t $(DESTDIR)/usr/share/common-lisp/source/$(REALNAME)/uiop uiop/asdf-driver.asd \
	    uiop/common-lisp.lisp \
	    uiop/driver.lisp \
	    uiop/image.lisp \
	    uiop/os.lisp \
	    uiop/pathname.lisp \
	    uiop/stream.lisp \
	    uiop/utility.lisp \
	    uiop/backward-driver.lisp \
	    uiop/configuration.lisp \
	    uiop/filesystem.lisp \
	    uiop/lisp-build.lisp \
	    uiop/package.lisp \
	    uiop/run-program.lisp \
	    uiop/uiop.asd \
	    version.lisp-expr
	# install contrib
	install -d $(DESTDIR)/usr/share/common-lisp/source/$(REALNAME)/contrib
	install -m 644 -t $(DESTDIR)/usr/share/common-lisp/source/$(REALNAME)/contrib \
	    contrib/debug.lisp \
	    contrib/detect-multiply-used-files.lisp \
	    contrib/wild-modules.lisp # Watch out you kids, dem modules are WILD!! :P lol xD


	
# old code from the PKGBUILD.  Kept just in case it is ever needed again.  

## Taken from top of PKGBUILD: ## 

#if pacman -Qq clisp-new-clx &>/dev/null; then
#    depends=(clisp-new-clx)
#elif pacman -Qq clisp-gtk2 &>/dev/null; then
#    depends=(clisp-gtk2)
#elif pacman -Qq clisp; then
#    depends=(clisp)
#elif pacman -Qq cmucl; then
#    depends=(cmucl)
#else
#    depends=(clisp)
#fi

##  Taken from package(): ##

# rename info file to prevent conflict with sbcl package
    #install -Dm 644 asdf.info ${pkgdir}/usr/share/info/asdf-git.info

    #install -Dm 644 asdf.asd ${pkgdir}/usr/share/common-lisp/source/asdf/asdf.asd
    #install -d ${pkgdir}/usr/share/common-lisp/source/asdf/
    #install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/asdf/ *.lisp

#    install -d ${pkgdir}/usr/share/common-lisp/systems/

#    cd ${pkgdir}/usr/share/common-lisp/systems/
#    ln -s ../source/asdf/cclan.asd .


