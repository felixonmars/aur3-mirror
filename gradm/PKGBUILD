# Contributors:
#   Jonathan Liu <net147@gmail.com>
#   henning mueller <henning@orgizm.net>

pkgname=gradm
pkgver=3.0
_timestamp=201311242038
pkgrel=1
pkgdesc='Administrative interface for the grsecurity Role Based Access Control system'
arch=(i686 x86_64)
url=http://grsecurity.net/
license=(GPL2)
depends=(pam)
source=(
  http://grsecurity.net/stable/$pkgname-$pkgver-$_timestamp.tar.gz
  learn_config
  policy
)

build() {
  cd "$srcdir/$pkgname"
  sed -i -e 's/^CFLAGS :=/CFLAGS +=/' -e 's:sbin:usr/bin:' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install

  cp "$startdir"/{learn_config,policy} "$pkgdir/etc/grsec"

  rm -rf "$pkgdir/dev"
}

sha256sums=('9d9040ef2be90b6a4db5b68ba5b7bc658cbbcdb8c71c643b8f95373e4a892e55'
            'ec8e824e8a29a67be76bf853814ee85e80c4063009e5693d5db8cdb45bd45813'
            '777b760af9b3c73ac30e4a44d6a4dd296d079d7f64fc98f7cdc529b2a9f0a8d1')
