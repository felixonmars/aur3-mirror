# Contributors:
#   Jonathan Liu <net147@gmail.com>
#   henning mueller <henning@orgizm.net>

pkgname=gradm
pkgver=2.9.1
_timestamp=201301041755
pkgrel=1
pkgdesc='Administrative interface for the grsecurity Role Based Access Control system'
arch=('i686' 'x86_64')
url='http://grsecurity.net/'
license=('GPL2')
depends=('pam')
source=("http://grsecurity.net/stable/$pkgname-$pkgver-$_timestamp.tar.gz")
sha256sums=(516a1700e88edf7b9dc868f3c02f7571a53d00e078e5deb50189fc1ea8fb8082)

build() {
  cd "$srcdir/${pkgname}2"
  sed -ie 's/^CFLAGS :=/CFLAGS +=/' Makefile
  make
}

package() {
  cd "$srcdir/${pkgname}2"
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/dev"
}
