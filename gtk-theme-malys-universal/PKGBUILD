# Maintainer: Ner0

pkgname=gtk-theme-malys-universal
pkgver=3.20
pkgrel=1
pkgdesc="GTK2/GTK3 Malys Universal Theme"
arch=('any')
url=('http://malysss.deviantart.com/art/malys-universal-3-20-298507703')
license=('GPL3')
depends=('gtk-engine-unico')
optdepends=('gtk-engine-murrine: GTK2 support')
source=("http://www.deviantart.com/download/298507703/malys___universal_3_20_by_malysss-d4xq20n.zip")
md5sums=('49f8789bdab8f07fc208f7c34d7d1d10')

package () {
  tar -xf malys-theme\ GTK3-universal/malys-universal\(right\).tar.bz2
  cd malys-universal\(right\)
  find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/malys-universal/{}" \;
  rm -rf "$pkgdir/usr/share/themes/malys-universal/backgrounds"
}
