# Contributor: Mikhail Mikhaylenko <sniff303@gmail.com>
pkgname=gnome-shell-searchprovider-duckduckgo
pkgver=3.12
pkgrel=1
pkgdesc="Adds a DuckDuckGo search engine to GNOME."
arch=('any')
url="https://duckduckgo.com/"
license=('None')
source=("http://duckduckgo.com/opensearch.xml")
sha1sums=('SKIP')
depends=('gnome-shell')


package() {
    install -D opensearch.xml $pkgdir/usr/share/gnome-shell/open-search-providers/duckduckgo.xml
}

# vim:set ts=4 sw=4 et:
