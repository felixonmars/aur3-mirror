# Maintainer: Marco Gulino <marco.gulino@gmail.com>

pkgname=indi-3rdparty
pkgver=1.0.0
pkgrel=1
pkgdesc="The INDI 3rd party drivers collection"
url="http://www.indilib.org"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('libnova' 'cfitsio' 'boost-libs' 'libindi' 'qsiapi' 'dcraw')
makedepends=('pkgconfig' 'cmake' 'boost')
#options=('!libtool')
source=("http://www.indilib.org/jdownloads/Source/libindi_3rdparty_${pkgver}.tar.gz" )

prepare() {
  mkdir -p build
}

build() {
  find "${srcdir}" -name CMakeLists.txt -exec sed -i 's/"\/lib\//"${CMAKE_INSTALL_PREFIX}\/lib\//g' {} \;
  cd build 
  cmake ../libindi_3rdparty-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_SBIG=Off \
    -DWITH_FLI=Off \
    -DWITH_APOGEE=Off \
    -DWITH_FISHCAMP=Off \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
  # cleanup: conflicting files already installed by qsiapi
  rm -f ${pkgdir}/usr/bin/qsiapitest
  rm -f ${pkgdir}/usr/include/QSIError.h
  rm -f ${pkgdir}/usr/include/qsiapi.h
  rm -f ${pkgdir}/usr/lib/libqsiapi.so
}

md5sums=('65534cec851b27d9a4eb06adaf95a549')
