##参照了http://people.debian.org/~kmccarty/cernlib/faq.html###
###Gentoo portage###
##Contributor: T.Cunly

pkgname=cernlib2006
pkgver=1220
pkgrel=1
pkgdesc="Large collection of general purpose libraries and modules maintained and offered in both source and object code form on the CERN central computers. " 
license=(GPL)
arch=('i686' 'x86_64')
url="http://cernlib.web.cern.ch/cernlib/"
##由于是初次试验，依赖关系可能不全，自己看编译出错信息，把依赖关系自己加上。
depends=(cfortran lapack openmotif imake)

###用debian的源码包和补丁
NETADDRESS=http://ftp.debian.org/debian/pool/main/c/cernlib
ORIGINFILE=cernlib_20061220+dfsg3.orig.tar.gz
PATCHFILE=cernlib_20061220+dfsg3-2.debian.tar.gz
source=("${NETADDRESS}/${ORIGINFILE}" "${NETADDRESS}/${PATCHFILE}"
            "cernlib-2006-fgets.patch" "cernlib-2006-nogfortran.patch"
            "cernlib-2006-ypatchy-short-name.patch")

md5sums=('13332f7d664a6d0d566e7eb4bca25133' '73aa30ae1a4e1d74701b86531a497406'
         '20c4c0d97563fab3a92ca393cb18267f' '1855cb17134b07af5871179726c8f443'
         '7dace75cccbc6622673c0c3bab571e18')

build() {
      cd $srcdir/debian
      patch -Np1 -i $srcdir/cernlib-2006-nogfortran.patch
      sed -i \
		-e "s:/usr/local:/usr:g" \
		-e "s:\$(prefix)/etc:/etc:" \
		-e 's:$(prefix)/man:$(prefix)/share/man:' \
		$srcdir/debian/add-ons/cernlib.mk
      # use system blas and lapack set by gentoo framework
      echo "OK"
	sed -i -e 's:X11R6:X11:g' \
		$srcdir/debian/add-ons/bin/cernlib.in
    
      cd $srcdir
      cp debian/add-ons/Makefile ./Makefile
      export DEB_BUILD_OPTIONS="$gfortran nostrip nocheck"
      echo "Applying Debian patches"
    
      mv cernlib-20061220+dfsg3/upstream .
      make -j1 patch
      patch -Np0 -i cernlib-2006-fgets.patch
      patch -Np0 -i cernlib-2006-ypatchy-short-name.patch
      # since we depend on cfortran, do not use the one from cernlib
	rm src/include/cfortran/cfortran.h
      # respect users flags
	sed -i \
		-e 's/-O3/-O2/g' \
		-e "s/-O2/${CFLAGS}/g" \
		-e "s|\(CcCmd[[:space:]]*\)gcc|\1gcc|g" \
		-e "s|\(CplusplusCmd[[:space:]]*\)g++|\1g++|g" \
		-e "s|\(FortranCmd[[:space:]]*\)gfortran|\1gfortran|g" \
		src/config/linux.cf
	sed -i \
		-e 's/\$(FCLINK)/\$(FCLINK) $(LDFLAGS)/' \
		-e 's/\$(CCLINK)/\$(CCLINK) $(LDFLAGS)/' \
		src/config/{biglib,fortran,Imake}.rules \
		src/patchy/Imakefile
	# add missing headers for implicit
	sed -i \
		-e '0,/^#include/i#include <stdlib.h>' \
		src/kernlib/kerngen/ccgen*/*.c || die
      make
      make DESTDIR=$pkgdir/ install || echo "cernlib install failed"
}
