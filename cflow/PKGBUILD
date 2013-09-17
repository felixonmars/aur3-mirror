# Maintainer: Jason St. John <jstjohn .. purdue . edu>

pkgname=cflow
pkgver=1.4
pkgrel=3
pkgdesc='Analyzes a collection of C source files and prints a graph, charting control flow within the program'
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/${pkgname}/"
license=('GPL')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('b8f8bd0e75e9ad0ba112313c576766b7cf72ef1e29ad0b0a2ce233f43b4196e311077be2134ff6e0fa0bb18375469ca6a969307fa7565a63ab60dec20400ee03')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
