# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>

pkgname=tmfs
pkgver=4
pkgrel=1
pkgdesc="Time Machine FS (fuse)"
arch=('i686' 'x86_64')
url="https://github.com/abique/tmfs"
license=('MIT')
makedepends=('cmake>=2.8')
depends=('fuse' 'boost')
options=()
source=(https://github.com/abique/tmfs/archive/r${pkgver}.tar.gz)
sha1sums=('e6a6f636085199728ecf9b8640042b6fed9550ed')

build() {
  cd ${srcdir}/tmfs-r${pkgver}
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${srcdir}/tmfs-r${pkgver}/build
  DESTDIR=${pkgdir} make install
}
