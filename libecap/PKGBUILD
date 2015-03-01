# $Id$
# Maintainer: Michael Schindhelm <mschindhelm@gmx.de>

pkgname=libecap
pkgver=1.0.0
pkgrel=1
pkgdesc='API for implementing ICAP content analysis and adaption'
arch=('x86_64' 'i686')
url='http://www.e-cap.org/'
license=('BSD-2')
source=("http://www.measurement-factory.com/tmp/ecap/$pkgname-$pkgver.tar.gz")
md5sums=('68cbd5b8e505e3fa7da520c3b0fe5a3c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}
