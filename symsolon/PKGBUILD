# Contributor: Fabio Falcinelli < fabio.falcinelli@gmail.com >

pkgname=symsolon
pkgver=0.6
pkgrel=4
pkgdesc="Astrology software insipred by the SYMBOLON deck. This software calculates the planet positions and make symbolon card tables according to the calculated constellation. It can draw the classical circular horoscope also."
arch=('i686' 'x86_64')
groups=()
url="http://symsolon.sourceforge.net/"
license=('GPL' 'custom:"SWISSEPHEM"')
depends=('qt>=4')
makedepends=()
conflicts=()
provides=(symsolon)
source=(http://downloads.sourceforge.net/symsolon/$pkgname-src-$pkgver.tgz)
md5sums=('bd96f37968544191ad5c1179714b1332')

build() {
	install -D -m744 $srcdir/$pkgname-$pkgver/share/doc/symsolon/GNU_GPL_LICENSE_V3 $pkgdir/usr/share/licenses/symsolon/GNU_GPL_LICENSE_V3
	install -D -m744 $srcdir/$pkgname-$pkgver/share/doc/symsolon/SWISSEPHEM_LICENSE $pkgdir/usr/share/licenses/symsolon/SWISSEPHEM_LICENSE

	_src_array="quazip swe_171 zoneinfo symsolon"
	for _step in $_src_array ; do
		if [[ -e $srcdir/$pkgname-$pkgver/src/$_step ]] ; then
			qmake -unix -o $srcdir/$pkgname-$pkgver/src/$_step/Makefile $srcdir/$pkgname-$pkgver/src/$_step/$_step.pro
		fi
	done
	cd $srcdir/$pkgname-$pkgver/src
	qmake -unix -o Makefile src.pro
	cd ..
	qmake -unix -o Makefile symsolon.pro
	make || return 1

	export INSTALL_ROOT=$pkgdir/usr
	make install || return 1

	mkdir -p $pkgdir/usr/bin
	cp $srcdir/$pkgname-$pkgver/bin/symsolon $pkgdir/usr/bin 
	chmod 755 $pkgdir/usr/bin/symsolon
}

