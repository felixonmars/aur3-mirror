# Maintainer: sh4nks <https://github.com/sh4nks/pkgbuilds>
# Author: bimsebasse
pkgname=cinnamon-theme-gnome
pkgver=2.0
pkgrel=2
pkgdesc="Gnome theme for cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/51"
license=('unknown')
depends=('cinnamon')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/UXG0-D8G8-56ND.zip")
md5sums=('4ed4a57e78faec0f5d3c92b9c301d909')

package() {
  find Gnome -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
