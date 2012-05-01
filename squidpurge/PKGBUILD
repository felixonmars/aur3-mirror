# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=squidpurge
pkgver=20040201
pkgrel=2
pkgdesc="Tool for selectively removing or dumping Squid-2 cache contents"
arch=(i686 x86_64)
url="http://www.squid-cache.org/"
license=('MIT')
depends=(gcc-libs)
source=("http://www.squid-cache.org/contrib/purge-$pkgver-src.tar.gz")
md5sums=('60385256da26311036ebcc4802b0dac5')

build() {
  cd "$srcdir/purge"
  make OPT_NORM='-DDEFAULT_SQUID_CONF=\"/etc/squid/squid.conf\" -Wall -fpermissive' SOCKLEN=socklen_t
}

package() {
  cd "$srcdir/purge"
  install -D purge "$pkgdir/usr/bin/squidpurge"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  sed -n '/Author/,/SOFTWARE\./s,^// \?,,p' purge.cc > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
