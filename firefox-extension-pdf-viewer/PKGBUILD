# Maintainer: OmeGa <omega at mailoo dot org>

pkgname=firefox-extension-pdf-viewer
_file=192788
pkgver=0.7.236
pkgrel=1
pkgdesc="Uses HTML5 to display PDF files directly in Firefox."
arch=('any')
url="https://github.com/mozilla/pdf.js"
license=('Apache')
depends=('firefox')
makedepends=('unzip')
source=(https://addons.mozilla.org/firefox/downloads/file/$_file/pdf_viewer-$pkgver.xpi)
noextract=(pdf_viewer-$pkgver.xpi)
sha1sums=('c582647a6063cc88ed39407ba5254eb54c1bceb9')

build() {
  cd "$srcdir"
  [[ -d $pkgname-extract ]] || \
    mkdir $pkgname-extract
  unzip -q -d $pkgname-extract \
    pdf_viewer-$pkgver.xpi
}

package() {
  cd "$srcdir/$pkgname-extract"
  local emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir="$pkgdir/usr/lib/firefox/extensions/$emid"
  install -d "$dstdir"
  cp -r * "$dstdir"
  find "$pkgdir" -type d -exec chmod 0755 {} \;
  find "$pkgdir" -type f -exec chmod 0644 {} \;
}

# vim:set ts=2 sw=2 et:
