# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-noscript
pkgver=2.6.9.11
pkgrel=1
pkgdesc='Allows JavaScript, Java (and other plugins) only for trusted domains of your choice.'
url=https://noscript.net
arch=('any')
license=('GPL')
depends=('firefox')
source=("https://secure.informaction.com/download/releases/noscript-$pkgver.xpi")
sha256sums=('568122b4834baf2113648317baf294879700178df157780a9c89582280338ba8')

package() {
  local GLOBIGNORE=*.xpi:GPL.txt
  local emid=$(python -c \
"import xml.etree.ElementTree as ET
tree = ET.parse('install.rdf')
root = tree.getroot()
print(root[0][0].text)")
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/"$emid"

  install -d "$dstdir"
  cp -r * "$dstdir"
}

# vim:set ts=2 sw=2 et:
