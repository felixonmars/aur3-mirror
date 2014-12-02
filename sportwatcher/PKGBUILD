# Maintainer: 
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Biginoz <biginoz (at) free.fr>

pkgname=sportwatcher
pkgver=0.7
pkgrel=4
pkgdesc="KDE program, who reads data out of a Garmin GPS-device"
arch=('i686' 'x86_64')
url="http://www.theosys.at/download/index.html"
license=('GPL2')
depends=('gdal' 'mapnik' 'kdelibs' 'libusb')
makedepends=('cmake' 'boost' 'automoc4')
source=(http://www.theosys.at/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('b106c939f0af350d5a8adc04f0c0487f')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  LDFLAGS=""
  msg "Patch files"
  sed -i "s/<gdal\//</" src/*.h src/*.cpp
  sed -i "s/include_directories(/include_directories\(\/usr\/include\/freetype2 /" CMakeLists.txt
}

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  make install
}
