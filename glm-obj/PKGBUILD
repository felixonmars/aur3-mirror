# Creator Cristóvão D. Sousa <crisjss@gmail.com>
# Maintainer: Kelvin Ng (qpalz) <kelvin9302104 at gmail dot com>

pkgname=glm-obj
_pkgname=glm
pkgver=0.3.2
pkgrel=1
pkgdesc="An Alias Wavefront OBJ file library"
arch=('any')
license=('GPL')
url="http://devernay.free.fr/hacks/glm/"
source=("http://devernay.free.fr/hacks/glm/glm-$pkgver.tar.gz")
md5sums=('63836fce687ac5ed2108d7bc889db71f')

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	sed 's/examples//' Makefile.am > Makefile.am.new
	sed 's/examples//' Makefile.in > Makefile.in.new
	mv Makefile.am.new Makefile.am
	mv Makefile.in.new Makefile.in

	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
}
