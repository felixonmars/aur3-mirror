# Maintainer: shmibs <shmibs@gmail.com>
pkgname=xcursor-transparent-cursor
pkgver=1.0
pkgrel=2
pkgdesc="A transparent cursor theme for X"
arch=('any')
url="https://github.com/shmibs/${pkgname}"
license=('GPL')
makedepends=('xorg-xcursorgen')
source=("https://github.com/shmibs/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('66a8939805404a4eea4bf0e64b959c159957e900267f202c66834acd759a1204')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	
	./gen.sh
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	mkdir -p "$pkgdir/usr/share/icons/transparent-cursor"

	cp -r index.theme cursors \
		$pkgdir/usr/share/icons/transparent-cursor
}
