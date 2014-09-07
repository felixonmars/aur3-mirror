# Maintainer: Andreas Bielawski <brawl98 at outlook dot com>

pkgname=firefox-extension-in-der-wikipedia-nachschlagen
pkgver=1.0.1
pkgrel=2
pkgdesc="With this Add-On you can easily look up selected text in the german Wikipedia."
license=('GPL3')
arch=('any')
url="https://addons.mozilla.org/de/firefox/addon/in-der-wikipedia-nachschlag/"
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/file/213958/in_der_wikipedia_nachschlagen-${pkgver}-fx.xpi")
sha512sums=('9567dd55612945211487e270959fcfdab6ea2ddf57d94b075db5ec07fa34a11d630b7ad80e08264c2f326fd69a21e93f307273afa805c095290e1504252413ac')

package() {
  cd "$srcdir"
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)

  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/${emid}"
  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  chmod -R 755 "$dstdir"
}
