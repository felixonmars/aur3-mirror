# Maintainer: Christian Bühler <christian@cbuehler.de>
pkgname=gammaray
pkgver=2.2.1
pkgrel=1
pkgdesc="A tool for examining the internals of a Qt application and to some extent also manipulate it"
arch=('i686' 'x86_64')
url="http://www.kdab.com/kdab-products/gammaray/"
license=('GPL')
makedepends=(cmake)
depends=(graphviz qt5-script qt5-svg qt5-tools)
source=(https://github.com/KDAB/GammaRay/archive/v$pkgver.tar.gz)
md5sums=('0ca22164742991437d4353222db766d3')

build() {
	cd "$srcdir/GammaRay-$pkgver"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/GammaRay-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
