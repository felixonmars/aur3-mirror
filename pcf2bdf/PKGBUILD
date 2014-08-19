# Maintainer: Schnouki <thomas.jost@gmail.com>
# Contributor: cs-cam - me.at.camdaniel.com
pkgname=pcf2bdf
pkgver=1.04
pkgrel=2
pkgdesc="Convert X font from Portable Compiled Format to Bitmap Distribution Format"
arch=('i686' 'x86_64')
url="http://www.tsg.ne.jp/GANA/S/pcf2bdf/"
license=('custom:X11')
depends=('gcc-libs')
source=(http://distcache.freebsd.org/ports-distfiles/$pkgname-$pkgver.tgz)
md5sums=('8ce3b6a57491c67ef0cbf2f5413451f3')
sha1sums=('6fdcc10132e27d3c26ff7e4be541332ee5d4e927')

build() {
  cd "$srcdir"

  make -f Makefile.gcc CC=g++
}

package() {
  cd "$srcdir"

  install -Dm644 README.txt "$pkgdir/usr/share/licenses/$pkgname/README.txt"
  make -f Makefile.gcc PREFIX="$pkgdir/usr" MANPATH="$pkgdir/usr/share/man/man1" install
}
