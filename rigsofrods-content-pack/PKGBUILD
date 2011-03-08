# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=rigsofrods-content-pack
pkgver=0.37
pkgrel=1
pkgdesc="Official content pack for Rigs of Rods"
arch=('any')
url="http://www.rigsofrods.com"
license=('GPL')
depends=('rigsofrods')
source=("http://downloads.sourceforge.net/project/${pkgname%-content-pack}/${pkgname%-content-pack}/$pkgver/${pkgname#rigsofrods-}-$pkgver.zip")
md5sums=('261eb00d93559421f568b578bb95b697')

package() {
 while read file; do
  install -Dm 644 "$file" "$pkgdir/opt/rigsofrods/packs/${file/*\/}"
 done < <(find "$srcdir/streams" -type f)
}
