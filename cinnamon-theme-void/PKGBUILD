# Maintainer: sh4nks <https://github.com/sh4nks/pkgbuilds>
# Author: debimint <luisrafaelgalvez.com>
pkgname=cinnamon-theme-void
pkgver=1.8
pkgrel=2
pkgdesc="Void Cinnamon theme"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/104"
license=('unknown')
depends=('cinnamon' 'ttf-roboto')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/ZJF7-L8MD-6U72.zip")
md5sums=('a3af0eaff4a9b7447b583bf15ba24c60')

package() {
    find Void -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
