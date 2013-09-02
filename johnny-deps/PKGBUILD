# Maintainer: Eivind Uggedal <eivind@uggedal.com>

pkgname=johnny-deps
pkgver=0.2.3
pkgrel=1
pkgdesc="Barebones dependency manager for Go"
arch=('any')
license=('MIT')
url="https://github.com/VividCortex/johnny-deps"
depends=('bash')
source=("https://github.com/VividCortex/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('ddf7a6e5a451182843acceee12b495f9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix="$pkgdir/usr"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install
}
