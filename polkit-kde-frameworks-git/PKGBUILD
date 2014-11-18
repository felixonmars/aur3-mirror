# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=polkit-kde-frameworks-git
pkgver=r233.b0163f5
pkgrel=1
pkgdesc='Daemon providing a polkit authentication UI for KDE'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/base/polkit-kde-agent-1/'
license=('LGPL')
depends=('knotifications')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'python')
conflicts=('polkit-kde-frameworks')
provides=('polkit-kde-frameworks')
source=('git://anongit.kde.org/polkit-kde-agent-1.git#branch=frameworks')
md5sums=('SKIP')

pkgver() {
  cd polkit-kde-agent-1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../polkit-kde-agent-1 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DSYSCONF_INSTALL_DIR=/etc
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
