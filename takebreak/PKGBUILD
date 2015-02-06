# Maintainer: Kudruavtsev Alexander <carsanda@yandex.ru>

pkgname=takebreak
pkgver=1.2.22
pkgrel=3
pkgdesc="TakeBreak - simple program to save your eyes from damage when you work at a computer for a long time."
arch=('i686' 'x86_64')
license=("BSD")
url="http://life-warrior.org/programs/takebreak/"
conflicts=('')
options=('!emptydirs')
install=${pkgname}.install
source=("http://life-warrior.org/distrib/takebreak-latest-1-i686.pkg.tar.xz")
sha1sums=('6d906c7a86792ec029feabe02b836b843783ee80')
depends=('qt4' 'phonon' 'phonon-backend')
options=('strip' 'docs' 'libtool' 'emptydirs' 'zipman' 'purge' '!upx')

package() {
	#bsdtar -xf takebreak-latest-1-i686.pkg.tar.xz
	rm takebreak-latest-1-i686.pkg.tar.xz
	cd $pkgdir
	install -d $pkgdir/usr/bin
	install -m755 $srcdir/opt/TakeBreak/TakeBreak $pkgdir/usr/bin/takebreak
	install -m755 $srcdir/opt/TakeBreak/TakeBreak $pkgdir/usr/bin/TakeBreak
	install -m755 $srcdir/opt/TakeBreak/LWUpChecker $pkgdir/usr/bin/LWUpChecker
	install -d $pkgdir/opt
	cp -R $srcdir/opt/TakeBreak $pkgdir/opt
	install -d $pkgdir/usr/share
	cp -R $srcdir/usr/share/* $pkgdir/usr/share
	install -d $pkgdir/etc
	cp -R $srcdir/etc/* $pkgdir/etc
}
