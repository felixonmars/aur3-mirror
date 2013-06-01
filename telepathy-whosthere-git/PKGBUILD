# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=telepathy-whosthere-git
pkgver=48.bd5cd6a
pkgrel=1
pkgdesc="A telepathy-yowsup connector"
arch=('i686' 'x86_64')
url="https://github.com/mgehre/telepathy-whosthere"
license=('GPL2')
depends=('telepathy-qt5-mgehre-git' 'boost-libs' 'python2')
makedepends=('cmake' 'git' 'boost')
provides=('telepathy-whosthere')
conflicts=('telepathy-whosthere')
source=(telepathy-whosthere::git://github.com/mgehre/telepathy-whosthere.git)
md5sums=('SKIP')

pkgver() {
  cd telepathy-whosthere
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd telepathy-whosthere
  sed -i 's/pkg_check_modules(PYTHON REQUIRED python)/pkg_check_modules(PYTHON REQUIRED python2)/' CMakeLists.txt
}

build() {
  mkdir -p build
  cd build
  cmake ../telepathy-whosthere \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
