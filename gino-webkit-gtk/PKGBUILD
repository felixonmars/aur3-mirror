# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=gino-webkit-gtk
pkgver=0.4.0
pkgrel=1
pkgdesc="Gino WebKitGTK+2 implementation"
arch=('i686' 'x86_64')
url="http://naspro.atheme.org/"
license=('custom:ISC')
depends=("gino-headers>=$pkgver" "ino-jsc>=$pkgver" 'libwebkit')
options=('!libtool')
source=("http://download.sourceforge.net/project/naspro/naspro/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('80ecda608308d073f261e51300e43357')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
