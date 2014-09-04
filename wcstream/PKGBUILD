# Maintainer: Wesley Wiedenmeier <wesley dot wiedenmeier at gmail>
pkgname=wcstream
pkgver=1
pkgrel=1
pkgdesc="WC Stream Meter, shows number of bytes passed through it every second. Useful for measuring progress when using cat or dd."
arch=("any")
url="http://www.tansi.org/tools/"
license=('GPL')
depends=("glibc")
makedepends=("gcc")
source=(http://www.tansi.org/tools/wcs.c)
md5sums=('eab76531a936d7e90c791dca3bbacd54')

build() {
  gcc -o wcstream wcs.c -O3
}

package() {
  install -D -m755 wcstream "$pkgdir/usr/bin/wcstream"
}
