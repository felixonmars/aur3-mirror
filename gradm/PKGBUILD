# Contributors:
#   Jonathan Liu <net147@gmail.com>
#   henning mueller <henning@orgizm.net>

pkgname=gradm
pkgver=2.9.1
_timestamp=201308091629
pkgrel=3
pkgdesc='Administrative interface for the grsecurity Role Based Access Control system'
arch=(i686 x86_64)
url=http://grsecurity.net/
license=(GPL2)
depends=(pam)
source=(http://grsecurity.net/stable/$pkgname-$pkgver-$_timestamp.tar.gz)

build() {
  cd "$srcdir/${pkgname}2"
  sed -i -e 's/^CFLAGS :=/CFLAGS +=/' -e 's:sbin:usr/bin:' Makefile
  make
}

package() {
  cd "$srcdir/${pkgname}2"
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/dev"
}

sha256sums=('10af8959fc9f9cf70d16188bca65ab6025b1fe6590920298ed10c20b217c57c4')
