# Maintainer: Marius Knaust <marius.knaust@gmail.com>

pkgname=ttf-bitstream-charter
pkgver=1.0
pkgrel=1
pkgdesc="Bitstream charter fonts"
arch=('any')
url="http://practicaltypography.com/charter.html"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=charter.install
source=('http://practicaltypography.com/fonts/charter.zip')
md5sums=('b1816043444645ec6232534543a2ffa6')

package() {
  cd "$srcdir/charter/ttf"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -D -m644 ../license.txt "$pkgdir/usr/share/licenses/ttf-bitstream-charter/LICENSE"
}
