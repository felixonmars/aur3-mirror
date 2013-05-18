# Maintainer: Eero Molkoselka <molkoback@gmail.com>

pkgname=g500_control
pkgver=0.0.1
pkgrel=1
pkgdesc="Configure Logitech G500's internal profile under Linux"
url="http://code.google.com/p/g500-control"
arch=('any')
license=('GPL')
makedepends=('gcc')
source=("http://g500-control.googlecode.com/files/${pkgname}_${pkgver}.tar.gz")

build() {
  gcc -o g500_control g500_control.c
}

package() { 
  install -Dm 755 g500_control "$pkgdir/usr/bin/g500_control"
}

sha256sums=('6b7fd5cc36cabc641227e5110325b9c13502a53431f8802612624cdb2f4d8ff6')
