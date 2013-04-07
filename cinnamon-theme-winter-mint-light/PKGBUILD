# Maintainer: sh4nks <https://github.com/sh4nks/pkgbuilds>
# Author: infektedpc
pkgname=cinnamon-theme-winter-mint-light
pkgver=1.2
pkgrel=1
pkgdesc="A Darkish Theme With White Menus, Blue Highilights and Grey Accents."
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/157"
license=('unknown')
depends=('cinnamon')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/SY9F-EU3T-Z50I.zip")
md5sums=('6e516a69512bda2dc540c569d5ccf9bb')

package() {
        find "Winter-Mint-Light" -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
