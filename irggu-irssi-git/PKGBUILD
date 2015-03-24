# Maintainer: Arttu Liimola <arttu.liimola at gmail dot com>
pkgname=irggu-irssi-git
pkgver=20150323
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Irssi module for connection Irssi to IrGGu-Server"
url="http://irggu.arggu.ath.cx/irssi/"
license=('GPL3')
depends=('qt5-base' 'irssi' 'glib2')
makedepends=('extra-cmake-modules' 'pkgconfig')
source=("${pkgname}::git+https://gitlab.com/irggu-irssi/irggu-irssi.git")
sha256sums=(SKIP)

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSOCK_FILE=/run/irggu/irggu.sock
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
