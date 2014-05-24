# Maintainer: Brandon Invergo <brandon@invergo.net
pkgname=guile-wm
pkgver=1.0
pkgrel=1
pkgdesc="A window manager framework written in Guile Scheme"
arch=('any')
url="http://www.markwitmer.com/guile-xcb/guile-wm.html"
license=('GPL3')
depends=('guile' 'guile-xcb')
install=guile-wm.install
changelog=
source=(http://www.markwitmer.com/dist/$pkgname-$pkgver.tar.gz)
md5sums=('f592815dd876838b00985bf1a134be9e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
