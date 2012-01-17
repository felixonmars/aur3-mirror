# Maintainer: A Rojas <nqn1976 @ gmail.com>

pkgname=oxygen-gtk3
pkgver=1.0.0
pkgrel=1
pkgdesc="Port of the default KDE widget theme (Oxygen) to GTK"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/?content=136216"
license=('LGPL')
depends=('gtk3')
makedepends=('cmake')
source=("http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.bz2")
md5sums=('029571469ea3436d47cdac20b2069fed')

build() {
  cd $srcdir
  mkdir build
  cd build
  cmake ../$pkgname-$pkgver -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $srcdir/build
  make DESTDIR="$pkgdir" install
}
