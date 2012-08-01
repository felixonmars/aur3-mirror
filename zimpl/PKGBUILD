# Maintainer: Robert Schwarz <mail@rschwarz.net>
pkgname=zimpl
pkgver=3.3.0
pkgrel=1
pkgdesc="Mathematical modelling language for LP and MIP"
arch=(i686 x86_64)
url="http://zimpl.zib.de/"
license=('GPL')
depends=(gmp zlib)
makedepends=()
optdepends=(glpk)
source=(http://zimpl.zib.de/download/$pkgname-$pkgver.tgz)
md5sums=('3c296eb9077e89a360789a6a72d25691')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir $pkgdir/bin
  cp bin/$pkgname $pkgdir/bin/$pkgname
  mkdir $pkgdir/share
  mkdir $pkgdir/share/doc
  mkdir $pkgdir/share/doc/$pkgname
  cp doc/$pkgname.pdf $pkgdir/share/doc/$pkgname
  cp -r example $pkgdir/share/doc/$pkgname/example
}

# vim:set ts=2 sw=2 et:
