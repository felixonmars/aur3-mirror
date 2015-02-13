# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=oxygen-window-decoration-git
pkgver=r3878.b680b51
pkgrel=1
pkgdesc='Oxygen window decoration for Kwin 5'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('LGPL')
depends=('kdecoration')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'python')
conflicts=('oxygen-git')
source=('git://anongit.kde.org/oxygen.git')
md5sums=('SKIP')

pkgver() {
  cd oxygen
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../oxygen \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build/kdecoration
  make DESTDIR="$pkgdir" install
}
