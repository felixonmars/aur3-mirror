pkgname=ttf-font-ionicons-space
pkgver=1.4.0
pkgrel=1
pkgdesc="The premium icon font for Ionic Framework, patched with an space glyph"
url="http://ionicons.com"
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
options=("!strip")
arch=('any')
source=('https://www.dropbox.com/s/jl2ls8pr13rigcp/ionicons.ttf')
md5sums=('1a3aa8e18b7e55d258480b3a42812fb7')

package() {
  install -m 644 -D "$srcdir/ionicons.ttf" "$pkgdir/usr/share/fonts/TTF/ionicons.ttf"
}
