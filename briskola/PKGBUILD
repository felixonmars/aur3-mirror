# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=briskola
pkgver=1.0.0
pkgrel=3
pkgdesc="BrisKola is a popular Italian card game."
arch=('i686' 'x86_64')
url="http://www.briskola.net/"
license=('GPL2')
depends=('qt4')
makedepends=('cmake')
source=(http://www.briskola.net/files/$pkgname-$pkgver.tar.gz)
md5sums=('df21a66b979c811142fa082e98956d38')

prepare() {
  cd $srcdir/$pkgname-$pkgver/build/unix
  cmake ../..
}

build() {
  cd $srcdir/$pkgname-$pkgver/build/unix
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/build/unix
  make DESTDIR=$pkgdir install
}
