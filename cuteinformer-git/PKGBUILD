# Contributor: Alister Hood <alister.hood@gmail.com>
# Contributor: SomeOneBeforeMe

_pkgname=cuteinformer
pkgname=cuteinformer-git
pkgver=r32.65f67b8
pkgrel=1
pkgdesc="Qt4 implementation of notification-daemon with theming and animations"
url="http://github.com/borman/cuteinformer"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt4')
makedepends=('git' 'cmake')
provides=('cuteinformer' 'notification-daemon')
conflicts=('cuteinformer')
source=("git://github.com/borman/cuteinformer.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p build && cd build
  cmake ../$_pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package() {
  cd build
  make "DESTDIR=$pkgdir" install
}
