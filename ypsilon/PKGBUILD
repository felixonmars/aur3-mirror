# Contributor: noonov <noonov@gmail.com>

pkgname=ypsilon
pkgver=0.9.6.update3
pkgrel=4
pkgdesc="The implementation of R6RS Scheme Programming Language for real-time applications"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ypsilon/"
license=('BSD')
depends=('gcc-libs')
makedepends=('cpio')
source=(http://ypsilon.googlecode.com/files/$pkgname-$pkgver.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver

  make PREFIX=/usr || return 1
  make -j1 PREFIX=/usr DESTDIR=$pkgdir install || return 1

  install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}

md5sums=('b330ebabce9b665418f3c347a43dcd24')
