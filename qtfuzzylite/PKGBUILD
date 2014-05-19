# Maintainer: Aris Synodinos <arissynod-gmail-com>

pkgname=qtfuzzylite
pkgver=4.0
pkgrel=1
pkgdesc=('A Fuzzy Logic Control Library and Application in C++')
arch=('any')
url="http://www.fuzzylite.com"
license=('Apache' 'GPL')
depends=('gcc-libs' 'fuzzylite>=4.0' 'qt5-base')
makedepends=('cmake' 'gcc')
source=("http://www.fuzzylite.com/download/fuzzylite-sources")
md5sums=("62ce1171fab7c2b5bfe11c790b20b015")

prepare() {
  cd ${srcdir}/fuzzylite-${pkgver}
  msg "Applying patch"
  patch -p8 -i ${startdir}/${pkgname}.patch || return 1
}

build() {
  cd ${srcdir}/fuzzylite-${pkgver}/${pkgname}
  msg "Building ${pkgname}"
  # Building
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DFL_USE_QT5=ON ..
  make
}
package() {
  cd ${srcdir}/fuzzylite-${pkgver}/${pkgname}/build
  msg "Installing ${pkgname}"
  make install DESTDIR=${pkgdir}
}
