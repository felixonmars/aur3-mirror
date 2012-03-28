# Maintainer: Ner0

pkgname=ghnomix-icon-theme
pkgver=1.3
pkgrel=1
pkgdesc="An icon theme inspired by elementary and MeliaeSVG"
arch=('any')
url="http://ilnanny.deviantart.com/art/Ghnomix-283689300"
license=('cc-by-nc-nd')
source=(http://www.deviantart.com/download/283689300/ghnomix_1_3_by_ilnanny-d4owg2c.7z)
md5sums=('98c05540b8de25f945d3332b39c182b4')

package() {
  cd "$srcdir/Ghnomix_by_ilnanny"
  tar -xf Ghnomix.tar.gz
  find Ghnomix/ -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/icons/{}" \;
}
