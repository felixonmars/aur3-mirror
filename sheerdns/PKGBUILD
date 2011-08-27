pkgname=sheerdns
pkgver=1.0.3
pkgrel=1
pkgdesc="a simple replacement master DNS server"
arch=(i686 x86_64)
url="http://threading.2038bug.com/sheerdns/"
license=('GPL')
depends=(glibc)
makedepends=(gcc)
source=(http://threading.2038bug.com/sheerdns/sheerdns-$pkgver.tar.gz)
md5sums=('08cad04e81dfec0af434803733f1a351')

build() {
  cd "$srcdir/$pkgname"

  make || return 1

  install -D -m0755 sheerdnshash $pkgdir/usr/sbin/sheerdnshash && \
  install -D -m0755 sheerdns $pkgdir/usr/sbin/sheerdns && \
  install -D -m0644 sheerdns.8 $pkgdir/usr/share/man/man8/sheerdns.8
}
