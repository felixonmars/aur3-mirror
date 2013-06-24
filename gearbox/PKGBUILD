# Contributor: Alexander Lam <moar.spam.rite.nao <at> gmail <dot> com>
# Maintainer: numeral <numerical@gmail.com>

pkgname=gearbox
pkgver=10.11
pkgrel=3
pkgdesc='Robotics libraries & drivers'
arch=('i686' 'x86_64')
url='http://gearbox.sourceforge.net'
license=('LGPL' 'GPL' 'EPL')
depends=('boost-libs')
makedepends=('cmake' 'boost')
install=gearbox.install
source=("http://sourceforge.net/projects/gearbox/files/gearbox/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('05433ba6f0f4d335dc948291d209235d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i 's/GET_FILENAME_COMPONENT (boostPythonLib ${Boost_PYTHON_LIBRARY} NAME_WE CACHE)/GET_FILENAME_COMPONENT (boostPythonLib "${Boost_PYTHON_LIBRARY}" NAME_WE CACHE)/' src/hokuyo_aist/python/CMakeLists.txt

  sed -i '1i#include <unistd.h>' src/flexiport/port.h \
                                 src/gbxserialacfr/lockfile/lockfile.h \
                                 src/flexiport/logfile.h \
                                 src/hokuyo_aist/getid/getid.cpp \
                                 src/hokuyo_aist/test/example.cpp
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DGEARBOX_INSTALL=/usr .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}/etc/ld.so.conf.d/
  echo /usr/lib/gearbox > ${pkgdir}/etc/ld.so.conf.d/gearbox
  make DESTDIR="${pkgdir}" install
}
