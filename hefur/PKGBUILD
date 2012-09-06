# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>

pkgname=hefur
pkgver=0.3
pkgrel=1
pkgdesc="Hefur is a standalone BitTorrent tracker"
arch=('i686' 'x86_64')
url="http://github.com/abique/hefur"
license=('MIT')
makedepends=('cmake>=2.8')
depends=('gnutls')
options=()
source=("https://github.com/downloads/abique/${pkgname}/${pkgname}-${pkgver}.tar.xz")
md5sums=('446ca4e659ce0ca3c8f32b0990ee7f5f')

build() {
  cd ${srcdir}/${pkgname}-${pkgver} &&
  mkdir build &&
  cd build &&
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. &&
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build &&
  DESTDIR=${pkgdir} make install
}
