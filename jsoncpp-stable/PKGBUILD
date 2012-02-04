# Maintainer: Splex

pkgname=jsoncpp-stable
pkgver=0.5.0
pkgrel=1
pkgdesc="A JSON C++ library"
url="http://jsoncpp.sourceforge.net/"
license="Public"
arch=('i686' 'x86_64')
makedepends=('scons' 'gcc')
depends=('gcc-libs')
conflicts=('jsoncpp')
source=("http://sourceforge.net/projects/jsoncpp/files/jsoncpp/0.5.0/jsoncpp-src-${pkgver}.tar.gz/download")
md5sums=('24482b67c1cb17aac1ed1814288a3a8f')

build(){
  cd ${srcdir}/jsoncpp-src-${pkgver}
  scons platform=linux-gcc
}

package(){
  cd ${srcdir}/jsoncpp-src-${pkgver}
  mkdir -p ${pkgdir}/usr/include
  cp -r include/json ${pkgdir}/usr/include/json
  mkdir -p ${pkgdir}/usr/lib
  cp buildscons/linux-gcc-*/src/lib_json/libjson_linux-gcc*libmt.so ${pkgdir}/usr/lib/
  cd ${pkgdir}/usr/lib/
  ln -sf libjson_linux-gcc-*_libmt.so libjsoncpp.so
  cd ${pkgdir}/usr/include/
  mv json jsoncpp
}

