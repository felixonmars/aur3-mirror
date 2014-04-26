# Maintainer: Dominik Heidler <dheidler@gmail.com>
pkgname=gr-fcdproplus
pkgver=3.7.4
pkgrel=2
pkgdesc="GNU Radio source block for Funcube Dongle Pro +"
arch=('i686' 'x86_64')
url="https://github.com/dl1ksv/gr-fcdproplus"
license=('GPLv3')
depends=('gnuradio' 'libusb' 'alsa-lib' 'boost-libs')
makedepends=('git' 'cmake' 'boost' 'swig')

source=("git://github.com/dl1ksv/gr-fcdproplus.git#commit=4f1deb5b0c5e6c712ec7b2027cedcd31de46c08b")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	mkdir build
	cd build
	cmake \
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
