# Maintainer: Eike Waldt <mail@yeoldegrove.de>

pkgname=fuzzylite
pkgver=5.0
pkgrel=1
pkgdesc='A Fuzzy Logic Control Library and Application in C++'
arch=('any')
url="http://www.fuzzylite.com"
license=('Apache' 'GPL')
depends=('gcc-libs')
makedepends=('cmake' 'gcc')
source=("http://www.fuzzylite.com/download/fuzzylite-5.0-linux64.zip")
md5sums=("61d2d4d6735678ab0a61e85650b72f3e")

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  unzip -x sources.zip
  #msg "Applying patch"
  #patch -p8 -i ${startdir}/${pkgname}.patch || return 1
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/${pkgname}-${pkgver}/${pkgname}
  msg "Building ${pkgname}"
  # Building
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}
package() {
  cd ${srcdir}/${pkgname}-${pkgver}/${pkgname}-${pkgver}/${pkgname}/build
  msg "Installing ${pkgname}"
  make install DESTDIR=${pkgdir}
}
