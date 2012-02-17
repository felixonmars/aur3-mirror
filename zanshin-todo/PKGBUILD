# Maintainer: Antonio Rojas ( nqn1976 @ gmail.com )

pkgname=zanshin-todo
_appname=zanshin
pkgver=0.2.1
pkgrel=1
pkgdesc="To-do management application for KDE based on Akonadi"
arch=('i686' 'x86_64')
url="http://zanshin.kde.org"
license=('GPL')
install=$pkgname.install
depends=('kdebase-runtime' 'kdepim-runtime')
makedepends=('cmake' 'automoc4' 'boost')
source=("http://files.kde.org/zanshin/$_appname-$pkgver.tar.bz2")
md5sums=('e8c920f07374cb08200f990ef592938c')

build() {
  cd $srcdir/$_appname-$pkgver
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd $srcdir/$_appname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
