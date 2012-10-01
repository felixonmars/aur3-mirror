# Maintainer: Pablo Olmos de Aguilera Corradini <pablo at glatelier dot org>
pkgname=ppmascii
pkgver=1.2
pkgrel=3
pkgdesc="A script to convert ppm bitmaps to 7-bit ASCII art"
arch=("any")
url="http://www.floodgap.com/software/ppmascii/"
license=('custom:FFSL')
depends=('perl')
optdepends=('libjpeg-turbo: to convert jpegs to ppm'
'tiff2pnm: convert tiff to ppm'
'imagemagick: convert from multiple image formats to ppm')
install=ppmascii.install
source=('http://www.floodgap.com/software/ffsl/license.txt'
        "$pkgname.txt::http://www.floodgap.com/software/$pkgname/$pkgname.txt")
md5sums=('b01fa646f567fbcb7f5df9dc05176d57'
         '45a72ace3241c95713eb537172b8c28a')

build() {
  cd "$srcdir"
  install -Dm755 $pkgname.txt "$pkgdir/usr/bin/$pkgname"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

# vim:set ts=2 sw=2 et:
