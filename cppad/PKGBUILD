# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=cppad
pkgver=20150127
pkgrel=1
pkgdesc="A Package for Differentiation of C++ Algorithms"
arch=('any')
url="http://www.coin-or.org/CppAD/"
license=('GPL3')
makedepends=('cmake')
source=("http://www.coin-or.org/CppAD/Doc/cppad-${pkgver}.gpl.tgz")

build() {
	cd "${srcdir}/cppad-${pkgver}"
	cmake -D CMAKE_INSTALL_PREFIX=/usr .
}

package() {
	cd "${srcdir}/cppad-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

md5sums=('a9e9847aaefcf119b44289719aeca3df')
