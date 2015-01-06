# Maintainer: mugifly <mp at ohgita dot info>
pkgname=bayon
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple and fast clustering tool"
arch=('any')
url="https://code.google.com/p/bayon/"
license=('GPL2')
checkdepends=('gtest')
optdepends=(
	'sparsehash: It allows to run bayon faster'
)
source=("https://bayon.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('bf3b0dd3b7f683cf8730dfd99b8695ae')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make $MAKEFLAGS
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}

