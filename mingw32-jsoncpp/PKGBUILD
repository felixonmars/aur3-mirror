# Contributor: Julien Quintard <mycure@gmail.com>
# Maintainer: Ali Neishabouri <ali@neishabouri.net>

pkgname=mingw32-jsoncpp
pkgver=0.5.0
pkgrel=2
pkgdesc="A JSON C++ library (mingw32)"
arch=('any')
url="http://jsoncpp.sourceforge.net/"
license=('Public')
makedepends=('scons' 'gcc')
depends=('gcc-libs' 'mingw32-runtime' 'mingw32-gcc')
source=("http://sourceforge.net/projects/jsoncpp/files/jsoncpp/0.5.0/jsoncpp-src-${pkgver}.tar.gz/download" "jsoncpp.patch")
md5sums=('24482b67c1cb17aac1ed1814288a3a8f' 'e3fc74224d01c8d03cda68e1f989e4dd')
options=('!strip' '!buildflags')

build()
{
  cd ${srcdir}/jsoncpp-src-${pkgver}
  patch -Np1 -i ../jsoncpp.patch
  touch src/lib_json/json_mingw_libmt.def
  scons platform=mingw
}

package(){
  cd ${srcdir}/jsoncpp-src-${pkgver}
  mkdir -p ${pkgdir}/usr/i486-mingw32/include
  cp -r include/json ${pkgdir}/usr/i486-mingw32/include/json
  mkdir -p ${pkgdir}/usr/i486-mingw32/lib
  cp buildscons/mingw/src/lib_json/libjson_mingw_libmt.* ${pkgdir}/usr/i486-mingw32/lib/
  cd ${pkgdir}/usr/i486-mingw32/lib/
  ln -sf libjson_mingw_libmt.a libjsoncpp.a
  ln -sf libjson_mingw_libmt.so libjsoncpp.so
  cd ${pkgdir}/usr/i486-mingw32/include/
  mv json jsoncpp
}
