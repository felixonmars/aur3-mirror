# Maintainer: Magnus Bjerke Vik <mbvett at gmail dot com>
pkgname=limbsoff
pkgver=alpha2
pkgrel=1
pkgdesc="A phun-fysics fighting game."
arch=('i686' 'x86_64')
url="https://secure.plaimi.net/games/limbs-off/"
license=('GPL3')
depends=('sdl' 'sdl_ttf' 'libpng' 'libgl' 'gcc-libs' 'fontconfig')
source=('https://secure.plaimi.net/games/limbs-off/limbs-off-alpha2.tar.gz')
md5sums=('7e8b96c18594b62ee7f795116c965a42')

build() {
	cd "$srcdir/limbs-off-0.1"
	./configure --prefix=/usr
	make
}
package() {
	cd "$srcdir/limbs-off-0.1"
	make DESTDIR="$pkgdir/" install
}

