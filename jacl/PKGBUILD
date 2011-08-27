# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=jacl
pkgver=2.8.4
pkgrel=1
pkgdesc="An interpreted language for writing interactive fiction."
arch=(i686 x86_64)
url="http://jacl.game-host.org:8080/stuart/if/jacl.html"
license=('gpl')
depends=('sdl' 'fcgi')
optdepends=('gargoyle: graphical interpreter')
#groups=()
source=(http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tgz)

md5sums=('1842bfeb76456d2feff6ed708889d38a')


build() {
	cd $srcdir/${pkgname}/src/glkterm
	make -f Makefile.Unix
    cd $srcdir/${pkgname}/src
	make jacl || return 1
	make cgijacl || return 1
	make bjorb || return 1
	make garjacl || return 1
	make cjacl || return 1
	
	cd $srcdir/${pkgname}
	
	mkdir -p $pkgdir/usr/share/jacl
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib

	cp $srcdir/${pkgname}/CHANGES $pkgdir/usr/share/jacl/
	cp $srcdir/${pkgname}/COPYING $pkgdir/usr/share/jacl/
	cp $srcdir/${pkgname}/README $pkgdir/usr/share/jacl/
	cp -fr $srcdir/${pkgname}/games $pkgdir/usr/share/jacl/
	chgrp games $pkgdir/usr/share/jacl/games
	cp -fr $srcdir/${pkgname}/guide $pkgdir/usr/share/jacl/
	#cp $srcdir/${pkgname}/bin/bjorb $pkgdir/usr/bin
	#cp $srcdir/${pkgname}/bin/jacl $pkgdir/usr/bin
	cp $srcdir/${pkgname}/src/garjacl $pkgdir/usr/bin
	cp $srcdir/${pkgname}/src/bjorb $pkgdir/usr/bin
	cp $srcdir/${pkgname}/src/jacl $pkgdir/usr/bin
	cp $srcdir/${pkgname}/src/cgijacl $pkgdir/usr/bin
	# ATTEntion pose pb avec gargoyle ! À corriger à l'occasion
	cp $srcdir/${pkgname}/src/Gargoyle/libgarglk.so $pkgdir/usr/lib
	
	#make install
	#make DESTDIR=$pkgdir install || return 1
}
