# Maintainer: Cory Giles <mail@corygil.es>
pkgname=crush-tools
pkgver=2013.04
_pkgver=${pkgver/./-}
pkgrel=1
epoch=
pkgdesc="Custom Reporting Utilities for Shell"
arch=('i686' 'x86_64')
url="https://code.google.com/p/crush-tools/"
license=('Apache')
depends=()
source=(https://crush-tools.googlecode.com/files/$pkgname-${_pkgver}.tar.gz)
md5sums=('7c6e11eab50d46359e49ebaa63b44774')

build() {
	cd "$srcdir/$pkgname-${_pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-${_pkgver}"
	make DESTDIR="$pkgdir/" install
}
