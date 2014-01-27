# Maintainer: ajs124 < ajs AT online DOT de >

pkgname=orbital
pkgver=0.1
pkgrel=1
pkgdesc="A Wayland shell client"
arch=(i686 x86_64)
url="https://github.com/giucam/orbital"
license=('LGPL')
depends=('weston' 'nuclear' 'qt5-tools')
makedepends=('cmake')
source=(https://github.com/giucam/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('65f18ecda27c90faf8e36ef45932a84c74ff84313f9e668390021e355ffd1623')

build() {
  mkdir ${pkgname}-${pkgver}/build || true
  cd ${pkgname}-${pkgver}/build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${pkgname}-${pkgver}/build

  make DESTDIR=${pkgdir} install
}
