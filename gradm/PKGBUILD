# Contributors:
#   Jonathan Liu <net147@gmail.com>
#   henning mueller <henning@orgizm.net>
#   s1gma, Ahmad24, maxrp

pkgname=gradm
pkgver=3.0
_timestamp=201311242038
pkgrel=2
pkgdesc='Administrative interface for the grsecurity Role Based Access Control system'
arch=(i686 x86_64)
url=http://grsecurity.net/
license=(GPL2)
depends=(pam)
source=(
  http://grsecurity.net/stable/$pkgname-$pkgver-$_timestamp.tar.gz
  usr.patch
  learn_config
  policy
)

build() {
  cd "$srcdir/$pkgname"
  patch -Np1 < ../usr.patch
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
            '7342323d2da3724afe745506690a1a5b194f3f0e959811ca320d820bf74c9ffa'
            'ec8e824e8a29a67be76bf853814ee85e80c4063009e5693d5db8cdb45bd45813'
            '61c0e84098e8386e5496dafce559558adef32e2a4a1241a9fa3bd56eab192dcd')
