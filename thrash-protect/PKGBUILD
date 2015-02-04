# Maintainer: Tobias Brox <t-arch@tobixen.no>
pkgname=thrash-protect
pkgver=0.9.0
pkgrel=5
pkgdesc="Simple-Stupid user-space program protecting a linux host from thrashing."
url="https://github.com/tobixen/thrash-protect"
arch=('any')
license=('GPL')
depends=('python')
source=("https://github.com/tobixen/$pkgname/archive/v$pkgver.tar.gz")

package() {
  mkdir -p "$pkgdir/usr/sbin/"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cd "$srcdir/$pkgname-$pkgver/"
  make PREFIX=$pkgdir/usr/ install
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}


md5sums=('f7245a0694ed3857046b67d7f3c24f72')
