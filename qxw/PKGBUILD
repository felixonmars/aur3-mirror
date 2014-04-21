# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=qxw
pkgver=20140331
pkgrel=1
pkgdesc="A program to help you create and publish crosswords"
arch=('i686' 'x86_64')
url="http://www.quinapalus.com/qxw.html"
license=('GPL')
depends=('gtk2')
install=qxw.install
source=("http://www.quinapalus.com/$pkgname-$pkgver.tar.gz")
md5sums=('745bdc9eb7a05602539f685b0bb8527b')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's/games/bin/' Makefile
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
