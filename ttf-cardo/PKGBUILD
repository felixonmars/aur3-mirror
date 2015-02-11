# Maintainer: TDY <tdy@gmx.com>

pkgname=ttf-cardo
pkgver=1.04
pkgrel=1
pkgdesc="A Unicode font for classicists, scholars, medievalists, and linguists"
arch=('any')
url="http://scholarsfonts.net/cardofnt.html"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://scholarsfonts.net/cardo${pkgver/.}.zip
        license.txt)
sha256sums=('9401db6357cb71fa1f8791323679f81d6b0473d6280a7ec8abdf11b5e52f455f'
            '7b52a2e3b2c4d1f0df6861eb5f8863bc71d702af8a1e72c6f2cdec3352818633')

package() {
  install -dm755 "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 Cardo*.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

# vim:set ts=2 sw=2 et:
