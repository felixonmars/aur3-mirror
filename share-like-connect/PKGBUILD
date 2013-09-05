# Maintainer: Antonio Rojas < nqn1976 @ gmail.com >
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=share-like-connect
pkgver=0.4
pkgrel=1
pkgdesc="A simple ubiquitous user interface for interacting with your data"
arch=('i686' 'x86_64')
url='http://plasma-active.org/'
license=('LGPL')
depends=('kdebase-runtime' 'kactivities')
makedepends=('cmake' 'automoc4')
groups=('plasma-active')
source=("http://download.kde.org/stable/active/4.0/src/${pkgname}-${pkgver}.tar.xz")
md5sums=('0f986d5fcf1e63cfc565561a7436903d')

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
