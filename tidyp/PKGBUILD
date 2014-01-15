# Maintainer: Matt Garriott <matt.garriott at gmail dot com>

pkgname=tidyp
pkgver=1.04
pkgrel=3
pkgdesc="Validate your HTML, and output cleaned-up HTML."
depends=('glibc')
arch=('i686' 'x86_64')
url="http://tidyp.com/"
license=('custom')
source=(https://github.com/petdance/tidyp/archive/$pkgver.tar.gz LICENSE)
md5sums=('ad4e95b941ff482f5745b503fb5e20df'
         '6b6ef7037785d402a5665974dfc923a8')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./acgo
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make prefix="$pkgdir"/usr install

  install -D -m644 "$srcdir"/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
