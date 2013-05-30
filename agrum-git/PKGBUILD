# Maintainer: Julien Schueller <schueller at phimeca dot com>

pkgname=agrum-git
pkgver=0.8.0
pkgrel=1
pkgdesc="C++ bayesian networks library"
arch=('i686' 'x86_64')
url="https://forge.lip6.fr/projects/aGrUM/wiki"
license=('GPL')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'cococpp')
source=('agrum-build.patch')
md5sums=('392790ac13dee76edfe72a3a6a869cb8')

build() {
  git clone git://forge.lip6.fr/aGrUM $srcdir/$pkgname-$pkgver
  cd $srcdir/$pkgname-$pkgver
  patch -p1 -i $srcdir/agrum-build.patch 
  cmake ./src -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}