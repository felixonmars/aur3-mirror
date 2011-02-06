# Maintainer: TDY <tdy@gmx.com>

pkgname=ttf-breip
pkgver=0.5.1
pkgrel=2
pkgdesc="A TrueType handwriting font"
arch=('any')
url="http://stalefries.googlepages.com/fontsbreip"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://stalefries.googlepages.com/Breip-$pkgver.zip)
md5sums=('9a5cd02985379d32a3bbd3054405043e')

build() {
  cd "$srcdir/Breip"
  install -Dm644 Breip.ttf "$pkgdir/usr/share/fonts/TTF/Breip.ttf"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
