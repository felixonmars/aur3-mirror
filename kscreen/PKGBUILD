# Maintainer: birdflesh <antkoul at gmail dot com>

pkgname=kscreen
pkgver=1.0
pkgrel=1
pkgdesc="KDE's screen management software"
arch=('i686' 'x86_64')
url='https://projects.kde.org/kscreen'
license=('GPL' 'LGPL')
depends=('kdebase-runtime' "libkscreen>=$pkgver")
makedepends=('cmake' 'automoc4')
source=("http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.bz2")
install=$pkgname.install
md5sums=('52a0fef238ed71c08ee853f55e53f8bb')

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
