# Maintainer: archtux <antonio.arias99999 at gmail.com>

pkgname=korners
pkgver=0.84
pkgrel=2
pkgdesc="Korners is a simple board game for KDE also known as Helma."
arch=('i686' 'x86_64')
url="http://code.google.com/p/korners/"
license='GPL2'
depends=('kdegames-libkdegames' 'qt')
makedepends=('automoc4' 'cmake')
source=(http://korners.googlecode.com/files/korners_$pkgver.tar.gz)
md5sums='c9d2c8d8a88ec573aae744f921d5e8cd'

build() {
  cd $startdir/src/$pkgver

  # Fix CMakeLists.txt
  sed -i 's#kdegames#\kdegames ${QT_QTNETWORK_LIBRARY}#' CMakeLists.txt

  mkdir build
  cd build

  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make DESTDIR=$pkgdir install

  # Desktop icon
  install -Dm644 $srcdir/$pkgver/hi64-app-korners.png  $pkgdir/usr/share/pixmaps/korners.png
  install -Dm644 $startdir/korners.desktop  $pkgdir/usr/share/applications/korners.desktop
}