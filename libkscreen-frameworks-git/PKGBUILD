# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libkscreen-frameworks-git
pkgver=r516.d7393c9
pkgrel=1
pkgdesc='KDE screen management software'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/libs/libkscreen'
license=('LGPL')
depends=('qt5-x11extras' 'libxrandr')
makedepends=('extra-cmake-modules' 'git')
provides=('libkscreen-frameworks')
conflicts=('libkscreen-frameworks')
source=('git://anongit.kde.org/libkscreen.git')
md5sums=('SKIP')

pkgver() {
  cd libkscreen
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libkscreen \
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
