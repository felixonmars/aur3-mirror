# Contributor: lobotomius at gmail dot com
# Maintainer: lobotomius at gmail dot com

pkgname=64tass
pkgver=382
pkgrel=1
pkgdesc="6502/65C02/R65C02/W65C02/65CE02/65816/DTV/65EL02 Turbo Assembler"
arch=('any')
url='http://tass64.sourceforge.net'
license=('GPL')
makedepends=('subversion')
source=("http://downloads.sourceforge.net/project/tass64/source/64tass-1.5x-r$pkgver.zip")
md5sums=('8b625393c2ed51ce19696f849433ce22')

build() {
	cd "$srcdir/64tass-1.5x-r$pkgver"
	make
}

package() {
	cd "$srcdir/64tass-1.5x-r$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	install -m 755 64tass "$pkgdir/usr/bin"
}
