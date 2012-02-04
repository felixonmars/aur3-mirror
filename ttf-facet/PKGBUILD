# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=ttf-facet
pkgver=1
pkgrel=2
pkgdesc="A font similar to Eurostile (narrower and edgier)"
arch=('any')
url="http://www.font-zone.com/download.php?fid=665"
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=('Facet.ttf')
md5sums=('0165ef7aab1ad20e6f840fe914a680df')

package() {
 install -Dm 644 "$srcdir/Facet.ttf" "$pkgdir/usr/share/fonts/TTF/Facet.ttf"
}
