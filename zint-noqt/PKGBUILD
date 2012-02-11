# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=zint-noqt
_pkgname=zint
pkgver=2.4.2
pkgrel=2
pkgdesc="A barcode encoding library supporting over 50 symbologies."
url="http://sourceforge.net/projects/zint/"
license=('GPLv3')
arch=('i686' 'x86_64')
depends=('openssl' 'zlib')
makedepends=('cmake')
source=(http://sourceforge.net/projects/$_pkgname/files/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.gz)
md5sums=('5ab8556e3ef5ff36cb70de0be6a3b8b8')

build() {
  cd $srcdir/$_pkgname-$pkgver

  sed -i 's|^find_package(Qt4)|#find_package(Qt4)|' CMakeLists.txt

  cmake -DCMAKE_INSTALL_PREFIX=/usr

  sed -i '/^#include "png.h"/a #include <zlib.h>' backend/png.c

  make
  make DESTDIR=$pkgdir install
}
