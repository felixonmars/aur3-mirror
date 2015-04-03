# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=xnecview
pkgver=1.36
pkgrel=3
pkgdesc="X-windows NEC Antenna simulator"
arch=('i686' 'x86_64' 'armv7h')
url="http://wwwhome.cs.utwente.nl/~ptdeboer/ham/xnecview/"
license=('GPL')
depends=('gtk2')
source=(http://wwwhome.cs.utwente.nl/~ptdeboer/ham/xnecview/$pkgname-$pkgver.tgz)
md5sums=('c7a96fbaf006e209abe9e23bd011caa5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  install xnecview $pkgdir/usr/bin
  install -Dm644 xnecview.1x "$pkgdir/usr/share/man/man1/xnecview.1"
}

# vim:set ts=2 sw=2 et:
