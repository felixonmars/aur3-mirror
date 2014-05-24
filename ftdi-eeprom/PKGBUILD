# $Id: PKGBUILD 108411 2014-03-27 14:47:20Z fyan $
# Contributor: Kyle Keen <keenerd@gmail.com>

# bug, python binding vanished with 3.4
# Could NOT find PythonLibs (missing:  PYTHON_LIBRARIES PYTHON_INCLUDE_DIRS)

pkgname=ftdi-eeprom
pkgver=1.1
pkgrel=1
pkgdesc="A tool for creating, uploading, and erasing the configuration EEPROM for a FT232BM/FT245BM FTDI chip"
arch=('i686' 'x86_64')
url="http://www.intra2net.com/en/developer/libftdi/download.php"
license=('GPL2')
depends=('confuse' 'libftdi')
makedepends=('cmake')
# doxygen for docs, confuse for eeprom
source=(http://www.intra2net.com/en/developer/libftdi/download/libftdi1-$pkgver.tar.bz2{,.sig})
sha1sums=('f05ade5614aa31e64f91a30ce3782f7ca3704d18'
          'SKIP')

replaces=('ftdi_eeprom')
conflicts=('ftdi_eeprom-git')

prepare() {
  cd "libftdi1-$pkgver"
  sed -i 's|LIB_SUFFIX 64|LIB_SUFFIX ""|' CMakeLists.txt
}

build() {
  cd "$srcdir/libftdi1-$pkgver"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_SKIP_BUILD_RPATH=ON \
    -DCMAKE_BUILD_TYPE=Release -DEXAMPLES=OFF -DFTDI_EEPROM=ON \
    -DFTDIPP=OFF -DDOCUMENTATION=OFF -DLINK_PYTHON_LIBRARY=OFF \
    -DPYTHON_BINDINGS=OFF
  make
}

package() {
  cd "libftdi1-$pkgver/build"
  #make DESTDIR="$pkgdir" install
  install -D -m755 "ftdi_eeprom/ftdi_eeprom" ${pkgdir}/usr/bin/ftdi_eeprom
}

