pkgname=otf-quicksand
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Quicksand, a free sans serif typeface"
arch=('any')
url="http://www.typophile.com/node/50437"
license=('NC')
source=(http://www.andrewpaglinawan.com/typeface/QuicksandFamily.zip)
md5sums=('5110db5a8c825b5d813030d503242a79')
install=$pkgname.install

package() {
  install -d "$pkgdir/usr/share/fonts/OTF"
  cp -dpr --no-preserve=ownership "$srcdir/QuicksandFamily/"*.otf "$pkgdir/usr/share/fonts/OTF/"
}
