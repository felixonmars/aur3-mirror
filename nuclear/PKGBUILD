# Maintainer: ajs124 < ajs AT online DOT de >

pkgname=nuclear
pkgver=0.1
pkgrel=1
pkgdesc="A Shell plugin for Weston"
arch=(i686 x86_64)
url="https://github.com/nuclide/nuclear"
license=('LGPL')
depends=('weston')
makedepends=('cmake')
options=(!libtool)
source=(${pkgname}-${pkgver}::https://github.com/nuclide/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('b464c54282e242eeaa5c21aa38a35643d521ad4f816fa556ac48a3f0c8f08cc9')

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
