# Maintainer: Blackleg <blackleg@openmailbox.org>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Dominik George <nik@naturalnet.de>

pkgname='firefox-search-duckduckgo'
pkgver=1
pkgrel=4
pkgdesc="Firefox search engine plugin for DuckDuckGo with SSL"
arch=('any')
url="https://www.duckduckgo.com/"
license=('unknown')
depends=('firefox')
source=(duckduckgo.xml::https://duckduckgo.com/opensearch.xml)
sha256sums=('a6c771814d4b63710285ff17c8ce8e85f90cbdf0a3dd2af21085fe249c535fd2')

package() {
  install -Dm644 duckduckgo.xml "$pkgdir"/usr/lib/firefox/browser/searchplugins/duckduckgo.xml
}
