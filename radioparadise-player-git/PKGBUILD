# Maintainer: Michal Malek <michalm@jabster.pl>

_pkgname=radioparadise-player
pkgname=$_pkgname-git
pkgver=r30.cb84af9
pkgrel=1
pkgdesc="Radio Paradise Player"
arch=('i686' 'x86_64')
url="https://github.com/mmalek/radioparadise-player"
license=('GPL')
conflicts=('radioparadise-player')
depends=('qt5-base' 'qt5-declarative' 'qt5-multimedia' 'qt5-quickcontrols')
makedepends=('git' 'cmake' 'make')
source=("$_pkgname::git+https://github.com/mmalek/radioparadise-player.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  cmake ../$_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

