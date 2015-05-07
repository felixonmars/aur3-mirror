# Maintainer: Michael Williams <draringi@draringi.net>
# Contributor: onny <onny@project-insanity.org>

pkgname=libwebsockets
pkgver=1.4
pkgrel=1
pkgdesc="A c websockets server library."
depends=('openssl')
makedepends=('cmake')
arch=('i686' 'x86_64')
url="http://git.warmcat.com/cgi-bin/cgit/libwebsockets/"
license=('LGPL')
source=("http://git.warmcat.com/cgi-bin/cgit/libwebsockets/snapshot/libwebsockets-1.4-chrome43-firefox-36.tar.gz")
md5sums=('0452c278a5cd4349135df2a693f35c28')
_browser_versions='chrome43-firefox-36'

prepare() {
	cd "$srcdir/${pkgname}-${pkgver}-${_browser_versions}"
	mkdir build
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}-${_browser_versions}/build"
	cmake ..  -DCMAKE_INSTALL_PREFIX:PATH=/usr -DLWS_IPV6:BOOL=ON
	make
}
package () {
	cd "$srcdir/${pkgname}-${pkgver}-${_browser_versions}/build"
	make DESTDIR="$pkgdir" install
}
