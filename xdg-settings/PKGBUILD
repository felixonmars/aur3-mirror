# Contributor: Matthew Bauer <mjbauer95@gmail.com>
pkgname=xdg-settings
pkgver=1
pkgrel=1
pkgdesc="get and set various desktop environment settings"
arch=(any)
url="http://crystalorb.net/mikem/xdg-settings.html"
license=('custom')
source=('http://crystalorb.net/mikem/xdg-settings')
depends=('sh')

build() {
	install -D -m755 ${srcdir}/xdg-settings ${pkgdir}/usr/bin/xdg-settings
}

md5sums=('afbb1e2245020f26212450ed8bb1b192')
