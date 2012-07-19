# Maintainer: Lukas Martini <hello@lutoma.org>
# Author: Jonahtan Schaeffer <joschaeffer@gmail.com>
# Author: Lukas Martini <hello@lutoma.org>

pkgname=jsoncpp-fixed
pkgver=0.6.0rc2
pkgrel=2
pkgdesc="A JSON C++ library (Fixed, up-to-date PKGBUILD without conflict against json-c)"
url="http://jsoncpp.sourceforge.net/"
license="Public"
arch=('i686' 'x86_64')
makedepends=('scons' 'gcc')
depends=('gcc-libs')
source=("http://sourceforge.net/projects/jsoncpp/files/jsoncpp/0.6.0-rc2/jsoncpp-src-0.6.0-rc2.tar.gz/download")
md5sums=('363e2f4cbd3aeb63bf4e571f377400fb')
provides=('jsoncpp')

build(){
  cd ${startdir}/src/jsoncpp-src-0.6.0-rc2
  scons platform=linux-gcc
  
  mkdir -p ${pkgdir}/usr/include
  cp -r include/json ${pkgdir}/usr/include/jsoncpp

  mkdir -p ${pkgdir}/usr/lib
  cp buildscons/linux-gcc-*/src/lib_json/libjson_linux-gcc*libmt.so ${pkgdir}/usr/lib/
  cd ${pkgdir}/usr/lib/ 
  ln -sf libjson_linux-gcc-*_libmt.so libjsoncpp.so

}

