# Maintainer: TDY <tdy@gmx.com>

pkgname=ttf-eurofc
pkgver=1.0
pkgrel=5
pkgdesc="A eurofurence variant similar to renaissance typefaces, Futura, and other sans serif fonts"
arch=('any')
url="http://www.eurofurence.net/eurofclassic.html"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.eurofurence.net/eurofctt.zip)
md5sums=('91389f43a1e7f7ceaa1b35b1da6b7037')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 eurofc*.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 eurofctt.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

# vim:set ts=2 sw=2 et:
