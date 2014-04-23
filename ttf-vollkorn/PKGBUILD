# Maintainer: Tom <uebershark@googlemail.com>
# Creator: Friedrich Althausen
pkgname=ttf-vollkorn
pkgver=3.005
pkgrel=0
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="The free and healthy typeface for bread and butter use"
arch=('any')
license=(OFL)
url="http://vollkorn-typeface.com/"
source=(http://vollkorn-typeface.com/download/vollkorn-3-005.zip $pkgname.install)
md5sums=(3ec0bfdae17dc8dd088d6be4001169bf 58f7ac5ab595722dac603f26373c976b)
install=$pkgname.install

package() {
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -m644 TTF/*.ttf $pkgdir/usr/share/fonts/TTF/
}
