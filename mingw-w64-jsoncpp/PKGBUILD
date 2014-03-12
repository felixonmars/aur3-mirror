# Contributor: Julien Quintard <mycure@gmail.com>
# Maintainer: Ali Neishabouri <ali@neishabouri.net>
# Adopter: Marty Plummer <ntzrmtthihu777 (at) gmail (dot) com>
pkgname=mingw-w64-jsoncpp
pkgver=0.5.0
pkgrel=1
pkgdesc="A JSON C++ library (mingw-w64)"
arch=('any')
url="http://jsoncpp.sourceforge.net/"
license=('Public')
makedepends=('scons' 'gcc')
depends=('gcc-libs' 'mingw-w64-gcc')
source=("http://sourceforge.net/projects/jsoncpp/files/jsoncpp/0.5.0/jsoncpp-src-${pkgver}.tar.gz/download" "jsoncpp.pc.i686-w64-mingw32" "jsoncpp.pc.x86_64-w64-mingw32")
md5sums=('24482b67c1cb17aac1ed1814288a3a8f'
         '1bc071ff64fac505911a6fd4ac31abc9'
         'c2f23c19cd63842c395046a8699b987d')
options=('!strip' '!buildflags' 'staticlibs')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
build() {
  cd ${srcdir}/jsoncpp-src-${pkgver}
  scons platform=mingw
}

package() {
  cd ${srcdir}/jsoncpp-src-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p ${pkgdir}/usr/${_arch}/include/jsoncpp/
    cp -r include/json ${pkgdir}/usr/${_arch}/include/jsoncpp/
    install -Dm644 buildscons/mingw/src/lib_json/libjson_mingw_libmt.a ${pkgdir}/usr/${_arch}/lib/libjsoncpp.a
    install -Dm644 ${srcdir}/jsoncpp.pc.${_arch} ${pkgdir}/usr/${_arch}/lib/pkgconfig/jsoncpp.pc
  done
}
