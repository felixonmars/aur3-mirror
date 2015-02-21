# Maintainer : robin < 726f62696e at gmail dot com >

pkgname=vhdocl
pkgver=0.2.5
pkgrel=1
pkgdesc="VHDL documentation utility"
arch=('any')
url="http://www.volkerschatz.com/hardware/vhdocl.html"
license=('GPL3')
depends=('perl')
source=("http://www.volkerschatz.com/hardware/$pkgname-$pkgver.tgz")
md5sums=('c5fd6b155443e1e8fd27f9d26b35bb6c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  ./install-vhdocl.pl $pkgdir/usr
}
