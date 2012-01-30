# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=ino-headers
pkgver=0.4.0
pkgrel=1
pkgdesc="Minimalist C API to execute JavaScript code and to expose native methods to JavaScript execution contexts"
arch=('any')
url="http://naspro.atheme.org/"
license=('custom:ISC')
makedepends=('naturaldocs')
source=("http://download.sourceforge.net/project/naspro/naspro/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('3ce4c99e0ffedf6d62fff3c00595b48f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  NATURALDOCS="/usr/bin/naturaldocs" \
  ./configure --prefix=/usr
  make html
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
