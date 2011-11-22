# Contributor: Florian Bäuerle <florian.bae@gmail.com>
pkgname=gnome-shell-searchprovider-bing
pkgver=3.2
pkgrel=1.0
arch=(any)
url="http://www.fpmurphy.com/gnome-shell-extensions/"
license=(GPL2)
pkgdesc="Add Bing as search Provider to GNOME Shell"
depends=(gnome-shell)
makedepends=(gnome-shell)

build() {
	wget "http://www.fpmurphy.com/gnome-shell-extensions/bing.xml" -O bing.xml
	mkdir -p $pkgdir/usr/share/gnome-shell/search_providers
	cp bing.xml $pkgdir/usr/share/gnome-shell/search_providers
}



