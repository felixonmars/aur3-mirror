# Maintainer: sh4nks <https://github.com/sh4nks/pkgbuilds>
# Author: abnvolk
pkgname=cinnamon-theme-elementary-luna
pkgver=2.0
pkgrel=1
pkgdesc="Elementary Luna theme for cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/112"
license=('unknown')
depends=('cinnamon' 'ttf-droid')
source=('http://cinnamon-spices.linuxmint.com/uploads/themes/0UMZ-3GWC-II41.zip')
md5sums=('ca6a04b7d7ceed4c1608020414d99e51')

package() {
  find Elementary* -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
