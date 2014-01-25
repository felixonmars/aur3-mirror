# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=triplane
pkgver=1.0.8
pkgrel=1
pkgdesc="A side-scrolling dogfighting game featuring solo missions and multiplayer mode"
arch=('i686' 'x86_64')
url="http://triplane.sourceforge.net/"
license=('GPL3')
depends=('sdl' 'sdl_mixer')
source=("http://downloads.sourceforge.net/project/triplane/triplane-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/triplane-${pkgver}"
	sed -i 's/\/games//' Makefile
	sed -i 's/)\/triplane/)\/bin\/triplane/' Makefile
	make PREFIX=/usr depend
	make PREFIX=/usr
}

package() {
	cd "${srcdir}/triplane-${pkgver}"
	install -dm755 "$pkgdir/usr/bin"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}

md5sums=('5e7f0a64edfb66f399c8ff602742e5dc')
