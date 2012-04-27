# Maintainer: Marat Mukhametshin <mukhametshin[at]yandex.ru>
pkgname=tomboy-export-to-latex
pkgver=0.21
pkgrel=1
pkgdesc="A tomboy plugin 'Tomboy Exporter' to export whole notebooks to a LaTeX file which can be used to make a PS or PDF file"
arch=(any)
url="http://notendur.hi.is/pth8/"
license=(freeware)
depends=('tomboy')
source=("http://notendur.hi.is/pth8/binaries/TomboyExporter_${pkgver}.zip")
md5sums=("cf715ffa837dd513a96828af73be6ccd")
install=${pkgname}.install

build() {
  true
}

package() {
  install -D "$srcdir/TomboyExporter.dll" \
  "$pkgdir/usr/lib/tomboy/addins/TomboyExporter.dll"
}

