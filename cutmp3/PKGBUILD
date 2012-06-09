# Maintainer: Daniel Wallace < daniel.wallace at gatech dot edu>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: fancris3 <fancris3 at aol.com>

pkgname=cutmp3
pkgver=2.1
pkgrel=1
pkgdesc="A small, fast command-line MP3 editor"
arch=('i686' 'x86_64')
url="http://www.puchalla-online.de/cutmp3.html"
license=('GPL')
depends=('mpg123')
source=(http://www.puchalla-online.de/$pkgname-$pkgver.tar.bz2)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make | grep -v '\*\*\*'
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
md5sums=('54ade41f7f81ef8b63e90e705364f0d9')
