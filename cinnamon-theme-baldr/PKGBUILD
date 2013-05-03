# Maintainer: Ner0

pkgname=cinnamon-theme-baldr
pkgver=4.0
pkgrel=5
pkgdesc="White monochrome theme where all highlighting is achieved with an inner shadow effect"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/38"
license=('GPL')
depends=('cinnamon')
conflicts=('cinnamon-theme-baldr-and-loki')
options=('!strip')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/A84H-BK84-4ZN1.zip")
md5sums=('1c8b5fae626d2c9ac0d8159d24472487')

package() {
  find Baldr/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
