# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kscreen-frameworks-git
pkgver=r521.b466607
pkgrel=1
pkgdesc='KDE screen management software'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/libs/libkscreen'
license=('LGPL')
depends=('kxmlgui' 'libkscreen-frameworks-git' 'kdeclarative')
makedepends=('extra-cmake-modules' 'git' 'python')
provides=('kscreen-frameworks')
conflicts=('kscreen-frameworks' 'kscreen')
install=$pkgname.install
source=('git://anongit.kde.org/kscreen.git')
md5sums=('SKIP')

pkgver() {
  cd kscreen
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kscreen \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
