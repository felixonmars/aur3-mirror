# Maintainer: sh4nks <https://github.com/sh4nks/pkgbuilds>
# Author: infektedpc
pkgname=cinnamon-theme-winter-mint
pkgver=1.3
pkgrel=1
pkgdesc="A Dark Theme With Blue Highlights and Grey Accents"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/156"
license=('unknown')
depends=('cinnamon')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/R852-82JP-TTLQ.zip")
md5sums=('b774cf07319d55085f1766d3b0724185')

package() {
        find "Winter-Mint" -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
