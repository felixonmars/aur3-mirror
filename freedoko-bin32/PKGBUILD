# Contributor: SiD/sidious <miste78@web.de>

pkgname=freedoko-bin32
pkgver=0.7.8
pkgrel=1
pkgdesc="Free version of the german card game Doppelkopf 32bit binary"
arch=('i686')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL')
depends=('gtkmm' 'gnet' 'freealut')
makedepends=('rpmextract')
conflicts=('freedoko')
install=(freedoko.install)

source=(http://downloads.sourceforge.net/free-doko/freedoko-nonfree-$pkgver-2.i386.rpm freedoko.sh)
md5sums=('3897d3b7147bf7b998294f6a49491ed0'
         '64cb477d0ebfe89cc08c42a10f91fa2c')

build() {
	cd $srcdir
	rpmextract.sh freedoko-nonfree-$pkgver-2.i386.rpm
	install -d -m 0755 $pkgdir/usr/bin 
	install -d -m 0755 $pkgdir/usr/share/applications
	install -d -m 0755 $pkgdir/usr/share/man/man6
	install -d -m 0755 $pkgdir/usr/share/freedoko
	install -d -m 0755 $pkgdir/usr/share/pixmaps
	cp $srcdir/usr/games/FreeDoko $pkgdir/usr/bin/
	cp -r $srcdir/usr/share/applications/* $pkgdir/usr/share/applications/
	cp -r $srcdir/usr/share/man/man6/* $pkgdir/usr/share/man/man6/
	cp -r $srcdir/usr/share/games/FreeDoko/* $pkgdir/usr/share/freedoko/
	rm -r $pkgdir/usr/share/freedoko/bin
	cp -r $srcdir/usr/share/pixmaps/* $pkgdir/usr/share/pixmaps/
	install -m 0755 $srcdir/freedoko.sh $pkgdir/usr/bin/freedoko
}


