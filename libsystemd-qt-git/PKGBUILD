# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=libsystemd-qt-git
pkgver=208.29.g4c4533e
pkgrel=1
pkgdesc='Qt-only wrapper for Systemd D-Bus API'
arch=('i686' 'x86_64')
url='https://github.com/ilpianista/libsystemd-qt'
license=('GPL')
depends=('qt5-base' 'systemd')
makedepends=('cmake' 'git')
provides=('libsystemd-qt')
conflicts=('libsystemd-qt')
source=('git://github.com/ilpianista/libsystemd-qt')
md5sums=('SKIP')

pkgver() {
  cd libsystemd-qt
  local ver="$(git describe --tags)"
  printf "%s" "${ver//-/.}"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libsystemd-qt \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
