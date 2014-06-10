
# Maintainer: Luca Fulchir <luca@fulchir.it>

pkgname=spot
pkgver=1.2.4
pkgrel=1
pkgdesc="Object-oriented model checking library written in C++"
arch=('i686' 'x86_64')
url="http://spot.lip6.fr/wiki/"
license=('GPL')
source=(http://spot.lip6.fr/dl/${pkgname}-${pkgver}.tar.gz)
depends=('boost')
optdepends=('python')
md5sums=('090149cb076b6984be4633c1e57cd513')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./configure
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	make install DESTDIR=${pkgdir}

}


