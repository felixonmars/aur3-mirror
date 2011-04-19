# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=pngrewrite
pkgver=1.4.0
pkgrel=1
pkgdesc="A utility to reduce unnecessarily large palettes and bit depths in PNG image files"
arch=('i686' 'x86_64')
url="http://entropymine.com/jason/pngrewrite/"
license=('BSD')
depends=('libpng')
source=(http://entropymine.com/jason/pngrewrite/$pkgname-$pkgver.zip)
md5sums=('983537203b11ca674347a54e19bdd7c1')

build() {
  sed -n '11,30p' readme.txt > COPYING
#  make CFLAGS="$CFLAGS -DPNG_SETJMP_NOT_SUPPORTED"
  make CFLAGS="$CFLAGS"
}

package() {
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
