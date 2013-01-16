# Maintainer: TDY <tdy@archlinux.info>

pkgname=qyzis
pkgver=1.0_alpha1
pkgrel=1
pkgdesc="A Qt interface to yzis"
arch=('i686' 'x86_64')
url="http://freecode.com/projects/yzis"
license=('LGPL' 'GPL')
depends=('yzis')
makedepends=('cmake' 'doxygen')
install=qyzis.install
source=(http://dl.freehackers.org/yzis/yzis-${pkgver/_/-}.tar.bz2
        qyzis-$pkgver.diff)
md5sums=('9627cb52f214754225ee632695933ad5'
         'b328eed700c651a36d231d04e7e9fd18')

build() {
  cd "$srcdir/yzis-${pkgver/_/-}"
  patch -Np1 -i ../qyzis-$pkgver.diff

  cd cmake
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_NYZIS=OFF \
    -DENABLE_LIBYZISRUNNER=OFF \
    -DENABLE_DOCUMENTATION=OFF \
    -DLIBLUA51_INCLUDE_DIR=/usr/include/lua5.1
  make
}

check() {
  cd "$srcdir/yzis-${pkgver/_/-}/cmake"
  make test
}

package() {
  cd "$srcdir/yzis-${pkgver/_/-}/cmake"
  sed -i '/INCLUDE/ s#\(.*cmake/\)[^/]*/#\1qyzis/#' cmake_install.cmake
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
