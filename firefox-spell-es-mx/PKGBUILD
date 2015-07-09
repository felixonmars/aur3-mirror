pkgname=firefox-spell-es-mx
_file=171546
pkgver=1.1.3
pkgrel=3
pkgdesc="Spanish (Mexico) spellchecking dictionary for Firefox."
arch=('any')
url="https://addons.mozilla.org/firefox/addon/7020/"
license=('LGPL3')
depends=('firefox')
makedepends=('unzip')
source=($pkgname-$pkgver.xpi::https://addons.mozilla.org/firefox/downloads/file/$_file/diccionario_espanol_mexico-$pkgver.xpi)
noextract=($pkgname-$pkgver.xpi)
sha1sums=('8880582675a2ed9fae2a11b56487c3ff3e16d900')

build() {
  cd "$srcdir"
  [[ -d $pkgname-extract ]] || \
    mkdir $pkgname-extract
  unzip -q -d $pkgname-extract \
    $pkgname-$pkgver.xpi
}
  
package() {
  cd "$srcdir/$pkgname-extract"
  local emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/$emid"
  install -d "$dstdir"
  cp -R * "$dstdir"
  find "$pkgdir" -type d -exec chmod 0755 {} \;
  find "$pkgdir" -type f -exec chmod 0644 {} \;
}

# vim:set ts=2 sw=2 et:

