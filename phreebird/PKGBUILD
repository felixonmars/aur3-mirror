pkgname=phreebird
pkgver=1.02
pkgrel=1
pkgdesc="DNSSEC proxy that signs authoritative responses in realtime"
arch=('i686' 'x86_64')
url="http://dankaminsky.com/phreebird/"
license=('BSD')
depends=('libghthash' 'ldns' 'unbound' 'libevent')
#makedepends=('glibc' 'libgpg-error' 'libtasn1' 'libgcrypt' 'zlib')
#backup=(etc/aiccu.conf)
source=(http://s3.amazonaws.com/dmk/${pkgname}_suite_${pkgver}.tar.gz)
sha256sums=('851f74625841584a432de6c57ae431f0553eb5bb5633b06087be46e51e44f01b')

build() {
  cd "$srcdir/${pkgname}_suite_${pkgver}"
  make
}

package() {
  cd "$srcdir/${pkgname}_suite_${pkgver}"
  install -d $pkgdir/usr/bin $pkgdir/usr/lib
  install -m755 bin/phreebird bin/phreeload bin/ldns_chase bin/unbound_trace "$pkgdir/usr/bin/"
  install -m644 lib/phreeload.so "$pkgdir/usr/lib/"
}
