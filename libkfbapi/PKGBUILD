# Maintainer: birdflesh <antkoul at gmail dot com>

pkgname=libkfbapi
pkgver=1.0
pkgrel=1
pkgdesc="KDE library for accessing Facebook services"
arch=('i686' 'x86_64')
url='https://projects.kde.org/libkfbapi'
license=('GPL')
depends=('kdepimlibs')
makedepends=('cmake' 'automoc4' 'boost')
conflicts=('libkfbapi-git')
source=("http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.bz2")
md5sums=('05ce3213a1383796a02115705c2bf829')

build() {
  cd "$srcdir"
  mkdir build
  cd build
  cmake ../$pkgname-$pkgver \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
