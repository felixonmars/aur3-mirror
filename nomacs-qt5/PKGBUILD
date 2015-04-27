# $Id$
# Maintainer: Ilya87 <yast4ik@yahoo.com>

pkgname=nomacs-qt5
pkgver=2.4.4.15.g515b954
pkgrel=1
pkgdesc="A Qt image viewer"
arch=(i686 x86_64)
url="http://www.nomacs.org/"
license=('GPL3')
depends=('qt5-base' 'exiv2' 'quazip-qt5' 'libraw' 'opencv')
makedepends=('cmake' 'qt5-tools')
install="$pkgname.install"
source=(git://github.com/nomacs/nomacs.git)
md5sums=('SKIP')
provides=('nomacs')
conflicts=('nomacs')
pkgver() {
  cd nomacs
  git describe --always | sed 's|-|.|g'
}

build() {
  cd nomacs/ImageLounge
  read -p "enter"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_QT5=ON -DENABLE_QUAZIP=ON -DUSE_SYSTEM_QUAZIP=ON -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt5
  make -j3
}

package() {
  cd nomacs/ImageLounge
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128"
  ln -s "$pkgdir/usr/share/pixmaps/nomacs.png" "$pkgdir/usr/share/icons/hicolor/128x128/nomacs.png"
}