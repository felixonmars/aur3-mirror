# Maintainer: numeral <numerical@gmail.com>
# Old Maintainer: Renato Garcia <fgar.renato@gmail.com>
# Contributor: Yannick Poirier <contact@yannickpoirier.fr>

pkgname=player
pkgver=3.0.2
pkgrel=4
pkgdesc='Robotic systems environment'
arch=('i686' 'x86_64')
url='http://playerstage.sourceforge.net'
license=('GPL')
depends=('libgnomecanvas' 'libtool' 'libusb-compat' 'boost-libs' 'gsl' 'opencv' 'python2')
makedepends=('cmake' 'swig' 'boost')
source=("http://downloads.sourceforge.net/project/playerstage/Player/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('b92b5ea028e6bfc49351849f420167db')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i s/lib64/lib/ cmake/internal/SetupDirectories.cmake
  sed -i '1i #include <cstddef>' server/drivers/blobfinder/shapetracker/shapetracker.cc
  sed -i '1i #include <cstddef>' server/drivers/blobfinder/upcbarcode/upcbarcode.cc
  find -iname '*.py' | xargs sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|'
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' playerconf

  sed -i '668s/this/(gzFile)this/' server/drivers/shell/readlog.cc
  sed -i '714s/this/(gzFile)this/' server/drivers/shell/readlog.cc

  sed -i '171s/UTC/UTC_/' client_libs/libplayerc++/playerclient.cc
  sed -i '48a PLAYERCC_ADD_LINK_LIB( boost_system )' client_libs/libplayerc++/CMakeLists.txt
  sed -i '98a PLAYERCC_ADD_LINK_LIB( boost_system )' client_libs/libplayerc++/CMakeLists.txt
  #sed -i '41s/$/ boost_system/' client_libs/libplayerc++/test/CMakeLists.txt

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_SKIP_BUILD_RPATH=TRUE -DPYTHON_EXECUTABLE=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

