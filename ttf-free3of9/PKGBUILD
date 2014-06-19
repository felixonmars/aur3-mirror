# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=ttf-free3of9
pkgver=20010117
pkgrel=4
pkgdesc="A freeware 'code 39' barcode font"
arch=('any')
license=('custom:ttf-free3of9')
url="http://www.barcodesinc.com/free-barcode-font/"
depends=('fontconfig' 'xorg-mkfontdir')
install=ttf.install
source=(http://www.barcodesinc.com/free-barcode-font/free3of9.zip)
md5sums=('1de33e88ea27445e32921bfbaae8919b')

package() {
  mkdir -p "$pkgdir/usr/share/fonts/TTF/"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"  
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
