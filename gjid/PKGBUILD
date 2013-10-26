# Maintainer: David Zaragoza <david@zaragoza.com.ve>
pkgname=gjid
pkgver=3.1
pkgrel=1
pkgdesc="In this game you play GJID, whose task is to move each crate into recycling bins."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/gjid/"
license=('MIT')
depends=('gcc-libs' 'libxcb')
source=(http://heanet.dl.sourceforge.net/project/gjid/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('4100774a44db67b0177e5699484cde2e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make BINDIR="$pkgdir/usr/bin/" install
  mkdir -p "$pkgdir/usr/share/licenses/gjid"
  install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
