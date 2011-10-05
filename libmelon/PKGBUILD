# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>

pkgname=libmelon
pkgver=0.10.4
pkgrel=1
pkgdesc="M:N fiber implementation, with transparent IO reactor and timeouts, POSIX like APIs"
arch=('i686' 'x86_64')
url="http://github.com/abique/melon"
license=('LGPL3')
makedepends=('cmake>=2.8')
depends=()
options=()
source=("https://github.com/abique/melon/tarball/${pkgver}")
sha256sums=('d8aef10ca64062543ea6044e86bdc4f7913b9b4608e88264badbf48d9fa8df69')

build() {
  cd ${srcdir}/abique-melon-* &&
  mkdir build &&
  cd build &&
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. &&
  make
}

package() {
  cd ${srcdir}/abique-melon-*/build &&
  DESTDIR=${pkgdir} make install
}
