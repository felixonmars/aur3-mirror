# Maintainer: Dominik Heidler <dheidler@gmail.com>
pkgname=gr-iqbal
pkgver=0.37.1
pkgrel=1
pkgdesc="gnuradio I/Q balancing"
arch=('i686' 'x86_64')
url="https://lists.gnu.org/archive/html/discuss-gnuradio/2013-03/msg00245.html"
license=('GPL')
depends=('gnuradio')
makedepends=('git' 'cmake' 'boost' 'swig')
source=("git://git.osmocom.org/${pkgname}#commit=d4fd4dd41ead825a25729021023dda3db51d8b85")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	git submodule init
	git submodule update
	mkdir build
	cd build
	cmake \
		-Wno-dev \
		-DCMAKE_BUILD_TYPE=Release \
		-DPYTHON_EXECUTABLE=$(which python2) \
		-DPYTHON_INCLUDE_DIR=$(echo /usr/include/python2*) \
		-DPYTHON_LIBRARY=$(echo /usr/lib/libpython2.*.so) \
		-DCMAKE_INSTALL_PREFIX=/usr ../
	make
}

package() {
	cd "$srcdir/$pkgname/build/"
	make DESTDIR=${pkgdir} install
}
