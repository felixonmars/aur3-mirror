# Maintainer: A Rojas <nqn1976 @ gmail.com>

pkgname=sprinter-git
pkgver=r432.e9a59cf
pkgrel=1
pkgdesc='Multi-agent query parser and result generator'
arch=('i686' 'x86_64')
url='https://git-next.kde.org/kde/sprinter/'
license=('GPL')
depends=('qt5-quick1')
makedepends=('extra-cmake-modules' 'git')
source=('git+https://git-next.kde.org/kde/sprinter.git')
md5sums=('SKIP')

pkgver() {
  cd sprinter
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../sprinter \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
