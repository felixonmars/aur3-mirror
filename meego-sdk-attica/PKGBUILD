# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-sdk-attica
pkgver=0.2.80
pkgrel=1
_rpmver=1.43
pkgdesc='Qt library that implements the Open Collaboration Services API'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('LGPL2.1')
depends=('meego-sdk-qt')
makedepends=('cmake')
source=("http://download.meego.com/live/Tools:/SDK:/Host/Trunk/src/attica-${pkgver}-${_rpmver}.src.rpm")
md5sums=('b8d6e7909ba8e629abec8586f3dd5fa4')

build() {
  export QTDIR=" `meego-sdk-qmake -query QT_INSTALL_PREFIX` "

  cd "${srcdir}"
  tar -zxf attica-${pkgver}.tar.gz

  cd attica-${pkgver}
  mkdir build
  cd build
  cmake ..\
    -DCMAKE_INSTALL_PREFIX=/opt/meego/attica\
    -DCMAKE_C_COMPILER:FILEPATH="cc"\
    -DCMAKE_CXX_COMPILER:FILEPATH="g++"\
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_USE_RELATIVE_PATHS=ON \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_SKIP_RPATH:BOOL=OFF\
    -DCMAKE_USE_RELATIVE_PATHS=ON\
    -DCMAKE_SHARED_LINKER_FLAGS="-Wl"\
    -DCMAKE_MODULE_LINKER_FLAGS="-Wl"\
    -DCMAKE_EXE_LINKER_FLAGS="-Wl"\
    -DLIB_DESTINATION:STRING="/opt/meego/attica/lib"
  make 
}
    
package() {
  cd "${srcdir}"/attica-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
