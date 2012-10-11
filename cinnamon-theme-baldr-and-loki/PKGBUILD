# Contributor: gareth_c
# Maintainer: Ner0

pkgname=cinnamon-theme-baldr-and-loki
pkgver=3.6
pkgrel=1
pkgdesc="White and dark monochrome themes where all highlighting is achieved with an inner shadow effect"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/38"
license=('GPL')
depends=('cinnamon')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/YN44-5ZUO-LJNE.zip")
md5sums=('d36f7e86175e5ed31500f31c6c04c406')

package() {
  cd baldrandloki/
  find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
