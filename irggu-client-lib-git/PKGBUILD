# Maintainer: Arttu Liimola <arttu.liimola at gmail dot com>
pkgname=irggu-client-lib-git
pkgver=20150323
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Library for connecting to IrGGu-Server"
url="http://irggu.arggu.ath.cx/client-lib/"
license=('GPL3')
depends=('qt5-base')
makedepends=('extra-cmake-modules')
source=("${pkgname}::git+https://gitlab.com/irggu-client-lib/irggu-client-lib.git")
sha256sums=(SKIP)

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
