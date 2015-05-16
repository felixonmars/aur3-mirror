# Maintainer: Masoud <mpoloton@gmail.com>

pkgname=('soapysdr-git')
_pkgname=SoapySDR
pkgrel=1
pkgdesc="Vendor and platform neutral SDR support library"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/pothosware/SoapySDR"
license=('Boost')
makedepends=('cmake')
depends=('boost' 'libuhd' 'gnuradio-osmosdr')

source=("git+https://github.com/pothosware/SoapySDR.git")
md5sums=('SKIP')

pkgver=0.1.0.r100.g8d00dd1
pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^soapy.sdr-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  git submodule init #needed for osmo and uhd support
  git submodule update
}


build() {
  cd $_pkgname
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr # -DUHD_DIR=/usr/lib/cmake/uhd
  make
}

package() {
  cd $_pkgname/build  
  make DESTDIR="$pkgdir/" install 
}
