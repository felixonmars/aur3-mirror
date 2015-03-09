# Maintainer: Reto Habluetzel <rethab@rethab.ch>
pkgname=ecf
_pkgname=ECF
pkgver=1.4.1
pkgrel=1
pkgdesc="C++ Evolutionary Computation Framework"
arch=('any')
url="http://gp.zemris.fer.hr/ecf"
license=('unknown')
depends=('boost-libs')
makedepends=('boost')
optdepends=('openmpi: for parallelization')
source=(http://downloads.sourceforge.net/project/ecfproject/${_pkgname}_$pkgver/${_pkgname}_$pkgver.tar.gz)
md5sums=('f58e9d13d3b145c3e5b20f71787e2342')

build() {
	cd "${_pkgname}_$pkgver"
        libtoolize -f
        aclocal
        automake --force-missing --add-missing
        autoconf
	./configure --prefix=/usr
	make
}

package() {
	cd "${_pkgname}_$pkgver"
	make DESTDIR="$pkgdir/" install
}
