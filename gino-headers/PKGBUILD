# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=gino-headers
pkgver=0.4.0
pkgrel=1
pkgdesc="Minimalist C API to create GUIs using HTML/CSS/JavaScript and interfacing them with C code"
arch=('any')
url="http://naspro.atheme.org/"
license=('custom:ISC')
depends=("ino-headers>=$pkgver")
makedepends=('naturaldocs')
source=("http://download.sourceforge.net/project/naspro/naspro/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('1f91326d00f8ebe1bf8f6dbe6e2999e2')

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
