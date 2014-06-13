pkgname=ttf-covington
pkgver=1.0
pkgrel=1
pkgdesc="Covington proportional font with serifs from Font River"
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
source=("http://www.fontriver.com/f/covington.zip")
md5sums=('7e230d39b364c2e459c5fe9ec6fef288')
install=$pkgname.install
license=("custom: \"Free\"")
url=("http://www.fontriver.com/font/covington/")

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  cp -dpr --no-preserve=ownership "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
}