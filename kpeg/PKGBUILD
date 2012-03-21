# Maintainer: Antonio Rojas < nqn1976 @ gmail.com >
 
pkgname=kpeg
pkgver=0.2
pkgrel=2
pkgdesc="Peg solitaire game for KDE"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KPeg?content=123679"
license=('GPL')
depends=('kdebase-runtime' 'kdegames-libkdegames')
makedepends=('cmake' 'automoc4')
source=(http://kde-apps.org/CONTENT/content-files/123679-$pkgname.tar.gz)
md5sums=('64f821daf1234d7ec52cce3e1be9ec0b')
install=$pkgname.install

build() {
  cd $srcdir/pege
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd $srcdir/pege/build
  make DESTDIR="$pkgdir" install
}
