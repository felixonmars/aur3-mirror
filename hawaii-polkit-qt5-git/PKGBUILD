# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-polkit-qt5-git
pkgver=v0.103.0.3.g4ed9c3f
pkgrel=3
pkgdesc='Qt wrapper around polkit-1 client libraries'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('LGPL')
depends=('qt5-x11extras' 'qt5-svg' 'polkit')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'qtchooser')
provides=('kf5-polkit-qt' 'kf5-polkit-qt-git' 'polkit-qt5')
conflicts=('kf5-polkit-qt' 'kf5-polkit-qt-git' 'polkit-qt5')
options=('debug')
source=(git://anongit.kde.org/polkit-qt-1.git#branch=master)
md5sums=('SKIP')

pkgver() {
  cd polkit-qt-1
  git describe --always | sed 's|-|.|g' 
}

prepare() {
  mkdir -p build
}

build() {
  export QT_SELECT=5

  cd build
  cmake ../polkit-qt-1 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINCLUDE_INSTALL_DIR=/usr/include \
    -DLIB_INSTALL_DIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
