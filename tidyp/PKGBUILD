# Maintainer: Matt Garriott <matt.garriott at gmail dot com>

pkgname=tidyp
pkgver=1.04
pkgrel=1
pkgdesc="Validate your HTML, and output cleaned-up HTML."
arch=('i686' 'x86_64')
url="http://tidyp.com/"
license=('none')
source=(https://github.com/petdance/tidyp/archive/$pkgver.tar.gz)
md5sums=('ad4e95b941ff482f5745b503fb5e20df')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./acgo
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make prefix="$pkgdir"/usr install
}
