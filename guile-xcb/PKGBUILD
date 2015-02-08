# Maintainer: Brandon Invergo <brandon@invergo.net
pkgname=guile-xcb
pkgver=1.3
pkgrel=1
pkgdesc="An XCB library for Guile Scheme"
arch=('any')
url="http://www.markwitmer.com/guile-xcb/guile-xcb.html"
license=('GPL3')
depends=('guile')
install=guile-xcb.install
changelog=
source=(http://www.markwitmer.com/dist/$pkgname-$pkgver.tar.gz)
md5sums=('f7bc5886ba479c2b2b30443b27863730')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make -j1
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

