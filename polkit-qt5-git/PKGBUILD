# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
# Based on kf5-polkit-qt-git from Andrea Scarpino <andrea@archlinux.org>

pkgname=polkit-qt5-git
pkgver=0.0.0
pkgrel=1
pkgdesc='Qt wrapper around polkit-1 client libraries'
arch=('i686' 'x86_64')
url='http://phonon.kde.org/'
license=('LGPL')
depends=('qt5-x11extras' 'qt5-svg' 'polkit')
makedepends=('cmake' 'extra-cmake-modules-git' 'git' 'qtchooser')
options=('debug')
#source=(git://anongit.kde.org/polkit-qt-1.git#branch=qt5)
source=(git://github.com/hawaii-desktop/polkit-qt-1#branch=hawaii)
md5sums=('SKIP')

pkgver() {
  cd polkit-qt-1
  #git describe --always | sed 's|-|.|g' 
  echo v0.103.0.6.g1f3b311
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../polkit-qt-1 \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/opt/hawaii-git \
    -DLIB_INSTALL_DIR=lib
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
