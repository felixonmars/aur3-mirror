# Maintainer: György Balló <ballogy@freestart.hu>

pkgname=kdeplasma-applets-message-indicator
_pkgname=plasma-widget-message-indicator
pkgver=0.5.8
pkgrel=2
pkgdesc="A Plasma widget which displays messages from message-indicator enabled applications"
arch=('i686' 'x86_64')
url="https://launchpad.net/plasma-widget-message-indicator"
license=('GPL')
depends=('kdelibs' 'libindicate-qt')
makedepends=('cmake' 'automoc4')
source=(http://launchpad.net/$_pkgname/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.bz2
        kubuntu_libindicate_pkgconfig.diff
        indicator_status.diff)
md5sums=('5fb2af552c8d71fbd596a2635fb70901'
         'dada78e66415908ddedf7ceab56c1070'
         '60b3168d95c8b54685b3522e04b6ac5a')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np1 -i "$srcdir/kubuntu_libindicate_pkgconfig.diff"
  patch -Np1 -i "$srcdir/indicator_status.diff"

  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release \
           -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/build"

  make DESTDIR="$pkgdir/" install
}

