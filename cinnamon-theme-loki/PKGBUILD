# Maintainer: Ner0

pkgname=cinnamon-theme-loki
pkgver=4.0
pkgrel=5
pkgdesc="Dark monochrome theme where all highlighting is achieved with an inner shadow effect"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/145"
license=('GPL')
depends=('cinnamon')
conflicts=('cinnamon-theme-baldr-and-loki')
options=('!strip')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/H9LR-1HBV-WO83.zip")
md5sums=('50434d38c02e91836b3eefa8a1076b18')

package() {
  find Loki/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
