pkgname=aiccu
pkgver=20070115
pkgrel=9
pkgdesc="SixXS Automatic IPv6 Connectivity Client Utility - AICCU"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="http://www.sixxs.net/tools/aiccu/"
license=('BSD')
depends=('gnutls' 'iproute2')
makedepends=('glibc' 'libgpg-error' 'libtasn1' 'libgcrypt' 'zlib')
backup=(etc/aiccu.conf)
source=(http://www.sixxs.net/archive/sixxs/aiccu/unix/${pkgname}_${pkgver}.tar.gz
        aiccu.rc.d
        aiccu.service)

build() {
  cd "$srcdir/$pkgname"

  sed -i 's|Installing Debian-style init.d||' Makefile

  LDFLAGS="" make
  make DESTDIR="$pkgdir" install
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m600 doc/aiccu.conf "$pkgdir/etc/aiccu.conf"
  install -D -m755 "$srcdir/aiccu.rc.d" "$pkgdir/etc/rc.d/aiccu"
  install -D -m644 "$srcdir/aiccu.service" "$pkgdir/usr/lib/systemd/system/aiccu.service"
  install -D -m444 doc/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -fr "$pkgdir/etc/init.d"
}
md5sums=('c9bcc83644ed788e22a7c3f3d4021350'
         '9eb63ae132d4835a822ea925c6440b04'
         '302171a740e386402e774fe14044a938')
