# Maintainer: crazyelf5

pkgname=gtk-theme-redux
pkgver=20120306
pkgrel=1
pkgdesc="GTK2/GTK3 theme based on Radiance and Elementary"
url="http://nanabuluku.deviantart.com/art/Redux-288881077"
license=('cc-by-nc-sa-3.0')
arch=('any')
depends=('gtk-engine-murrine' 'gtk-engine-unico')
source=("http://www.deviantart.com/download/288881077/redux_by_nanabuluku-d4rzq2d.zip")
md5sums=('cef2006faa782489d152fa870fde91cb')

package() {
  find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
