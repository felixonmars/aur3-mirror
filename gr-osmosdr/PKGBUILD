# Maintainer: Dominik Heidler <dheidler@gmail.com>
pkgname=gr-osmosdr
pkgver=0.1.1
pkgrel=7
pkgdesc="GNU Radio source block for Funcube Dongle, RTL-SDR, USRP and OsmoSDR devices"
arch=('i686' 'x86_64')
url="http://sdr.osmocom.org/trac/"
license=('GPL')
depends=('gnuradio' 'gr-iqbal' 'rtl-sdr' 'gr-fcdproplus' 'hackrf' 'bladerf')
makedepends=('git' 'cmake' 'boost' 'python2-cheetah' 'swig')
conflicts=('gr-osmosdr-git')
source=("git://git.osmocom.org/gr-osmosdr#tag=v$pkgver")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
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
