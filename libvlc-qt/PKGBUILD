# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=libvlc-qt
pkgver=0.10.0
pkgrel=2
pkgdesc="A free library used to connect Qt and libvlc libraries."
arch=('i686' 'x86_64')
url="http://vlc-qt.tano.si/"
license=('LGPL3')
depends=('vlc>=2.0' 'qt5-declarative')
makedepends=('cmake')
conflicts=('libvlc-qt-git')
source=($pkgname-$pkgver.tar.gz::https://github.com/vlc-qt/vlc-qt/archive/$pkgver.tar.gz)
md5sums=('2750f3e2148d9e0edd2b560a5780f057')

prepare() {
  cd $srcdir/vlc-qt-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt5
}

build() {
  cd $srcdir/vlc-qt-$pkgver
  make 
}

package() {
  cd $srcdir/vlc-qt-$pkgver
  make DESTDIR=$pkgdir install
}
