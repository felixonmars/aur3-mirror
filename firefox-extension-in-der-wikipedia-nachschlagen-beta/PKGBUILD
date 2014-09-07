# Maintainer: Andreas Bielawski <brawl98 at outlook dot com>

pkgname=firefox-extension-in-der-wikipedia-nachschlagen-beta
pkgver=1.1
pkgrel=2
pkgdesc="With this Add-On you can easily look up selected text in the Wikipedia (beta version)."
license=('GPL3')
arch=('any')
url="http://wiidatabase.de/in-der-wikipedia-nachschlagen/"
depends=("firefox")
conflicts=("firefox-extension-in-der-wikipedia-nachschlagen")
source=("http://static.wiidatabase.de/in-der-wikipedia-nachschlagen-v${pkgver}.xpi")
sha512sums=('e8911587481ffd8c30eb01bb86300e679fb9d8897427a9ff34021edba584bd97351e92a48bc47d6087febc74a23947b37442a538d3503f5cd8d3b8f59c74f57b')

package() {
  cd "$srcdir"
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)

  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/${emid}"
  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  chmod -R 755 "$dstdir"
}
